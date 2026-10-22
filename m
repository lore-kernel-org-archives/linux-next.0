Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792636222;
	b=UVzDhuWcURMO7YettYiejUF1do6qcrv4hGGi2ZXno+EKsjI7BuZ5n6HpDBCKxp4SnaRJ
	 HnDGfjU3bj3OIIKpJnxwaL052o40T80/0MfjLSqUGrtCo91WeVYcRBN9DyGLHswUM815w
	 qxtc2rzt8Gx5juHVF/NrRkiZu8IrBI7YX3sLyJI2GUpevXhS7S19Nc7Vvm8XURsdRZ9Zm
	 lC8FxgeqnL+PDjY85ylcPRFihIppVXZc0Us48MUsh10o32zYvAXPnNu03vgExBjcKX+4h
	 +RI1PaCss475Iy6q5Pa6ZL4TwSDy7ATV+et9lNLnzPG7ydjzNczbM4CtV/DTGhnJOCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792636222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:To:Cc:Reply-To:
	 Date:Message-ID;
	bh=0J6Gi85ny7MBeSdBDKma9JFeoouvlqdnr8ja75uel5I=;
	b=miftr7d7rXIBMNdeUSCtdE1Kbt1LvdL0a4IK8C7iyxr8Uou6iSXKvNvkb5PV3dgnLmVa
	 iB+FbPSsYUm9u5tHZgzM3uaYCnFlQH9W8tADZ15ihfLsGmGM7IZsQV3IYA5gx6yNaSF9E
	 wk80tgJI/sXticolcrukMMl0cl4jkeiKQXaizyYrbIM28dqvOdGxfuo93intS5d1b7zmr
	 Tx/TD9Vw1KzaEHYtEEhAcWOgl6JRebhCG950cfgM4rd+t/VxofUBggJR4spRB+l1KLDkO
	 aRXPk39vJ5txGqKBGBgeylX/LqiAD+dczkJDNLdR4OxuR13oxy7SNDJzmAUX9/9fAvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=TUXGVs+5;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE4F606A31B
	for <linux-next@vger.kernel.org>; Thu, 22 Oct 2026 02:30:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFE4F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=TUXGVs+5
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-18cdcfc05ffso1456205c88.1
        for <linux-next@vger.kernel.org>; Wed, 21 Oct 2026 19:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1792636221; x=1793241021; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0J6Gi85ny7MBeSdBDKma9JFeoouvlqdnr8ja75uel5I=;
        b=TUXGVs+5J09klulAL4817nyz7/qU0nswlULjsMEoFdPtIBVy3/FV8R8gHnlziRFuHa
         YsHJYAJI5DmO3zUB+x8vL3wHJow9RU7izEYhkP46cYK0isINCBGnLhYxnxqrzBqjC+P8
         tKu22Rxgq3iIeTeLQXyU6b1DeabfIV25wT1ZJBXVln+u9Y0mxWsymT17xjUfTkwcdOcd
         0yhxPIdAHtgcE4AIDgRld9LOIFZbzNDLmvbdcPiHJb25+xaWhAiG1kai+pXWay6aSjaS
         GYMfue2wvFtrXE+pA5GnrLaeeuEPiM19hPQiLPp0oxWaKpZEcE+0wJcdau/8PK8YbtWP
         WvWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792636221; x=1793241021;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0J6Gi85ny7MBeSdBDKma9JFeoouvlqdnr8ja75uel5I=;
        b=hLVqkLUKHlRmHpHqEp5S4sjRuMVKjOErps/IaNVmcHNcqGTjtEGxrt2Yi2G8o8uBRO
         u6DHBO2hdEuTlJe7nnb7L+AdsFlax3ukAVTJoImU1C4noK5vv2KMMM9NAyTuPVjM9CAW
         BhlTljT64qCskqBQiEp6CLCITnH7UpIfUqAgiZ7FrghbMYQ2kGEqnAeByH907zyq0fe+
         CBDZJBv2GX8IIMMjVFU6ebXXZJbBmZh0wbjH0yPHBiAayxRPUOk6Ml7oi9dTSd0nPbmw
         pjVDBkYQr77j1xXW8zdhldJr0a1XqtpQrzNGP96KmjTe1cICG4x1xh6SxX2sf0prECfd
         mEJA==
