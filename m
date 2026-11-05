Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793845826;
	b=rwPUo01DJanHRWDL0flUZSXdsDuTVuQS51uvpP7kZHICbEmXvwayATNH610xoS0U3YCT
	 F+a4sKKZxCT91wl5jjsC+JEDz+Jc/v+AAg5DJzAx/tL9+SFlqfKokvViaXNheIsm/IKS3
	 UP30+mT3sRmXNoyUlRnHEj+iRkmeSg+4+UsxATVa2ACyozO0QAW6dBhNyX8Wc4EM9HX4P
	 CdVatLpeZo1SrZfz2ir9rw9gAjJ+1DipSR8AyOAIeLLdawurv/bwxeT8xCT3PlGwMfQyL
	 FfMOq1JJYo3pDwoPygV9MkdRPZX8wM4AgVqTJ2bqQmOdFiFZOHn2psuE1BHo7B89Msw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793845826;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:To:Cc:Reply-To:
	 Date:Message-ID;
	bh=SmhGAH9lbKrfuLZcZkaBtmGpUhnVeZEUFGZqfVx6jbw=;
	b=JiuDih3SGz0Ff35f0fnfNI4QEMAT0L44iYH2jp/oLulEneWgWT9CuhoFXUbruxFqhxfH
	 e2Q8kZLFmXMQBgAhnJNzXut6BHsokdhowRWJDGK06hLqpyFQo0aekyeRv5iUU9BS4tvyi
	 nUuhFcZyHYooZrdpar002qnxhJz9q//sI9llyOUp1XOdhuSVREjTJYdtsT9Fb9LAaGpoU
	 9einwpMyzwll4ag35FvHmZ1pOC2U0fACFly16rN4ol4Xu9oRq0q5p2OSl8Y2LqdGZVy38
	 Zvc2sRwWxr6iSquweNUWHlEUUjHFBjGeIbob0+xksz3T3oggwMbJjiF0TSxqoxbRgMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=V0jrk7+d;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44D8606A31B
	for <linux-next@vger.kernel.org>; Thu,  5 Nov 2026 02:30:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A44D8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=V0jrk7+d
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36a1947498bso3594763eec.1
        for <linux-next@vger.kernel.org>; Wed, 04 Nov 2026 18:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1793845824; x=1794450624; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SmhGAH9lbKrfuLZcZkaBtmGpUhnVeZEUFGZqfVx6jbw=;
        b=V0jrk7+di5j8bGhN0ZkMaiiBMyz88n1VbPOOoQ3BjaJ2bUPIdgMJQ1gtO1c1tR4XAV
         HtSdqr8DzfKB18EPaEESlimWDO6jHHKg3imWMQeJiBVlDmSbL+E64cjgDVQYYgNvL2gu
         VgBoDjXBZDOm8clmvSMSPvN1VbzzrD8p1mLMV0leywqZyjnFy2YZZ8UQhs6qDmfgvkfK
         1WyTvXjj8boNnvuD3i8iuwQXmspE7F6h4BS0IgulXlNTpZwE/KtC5BjJ9wibyzvqVxUW
         n350ExQZB1sDaP9jex2kOr/UggnH7WbUS/G1+g/ZtJ/CbDr1G2IGgTfcm0xEYf3uENbk
         gLTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793845824; x=1794450624;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SmhGAH9lbKrfuLZcZkaBtmGpUhnVeZEUFGZqfVx6jbw=;
        b=hVJqgUGyNdRsh+IZMg5ATPRoA6VC5Fqjo2D8ojSyY/t33i8SEfVR9NP5+oBF6Pxp0D
         nZfvr63/XE84p5oIURdi7+MLmVA6QOwqcFuaKVVu7r9qjWoSlphi6abVn3lVjzAKsOY4
         +ws7/3dyGPFsNuqHm/rh9r7sHf9+tRVtSHRx/gveOYE44okXEfOcLa5r0K20YR0Fz9sK
         eeu2u7UpOcJEFvjbMGn0ATeKB6SFJNNGZvj7yt7JPcvTvasz0EfmqwIIKPoTO8rdA14z
         6hjEFG0r5ZCGUyGxN/j9UFkgPWPJUY5HgQoNhHfF8VmS0JfSSKSqDemBE2opuj+D+ea4
         B/Ew==
