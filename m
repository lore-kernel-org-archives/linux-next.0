Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794450620;
	b=1PNDaJ5IxHKq58lmJti4V4uJOt/gQS2fPZCpyz/s7bXYB1+ffbAH5ai9YnoB5RgCGkuk
	 TOn3gLQ3qbBtidTEu20fJqLi8UTIKR3ijPzHFcEEJ32VJkWZn/OBiuM9+VKn4j622QcKZ
	 C0tsVX6r0Z8n40K0U0gx1Njbrie85oJA8JVuHnfANDlaJeHg4Okg4cXh7jJl5rLQk0ZNX
	 IJpt2dPIbmJ1f1nc+K1s26D5u3w3Akw63S7UCYmbLPDTrIMiLEGTIJQvG/rbmejhVppd0
	 HCIY5rAijDn96ibpd+/IvHOhmpDRotvyB2c6/wZgtf1SMlOPVF+yHVSHX6U+dfFrGOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794450620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:To:Cc:Reply-To:
	 Date:Message-ID;
	bh=C2GtDs028gR8VelDzNwOKcqPfxEZEa+SNWyehs28ia4=;
	b=ZhMwy51WvB4aZOvJU3Hk6xXntN9WcBTjI4YAoar+DSO8/CpqdcZjwFzUqQTfduEJTO72
	 t/yt+8je73ZZr1XljBG2McjXhiCbSpkXu5xQgn8Mn++ThGu7UHT8IUPmEmPGQBxxvpBPM
	 AltxFiknYAjWzd03f3WgYhWAxAUTRkijJ0Bnrk59h3yA2GZaDUIlplNY/vzjKc8PsKjFv
	 AEpr7g6naZlLUqVck4JnKTJsqJTRn3QGuKNHBmck4A+LQ06vTOLfQWD23YT/Yj1zBgokh
	 RMDie2TlZud7BUDBnMT0oGa0iOj/bvsmONZ5GCBOEYIKA/JWpYiyurtGGyKm65QA5Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=WeRhPnmW;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD287606A324
	for <linux-next@vger.kernel.org>; Thu, 12 Nov 2026 02:30:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD287606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=WeRhPnmW
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a2af4c8d00so3807085c88.0
        for <linux-next@vger.kernel.org>; Wed, 11 Nov 2026 18:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1794450619; x=1795055419; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C2GtDs028gR8VelDzNwOKcqPfxEZEa+SNWyehs28ia4=;
        b=WeRhPnmWeGz/91wMul0TCfHfLxzz5xU6D9UhBfWB68dgwS+cVY+YQEhEAgDHUVV5j/
         /vjBVwQp1fsAaL+I1gmbtEeUKsZVXyRPy1X4daU4joBZ8sp+5EfAM3TLgjtqTsHkZrFs
         RaFMw7QIR9EppWZETlE1CDlErEbxN/g0e+0oREFzqMJA7tcPo4V16Epuzd6nj4mqYmvt
         LskZitLrTByv1UTALNW0BmLpTI4aO10DOxGS0JzSYQMZWQa+EpqnSQlR3D+XVoqaTMYJ
         77YQXIpzUiG1NfTVxwe+GNHSTbZ7GVDGthlNJ26r0AxzrcpLH1fdcv60TgY/Auv+2uA4
         erSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794450619; x=1795055419;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C2GtDs028gR8VelDzNwOKcqPfxEZEa+SNWyehs28ia4=;
        b=p7RhNXpdzhWDOlvc16i8NI5YZg4fkKCMOijPRC+/YdAPvWQLvyxFXOgJvEMjpIXBy6
         xEX50ehEkWcrtO5GESbEM4CfPtP1dFo4OrxQPhm1gCcbHj8rWeCqUEGGLQfDmWQDau0w
         OSagyxS5SRWNuvXwidwZTk18IoV0YeZ8tPC8nI9dOB3bVlvXPZrq3lAHN4Vg7U6eVTn0
         v2aEWCTkBmxgQbqIgmCP2b+6TL7FKzMGhV04Oa6/rmwmi2jv9RctAtnjqw/f1shZUNYz
         TEZXuhIjcftnSbb/quNzLaTRa1EpbW//xiYlg/jnBibbL5f0ElAr1WqvFfovABLJDS5N
         1nbg==
