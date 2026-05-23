Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5343329CB24
	for <linux-next@vger.kernel.org>; Sat, 23 May 2026 02:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779503421; cv=none; b=BfCvnnpp34mRYDMf4efxTKyppfDrB0sTaF+PMMIuATt3gwTL5jnZ4YrQMSb/NagE4Et7ZX/+eknjAxwMKbDnS57UoLXUFq9n5XHqAa3IphxxQVBiJ5kd7zTRrQigTUg2npmA826F/s7nWfk4ysN68kAjrlMJpS3JU7jRCQp34mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779503421; c=relaxed/simple;
	bh=6nW7mDXM/VFfs4n1Qppa/YlmUBDvZtybxDNF4E6H/rw=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=SMqXlMyZaMOjfzzPea5ZYyfPbvElbsy45n0R8QLiW6/b1OWDUWrgloiAi6JfiYg3u0uxXCc9/Yoowj7EpX+TCGP2mya6IO7VAx06I4kFHIjeyae7XHV7kbznPaiB+gZQvp/qFXtlOHDOzN9hg88bgJO+5Uxly0psww9p/wCxC/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=jCDEwqLc; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="jCDEwqLc"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2f0ad52830cso10291140eec.1
        for <linux-next@vger.kernel.org>; Fri, 22 May 2026 19:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1779503418; x=1780108218; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TXsg3dAkmbix/umvwG91YwbS01JhT0Nhsqy/VHmI5Yk=;
        b=jCDEwqLcVPHREemJ26RBLh81hP7KNreJAXk6KA6/ge2rJwXcGT4fGGsiCSSzrhJfKQ
         JcztEjcJegGRw+/e6AuWzDfsw+ccVixvlASCT2CuPsr6d3ErcuGHrslH3uF0P2IHnyjc
         XhcUWp0IrHzxAPWaymdez9LOD231wWOqkVmkvptD0lo21uqASGjZeGn3kAaK5ASS9TQJ
         FISjPzVjyKr7yvdE/YegPYkw9c4Q5YoVHn/Xx5nzypmqKROts8ng4G04xaGvL7tptarK
         Tp3RYmrhvRjmLB+WTZPFWjzYfMvRibSw7AicTGCApwWUk1gELbsPGDGwcXA3Q0NvZGWU
         mwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779503418; x=1780108218;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TXsg3dAkmbix/umvwG91YwbS01JhT0Nhsqy/VHmI5Yk=;
        b=ilpHjOyKRUhYYAVJ/yjZu1fcFsjcMWJnX/TRmuwOprq3zGVloRBeWcVTsGFn/A8mYt
         8pelxJP/gENuiiY+NQvBPUI0CXYsrStsi89DVmaJJJ9EcrgwTYpjUe+ftO8Anxxq8SUO
         8tLRg3aRCMmRHFHHnm6MIgNm7rb7I5BHJAwZb9yuxjah7viBnWNf+7CRQ5rGOlJr70a7
         cVjv4tqr78BIuqh+xsbrEr+Ow82IfL+Wk1bYtMuZO3JHRSEhVnrDI7EqhJyWR4fuiarg
         nhu1lLTw8QXR+vLdF5ocRXW5SjzTnfeLOvJF6Zi5zYukgCcgxqyfFNohNLvNEAjIbTEq
         gD7w==
X-Gm-Message-State: AOJu0YzMliSkYS0ysBrOil/6bw9byzo68QLEKdOk4q2uVrhaHRDeAb/v
	pEhsLiMED5PX5SdziQGfOf2eB3X+AHFhN7sM99BsSXZMc/ZGzA20mi0urW+nFV9L5Z9L+95q7m/
	Q9OWA
X-Gm-Gg: Acq92OHt9FCaqT1t8lfE5rVIBonomP7dKWU41msjhxeB+IGz21v8799dYkmusNAixSh
	AquMYGYUBeb9VJfxP+hYPMqnZvu3LNacj+sJh1nFdLRnkLyePUZmWB+wfk70GK0H7+2dbd7ibcN
	2jaDSXBPfGgbtTa8rqPHIlXzNJy1d87Rh4qX3BklsYqmLb7T+LEadUZQ1pQDNNPwnRb5diTAbe3
	OzWXibpW8gm/giwvco12UqqDR/uAISJLxJuXKeyXc1xUnCd1MCE06gCCwr6yZizpucxoUYXkxl7
	S2EJT4SphJ66W+D97cOYRh2ZjYQYA5r2NeM4LHSW1YUMd5bwp1kAy6sotzqnSHNDfeKs4VYEw1Y
	E3dd4PHtE9lGVJ6zbQKQftqlYn6dB962+eaMRGHbJug75dwVel3MsZKOTutOcONVJ5DUhEEvU4m
	cX254tm9Cfxa4LfrFQ
