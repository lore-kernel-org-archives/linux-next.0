Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E21A35CB8C
	for <linux-next@vger.kernel.org>; Thu, 23 Jul 2026 02:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784773853; cv=none; b=kdThuXcvQRS3kRsq2DranzgAR4ED6djYswdxP9Z71iff92KB6FTG7eIK0/gqElfTzUpMkjdWSwcnRzWkAMPkAa3lPY46Bo0+FICD/Fe8Ut51eqmX2IvCLJ2uqVhJcbP8kUj/Dpp3MmymR6r8p0P3oKRAW2cRkSrgH16gcNUR5js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784773853; c=relaxed/simple;
	bh=dVjsu8GMgpHGElc6em5uxl+zJwuacKyiYeWpmdYCz5s=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=rWJSe8zYTZ0CdZ1ZSDL97BpbmzCm7Z8EXqP3mrTHXMkUD/nZxjZMZ7JV4mutlnTJVnuOFYAGt5/7dgu7VF/6QmGsbnjpKa31npHijNacy1R3ZvUxkDOVr0PPMWn9bo0pNLYOBpkMWwrtXEJbYztX7iEtx/HjFs1HdEuIKoNo+no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=M8ZKuqpf; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="M8ZKuqpf"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38101f85591so87655a91.1
        for <linux-next@vger.kernel.org>; Wed, 22 Jul 2026 19:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1784773847; x=1785378647; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cO0jJA2Z7DzPwyOvlgnvMfMw2XnlgC0yqw+XSKNAF10=;
        b=M8ZKuqpfJfdoImPuxv7EkXPuzXaZ0j3AzpuVxikNSKGepYg2HFtCdRCWSQEGNXrauq
         ld9U8oIxY/ZqBV7Rhz55plsplsuwvm9p4UYCbNtwPz7rxuwnxt0kAUf7L4NxlBle/MzT
         ruWOl5KtiOOmPMdOrANF2Tf2A4DQ4QaZqe0agcZd9lwgj15aZFFR5BJP6HJxmhOyVovS
         XGwKIAAS+TUPx4oVX8ZPax9+cff0u2AAaThVeBB2VcnUcWxyHWEZhlVDcTnfO/cNhB1z
         zG01c5zlzyu2S09tc1I65z1/VHwMvK2iOO+MrwqNQHf8/sQKvdhJMwuVPQAWzrDVkwOD
         DmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784773847; x=1785378647;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cO0jJA2Z7DzPwyOvlgnvMfMw2XnlgC0yqw+XSKNAF10=;
        b=aOD0OnERnRI7m2gDgnbv/myHwuhF1sOn3mHaEDCCRGaHGM38C8N5heVkP7SzjZ5hl8
         teMu+rvlgOsotw7IVkPweeB8JWlJrk7AfxZxYvaVknPKzNi2du3JwZ8RQS0S2PI+tokL
         iNW/n3khKcVN8UPaHX+lGQRTSgVt5jkzr7SKBO+CA0ozgXBMrDbXLfZj7AJF/a/rn2te
         NhXEhYMDhbn4JH9KaahP6BIcNPIVWjDAmsFVNgvN1oKA8Jaa+JDmks0aI+awnqf/FU4V
         xVOc7dpnIoWkjD3lPIxybhlGDAKnOFpJl9S7Bd2cKkjB0q/WtZsKxcFXmcadjaDj1Kg0
         dOLg==
X-Gm-Message-State: AOJu0Yy4C+jxViFZTFuf0k/foet262JLJ+quGM8PnXr6/1rBpRLIEVEZ
	zAbBwsSVLzbwHAVjAwkqJ4jZezhp5mN3FMD7smVCQUkhalxualuRarxS3EYVr+g8znU=
X-Gm-Gg: AR+sD116a47QhplLBGcWehKdt0ar6C3KPU3lOrvIIVzrOMJ1EejUvCPXz29Au9d7hta
	BdBtE774neNdP0GH+jRGFn0jQP3NyKqPkOWjEwgwOTl9JJ5DmkfjLaTArf9eJkF1F93vPQqVb0K
	fBmnaKswOMg6SSiZhj/+/+2PPsJLE9hYgI7yJDWzZG7K6aMkbSp3yezE6yJ04hxgRsxSB/GKu6u
	99HH6R5ry//RJw4/c59TWTsc7ZggGl2UaImDXVHVIm+wb7C9NGZvrLF+pWP4cC08H92e2NuFKJJ
	GXOEx9rDUFdV181nCADsoS/3r1t9NK5EC3GCE3QZxSuG4WknYtkibNKOqMKcWgbPmSNr4WKHSMx
	zVt9VmNhPg8WQMfWuRmFzN6lTAia+BUxC/dkzSe60vIlvYqDo5XAVxW/NOXncqzGF30xHqQ4=
