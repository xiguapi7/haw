<template>
    <view>
        <image class="logo" mode="widthFix" src="../../static/logo-1.png"></image>
        <view class="logo-title">
            Haw
        </view>
        <view class="logo-subtitle">
            在线办公小程序
        </view>
        <button class="login-btn" open-type="getUserInfo" @tap="login()">
            登录
        </button>
        <view class="register-container">
            <text class="register" @tap="toRegister()">注册</text>
        </view>
    </view>
</template>

<script>
    export default {
        data() {
            return {}
        },
        methods: {
            login() {
                let that = this
                uni.login({
                    provider: 'weixin',
                    success(resp) {
                        let code = resp.code
                        that.ajax(that.url.login, 'POST', {
                            code
                        }, (resp) => {
                            let permission = resp.data.permission
                            uni.setStorageSync('permission', permission)
                            console.log('login success')
                            // TODO 跳转到登录页面
                        })
                    },
                    fail(e) {
                        console.log(e)
                        uni.showToast({
                            icon: 'none',
                            title: '执行异常'
                        })
                    }
                })
            },
            toRegister() {
                uni.navigateTo({
                    url: '../register/register'
                })
            }
        }
    }
</script>

<style lang="less">
    @import url("login.less");
</style>
