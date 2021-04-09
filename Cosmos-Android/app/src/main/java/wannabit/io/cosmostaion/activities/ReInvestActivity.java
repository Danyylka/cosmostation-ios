package wannabit.io.cosmostaion.activities;

import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;

import androidx.appcompat.widget.Toolbar;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentPagerAdapter;
import androidx.viewpager.widget.ViewPager;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;

import cosmos.distribution.v1beta1.Distribution;
import wannabit.io.cosmostaion.R;
import wannabit.io.cosmostaion.base.BaseBroadCastActivity;
import wannabit.io.cosmostaion.base.BaseChain;
import wannabit.io.cosmostaion.base.BaseFragment;
import wannabit.io.cosmostaion.fragment.ReInvestStep0Fragment;
import wannabit.io.cosmostaion.fragment.ReInvestStep1Fragment;
import wannabit.io.cosmostaion.fragment.ReInvestStep2Fragment;
import wannabit.io.cosmostaion.fragment.ReInvestStep3Fragment;
import wannabit.io.cosmostaion.fragment.StepFeeSetFragment;
import wannabit.io.cosmostaion.model.type.Coin;
import wannabit.io.cosmostaion.model.type.Validator;
import wannabit.io.cosmostaion.task.SingleFetchTask.SingleRewardTask;
import wannabit.io.cosmostaion.task.TaskListener;
import wannabit.io.cosmostaion.task.TaskResult;
import wannabit.io.cosmostaion.task.gRpcTask.AllRewardGrpcTask;
import wannabit.io.cosmostaion.utils.WDp;

import static wannabit.io.cosmostaion.base.BaseChain.isGRPC;
import static wannabit.io.cosmostaion.base.BaseConstant.CONST_PW_PURPOSE;
import static wannabit.io.cosmostaion.base.BaseConstant.CONST_PW_TX_REINVEST;
import static wannabit.io.cosmostaion.base.BaseConstant.TASK_FETCH_SINGLE_REWARD;
import static wannabit.io.cosmostaion.base.BaseConstant.TASK_GRPC_FETCH_ALL_REWARDS;

public class ReInvestActivity extends BaseBroadCastActivity implements TaskListener {

    private ImageView               mChainBg;
    private RelativeLayout          mRootView;
    private Toolbar                 mToolbar;
    private TextView                mTitle;
    private ImageView               mIvStep;
    private TextView                mTvStep;
    private ViewPager               mViewPager;
    private ReInvestPageAdapter     mPageAdapter;

