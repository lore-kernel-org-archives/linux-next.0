Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9940436A34C
	for <linux-next@vger.kernel.org>; Thu, 21 May 2026 02:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779330622; cv=none; b=KyWumREeQVZVAcJvXdBgNIb2jjTZhMoZd/Je5+2aaw6UxkG9bv4nXkvuW+sV9ZMdjzt+zTCxdLe5XFg0BHfAJblHRI2GJimN4m44flTfXX749UGaeJfy50VW9l8wN3HASRQablgCKS/CFTjkvqK/Og628PVWNGFIy8SpLj82ThI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779330622; c=relaxed/simple;
	bh=b5lNSj8VcmchP/CFjl2hxzCZmb5TFpOhhkhFViRUoAk=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=NuDQdb85EqcOTN6AMhPozAll6fAP8AsktI293BX/TBBatWOJkVGGX+Jl8/1eC3f+ZMkzNcFcbD4Cbh4kpuetIEPZTM/pQXrxXWVNdrlDMVLDJpqPKAMQ1Ym0eeOcNj6yh5tfxtIRQF0CSUzhtlfOdXqyMygPuM9aIo+XMD949Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=BnsTejOE; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="BnsTejOE"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-132830d8281so4181953c88.1
        for <linux-next@vger.kernel.org>; Wed, 20 May 2026 19:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1779330614; x=1779935414; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rl7YTjbnUQDw0nVAdptQlK90UHXGUP80NQXq88L2P0g=;
        b=BnsTejOE0NlpEZzF+y/hntBbW3kOgH7sh4Yp6OmQfgM3huLED0uBa4QtEYojd2JytV
         LjekfKMsuN0zhLKbMccq33DBgXP8mE5ATUG9yQKGK2YLjGtkRt+Sz8HoSFEhPUZ3KtUw
         ApOlkP5VO1BWJTMftc0ZuAFhrTGgM1g52ADRaGCueyPVtgHy9Co9U/sPPuutEh4aCUIo
         Dxu3Gs7LAjB5Bau8oZoXPcy/Y9KCt+mRdTYUbwCfniJSXkbkW63CfEQtYolYSojUWkee
         BXCXcUr4fWjIGjUsfa2TGQ2P2UKAz87SZj/1tdm6k7Rm994ogK3AynQL/ii/MJIkmIi9
         bDXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779330614; x=1779935414;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rl7YTjbnUQDw0nVAdptQlK90UHXGUP80NQXq88L2P0g=;
        b=br3k7I4l4y41Vzu34koFSEZC4rVDMfF8XlHzuUcYGBiCPAL9RHhBmxRXGC6EK4w3rG
         7gX45K4baPpBd2Oy7XKtWt3LRL0860nXhcEAVdrcmTKNm8HS1i5QqFApSDPpexgDuq+7
         CH4W29jW103OX2RUQA+0PUP/1wtth6JDWtn/TW41zzAM8N4McbI6d5A2tFirM9EN9bCT
         JY9uMCGIgJHXJNpPa4nsiPlXiS0syYORmaM3SBAK1TDkrTdindLKCX1is1PIAR3R8jNU
         6GYFO+K9o8a731w9ggt7CnFhG+liXt1qTUpG9NV8WGrkVRavpRhWHrh4N+vRHyLOdEcH
         u6rg==
X-Gm-Message-State: AOJu0YzqzxVdzbG/M7ZiaLhJPCB4tY5ucFgRyfcpzduorysiS3hTtIhj
	dvlW5I2dIP9quT9djVKAR9JVJEIJaC+IikyoH6qdWpwpv9zH7yn3JkKg/h+QtAGV4cizP5/OgKL
	vG6Ed