X-Received: by 2002:a05:7301:198f:b0:2da:44ac:6d17 with SMTP id 5a478bee46e88-30449185e04mr2739831eec.17.1779503418215;
        Fri, 22 May 2026 19:30:18 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30451f1f38bsm2301556eec.9.2026.05.22.19.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 19:30:17 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - c1ecb239fa3456529a32255359fc78b69eb9d847
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sat, 23 May 2026 02:30:17 -0000
Message-ID: <177950341726.4446.2578595066986948769@330cfa3079ca>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/c1ecb239fa3456529a32255359fc78b69eb9d847/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: c1ecb239fa3456529a32255359fc78b69eb9d847
origin: maestro
test start time: 2026-05-22 13:34:31.877000+00:00

Builds:	   58 ✅    1 ❌    0 ⚠️
Boots: 	  123 ✅   52 ❌    8 ⚠️
Tests: 	21830 ✅ 4208 ❌ 5521 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_crypto_1d90000
      last run: https://d.kernelci.org/test/maestro:6a1066215bf5d05c973d96f3
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: sc7180-trogdor-lazor-limozeen
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:6a10649a5bf5d05c973d85ac
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh
      last run: https://d.kernelci.org/test/maestro:6a10661d5bf5d05c973d8fc2
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_crypto_1d90000
      last run: https://d.kernelci.org/test/maestro:6a10661d5bf5d05c973d90f7
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_i2c_30a50000_eeprom_50
      last run: https://d.kernelci.org/test/maestro:6a10785c5bf5d05c973e07ef
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: mt8390-genio-700-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11e00000_typec-mux_48
      last run: https://d.kernelci.org/test/maestro:6a1070375bf5d05c973dc21c
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_spi_11010000_can_0
      last run: https://d.kernelci.org/test/maestro:6a1070415bf5d05c973dc3d5
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_vcodec_17020000
      last run: https://d.kernelci.org/test/maestro:6a1065f95bf5d05c973d8afc
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_16020000
      last run: https://d.kernelci.org/test/maestro:6a1065f95bf5d05c973d8afb
      history:  > ❌  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a106f5f5bf5d05c973dbdb6
      history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
Hardware: bcm2837-rpi-3-b-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:6a106f875bf5d05c973dbef1
      history:  > ✅  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:6a107c1a5bf5d05c973e1e0e
      history:  > ✅  > ❌  > ✅  > ❌  > ✅  
            
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a1064175bf5d05c973d7ea0
      history:  > ✅  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
Hardware: cd8180-orion-o6
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a106f1b5bf5d05c973dbb80
      history:  > ✅  > ⚠️  > ⚠️  > ✅  > ⚠️  
            
  > Config: defconfig+netdev+nfs-root-boot+kselftest
    - Architecture/compiler: arm64/gcc-14
      - ltp
      last run: https://d.kernelci.org/test/maestro:6a106dd55bf5d05c973db9fc
      history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a1064185bf5d05c973d7fb7
      history:  > ⚠️  > ✅  > ⚠️  > ✅  > ⚠️  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:6a106f665bf5d05c973dbde3
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.alsa.alsa_pcm-test
      last run: https://d.kernelci.org/test/maestro:6a107daf5bf5d05c973e46bb
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:6a1083a15bf5d05c973ed2b0
      history:  > ❌  > ✅  > ✅  > ❌  > ✅  
            
Hardware: qemu-x86_64
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a1062ca5bf5d05c973d5db5
      history:  > ⚠️  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.uevent
      last run: https://d.kernelci.org/test/maestro:6a1080855bf5d05c973e8af5
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.uevent.uevent_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:6a1081a75bf5d05c973eb3df
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.uevent.uevent_uevent_filtering_global_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:6a1081a75bf5d05c973eb3e0
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller0_14001000
      last run: https://d.kernelci.org/test/maestro:6a1065f95bf5d05c973d8b5d
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58_aux-bus_panel
      last run: https://d.kernelci.org/test/maestro:6a1065f95bf5d05c973d8b51
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_17030000
      last run: https://d.kernelci.org/test/maestro:6a1065f95bf5d05c973d8b46
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14008000
      last run: https://d.kernelci.org/test/maestro:6a1065f95bf5d05c973d8b35
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14009000
      last run: https://d.kernelci.org/test/maestro:6a1065f95bf5d05c973d8b34
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_1400a000
      last run: https://d.kernelci.org/test/maestro:6a1065f95bf5d05c973d8b33
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400b000
      last run: https://d.kernelci.org/test/maestro:6a1065f95bf5d05c973d8b28
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400c000
      last run: https://d.kernelci.org/test/maestro:6a1065f95bf5d05c973d8b27
      history:  > ❌  > ✅  > ❌  > ✅  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