X-Gm-Message-State: APuU4Z+VuRpcRPFi7YdbJTZK1bRZqmbeq/D2+bOzZvyIIJRrxqUcupHC
	KNT0P0uDSX81JQpD8S7AZJwmrp9ww6IYumkfSV4QYudyYuMQWrsKBYJAxSUTNIQVyddA5YQ8pFB
	m+pDW
X-Gm-Gg: AYBFou1oXznGzo1ohI9t+xlcoemDqFPNwMV8Vwe+zlIR5J9hT6T65w2G4BiknZn64hm
	IEtwlloLnh5ddREJR1HjdUYyyWRVKSfUWmDSz+X4Bz3nCNAa1IyUr1P3duGVQoHG4pcmEYlc4eT
	oxeVh+aA8Zu34dvCt+hvY0hH+SMRogqkfCBT1bxcUZ53aTiKquzYl94FCckVi6Ys3g+NDGdcFI0
	i+KC7VHo+CtYP1Fa09BoPPnCvu3IEWpmB3jRKAyHjQaunPaXsMiOmppczsoH+dC9Y5EimJDoqOH
	qE1fXrSHzn/MRalktU6pchV8YHv666UWXmzcSfqRCyf8wMnFpikGBvUwOn1a9eqftguvnZS/Uq4
	mEIuwrWvgEs0u26Mux/3dTYQI50aiqKsqMQLAiDwwuhTPXK4Bx6FdS/+RyPydTSOzvMSGEbcfSC
	ZmCXX2o3pImS9BCdAJ5Z2IyOImiMqrI0344jBFjGLb3paJa5cm9HUJSLGgNLfXarh7UsAtLdLYx
	vpAuyVEUYA46v4/FsHDwZU2PYtGHbc741Z+R/ghMyTEbyvL5VWZLDa0w44JrnlPJChI4cWuwd9R
	Cpk3cuEvYfVyauwYLXWbhA==
X-Received: by 2002:a05:7022:7f0b:b0:1a5:32b2:9053 with SMTP id a92af1059eb24-1ac5e22ad00mr25563639c88.37.1793845824024;
        Wed, 04 Nov 2026 18:30:24 -0800 (PST)
Received: from 34406640b1f4 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c283sm12552932c88.4.2026.11.04.18.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 18:30:23 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 05 Nov 2026 02:30:23 -0000
Message-ID: <179384582276.341757.17070207335647004433@34406640b1f4>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
origin: maestro
test start time: 2026-11-04 13:54:09.915000+00:00

Builds:	   73 ✅    2 ❌    0 ⚠️
Boots: 	  232 ✅   20 ❌    0 ⚠️
Tests: 	50952 ✅ 3306 ❌ 9199 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: aws-ec2-arm64
  > Config: defconfig+aws-ec2
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6aeb431e5b429d354eeabef8
      history:  > ✅  > ❌  
            
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+netdev+nfs-root-boot+ltp+crypto+ima
    - Architecture/compiler: arm64/gcc-15
      - ltp.af_alg07
      last run: https://d.kernelci.org/test/maestro:6aeb61bf5b429d354eebf5e8
      history:  > ✅  > ❌  
            
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.kvm.kvm_nested_tsc_scaling_test
      last run: https://d.kernelci.org/test/maestro:6aeb62805b429d354eebffa7
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - ltp.epoll_wait02
      last run: https://d.kernelci.org/test/maestro:6aeb62785b429d354eebfaa6
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: imx6q-sabrelite
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp
      last run: https://d.kernelci.org/test/maestro:6aeb4bdd5b429d354eeb6301
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
Hardware: jetson-agx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp.epoll_pwait03
      last run: https://d.kernelci.org/test/maestro:6aeb9b275b429d354eee980c
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - ltp.poll02
      last run: https://d.kernelci.org/test/maestro:6aeb9b275b429d354eee987a
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - ltp.shmget03
      last run: https://d.kernelci.org/test/maestro:6aeb9b275b429d354eee98b4
      history:  > ✅  > ✅  > ❌  > ❌  
            
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_af5c000
      last run: https://d.kernelci.org/test/maestro:6aeb54ad5b429d354eebd322
      history:  > ✅  > ❌  > ❌  
            
