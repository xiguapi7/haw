<template>
  <view>
    <image class="logo" mode="widthFix" src="../../static/logo-2.png"></image>
    <view class="register-container">
      <input v-model="registerCode" class="register-code" maxlength="6" placeholder="输入你的邀请码" type="text"/>
      <view class="register-desc">管理员创建员工证账号后，可以从你的个人邮箱中获得注册邀请码</view>
      <button class="register-btn" open-type="getUserInfo" @tap="register()">
        执行注册
      </button>
    </view>
  </view>
</template>

<script>
export default {
  data() {
    return {
      registerCode: ""
    }
  },
  methods: {
    register: function () {
      uni.login({
        provider: 'weixin',
        success: function (resp) {
          // 获取微信临时授权码
          let code = resp.code

          uni.getUserInfo({
            provider: "weixin",
            success: function (resp) {
              let nickName = resp.userInfo.nickName
              let avatarUrl = resp.userInfo.avatarUrl
              console.log(nickName)
              console.log(avatarUrl)
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
