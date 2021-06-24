import Vue from 'vue'
import App from './App'

Vue.config.productionTip = false

// 后台接口地址
const baseUrl = 'http://localhost:9000/haw-api'

App.mpType = 'app'

const app = new Vue({
    ...App
})
app.$mount()

// 绑定网络请求接口地址
Vue.prototype.url = {
    register: `${baseUrl}/user/register`,
    login: `${baseUrl}/user/login`
}

// 封装ajax, 参数分别为为请求地址、请求方法、请求参数、请求成功回调
Vue.prototype.ajax = (url, method, data, fun) => {
    uni.request({
        url,
        method,
        data,
        'header': {
            token: uni.getStorageSync('token')
        },
        success(resp) {
            const statusCode = resp.statusCode
            if (statusCode === 401) {
                // 未登录状态, 跳转登录页面
                uni.redirectTo({
                    url: '/pages/login/login'
                })
            } else if (statusCode === 200 && resp.data.code === 200) {
                // 成功响应状态
                // 0. 获取后台返回数据
                const data = resp.data
                // 1. 从数据中提取token
                if (data.hasOwnProperty('token')) {
                    console.log(resp.data)
                    const token = data.token
                    // 将token保存到storage中
                    uni.setStorageSync('token', token)
                }
                // 2. 执行回调函数, 参数为响应对象resp
                fun(resp)
            } else {
                // 其他状态
                uni.showToast({
                    icon: 'none',
                    title: resp.data
                })
            }
        }
    })
}