Hardware: sun50i-a64-pine64-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_pcm-test_default_time7_sun50ia64audio_0_0_CAPTURE
      last run: https://d.kernelci.org/test/maestro:6aeb483f5b429d354eeb3a4e
      history:  > ✅  > ✅  > ❌  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-03
      last run: https://d.kernelci.org/test/maestro:6aeb44cb5b429d354eeb02d3
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: nvidia-p3809-gb300
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6aebb3015b429d354eef2628
      history:  > ✅  > ❌  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6aebb3015b429d354eef2623
      history:  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.x86.x86_syscall_numbering_64
      last run: https://d.kernelci.org/test/maestro:6aeb62825b429d354eec006a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.futex_wait05
      last run: https://d.kernelci.org/test/maestro:6aeb62795b429d354eebfbe5
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.poll02
      last run: https://d.kernelci.org/test/maestro:6aeb62785b429d354eebfacf
      history:  > ❌  > ❌  > ✅  > ✅  
            
Hardware: jetson-agx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp.pselect01
      last run: https://d.kernelci.org/test/maestro:6aeb9b275b429d354eee9883
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: jetson-tx2-nx-devkit
  > Config: defconfig+lab-setup
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_freezer
      last run: https://d.kernelci.org/test/maestro:6aeb4b125b429d354eeb5ad2
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_freezer_test_cgfreezer_time_migrate
      last run: https://d.kernelci.org/test/maestro:6aeb4b125b429d354eeb5ace
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_af54000
      last run: https://d.kernelci.org/test/maestro:6aeb54ad5b429d354eebd324
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6aeb6c005b429d354eeceb67
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.timers.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:6aeb6c005b429d354eeceb68
      history:  > ❌  > ✅  > ✅  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.devices-exist
      last run: https://d.kernelci.org/test/maestro:6aeb44a25b429d354eeb0194
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000
      last run: https://d.kernelci.org/test/maestro:6aeb6eba5b429d354eecf7c6
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_display-controller_ae01000
      last run: https://d.kernelci.org/test/maestro:6aeb6eba5b429d354eecf7c5
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_dsi_ae94000
      last run: https://d.kernelci.org/test/maestro:6aeb6eba5b429d354eecf7c0
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_edp_aea0000
      last run: https://d.kernelci.org/test/maestro:6aeb6eba5b429d354eecf7be
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_ae94400
      last run: https://d.kernelci.org/test/maestro:6aeb6eba5b429d354eecf7bc
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_aec2a00
      last run: https://d.kernelci.org/test/maestro:6aeb6eba5b429d354eecf7bb
      history:  > ❌  > ❌  > ✅  
            
Hardware: qcs9100-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000
      last run: https://d.kernelci.org/test/maestro:6aeb731e5b429d354eed3ed0
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_display-controller_ae01000
      last run: https://d.kernelci.org/test/maestro:6aeb731e5b429d354eed3ecf
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_af54000
      last run: https://d.kernelci.org/test/maestro:6aeb731e5b429d354eed3ecd
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_af5c000
      last run: https://d.kernelci.org/test/maestro:6aeb731e5b429d354eed3ecb
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_dsi_ae94000
      last run: https://d.kernelci.org/test/maestro:6aeb731e5b429d354eed3eca
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_dsi_ae96000
      last run: https://d.kernelci.org/test/maestro:6aeb731e5b429d354eed3ec8
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_ae94400
      last run: https://d.kernelci.org/test/maestro:6aeb731e5b429d354eed3ec7
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_ae96400
      last run: https://d.kernelci.org/test/maestro:6aeb731e5b429d354eed3ec6
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_aec2a00
      last run: https://d.kernelci.org/test/maestro:6aeb731e5b429d354eed3ec5
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_aec5a00
      last run: https://d.kernelci.org/test/maestro:6aeb731e5b429d354eed3ec4
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_i2c_890000_i2c-mux_70_i2c_0_bridge_58
      last run: https://d.kernelci.org/test/maestro:6aeb731e5b429d354eed3ea8
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_i2c_890000_i2c-mux_70_i2c_1_bridge_58
      last run: https://d.kernelci.org/test/maestro:6aeb731e5b429d354eed3ea7
      history:  > ❌  > ✅  > ✅  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp9.VP9-TEST-VECTORS-GStreamer-VP9-V4L2.vp90-2-15-segkey-webm
      last run: https://d.kernelci.org/test/maestro:6aeb44dd5b429d354eeb041d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: hamoa-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:6aeb441e5b429d354eeae5c2
      history:  > ❌  > ❌  > ✅  
            