X-Gm-Message-State: APuU4Z9IwlFG8EbLMLPShpth/P28ifpgx1DvvVcYxLUvC6xr/nIqV8OE
	94axATQAubTpXe7Qx6P3vBu8Pjt3YAxSaQuLscJ0HMMn4RK/7uWMQMuunw+Jlv8/VZFQaaKEKeW
	JTCJb
X-Gm-Gg: AYBFou1uJzzYLdyr2I4joqJg1oKRUg/epP//SWEomA1GaWIbEfed+WIe43pL2opsECQ
	Oa299N6HBGgbooOkw2GgPzhzHW9yaFuF+WTiAX3rrbaDmr8mvzZywORKrBJrfBmf0Ai3q8eA7F/
	bzOLwQlM5FtJkjgPPdYhdv1TS096G9jsxl/oRhEOfqH3vUdNoGNlpQLLqFlCgCstszmQVI3Z/FK
	rGGzUIZHWApl/J50yHPWQ7bsiJVFN/CBae9y82rzjgScHGGkMq2rSy9YsOBw3RJr/mOZ1a7SpDI
	cqAnLjxJpRb5iNzx4gJA/QkMGBe5dZIVJ5TH7lSBKO3mIgYeOvU4ZqsMKMVfmHuIciRXg6p6/2c
	ZUJ+yLwqCv1OpN3EkqlvJwFOxp2uMKBGMGDCyNAhlA+R5MTZ/8b0ECa+CFdLrpLAWs9OSXuKWzM
	FDg/pVjmeMPixZe/58gPHf29FBQVQpG4IRFZoa7NebsRlKjz0pjzQLq8FDtyhp95b8F6wKJ6mkq
	eOc6zyfsKnp042dThWydYHc6k1WNurHLSqSI2Scf0aRajcNpTikP+ajPoErSCpT4pmwqzvDJOCh
	GGBofYVCTKayV9m++ZWzOg==
X-Received: by 2002:a05:7022:ea8d:b0:181:ccdd:ed2a with SMTP id a92af1059eb24-1b3c036ee70mr3842850c88.43.1794450618337;
        Wed, 11 Nov 2026 18:30:18 -0800 (PST)
Received: from a3f41c651398 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9e03sm40806404eec.23.2026.11.11.18.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 18:30:17 -0800 (PST)
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
Subject: [STATUS] next/master - aaa2f954c21b205a0bcd0961e5b2be4e82e58455
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 12 Nov 2026 02:30:16 -0000
Message-ID: <179445061614.122473.1548349568782108622@a3f41c651398>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/aaa2f954c21b205a0bcd0961e5b2be4e82e58455/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
origin: maestro
test start time: 2026-11-11 18:07:38.194000+00:00

Builds:	   74 ✅    1 ❌    0 ⚠️
Boots: 	  135 ✅   18 ❌    0 ⚠️
Tests: 	45945 ✅ 2737 ❌ 6064 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: glymur-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1bf0000
      last run: https://d.kernelci.org/test/maestro:6af4c0e05b429d354e38b853
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1bf0000_pcie_0
      last run: https://d.kernelci.org/test/maestro:6af4c0e05b429d354e38b851
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1bf0000_pcie_0_wifi_0
      last run: https://d.kernelci.org/test/maestro:6af4c0e05b429d354e38b850
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - ltp.epoll_wait02
      last run: https://d.kernelci.org/test/maestro:6af4e62d5b429d354e3a522e
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - ltp.prctl09
      last run: https://d.kernelci.org/test/maestro:6af4e62b5b429d354e3a51e7
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: jetson-agx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp.nanosleep01
      last run: https://d.kernelci.org/test/maestro:6af519655b429d354e3cc017
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - ltp.shmctl05
      last run: https://d.kernelci.org/test/maestro:6af519665b429d354e3cc085
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - ltp.shmget03
      last run: https://d.kernelci.org/test/maestro:6af519665b429d354e3cc088
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: jetson-nano-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6af4d8325b429d354e3a0b0e
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6af4d8325b429d354e3a0b09
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: jetson-orin-nx-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6af4d99b5b429d354e3a123d
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6af4d99b5b429d354e3a1238
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: mahua-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1bf0000
      last run: https://d.kernelci.org/test/maestro:6af4c76d5b429d354e39178f
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1bf0000_pcie_0
      last run: https://d.kernelci.org/test/maestro:6af4c76d5b429d354e39178d
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1bf0000_pcie_0_wifi_0
      last run: https://d.kernelci.org/test/maestro:6af4c76d5b429d354e39178c
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1c00000
      last run: https://d.kernelci.org/test/maestro:6af4c76d5b429d354e39178b
      history:  > ✅  > ✅  > ❌  > ❌  
            