X-Received: by 2002:a17:90b:35d0:b0:37f:a913:1554 with SMTP id 98e67ed59e1d1-38ec856d559mr830506a91.16.1784773847367;
        Wed, 22 Jul 2026 19:30:47 -0700 (PDT)
Received: from 4104846f2ebf ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d13003f12sm17707283c88.2.2026.07.22.19.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 19:30:46 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - b4515cf4156356e8f4fe6e0fdc17f59adab9772f
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 23 Jul 2026 02:30:46 -0000
Message-ID: <178477384597.2070.12005916370926456193@4104846f2ebf>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/b4515cf4156356e8f4fe6e0fdc17f59adab9772f/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: b4515cf4156356e8f4fe6e0fdc17f59adab9772f
origin: maestro
test start time: 2026-07-22 15:59:17.810000+00:00

Builds:	   68 ✅    4 ❌    0 ⚠️
Boots: 	  148 ✅    4 ❌    0 ⚠️
Tests: 	24904 ✅ 2220 ❌ 4126 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:6a60f39a75cb84fb217c5bef
      history:  > ✅  > ✅  > ❌  
            
Hardware: kaanapali-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_crypto_1dfa000
      last run: https://d.kernelci.org/test/maestro:6a60f98b75cb84fb217cb052
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.breakpoints
      last run: https://d.kernelci.org/test/maestro:6a60f37075cb84fb217c5a45
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_reboot-mode
      last run: https://d.kernelci.org/test/maestro:6a6108b675cb84fb217d2b5f
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_crypto_1dfa000
      last run: https://d.kernelci.org/test/maestro:6a6108b675cb84fb217d2b46
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_edp_aea0000
      last run: https://d.kernelci.org/test/maestro:6a6108b675cb84fb217d2b39
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_aec2a00
      last run: https://d.kernelci.org/test/maestro:6a6108b675cb84fb217d2b36
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_9c0000_serial_99c000_bluetooth
      last run: https://d.kernelci.org/test/maestro:6a6108b675cb84fb217d2b18
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_phy_88e8000
      last run: https://d.kernelci.org/test/maestro:6a6108b675cb84fb217d2afa
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_adc_3100
      last run: https://d.kernelci.org/test/maestro:6a6108b575cb84fb217d2ac5
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_adc-tm_3400
      last run: https://d.kernelci.org/test/maestro:6a6108b575cb84fb217d2ac6
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_nvram_7000
      last run: https://d.kernelci.org/test/maestro:6a6108b575cb84fb217d2ac3
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_nvram_7100
      last run: https://d.kernelci.org/test/maestro:6a6108b575cb84fb217d2ac2
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_nvram_7400
      last run: https://d.kernelci.org/test/maestro:6a6108b575cb84fb217d2ac1
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_nvram_7c00
      last run: https://d.kernelci.org/test/maestro:6a6108b575cb84fb217d2ac0
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_nvram_7d00
      last run: https://d.kernelci.org/test/maestro:6a6108b575cb84fb217d2abf
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_nvram_8400
      last run: https://d.kernelci.org/test/maestro:6a6108b575cb84fb217d2abe
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_nvram_8500
      last run: https://d.kernelci.org/test/maestro:6a6108b575cb84fb217d2abd
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_nvram_8600
      last run: https://d.kernelci.org/test/maestro:6a6108b575cb84fb217d2abc
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_nvram_9800
      last run: https://d.kernelci.org/test/maestro:6a6108b575cb84fb217d2abb
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_nvram_9d00
      last run: https://d.kernelci.org/test/maestro:6a6108b575cb84fb217d2aba
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_pon_1300
      last run: https://d.kernelci.org/test/maestro:6a6108b575cb84fb217d2ab9
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_pon_1300_pwrkey
      last run: https://d.kernelci.org/test/maestro:6a6108b575cb84fb217d2ab8
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_pon_1300_resin
      last run: https://d.kernelci.org/test/maestro:6a6108b575cb84fb217d2ab7
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_rtc_6100
      last run: https://d.kernelci.org/test/maestro:6a6108b575cb84fb217d2ab6
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_1_temp-alarm_a00
      last run: https://d.kernelci.org/test/maestro:6a6108b575cb84fb217d2ab3
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_2_pwm
      last run: https://d.kernelci.org/test/maestro:6a6108b575cb84fb217d2ab0
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_2_temp-alarm_a00
      last run: https://d.kernelci.org/test/maestro:6a6108b575cb84fb217d2aaf
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_8_adc_3100
      last run: https://d.kernelci.org/test/maestro:6a6108b575cb84fb217d2aad
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_8_temp-alarm_2400
      last run: https://d.kernelci.org/test/maestro:6a6108b575cb84fb217d2aab
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_usb_a600000
      last run: https://d.kernelci.org/test/maestro:6a6108b575cb84fb217d2a8a
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_video-codec_aa00000
      last run: https://d.kernelci.org/test/maestro:6a6108b575cb84fb217d2a89
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_wcn6750-pmu
      last run: https://d.kernelci.org/test/maestro:6a6108b575cb84fb217d2a84
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device-error-logs
      last run: https://d.kernelci.org/test/maestro:6a60f3ad75cb84fb217c5ce8
      history:  > ✅  > ❌  > ❌  
            
