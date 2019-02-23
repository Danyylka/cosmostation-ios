package wannabit.io.cosmostaion.base;

public class BaseConstant {
    public final static boolean                 IS_SHOWLOG 					            = true;
    public final static String                  LOG_TAG                                 = "Cosmostation";

    public final static String					DB_NAME			                        = "WannaBit";
    public final static int					    DB_VERSION			                    = 1;
    public final static String					DB_TABLE_PASSWORD			            = "paswd";
//    public final static String					DB_TABLE_MNEMONIC			            = "mnemc";
    public final static String					DB_TABLE_ACCOUNT			            = "accnt";
    public final static String					DB_TABLE_BALANCE			            = "balan";
    public final static String					DB_TABLE_BONDING			            = "bondi";
    public final static String					DB_TABLE_UNBONDING			            = "unbond";
    public final static String					DB_TABLE_PRICE			                = "price";

    public final static String					PRE_USER_ID			                    = "PRE_USER_ID";

    public final static String					SET_USE_FINGERPRINT			            = "SET_USE_FINGERPRINT";
    public final static String					SET_HISTORY_QUERY			            = "SET_HISTORY_QUERY";
    public final static String					SET_HISTORY_ORDER			            = "SET_HISTORY_ORDER";
    public final static int                     SET_HISTORY_QUERY_ALL                   = 0;
    public final static int                     SET_HISTORY_QUERY_TRANSFER              = 1;
    public final static int                     SET_HISTORY_QUERY_STAKING               = 2;
    public final static int                     SET_HISTORY_QUERY_VOTE                  = 3;
    public final static int					    SET_HISTORY_DEC			                = 0;
    public final static int					    SET_HISTORY_ASC			                = 1;

    public final static int					    TASK_INIT_PW		                    = 2000;
//    public final static int					    TASK_ADD_MN		                        = 2001;
    public final static int					    TASK_INIT_ACCOUNT		                = 2002;
    public final static int					    TASK_INIT_EMPTY_ACCOUNT		            = 2003;
    public final static int					    TASK_FETCH_ACCOUNT		                = 2004;
    public final static int					    TASK_FETCH_ALL_VALIDATOR		        = 2005;
    public final static int					    TASK_FETCH_BONDING_STATE		        = 2006;
    public final static int					    TASK_FETCH_UNBONDING_STATE		        = 2007;
    public final static int					    TASK_FETCH_TOTAL_REWARDS		        = 2008;
    public final static int					    TASK_FETCH_SINGLE_VALIDATOR		        = 2009;
    public final static int					    TASK_FETCH_SINGLE_BONDING			    = 2010;
    public final static int					    TASK_FETCH_SINGLE_UNBONDING			    = 2011;
    public final static int					    TASK_FETCH_SINGLE_REWARD		        = 2012;
    public final static int					    TASK_FETCH_SINGLE_SELF_BONDING		    = 2013;
    public final static int					    TASK_PASSWORD_CHECK		                = 2015;
    public final static int					    TASK_FETCH_WITHDRAW_ADDRESS		        = 2016;
    public final static int					    TASK_FETCH_HISTORY	                    = 2017;
    public final static int					    TASK_GEN_TX_SIMPLE_SEND	                = 2018;

//    public final static int					    TASK_INSERT_RAW_KEY		                = 2004;
//    public final static int					    TASK_INSERT_GENERATE_WITH_MNEMONIC	    = 2005;
//    public final static int					    TASK_UNLOCK		                        = 2006;


    public final static String                  COSMOS_AUTH_TYPE_DELAYEDACCOUNT         = "auth/DelayedVestingAccount";
    public final static String                  COSMOS_AUTH_TYPE_ACCOUNT                = "auth/Account";

    public final static String                  COSMOS_MSG_TYPE_TRANSFER                = "cosmos-sdk/Send";
    public final static String                  COSMOS_MSG_TYPE_DELEGATE                = "cosmos-sdk/MsgDelegate";
    public final static String                  COSMOS_MSG_TYPE_UNDELEGATE              = "cosmos-sdk/Undelegate";
    public final static String                  COSMOS_MSG_TYPE_REDELEGATE              = "cosmos-sdk/BeginRedelegate";
    public final static String                  COSMOS_MSG_TYPE_WITHDRAW_DEL            = "cosmos-sdk/MsgWithdrawDelegationReward";
    public final static String                  COSMOS_MSG_TYPE_WITHDRAW_VAL            = "cosmos-sdk/MsgWithdrawValidatorCommission";
    public final static String                  COSMOS_MSG_TYPE_WITHDRAW_MIDIFY         = "cosmos-sdk/MsgModifyWithdrawAddress";


    public final static String                  COSMOS_AUTH_TYPE_STDTX                  = "auth/StdTx";

    public final static String                  COSMOS_KEY_TYPE_PUBLIC                  = "tendermint/PubKeySecp256k1";


    public final static String					CONST_PW_PURPOSE		                = "CONST_PW_PURPOSE";
    public final static int					    CONST_PW_INIT		                    = 5000;
    public final static int					    CONST_PW_UNLOUCK		                = 5001;
    public final static int					    CONST_PW_SIMPLE_CHECK		            = 5002;

//    public final static int					    CONST_PW_SEND		                    = 5002;
//    public final static int					    CONST_PW_CHECK_MNEMONIC		            = 5003;
//    public final static int					    CONST_PW_CHECK_KEY		                = 5004;


    public final static int					    ERROR_CODE_UNKNOWN		                = 8000;
    public final static int					    ERROR_CODE_NETWORK		                = 8001;
    public final static int					    ERROR_CODE_INVALID_PASSWORD		        = 8002;


    public final static String                  COSMOS_ATOM                             = "muon";
    public final static String                  COSMOS_PHOTON                           = "photino";
    //TODO HardCoding!!
    public final static long                    COSMOS_UNBONDING_TIME                   = 259200000000000l;
    public final static long                    COSMOS_UNBONDING_DAY                    = 3;


    public final static String                  characterFilter                         = "[^\\p{L}\\p{M}\\p{N}\\p{P}\\p{Z}\\p{Cf}\\p{Cs}\\s]";
}
