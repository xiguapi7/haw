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
    login: function () {
    },
    toRegister: function () {
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