Hardware: purwa-evk
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio.gpio_gpio-aggregator_sh
      last run: https://d.kernelci.org/test/maestro:6af4eddc5b429d354e3a6122
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: qcs615-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.devices-probe
      last run: https://d.kernelci.org/test/maestro:6af4beb05b429d354e38a3e0
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp9.VP9-TEST-VECTORS-GStreamer-VP9-V4L2.vp90-2-15-segkey-webm
      last run: https://d.kernelci.org/test/maestro:6af4c8b05b429d354e3927bf
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: jetson-agx-xavier-devkit
  > Config: defconfig+lab-setup
    - Architecture/compiler: arm64/gcc-15
      - tegra-tests.boot.devices
      last run: https://d.kernelci.org/test/maestro:6af4d0f55b429d354e39e6ba
      history:  > ✅  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: jetson-xavier-nx-devkit
  > Config: defconfig+lab-setup
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_freezer
      last run: https://d.kernelci.org/test/maestro:6af4cae55b429d354e396384
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_freezer_test_cgfreezer_ptrace
      last run: https://d.kernelci.org/test/maestro:6af4cae55b429d354e396379
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: purwa-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers.timers_set-timer-lat
      last run: https://d.kernelci.org/test/maestro:6af4d2ea5b429d354e39f144
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_iommu_3da0000
      last run: https://d.kernelci.org/test/maestro:6af4ca5f5b429d354e39617e
      history:  > ❌  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: glymur-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1c00000
      last run: https://d.kernelci.org/test/maestro:6af4c0e05b429d354e38b84f
      history:  > ✅  > ✅  > ❌  > ✅  
            
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.cgroup
      last run: https://d.kernelci.org/test/maestro:6af4d3a25b429d354e39f48a
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6af4e6265b429d354e3a4f10
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6af4e6265b429d354e3a4f0b
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.kvm.kvm_nested_tsc_scaling_test
      last run: https://d.kernelci.org/test/maestro:6af4e6365b429d354e3a5734
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.kvm.kvm_set_memory_region_test
      last run: https://d.kernelci.org/test/maestro:6af4e6365b429d354e3a5704
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.mm
      last run: https://d.kernelci.org/test/maestro:6af4d3a35b429d354e39f496
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.mm.mm_ksft_thp_sh
      last run: https://d.kernelci.org/test/maestro:6af4e6345b429d354e3a56e5
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.mm.mm_ksft_thp_sh_khugepaged_sync_check
      last run: https://d.kernelci.org/test/maestro:6af4e6345b429d354e3a56dc
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - ltp.futex_wait05
      last run: https://d.kernelci.org/test/maestro:6af4e62e5b429d354e3a5371
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - ltp.shmget03
      last run: https://d.kernelci.org/test/maestro:6af4e62e5b429d354e3a533c
      history:  > ✅  > ❌  > ❌  > ✅  
            
Hardware: jetson-agx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_memcontrol
      last run: https://d.kernelci.org/test/maestro:6af5195f5b429d354e3cbd7e
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_memcontrol_test_memcg_low
      last run: https://d.kernelci.org/test/maestro:6af5195f5b429d354e3cbd71
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - ltp.epoll_pwait03
      last run: https://d.kernelci.org/test/maestro:6af519655b429d354e3cbfe1
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - ltp.splice08
      last run: https://d.kernelci.org/test/maestro:6af519665b429d354e3cc0a9
      history:  > ❌  > ❌  > ✅  > ❌  
            
