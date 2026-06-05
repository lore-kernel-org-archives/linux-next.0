Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A2A385539
	for <linux-next@vger.kernel.org>; Fri,  5 Jun 2026 02:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780626634; cv=none; b=BB8cfTM7RjuUHfWT4LJ9eM175jLyFwOhCUek7GDJj63pQZGx4Mia5f7L5/kg1zgMZvncfpRaz3Qon4VNnU9Ad29XPS/W8pHAuZoHCtq7K10Wm3JkLXerSxOlezMPKaH+kQYQ0xwxYvQqfCvj3VYDCly9BQUcHg2MgjQBgxSnOOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780626634; c=relaxed/simple;
	bh=zBLQjur140Dg4xKkjG6GhEsZ1b936QN/vHK5WcdRR54=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=NLNk1CwDe5sO7pFQcZzUR58+colLDnenzciWb+FAjZNbfcNTNmeCv/GgxkqO39chCapXrmZBwwUBhfBa3Sttp7qJsWo0CEmOTU3h9vO05zGPIYGCFcKWeMIVNWu0Tfft4JQrtg4A7xXZFMWQ6nIbRAzfkHnGwlCTajNZANirL84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=c9tfS4Gh; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="c9tfS4Gh"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-137dd5161feso2075562c88.1
        for <linux-next@vger.kernel.org>; Thu, 04 Jun 2026 19:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1780626626; x=1781231426; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IHgQjun8xJDVSfwXUcU1QlQb8DyYgBzQ5TRguokV430=;
        b=c9tfS4GhCz/fxrcIe5/WytMqJIPnEZHakHZ8bAmr2Ux0nxfHiJxDJx6CC2++MBWp/Z
         kifhb6PHD4mti04XbD0mRoqJApUZD32/99Q6m/pmT/TzNZ7/vNKUZHAX/KxfVJKjf8Rb
         uo38Q32iBY8AtWbq5FV3KEiSPrzMB4zAzVKCnnUYXYRIRbQ+4HQ2rIucFtqliQ7VAbwg
         OsvPCZCchIiURO9gfcgO4hH9hf/jg8kPsuPGK4hHP4TDPY2LzGAaa75inI09kh6c2gpy
         Jtomtr35WIv1N5WqXasVycJulYizZiQbyM1m0w83NczO3ETzw8C1c7rRK9XxFo1gIfW9
         qTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780626626; x=1781231426;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IHgQjun8xJDVSfwXUcU1QlQb8DyYgBzQ5TRguokV430=;
        b=kZLlBNHcxdzD6n67VHTrsDWB18VfOpDW/mOi6FEiRV76AzOSM4bFXt9A1swa2Klgi9
         6BDj1jH4FwKl6Ez4+BlC1MhHjvT4M4g64WapV+IG+q+TVN3FcvbWyL9hppKCSL2Th2+7
         ubAZpm6ZmFunPPjbH1NDIgvSn1aw1El3PQQ6kRl8xY/csN6i192cjH6AvnuHBDkNec3T
         Xgdi9SRNWMNFB7kihkGVfV38UvpSnvRNS6KP8sXzOLeZ2Vt3hSW78BDnhkSgYcI/En96
         4qaSSrms6a0T/l6phIjLwecAvXGuU+XN5JCedJ+jYtyS1ni5PfcRVUTXcMxQnQ6hpyUM
         lN5w==
X-Gm-Message-State: AOJu0YyZdiCA/dZex1YlyblNFzRVndAWUPkAgjJ4g+JDGrmpAI0DUeDd
	bpw/pSFl6DtcUBmRAuNxIfcBsvax7Mx80oPekNMizuGZpEIpHbyJHITF7sxuGG04cU5hhq0TwSU
	bZBZ6
X-Gm-Gg: Acq92OGBhrtz/36sbE71ZvcoyTbFzKI7TXOrBwu4xTLpsB3AhQcebs1kcFKe9yvodSp
	W6Dsop8QDAlXq2vuv+lvBXcgqaSM4mPdvwRrkAY4G8ljUUEUjAPBmYSjP8VP+PFr7j54MXUBvet
	zq1kejRkkXrw87tPV7eK7iR0+uGwxq3Q00qRzLfJMsuKPA036fTM8iGsTohZ37TRkXEn+tSLl1d
	Zh8Rerqs4oZhDuH0LrAPnAJtX93JUXjMn59yoVXVg0RZjP0qFr8RIKtzfL/njRg1NPoEBFKHM84
	3/zB7m1/+lZwBUc7DgereWWi0v19U+SjSqE1p/aUamcAMWOSIP405odtn5vdUcYGWB+JqjTwxCY
	WcqI0YgG2yn8Z8iN/EJp2GcCEO9RO/YCDjyX/moYB9hV8pF7G7RlXQAkF4bWovzFSGiILFXmdkM
	BhRMf7Ln/FzHzlnf80PCROFVPt9HI=
