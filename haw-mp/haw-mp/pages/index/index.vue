<template>
    <view class="page">
        <!-- 轮播图 -->
        <swiper circular="true" interval="8000" duration="1000" class="swiper">
            <swiper-item>
                <image mode="widthFix"
                    src="https://haw-1256365462.cos.ap-guangzhou.myqcloud.com/images/banner/swiper-1.jpg"></image>
            </swiper-item>
            <swiper-item>
                <image mode="widthFix"
                    src="https://haw-1256365462.cos.ap-guangzhou.myqcloud.com/images/banner/swiper-2.jpg"></image>
            </swiper-item>
            <swiper-item>
                <image mode="widthFix"
                    src="https://haw-1256365462.cos.ap-guangzhou.myqcloud.com/images/banner/swiper-3.jpg"></image>
            </swiper-item>
            <swiper-item>
                <image mode="widthFix"
                    src="https://haw-1256365462.cos.ap-guangzhou.myqcloud.com/images/banner/swiper-4.jpg"></image>
            </swiper-item>
            <swiper-item>
                <image mode="widthFix"
                    src="https://haw-1256365462.cos.ap-guangzhou.myqcloud.com/images/banner/swiper-5.jpg"></image>
            </swiper-item>
        </swiper>

        <!-- 消息通知栏 -->
        <view class="notify-container">
            <view class="notify-title">
                <image src="../../static/icon-1.png" mode="widthFix" class="notify-icon"></image>
                消息提醒
            </view>
            <view class="notify-content">
                你有{{ unreadRows }}条未读消息
            </view>
            <image src="../../static/icon-2.png" mode="widthFix" class="more-icon"></image>
        </view>

        <!-- 栏目导航 -->
        <view class="nav-container">
            <view class="nav-row">
                <view class="nav" @tap="toPage('在线签到','../checkin/checkin')">
                    <image mode="widthFix" src="../../static/nav-1.png" class="icon"></image>
                    <text class="name">在线签到</text>
                </view>
                <view class="nav">
                    <image src="../../static/nav-2.png" mode="widthFix" class="icon"></image>
                    <text class="name">员工健康</text>
                </view>
                <view class="nav">
                    <image src="../../static/nav-3.png" mode="widthFix" class="icon"></image>
                    <text class="name">在线请假</text>
                </view>
                <view class="nav">
                    <image src="../../static/nav-4.png" mode="widthFix" class="icon"></image>
                    <text class="name">公务出差</text>
                </view>
            </view>
            <view class="nav-row">
                <view class="nav">
                    <image src="../../static/nav-5.png" mode="widthFix" class="icon"></image>
                    <text class="name">员工日报</text>
                </view>
                <view class="nav">
                    <image src="../../static/nav-6.png" mode="widthFix" class="icon"></image>
                    <text class="name">我的加班</text>
                </view>
                <view class="nav">
                    <image src="../../static/nav-7.png" mode="widthFix" class="icon"></image>
                    <text class="name">付款申请</text>
                </view>
                <view class="nav">
                    <image src="../../static/nav-8.png" mode="widthFix" class="icon"></image>
                    <text class="name">费用报销</text>
                </view>
            </view>
            <view class="nav-row">
                <view class="nav">
                    <image src="../../static/nav-9.png" mode="widthFix" class="icon"></image>
                    <text class="name">公告通知</text>
                </view>
                <view class="nav" @tap="toPage('在线审批', '../approval_list/approval_list')">
                    <image src="../../static/nav-10.png" mode="widthFix" class="icon"></image>
                    <text class="name">在线审批</text>
                </view>
                <view class="nav">
                    <image src="../../static/nav-11.png" mode="widthFix" class="icon"></image>
                    <text class="name">物品领用</text>
                </view>
                <view class="nav">
                    <image src="../../static/nav-12.png" mode="widthFix" class="icon"></image>
                    <text class="name">采购申请</text>
                </view>
            </view>
        </view>
    </view>
</template>

<script>
    export default {
        data() {
            return {
                unreadRows: 24
            }
        },
        onLoad() {

        },
        methods: {
            toPage(name, url) {
                uni.navigateTo({
                    url
                })
            }
        }
    }
</script>

<style lang="less">
    @import url('index.less');
</style>
