<template>
    <view>
        <image class="logo" mode="widthFix" src="../../static/logo-2.png"></image>
        <view class="register-container">
            <input v-model="registerCode" class="register-code" maxlength="6" placeholder="输入你的邀请码" type="text" />
            <view class="register-desc">管理员创建员工证账号后，可以从你的个人邮箱中获得注册邀请码</view>
            <button type="default" class="register-btn" @tap="register()">
                执行注册
            </button>
        </view>
    </view>
</template>

<script>
    export default {
        data() {
            return {
                registerCode: ''
            }
        },
        methods: {
            // 注册
            register() {
                let that = this

                // 校验邀请码
                if (that.registerCode === null || that.registerCode.length === 0) {
                    uni.showToast({
                        icon: 'none',
                        title: '邀请码不能为空'
                    })
                    return
                }
                // 校验邀请码
                if (/^[0-9]{6}$/.test(that.registerCode) === false) {
                    uni.showToast({
                        icon: 'none',
                        title: '邀请码必须是6位数字'
                    })
                    return
                }

                // 封装请求参数
                let data = {
                    code: '',
                    nickname: '',
                    photo: '',
                    registerCode: that.registerCode
                }

                uni.getUserProfile({
                    desc: '信息仅用于绑定用户',
                    lang: 'zh_CN',
                    success: (user) => {
                        data.nickname = user.userInfo.nickName
                        data.photo = user.userInfo.avatarUrl
                        console.log(user.userInfo)

                        uni.login({
                            provider: 'weixin',
                            success: (resp) => {
                                data.code = resp.code
                                console.log('data.code: ', data.code)

                                // 提交请求
                                that.ajax(that.url.register, 'POST', data, function(resp) {
                                    let permission = resp.data.permission
                                    uni.setStorageSync('permission', permission)
                                    
                                    // 跳转首页, 跳转包含tabBar的页面需要使用switchTab
                                    uni.switchTab({
                                        url: '../index/index'
                                    })
                                })
                            }
                        })
                    }
                })
            }
        }
    }
</script>

<style lang="less">
    @import url("register.less");
</style>