X-Received: by 2002:a05:7022:42b:b0:123:34e8:aec2 with SMTP id a92af1059eb24-1380666a2e0mr664948c88.1.1780626626097;
        Thu, 04 Jun 2026 19:30:26 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f5539432sm6051648c88.9.2026.06.04.19.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 19:30:25 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - b99ae45861eccff1e1d8c7b05a13650be805d437
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 05 Jun 2026 02:30:25 -0000
Message-ID: <178062662547.10424.8491579619578114166@330cfa3079ca>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/b99ae45861eccff1e1d8c7b05a13650be805d437/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: b99ae45861eccff1e1d8c7b05a13650be805d437
origin: maestro
test start time: 2026-06-04 16:41:30.319000+00:00

Builds:	   58 ✅    1 ❌    0 ⚠️
Boots: 	  157 ✅    9 ❌    4 ⚠️
Tests: 	18839 ✅ 3204 ❌ 4132 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: bcm2837-rpi-3-b-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.proc
      last run: https://d.kernelci.org/test/maestro:6a21b4a12cc72b6e94bf5b81
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.proc.proc_read
      last run: https://d.kernelci.org/test/maestro:6a21bb362cc72b6e94bfaff8
      history:  > ✅  > ✅  > ❌  > ❌  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_i2c_30a50000_eeprom_50
      last run: https://d.kernelci.org/test/maestro:6a21b7c72cc72b6e94bf8a94
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: asus-CX3402CVA-brya
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kernelci_sleep
      last run: https://d.kernelci.org/test/maestro:6a21b0e42cc72b6e94bf3f0e
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kernelci_sleep.rtcwake-freeze-1
      last run: https://d.kernelci.org/test/maestro:6a21b14d2cc72b6e94bf3f52
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kernelci_sleep.rtcwake-freeze-10
      last run: https://d.kernelci.org/test/maestro:6a21b14d2cc72b6e94bf3f49
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kernelci_sleep.rtcwake-freeze-2
      last run: https://d.kernelci.org/test/maestro:6a21b14d2cc72b6e94bf3f51
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kernelci_sleep.rtcwake-freeze-3
      last run: https://d.kernelci.org/test/maestro:6a21b14d2cc72b6e94bf3f50
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kernelci_sleep.rtcwake-freeze-4
      last run: https://d.kernelci.org/test/maestro:6a21b14d2cc72b6e94bf3f4f
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kernelci_sleep.rtcwake-freeze-5
      last run: https://d.kernelci.org/test/maestro:6a21b14d2cc72b6e94bf3f4e
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kernelci_sleep.rtcwake-freeze-6
      last run: https://d.kernelci.org/test/maestro:6a21b14d2cc72b6e94bf3f4d
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kernelci_sleep.rtcwake-freeze-7
      last run: https://d.kernelci.org/test/maestro:6a21b14d2cc72b6e94bf3f4c
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kernelci_sleep.rtcwake-freeze-8
      last run: https://d.kernelci.org/test/maestro:6a21b14d2cc72b6e94bf3f4b
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kernelci_sleep.rtcwake-freeze-9
      last run: https://d.kernelci.org/test/maestro:6a21b14d2cc72b6e94bf3f4a
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kernelci_sleep.rtcwake-mem-1
      last run: https://d.kernelci.org/test/maestro:6a21b14d2cc72b6e94bf3f5c
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kernelci_sleep.rtcwake-mem-10
      last run: https://d.kernelci.org/test/maestro:6a21b14d2cc72b6e94bf3f53
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kernelci_sleep.rtcwake-mem-2
      last run: https://d.kernelci.org/test/maestro:6a21b14d2cc72b6e94bf3f5b
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kernelci_sleep.rtcwake-mem-3
      last run: https://d.kernelci.org/test/maestro:6a21b14d2cc72b6e94bf3f5a
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kernelci_sleep.rtcwake-mem-4
      last run: https://d.kernelci.org/test/maestro:6a21b14d2cc72b6e94bf3f59
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kernelci_sleep.rtcwake-mem-5
      last run: https://d.kernelci.org/test/maestro:6a21b14d2cc72b6e94bf3f58
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kernelci_sleep.rtcwake-mem-6
      last run: https://d.kernelci.org/test/maestro:6a21b14d2cc72b6e94bf3f57
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kernelci_sleep.rtcwake-mem-7
      last run: https://d.kernelci.org/test/maestro:6a21b14d2cc72b6e94bf3f56
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kernelci_sleep.rtcwake-mem-8
      last run: https://d.kernelci.org/test/maestro:6a21b14d2cc72b6e94bf3f55
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kernelci_sleep.rtcwake-mem-9
      last run: https://d.kernelci.org/test/maestro:6a21b14d2cc72b6e94bf3f54
      history:  > ✅  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: meson-gxl-s905x-libretech-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.clone3
      last run: https://d.kernelci.org/test/maestro:6a21b46d2cc72b6e94bf5ad9
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.clone3.clone3_clone3_cap_checkpoint_restore
      last run: https://d.kernelci.org/test/maestro:6a21bb0e2cc72b6e94bfaf35
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.clone3.clone3_clone3_cap_checkpoint_restore_global_clone3_cap_checkpoint_restore
      last run: https://d.kernelci.org/test/maestro:6a21bb0e2cc72b6e94bfaf36
      history:  > ❌  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: aws-ec2-arm64
  > Config: defconfig+aws-ec2
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a21d19b2cc72b6e94c09c7a
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
Hardware: aws-ec2-x86_64
  > Config: x86_64_defconfig+aws-ec2
    - Architecture/compiler: x86_64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a21afa02cc72b6e94bf3db0
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a21b4042cc72b6e94bf58f6
      history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: bcm2837-rpi-3-b-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:6a21b4752cc72b6e94bf5af6
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:6a21b73d2cc72b6e94bf89fe
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a21b29b2cc72b6e94bf512d
      history:  > ⚠️  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a21b29d2cc72b6e94bf5130
      history:  > ✅  > ⚠️  > ✅  > ⚠️  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:6a21b40c2cc72b6e94bf5933
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.alsa.alsa_pcm-test
      last run: https://d.kernelci.org/test/maestro:6a21b5292cc72b6e94bf6031
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:6a21ba762cc72b6e94bf9ff1
      history:  > ✅  > ❌  > ❌  > ✅  > ❌  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6a21bbf32cc72b6e94bfb49f
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6a21be852cc72b6e94bfec0f
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
Hardware: qemu-x86_64
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a21b0e02cc72b6e94bf3f01
      history:  > ⚠️  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rtla-osnoise
      last run: https://d.kernelci.org/test/maestro:6a21bc0b2cc72b6e94bfb64e
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_backlight_lcd0
      last run: https://d.kernelci.org/test/maestro:6a21bc072cc72b6e94bfb5a2
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller0_14001000
      last run: https://d.kernelci.org/test/maestro:6a21bc072cc72b6e94bfb586
      history:  > ✅  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58_aux-bus_panel
      last run: https://d.kernelci.org/test/maestro:6a21bc062cc72b6e94bfb55d
      history:  > ✅  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14008000
      last run: https://d.kernelci.org/test/maestro:6a21bc062cc72b6e94bfb541
      history:  > ✅  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14009000
      last run: https://d.kernelci.org/test/maestro:6a21bc062cc72b6e94bfb540
      history:  > ✅  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_1400a000
      last run: https://d.kernelci.org/test/maestro:6a21bc062cc72b6e94bfb53f
      history:  > ✅  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400b000
      last run: https://d.kernelci.org/test/maestro:6a21bc062cc72b6e94bfb534
      history:  > ✅  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400c000
      last run: https://d.kernelci.org/test/maestro:6a21bc062cc72b6e94bfb533
      history:  > ✅  > ❌  > ❌  > ✅  > ✅  
            

### NEW BUILD ISSUES
- Issue: maestro:96417cd30041ab8f3153128d0120c6cd70782d99 | version: 1
  Build: maestro:6a21abf22cc72b6e94bf3c60
  Comment:  stack frame size (2088) exceeds limit (2048) in 'dml31_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than] in drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.o (drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2026-06-04 17:51:52.028502+00:00
  Culprit: code

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
