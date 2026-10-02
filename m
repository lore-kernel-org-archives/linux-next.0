Received: from mail-dy2-f19.google.com (mail-dy2-f19.google.com [74.125.229.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10EA19D8BC
	for <linux-next@vger.kernel.org>; Fri,  2 Oct 2026 02:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790908233; cv=none; b=NXrIPJiuy12QklYXSwrc7aCl9xFcAE2+v1n6igTPFau1d3FPtzflelIcp39muFvUbZwYvP8JAJdQM/LQSZEKX/uGKXYya6BCBRf06pyugyD32+2oZybr7PuVQoA0hL+d4/EOpkJvp2hWICuTROR6YhSyEwANx3Ft2oy3i1RQ3HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790908233; c=relaxed/simple;
	bh=RuTApN0UPe2hPEF8+noB8aZgebLGmPZr/LMzlFVcecQ=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=TzXgq5D/Zgyn3swTrbUQmkCfKfEC6lTWONIy6NwLg18mVF/6Zl2Gi+DeYki8SJyiktx3/frPnbzvyS8qBqV/9gLXJ1vXJINkA1KkS1dqJVu5MQw1CA5ZK5rlXSy3Fv436j27LUd8+dWUiABoRYVaJRukD8O7uL3+WNoyZ5VW4ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=UyksAURr; arc=none smtp.client-ip=74.125.229.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="UyksAURr"
Received: by mail-dy2-f19.google.com with SMTP id 5a478bee46e88-34d2d25127aso1382290eec.1
        for <linux-next@vger.kernel.org>; Thu, 01 Oct 2026 19:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1790908230; x=1791513030; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WPt+XjmTF9IMBWFB346uVbnxM2TY5639+HMb8WxiOAU=;
        b=UyksAURrb8ysHZiODkY0IdYhSzBSzkyE3C6ce7Rx5IJM69GB6GJ7K/3JiecicTEcuy
         wqeLsIEY5s094yKkW9wjZ3xOAbkUbbfIs/GDTvUqjTKv6sB/wnu9rKGsjwAxLzsSAi5j
         O2vRDmMHmsyQfs9sUEOO+c8a0WxIgAgG6pXjNEQ1Mc0Q2IxkaS8bPV7yMoPd5FLXJNZR
         hhXnhRo0zjspLo6u4MpVOgpZuWEnsNe0R8U1x8wDXfGtuqrOPbZXSSUCbwf7RZkZ+Yyf
         EcJV7x7J+284hu50J2xqFElEVu1jgUSMO+KNguYqQRV/7ehMQ2MYMRhrFS4nIk72wmEN
         YxrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790908230; x=1791513030;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WPt+XjmTF9IMBWFB346uVbnxM2TY5639+HMb8WxiOAU=;
        b=BKDmXocx0+HoE9kiKAEbGX69I5Dog6k+Rjz3roeuGJno+pJbBuhBy2/myJFznouiy6
         H/KGlpOajuHJEEOeIdb25wGQYAJngK5HdqwhTYZMX2Nb+A7azY6u3RQyWMijRWejwHnU
         4q9PKy2QaI7ioSH+9VERR4KrybGqdGrF9kr06PDMCfjkKFyn0nqr4LgJP1MosmCuJo51
         WpPfUUSc5M3DdJVkiGrULMMisoVR0EiHgXfnJoTxm1/e68HgP5tXZe76SYHDArZidqIH
         DoXGQ5u4qcJkJpKySn90IuxLiCYWabLy8e5OtqVz+AsjH17I2vuONivS4D/y3SetSHqp
         cTBA==
X-Gm-Message-State: AFq9FYJ38D8v46FBQJXtKZBgb20hWrb9vWSUStv/LtQRfuWSjd/WFu1g
	MISn00DGj3/cLtq+OR/VqccvQH0HXm8bi9btrv1bCZj3l16JDRk00eMfNfzyLij3pXKeoOW+yca
	9VnEA
X-Gm-Gg: AYBFou1ENEpTCHXMZqr5WiGCVEZnyWDKHL+Feuy/03fjpkA9vcOU77h7h8PiV4dL0QQ
	q4+f2RAJmaUYqpMQjlBhHBdRph6royiGUdQILWRyKwIJIONmCDi0DvGFM4PrhtwZL/4A5zm+2Yq
	VxjiTq+3tsF1ew/qIEWGzP3oZKCkK5n94T1+IsztAob+luj6WA5NWNd8Q50lRPHil7/6kry0RL3
	tRg40dXtmPuDM0TptE3ewiqRHoK/YQSvrZ9k+Ts2gEKsMxlAbpQiA3uiMOcJh6MYM6RmqBDdi90
	j/7Bacn/SLYQTLyCyDDCDnqITSb4sE0OKPW0Awm519ElJ1COWp72ru7Gw15TK5tbecVeRyzzGAk
	OUeVibD9APWHJdJvsZmgq7UKL7/Bxig8C3oBgLVUeRosUe7LwwNjiVXP/hodlqDAIxY93koQIdN
	zRIzb0Q+uKhJToQdBqn2qso40cS9eM4zkUjKh1X1sBwunfa5mytfNm9FO2HndhvMo=
X-Received: by 2002:a05:7300:f58d:b0:34d:4cb9:f24c with SMTP id 5a478bee46e88-34f150cc0a1mr1343620eec.20.1790908230230;
        Thu, 01 Oct 2026 19:30:30 -0700 (PDT)
Received: from 5a6d9a2c18a2 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14fdfc58sm1949228eec.24.2026.10.01.19.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 19:30:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 9f24d789f03b22941b905ded43cb5ff8eea9ce62
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 02 Oct 2026 02:30:29 -0000
Message-ID: <179090822918.179516.16719126299555187781@5a6d9a2c18a2>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/9f24d789f03b22941b905ded43cb5ff8eea9ce62/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 9f24d789f03b22941b905ded43cb5ff8eea9ce62
origin: maestro
test start time: 2026-10-01 16:41:01.054000+00:00

Builds:	   70 ✅    1 ❌    0 ⚠️
Boots: 	  163 ✅    8 ❌    0 ⚠️
Tests: 	22121 ✅ 3112 ❌ 3605 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: hamoa-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_bc0000_i2c_b80000_touchpad_15
      last run: https://d.kernelci.org/test/maestro:6abeb117a3f195e1aa1834b7
      history:  > ✅  > ❌  
            
Hardware: jetson-agx-orin-industrial-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6abebbeca3f195e1aa18d668
      history:  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: acer-cbv514-1h-34uz-brya
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6abeaacca3f195e1aa17c53c
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6abeab70a3f195e1aa17d21f
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: acer-cp514-3wh-r0qs-guybrush
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6abeaacea3f195e1aa17c55b
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6abeab66a3f195e1aa17ceee
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6abec15fa3f195e1aa18f64a
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6abec475a3f195e1aa190b74
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: hamoa-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.devices-probe
      last run: https://d.kernelci.org/test/maestro:6abea808a3f195e1aa17acac
      history:  > ❌  > ✅  
            
Hardware: r8a779m1-ulcb
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6abec165a3f195e1aa18f661
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6abec44ca3f195e1aa190715
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: rk3576-rock-4d
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6abec168a3f195e1aa18f6f6
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6abec1e3a3f195e1aa18fc0b
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: rk3588-rock-5b
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6abec169a3f195e1aa18f6f9
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6abec207a3f195e1aa18fc9f
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: sun50i-a64-pine64-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:6abea9f0a3f195e1aa17c0df
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp9.VP9-TEST-VECTORS-GStreamer-VP9-V4L2.vp90-2-15-segkey-webm
      last run: https://d.kernelci.org/test/maestro:6abee9ada3f195e1aa1a8147
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-01-intra-1416
      last run: https://d.kernelci.org/test/maestro:6abee8d5a3f195e1aa1a7c4c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-01-intra-1417
      last run: https://d.kernelci.org/test/maestro:6abee8d5a3f195e1aa1a7c4b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - fluster.debian.v4l2.gstreamer_vp9.VP9-TEST-VECTORS-GStreamer-VP9-V4L2.vp90-2-15-segkey-webm
      last run: https://d.kernelci.org/test/maestro:6abee9bba3f195e1aa1a83ba
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: exynos850-e850-96
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6abebbe8a3f195e1aa18d5f8
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.breakpoints
      last run: https://d.kernelci.org/test/maestro:6abebbe8a3f195e1aa18d5fb
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6abebbe7a3f195e1aa18d5f2
      history:  > ❌  > ❌  > ✅  > ✅  
            
Hardware: imx6q-sabrelite
  > Config: multi_v7_defconfig+preempt_rt
    - Architecture/compiler: arm/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6abeb039a3f195e1aa182ea6
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6abeb0b4a3f195e1aa18321a
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: mt8390-genio-700-evk
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6abec164a3f195e1aa18f654
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6abec792a3f195e1aa19290b
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: rk3399-rock-pi-4b
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6abec167a3f195e1aa18f664
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6abec460a3f195e1aa190b04
      history:  > ❌  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: qemu-arm64
  > Config: defconfig+netdev+nfs-root-boot+ltp
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6abea479a3f195e1aa1770e2
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-01
      last run: https://d.kernelci.org/test/maestro:6abee8d5a3f195e1aa1a7c46
      history:  > ❌  > ✅  > ❌  > ✅  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-02
      last run: https://d.kernelci.org/test/maestro:6abee8d5a3f195e1aa1a7c45
      history:  > ❌  > ✅  > ✅  > ❌  > ✅  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