X-Gm-Message-State: AFq9FYIxC5Ye2t5UromaLBRWY5THgySxxNfGjc3qsCxwUoZCshTmXd94
	Atx3KUAhiqaiLgyFt+rY0tNAa8OAWrxPRTqDQsuUiWxoilUYvPdPsknDmNhWs+ty5Yr26gjd/6t
	dCW6K
X-Gm-Gg: AYBFou1RIF4ZUSjBWlRl3MBEmA3IpJ481sz4BiWuLBQOLr9xjJP2deMhC7XGtpV5w0E
	bcGLmSWI9vBo4ytObw0WIp5kfRaBC283oA2kmG+KuZeK1knAF/H75kDzPdHmgQnyo3QE/ydDnkU
	J8oQidmuRr+tobzffYopIuB/uvEDGdf1O2iNfywCQdpO4xDRl1HppMwGT8PeT28w7f/fGKSwt5s
	X32HJJHy7GJLcaZ6tKbBv7KNMGK1kBpgEFFi9tVxAKtyvR9KNO5LvbYbvFMNYAUztiqnYWMs4o7
	zfoAFBDibErrtWmCy0B6OE5XHkWIyP6grl39xUgTT1ZnlWiTkEurHSUUfqcv9sDYX/KdV/Rogb6
	2IffrCt+I/1NzEgrzzvg2FDQGXfESk6HatLlg80on8DweNj8oZm5VjvxrOVTTpuXku7Gi03STVM
	e4kka8j9qRa2OekeCr6/Sf2+eDAwYIErTFGOxnRbD3rJmpimRdCc7fEErDW9uX81sGPoZkGDpcy
	NYzrMvQef1MaR3GDOw+a0gIji/THIrRkA6GVsGCemECpTPD
X-Received: by 2002:a05:701b:42d4:20b0:191:444:425 with SMTP id a92af1059eb24-19104440440mr4260499c88.2.1792636220835;
        Wed, 21 Oct 2026 19:30:20 -0700 (PDT)
Received: from 6e52bff8000c ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a275026sm15403755c88.5.2026.10.21.19.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 19:30:20 -0700 (PDT)
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
Subject: [STATUS] next/master - 9a482184d910775cf648863148944945b74e2815
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 22 Oct 2026 02:30:20 -0000
Message-ID: <179263621985.276449.5440850350699356500@6e52bff8000c>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/9a482184d910775cf648863148944945b74e2815/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 9a482184d910775cf648863148944945b74e2815
origin: maestro
test start time: 2026-10-21 14:29:11.366000+00:00

Builds:	   75 ✅    1 ❌    0 ⚠️
Boots: 	  240 ✅    6 ❌    0 ⚠️
Tests: 	43703 ✅ 3746 ❌ 6133 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.kvm
      last run: https://d.kernelci.org/test/maestro:6ad8d66355fda507605d48b8
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.kvm.kvm_set_memory_region_test
      last run: https://d.kernelci.org/test/maestro:6ad8e58855fda507605eb384
      history:  > ✅  > ✅  > ❌  
            
Hardware: jetson-agx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp.clock_nanosleep02
      last run: https://d.kernelci.org/test/maestro:6ad8f9d255fda507605f85ee
      history:  > ✅  > ❌  
            
      - ltp.poll02
      last run: https://d.kernelci.org/test/maestro:6ad8f9d455fda507605f8737
      history:  > ✅  > ❌  
            
      - ltp.prctl09
      last run: https://d.kernelci.org/test/maestro:6ad8f9d455fda507605f873c
      history:  > ✅  > ❌  
            
      - ltp.select02
      last run: https://d.kernelci.org/test/maestro:6ad8f9d455fda507605f87d3
      history:  > ✅  > ❌  
            
      - ltp.shmget03
      last run: https://d.kernelci.org/test/maestro:6ad8f9d455fda507605f8738
      history:  > ✅  > ❌  
            
Hardware: nvidia-e5020-vera
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6ad8e6ec55fda507605ec217
      history:  > ✅  > ❌  
            
