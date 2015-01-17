<?php
namespace User\Model;
use Think\Model;
use Home\Model\MemberModel;

require_once(APP_PATH . 'User/Conf/config.php');
require_once(APP_PATH . 'User/Common/common.php');

class UcenterMemberModel extends Model{

    /* 用户模型自动验证 */
    protected $_validate = array(
        /* 验证用户名 */
        array('username', '4,30', -1, self::VALUE_VALIDATE, 'length'), //用户名长度不合法
        
        array('username', 'checkUsername', -20, self::VALUE_VALIDATE, 'callback'),
        array('username', '', -3, self::VALUE_VALIDATE, 'unique'), //用户名被占用

        /* 验证密码 */
        array('password', '6,30', -4, self::VALUE_VALIDATE, 'length'), //密码长度不合法

        /* 验证邮箱 */
        array('email', 'email', -5, self::VALUE_VALIDATE), //邮箱格式不正确
        array('email', '4,32', -6, self::VALUE_VALIDATE, 'length'), //邮箱长度不合法
        array('email', '', -8, self::VALUE_VALIDATE, 'unique'), //邮箱被占用

        /* 验证手机号码 */
        // array('mobile', '//', -9, self::VALUE_VALIDATE), //手机格式不正确 TODO:
        array('mobile','/1\d{10}/',-9,2,'regex'),
        array('mobile', '', -11, self::VALUE_VALIDATE, 'unique'), //手机号被占用
    );

    /* 用户模型自动完成 */
    protected $_auto = array(
        array('password', 'think_ucenter_md5', self::MODEL_INSERT, 'function', UC_AUTH_KEY),
        array('reg_time', NOW_TIME, self::MODEL_INSERT),
        array('reg_ip', 'get_client_ip', self::MODEL_INSERT, 'function', 1),
        array('update_time', NOW_TIME,self::MODEL_BOTH),
    );


/**
 * 用户登录认证
 * @param  string $username 用户名
 * @param  string $password 用户密码
 * @param  integer $type 用户名类型 （1-用户名，2-邮箱，3-手机，4-UID）
 * @return integer           登录成功-用户ID，登录失败-错误编号
 */
    public function login($username, $password, $type = 1)
    {
        $map = array();
        switch ($type) {
            case 1:
                $map['username'] = $username;
                break;
            case 2:
                $map['email'] = $username;
                break;
            case 3:
                $map['mobile'] = $username;
                break;
            case 4:
                $map['id'] = $username;
                break;
            default:
                return 0; //参数错误
        }
        /* 获取用户数据 */
        $user = $this->where($map)->find();
        if (is_array($user) && $user['status']) {
            /* 验证用户密码 */
            if (think_ucenter_md5($password, UC_AUTH_KEY) === $user['password']) {
                $this->updateLogin($user['id']); //更新用户登录信息
                return $user['id']; //登录成功，返回用户ID
            } else {
                return -2; //密码错误
            }
        } else {
            return -1; //用户不存在或被禁用
        }
    }

/**
     * 注册一个新用户
     * @param  string $username 用户名
     * @param  string $nickname 昵称
     * @param  string $password 用户密码
     * @param  string $email 用户邮箱
     * @param  string $mobile 用户手机号码
     * @return integer          注册成功-用户信息，注册失败-错误编号
     */
    public function register($username, $password)
    {
        $data = array(
            'username' => $username,
            'password' => $password,
            'nickname' => $username,
        );
        /* 添加用户 */
        $usercenter_member=$this->create($data);
        if ($usercenter_member) {
            $uid = $this->add($usercenter_member);
            return $uid ? $uid : 0; //0-未知错误，大于0-注册成功
        } else {
            return $this->getError(); //错误详情见自动验证注释
        }
    }

/*编辑用户的基本信息*/
    public function editUser($data){
        $datas = $this->create($data);
        /*dump($datas);
        die;*/
        if($datas){
            if($this->save($datas)){
                return true;
            }else{
                return false;
            }
        }else{
            return $this->getError();
        }
    }



/**
 * 更新用户登录信息
 * @param  integer $uid 用户ID
 */
    protected function updateLogin($uid)
    {
        $data = array(
            'id' => $uid,
            'last_login_time' => $_SERVER['REQUEST_TIME'],
            'last_login_ip' => get_client_ip(1),
            // 'last_login_ip' => ip2long($_SERVER['REMOTE_ADDR']),
        );
        M('ucenter_member')->save($data);
        M('ucenter_member')->where("id={$uid}")->setInc('login');
    }

protected function checkUsername($username)
    {

        //如果用户名中有空格，不允许注册
        if (strpos($username, ' ') !== false) {
            return false;
        }
        preg_match("/^[a-zA-Z0-9_]{1,30}$/", $username, $result);

        if (!$result) {
            return false;
        }
        return true;
    }



}