    public Validator                mValidator;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_step);
        mChainBg        = findViewById(R.id.chain_bg);
        mRootView       = findViewById(R.id.root_view);
        mToolbar        = findViewById(R.id.tool_bar);
        mTitle          = findViewById(R.id.toolbar_title);
        mIvStep         = findViewById(R.id.send_step);
        mTvStep         = findViewById(R.id.send_step_msg);
        mViewPager      = findViewById(R.id.view_pager);
        mTitle.setText(getString(R.string.str_reinvest_c));

        setSupportActionBar(mToolbar);
        getSupportActionBar().setDisplayShowTitleEnabled(false);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);

        mIvStep.setImageDrawable(getDrawable(R.drawable.step_4_img_1));
        mTvStep.setText(getString(R.string.str_reinvest_step_0));

        mAccount = getBaseDao().onSelectAccount(getBaseDao().getLastUser());
        mBaseChain = BaseChain.getChain(mAccount.baseChain);
        mTxType = CONST_PW_TX_REINVEST;

        mValidator = getIntent().getParcelableExtra("validator");
        mValAddress = getIntent().getStringExtra("valOpAddress");

        mPageAdapter = new ReInvestPageAdapter(getSupportFragmentManager());
        mViewPager.setOffscreenPageLimit(3);
        mViewPager.setAdapter(mPageAdapter);

        mViewPager.addOnPageChangeListener(new ViewPager.OnPageChangeListener() {
            @Override
            public void onPageScrolled(int i, float v, int i1) { }

            @Override
            public void onPageSelected(int i) {
                if(i == 0) {
                    mIvStep.setImageDrawable(getDrawable(R.drawable.step_4_img_1));
                    mTvStep.setText(getString(R.string.str_reinvest_step_0));
                } else if (i == 1 ) {
                    mIvStep.setImageDrawable(getDrawable(R.drawable.step_4_img_2));
                    mTvStep.setText(getString(R.string.str_reinvest_step_1));
                } else if (i == 2 ) {
                    mIvStep.setImageDrawable(getDrawable(R.drawable.step_4_img_3));
                    mTvStep.setText(getString(R.string.str_reinvest_step_2));
                    mPageAdapter.mCurrentFragment.onRefreshTab();
                } else if (i == 3 ) {
                    mIvStep.setImageDrawable(getDrawable(R.drawable.step_4_img_4));
                    mTvStep.setText(getString(R.string.str_reinvest_step_3));
                    mPageAdapter.mCurrentFragment.onRefreshTab();
                }
            }

            @Override
            public void onPageScrollStateChanged(int i) { }
        });
        mViewPager.setCurrentItem(0);

        mRootView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                onHideKeyboard();
            }
        });
        if (isGRPC(mBaseChain)) {
            new AllRewardGrpcTask(getBaseApplication(), this, mBaseChain, mAccount).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);

        } else {
            new SingleRewardTask(getBaseApplication(), this, mAccount, mValidator.operator_address).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
        }
    }

    @Override
    protected void onResume() {
        super.onResume();
        if(mAccount == null) finish();
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case android.R.id.home:
                onBackPressed();
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }

    @Override
    public void onBackPressed() {
        onHideKeyboard();
        if(mViewPager.getCurrentItem() > 0) {
            mViewPager.setCurrentItem(mViewPager.getCurrentItem() - 1, true);
        } else {
            super.onBackPressed();
        }
    }

    public void onNextStep() {
        if(mViewPager.getCurrentItem() < mViewPager.getChildCount()) {
            onHideKeyboard();
            mViewPager.setCurrentItem(mViewPager.getCurrentItem() + 1, true);
        }
    }

    public void onBeforeStep() {
        if(mViewPager.getCurrentItem() > 0) {
            onHideKeyboard();
            mViewPager.setCurrentItem(mViewPager.getCurrentItem() - 1, true);
        } else {
            onBackPressed();
        }
    }

    public void onStartReInvest() {
        Intent intent = new Intent(ReInvestActivity.this, PasswordCheckActivity.class);
        intent.putExtra(CONST_PW_PURPOSE, CONST_PW_TX_REINVEST);
        if (isGRPC(mBaseChain)) {
            intent.putExtra("reInvestValAddr", mValAddress);
        } else {
            intent.putExtra("reInvestValidator", mValidator);
        }
        mAmount.amount = new BigDecimal(mAmount.amount).setScale(0, BigDecimal.ROUND_DOWN).toPlainString();
        intent.putExtra("reInvestAmount", mAmount);
        intent.putExtra("memo", mTxMemo);
        intent.putExtra("fee", mTxFee);
        startActivity(intent);
        overridePendingTransition(R.anim.slide_in_bottom, R.anim.fade_out);
    }

    @Override
    public void onTaskResponse(TaskResult result) {
        if(isFinishing()) return;
        if (result.taskType == TASK_FETCH_SINGLE_REWARD) {
            if (result.isSuccess && result.resultData != null) {
                ArrayList<Coin> rewardCoins = (ArrayList<Coin>)result.resultData;
                for (Coin coin: rewardCoins) {
                    if (coin.denom.equals(WDp.mainDenom(mBaseChain))) {
                        mAmount = new Coin(WDp.mainDenom(mBaseChain), new BigDecimal(coin.amount).setScale(0, RoundingMode.DOWN).toPlainString());
                    }
                }
                mPageAdapter.mCurrentFragment.onRefreshTab();
            } else {
                onBackPressed();
            }

        } else if (result.taskType == TASK_GRPC_FETCH_ALL_REWARDS) {
            ArrayList<Distribution.DelegationDelegatorReward> rewards = (ArrayList<Distribution.DelegationDelegatorReward>)result.resultData;
            if (rewards != null) {
                getBaseDao().mGrpcRewards = rewards;
                mAmount = new Coin(WDp.mainDenom(mBaseChain), getBaseDao().getReward(WDp.mainDenom(mBaseChain), mValAddress).toPlainString());
                mPageAdapter.mCurrentFragment.onRefreshTab();
            } else {
                onBackPressed();
            }
        }
    }


    private class ReInvestPageAdapter extends FragmentPagerAdapter {

        private ArrayList<BaseFragment> mFragments = new ArrayList<>();
        private BaseFragment mCurrentFragment;

        public ReInvestPageAdapter(FragmentManager fm) {
            super(fm);
            mFragments.clear();
            mFragments.add(ReInvestStep0Fragment.newInstance(null));
            mFragments.add(ReInvestStep1Fragment.newInstance(null));
            if (isGRPC(mBaseChain)) { mFragments.add(StepFeeSetFragment.newInstance(null)); }
            else { mFragments.add(ReInvestStep2Fragment.newInstance(null)); }
            mFragments.add(ReInvestStep3Fragment.newInstance(null));
        }

        @Override
        public BaseFragment getItem(int position) {
            return mFragments.get(position);
        }

        @Override
        public int getCount() {
            return mFragments.size();
        }

        @Override
        public void setPrimaryItem(ViewGroup container, int position, Object object) {
            if (getCurrentFragment() != object) {
                mCurrentFragment = ((BaseFragment) object);
            }
            super.setPrimaryItem(container, position, object);
        }

        public BaseFragment getCurrentFragment() {
            return mCurrentFragment;
        }

        public ArrayList<BaseFragment> getFragments() {
            return mFragments;
        }
    }
}