Hardware: nvidia-p3809-gb300
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_cpuset_prs_sh
      last run: https://d.kernelci.org/test/maestro:6aebb3015b429d354eef267c
      history:  > ❌  > ✅  
            
      - ltp.clock_nanosleep02
      last run: https://d.kernelci.org/test/maestro:6aebb3075b429d354eef28db
      history:  > ❌  > ✅  
            
      - ltp.epoll_wait02
      last run: https://d.kernelci.org/test/maestro:6aebb3075b429d354eef28dc
      history:  > ❌  > ✅  
            
Hardware: jetson-agx-xavier-devkit
  > Config: defconfig+lab-setup
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_memcontrol_test_memcg_high_sync
      last run: https://d.kernelci.org/test/maestro:6aeb53665b429d354eebca17
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+netdev+nfs-root-boot+ltp+crypto+ima
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6aeb440d5b429d354eeace41
      history:  > ✅  > ✅  > ❌  > ❌  > ✅  
            
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.kvm
      last run: https://d.kernelci.org/test/maestro:6aeb4e3e5b429d354eeb7cdc
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.kvm.kvm_set_memory_region_test
      last run: https://d.kernelci.org/test/maestro:6aeb62805b429d354eebff77
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6aeb62765b429d354eebf8fa
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - ltp.clock_nanosleep02
      last run: https://d.kernelci.org/test/maestro:6aeb62785b429d354eebfaa1
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - ltp.prctl09
      last run: https://d.kernelci.org/test/maestro:6aeb62785b429d354eebfb42
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - ltp.shmget03
      last run: https://d.kernelci.org/test/maestro:6aeb62785b429d354eebfb49
      history:  > ✅  > ❌  > ✅  > ❌  
            
Hardware: jetson-agx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6aeb9b245b429d354eee9662
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - ltp.futex_wait05
      last run: https://d.kernelci.org/test/maestro:6aeb9b275b429d354eee994d
      history:  > ❌  > ❌  > ✅  > ❌  
            
      - ltp.splice08
      last run: https://d.kernelci.org/test/maestro:6aeb9b275b429d354eee98cf
      history:  > ✅  > ❌  > ✅  > ✅  
            
Hardware: jetson-agx-orin-industrial-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6aeb667e5b429d354eec1212
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6aeb667e5b429d354eec120d
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6aeb6a805b429d354eecdce2
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
Hardware: jetson-nano-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6aeb56145b429d354eebdb7f
      history:  > ❌  > ✅  > ✅  > ❌  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6aeb56145b429d354eebdb7a
      history:  > ❌  > ✅  > ✅  > ❌  
            
Hardware: jetson-orin-nx-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_cpuset_prs_sh
      last run: https://d.kernelci.org/test/maestro:6aeb57415b429d354eebe09b
      history:  > ⚠️  > ⚠️  > ❌  > ⚠️  
            
Hardware: jetson-tx2-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6aeb53085b429d354eebc846
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6aeb4cd75b429d354eeb7259
      history:  > ✅  > ❌  > ❌  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_500000_broadcast_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6aeb530b5b429d354eebc8a7
      history:  > ✅  > ❌  > ❌  > ✅  
            
Hardware: jetson-xavier-nx-devkit
  > Config: defconfig+lab-setup
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_freezer
      last run: https://d.kernelci.org/test/maestro:6aeb4d0e5b429d354eeb7507
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_freezer_test_cgfreezer_vfork
      last run: https://d.kernelci.org/test/maestro:6aeb4d0e5b429d354eeb74ff
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_usb_a800000_hub_2
      last run: https://d.kernelci.org/test/maestro:6aeb54ac5b429d354eebd249
      history:  > ✅  > ✅  > ⚠️  
            
Hardware: nvidia-e5020-vera
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_cpuset_prs_sh
      last run: https://d.kernelci.org/test/maestro:6aeb559d5b429d354eebd95a
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6aeb559c5b429d354eebd8f9
      history:  > ✅  > ❌  > ✅  > ✅  
            
Hardware: qemu-arm64
  > Config: defconfig+netdev+nfs-root-boot+ltp+crypto+ima
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6aeb43725b429d354eeac474
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-01-intra-1417
      last run: https://d.kernelci.org/test/maestro:6aeb443a5b429d354eeafa76
      history:  > ❌  > ✅  > ❌  > ❌  > ✅  
            
Hardware: nvidia-p3809-gb300
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6aebb3055b429d354eef2718
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