Hardware: nvidia-igx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_freezer
      last run: https://d.kernelci.org/test/maestro:6ad8e06f55fda507605e4022
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.cgroup.cgroup_test_freezer_test_cgfreezer_ptrace
      last run: https://d.kernelci.org/test/maestro:6ad8e06f55fda507605e400c
      history:  > ✅  > ✅  > ❌  
            
Hardware: purwa-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:6ad8d8b355fda507605d7b5d
      history:  > ✅  > ❌  
            
Hardware: stm32mp157a-dhcor-avenger96
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp.epoll_pwait03
      last run: https://d.kernelci.org/test/maestro:6ad914dc55fda507605ff9c8
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.acct
      last run: https://d.kernelci.org/test/maestro:6ad8d18055fda507605cece2
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.breakpoints
      last run: https://d.kernelci.org/test/maestro:6ad8d19b55fda507605cede5
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ad8d2d155fda507605cf690
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: jetson-agx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp.pselect01
      last run: https://d.kernelci.org/test/maestro:6ad8f9d455fda507605f8747
      history:  > ❌  > ✅  
            
Hardware: jetson-orin-nx-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6ad8e0e755fda507605e47f8
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6ad8e0e755fda507605e47f3
      history:  > ❌  > ❌  > ✅  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-01
      last run: https://d.kernelci.org/test/maestro:6ad8d94a55fda507605d8739
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-03
      last run: https://d.kernelci.org/test/maestro:6ad8d94a55fda507605d8737
      history:  > ❌  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.breakpoints.breakpoints_step_after_suspend_test
      last run: https://d.kernelci.org/test/maestro:6ad8d36255fda507605cff3a
      history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.kvm.kvm_nested_tsc_scaling_test
      last run: https://d.kernelci.org/test/maestro:6ad8e58855fda507605eb3b4
      history:  > ✅  > ❌  > ✅  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ad8e57f55fda507605ead37
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - ltp.shmget03
      last run: https://d.kernelci.org/test/maestro:6ad8e58155fda507605eaf65
      history:  > ❌  > ✅  > ❌  
            
Hardware: jetson-agx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ad8f9d155fda507605f8516
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
Hardware: jetson-agx-orin-industrial-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ad8e43855fda507605e7426
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
Hardware: jetson-orin-nx-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_cpuset_prs_sh
      last run: https://d.kernelci.org/test/maestro:6ad8e0e855fda507605e4840
      history:  > ⚠️  > ⚠️  > ❌  
            
Hardware: nvidia-igx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6ad8e07055fda507605e4035
      history:  > ❌  > ✅  > ❌  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6ad8e07055fda507605e4030
      history:  > ❌  > ✅  > ❌  
            
Hardware: qemu-arm64
  > Config: defconfig+netdev+nfs-root-boot+ltp
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ad8d76955fda507605d5aac
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
Hardware: stm32mp157a-dhcor-avenger96
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp.dirtyc0w_shmem
      last run: https://d.kernelci.org/test/maestro:6ad914db55fda507605ff5be
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - ltp.shmctl05
      last run: https://d.kernelci.org/test/maestro:6ad914dc55fda507605ff82b
      history:  > ✅  > ❌  > ✅  > ✅  > ❌  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp9.VP9-TEST-VECTORS-GStreamer-VP9-V4L2.vp90-2-15-segkey-webm
      last run: https://d.kernelci.org/test/maestro:6ad8dafe55fda507605da9f5
      history:  > ❌  > ✅  > ❌  > ❌  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-01-intra-1416
      last run: https://d.kernelci.org/test/maestro:6ad8d94a55fda507605d873f
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-01-intra-1417
      last run: https://d.kernelci.org/test/maestro:6ad8d94a55fda507605d873e
      history:  > ❌  > ✅  > ✅  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp9.VP9-TEST-VECTORS-GStreamer-VP9-V4L2.vp90-2-15-segkey-webm
      last run: https://d.kernelci.org/test/maestro:6ad8d9cd55fda507605d8d8d
      history:  > ❌  > ❌  > ✅  > ❌  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