Hardware: sm8750-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_crypto_1dfa000
      last run: https://d.kernelci.org/test/maestro:6a60fbac75cb84fb217cc04c
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: qcs8300-ride
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a60f4d575cb84fb217c6ba4
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: kaanapali-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a60f3d375cb84fb217c5de1
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6a60f9f375cb84fb217cb29b
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh_global_requeue_single
      last run: https://d.kernelci.org/test/maestro:6a60f9f375cb84fb217cb29c
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: meson-gxl-s905x-libretech-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a60f3e675cb84fb217c5f27
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6a6175cf75cb84fb2182ffb2
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.futex.futex_run_sh_global_requeue_single
      last run: https://d.kernelci.org/test/maestro:6a6175cf75cb84fb2182ffb3
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:6a60f39e75cb84fb217c5c05
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.device-error-logs
      last run: https://d.kernelci.org/test/maestro:6a60f3b175cb84fb217c5cfa
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a60f3ce75cb84fb217c5da5
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6a6108f875cb84fb217d2d4b
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh_global_requeue_single
      last run: https://d.kernelci.org/test/maestro:6a6108f875cb84fb217d2d4c
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.futex.futex_run_sh_global_requeue_single
      last run: https://d.kernelci.org/test/maestro:6a61080475cb84fb217d26b6
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: sm8750-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a60f3d275cb84fb217c5dc2
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6a60fad375cb84fb217cb748
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh_global_requeue_single
      last run: https://d.kernelci.org/test/maestro:6a60fad375cb84fb217cb749
      history:  > ❌  > ❌  > ✅  > ✅  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a60f3cf75cb84fb217c5db0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6a60fdc075cb84fb217cc82c
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.futex.futex_run_sh_global_requeue_single
      last run: https://d.kernelci.org/test/maestro:6a60fdc075cb84fb217cc82d
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: bcm2837-rpi-3-b-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:6a60f3c275cb84fb217c5d65
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:6a61598675cb84fb21817430
      history:  > ✅  > ✅  > ❌  > ✅  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:6a60f3da75cb84fb217c5e07
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
Hardware: kaanapali-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a60f36575cb84fb217c5a0a
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_fp-stress
      last run: https://d.kernelci.org/test/maestro:6a60f47f75cb84fb217c647a
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_9800000_dsi_9ac0000_panel_0
      last run: https://d.kernelci.org/test/maestro:6a60f98b75cb84fb217cb04c
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6a60f58475cb84fb217c700e
      history:  > ❌  > ✅  > ❌  > ❌  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6a60f8b075cb84fb217c8567
      history:  > ❌  > ✅  > ❌  > ❌  > ✅  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a60f36175cb84fb217c59f0
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.arm64.arm64_fp-stress
      last run: https://d.kernelci.org/test/maestro:6a61064375cb84fb217d1ecb
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_iommu_3da0000
      last run: https://d.kernelci.org/test/maestro:6a6108b675cb84fb217d2b06
      history:  > ✅  > ❌  > ❌  > ✅  > ✅  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a60f4d475cb84fb217c6ba1
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6a60f58775cb84fb217c7016
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6a60fada75cb84fb217cb7a1
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.devices-probe
      last run: https://d.kernelci.org/test/maestro:6a60f42775cb84fb217c6038
      history:  > ❌  > ✅  > ❌  
            
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6a60f3f275cb84fb217c5f74
      history:  > ✅  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.timers.timers_posix_timers
      last run: https://d.kernelci.org/test/maestro:6a610b4075cb84fb217d484e
      history:  > ✅  > ❌  > ✅  > ✅  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:6a60f39f75cb84fb217c5c1d
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.device-error-logs
      last run: https://d.kernelci.org/test/maestro:6a60f3b375cb84fb217c5cfd
      history:  > ❌  > ✅  > ❌  
            
      - kselftest.devices-exist
      last run: https://d.kernelci.org/test/maestro:6a60f41e75cb84fb217c601d
      history:  > ✅  > ❌  > ✅  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.efivars
      last run: https://d.kernelci.org/test/maestro:6a60f4b675cb84fb217c6b3b
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            



This branch has 3 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