X-Gm-Gg: Acq92OFHWBeF/RXsRr/72moQZ8Xp6oeXV6Jke33/qiYN4ggjBPDNgOePn1E1QFvyOkJ
	2ir7VyuF6BIOcvr5TMxiaNNrkCahELApROo9BHYruMHQPs8kT+tXjNlk1QlHgM0iavOWyBuP5SL
	nfYGj6SotAmCcLulS1Li6moltwevl+OrXaY1iaHj8ETmKqPOMCcYV6TBhQRxF7ms5lcjOHr1m7e
	oX66stEDMMrP5l9crGChopcRpeexxPpNVJRWXIGBOrc3UTagClU5BbH0xLX/AnW2juycQUvZ9Ke
	Bi9u3egWCH/mq3aL+hKziTJZL2/IJYPfjLxGdM3kAIsIJj+zGb5lVoLeHS4MtEWvLdubb5DAo3D
	BVYuW80cIH51aEmJr2t98Rg0m67N7+DFuLaE7D0m6KlHQivVzv+CMUPwHlaf0ZAx/I5EOUgq63/
	nIaTYsyKS6ACOxSf/U
X-Received: by 2002:a05:7022:ebc3:b0:12f:c7c3:f5ab with SMTP id a92af1059eb24-13632a02cd1mr662184c88.2.1779330613515;
        Wed, 20 May 2026 19:30:13 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-135e5c0a918sm5920722c88.14.2026.05.20.19.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 19:30:12 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 687da68900cd1a46549f7d9430c7d40346cb86a0
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 21 May 2026 02:30:12 -0000
Message-ID: <177933061241.3529.9709935135524122875@330cfa3079ca>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/687da68900cd1a46549f7d9430c7d40346cb86a0/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 687da68900cd1a46549f7d9430c7d40346cb86a0
origin: maestro
test start time: 2026-05-20 12:30:26.932000+00:00

Builds:	   58 ✅    1 ❌    0 ⚠️
Boots: 	  135 ✅   52 ❌    8 ⚠️
Tests: 	20436 ✅ 4168 ❌ 4602 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_crypto_1d90000
      last run: https://d.kernelci.org/test/maestro:6a0dc1bd744d1c1da02960d7
      history:  > ✅  > ❌  > ❌  
            
Hardware: sc7180-trogdor-lazor-limozeen
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:6a0dc0ae744d1c1da0294ccf
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh
      last run: https://d.kernelci.org/test/maestro:6a0dc932744d1c1da0298973
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_crypto_1d90000
      last run: https://d.kernelci.org/test/maestro:6a0dc932744d1c1da02989df
      history:  > ✅  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_i2c_30a50000_eeprom_50
      last run: https://d.kernelci.org/test/maestro:6a0dc313744d1c1da029749e
      history:  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a0dbe9a744d1c1da0292d3a
      history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
Hardware: bcm2837-rpi-3-b-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:6a0dbec3744d1c1da0292e4f
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:6a0dc1c6744d1c1da0296450
      history:  > ✅  > ❌  > ✅  
            
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a0db447744d1c1da028bcff
      history:  > ⚠️  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: cd8180-orion-o6
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a0dbe51744d1c1da0292a33
      history:  > ✅  > ✅  > ⚠️  
            
  > Config: defconfig+netdev+nfs-root-boot+kselftest
    - Architecture/compiler: arm64/gcc-14
      - ltp
      last run: https://d.kernelci.org/test/maestro:6a0db9f9744d1c1da028fcca
      history:  > ❌  > ❌  > ⚠️  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a0db448744d1c1da028bd05
      history:  > ✅  > ⚠️  > ✅  > ⚠️  > ✅  
            
Hardware: qemu-x86_64
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a0daf92744d1c1da0288369
      history:  > ⚠️  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.uevent
      last run: https://d.kernelci.org/test/maestro:6a0dc004744d1c1da0293735
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.uevent.uevent_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:6a0dc22a744d1c1da0296c31
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.uevent.uevent_uevent_filtering_global_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:6a0dc22a744d1c1da0296c32
      history:  > ✅  > ❌  > ✅  
            

### NEW BUILD ISSUES
- Issue: maestro:504ac30a3bdad797a2185cd52e1b61acb0439072 | version: 1
  Build: maestro:6a0daa38744d1c1da0287568
  Comment:  stack frame size (2104) exceeds limit (2048) in 'dml31_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than] in drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.o (drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2026-05-20 12:58:36.524986+00:00
  Culprit: code

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