Hardware: jetson-orin-nx-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_cpuset_prs_sh
      last run: https://d.kernelci.org/test/maestro:6af4d99b5b429d354e3a1291
      history:  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
Hardware: kaanapali-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_tn_111b8000
      last run: https://d.kernelci.org/test/maestro:6af4c1e75b429d354e38c750
      history:  > ⚠️  > ⚠️  > ❌  > ❌  
            
Hardware: mahua-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device-error-logs
      last run: https://d.kernelci.org/test/maestro:6af4be2d5b429d354e389b4f
      history:  > ❌  > ❌  > ✅  > ❌  
            
Hardware: nvidia-e5020-vera
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6af4d9d75b429d354e3a1356
      history:  > ❌  > ❌  > ✅  > ❌  
            
Hardware: purwa-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.devices-exist
      last run: https://d.kernelci.org/test/maestro:6af4bea05b429d354e38a043
      history:  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_ae90000
      last run: https://d.kernelci.org/test/maestro:6af4cb835b429d354e396785
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_iommu_3da0000
      last run: https://d.kernelci.org/test/maestro:6af4cb835b429d354e396748
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.timers.timers_mqueue-lat
      last run: https://d.kernelci.org/test/maestro:6af4d2ea5b429d354e39f143
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.timers.timers_nsleep-lat
      last run: https://d.kernelci.org/test/maestro:6af4d2ea5b429d354e39f145
      history:  > ✅  > ❌  > ❌  > ✅  
            
      - kselftest.timers.timers_posix_timers
      last run: https://d.kernelci.org/test/maestro:6af4d2ea5b429d354e39f159
      history:  > ✅  > ❌  > ✅  > ✅  
            
Hardware: qcs615-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000
      last run: https://d.kernelci.org/test/maestro:6af4c90c5b429d354e392f4a
      history:  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_display-controller_ae01000
      last run: https://d.kernelci.org/test/maestro:6af4c90c5b429d354e392f49
      history:  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_ae90000
      last run: https://d.kernelci.org/test/maestro:6af4c90c5b429d354e392f47
      history:  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_dsi_ae94000
      last run: https://d.kernelci.org/test/maestro:6af4c90c5b429d354e392f45
      history:  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_ae94400
      last run: https://d.kernelci.org/test/maestro:6af4c90c5b429d354e392f43
      history:  > ❌  > ❌  > ✅  > ❌  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000
      last run: https://d.kernelci.org/test/maestro:6af4ca5f5b429d354e3961be
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_display-controller_ae01000
      last run: https://d.kernelci.org/test/maestro:6af4ca5f5b429d354e3961bd
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_dsi_ae94000
      last run: https://d.kernelci.org/test/maestro:6af4ca5f5b429d354e3961b9
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_edp_aea0000
      last run: https://d.kernelci.org/test/maestro:6af4ca5f5b429d354e3961b7
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_ae94400
      last run: https://d.kernelci.org/test/maestro:6af4ca5f5b429d354e3961b5
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_aec2a00
      last run: https://d.kernelci.org/test/maestro:6af4ca5f5b429d354e3961b4
      history:  > ✅  > ❌  > ✅  > ✅  
            
Hardware: qemu-arm64
  > Config: defconfig+netdev+nfs-root-boot+ltp+crypto+ima
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6af4e90c5b429d354e3a5a68
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_h265.JCT-VC-HEVC_V1-GStreamer-H-265-V4L2SL.MAXBINS_C_TI_5
      last run: https://d.kernelci.org/test/maestro:6af4c6e25b429d354e3907b2
      history:  > ✅  > ❌  > ✅  > ✅  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-04
      last run: https://d.kernelci.org/test/maestro:6af4c8785b429d354e39261b
      history:  > ❌  > ✅  > ❌  > ❌  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-02
      last run: https://d.kernelci.org/test/maestro:6af4c8755b429d354e39259f
      history:  > ❌  > ❌  > ✅  > ❌  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
