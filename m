Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCF63F8EB5
	for <linux-next@vger.kernel.org>; Tue, 21 Jul 2026 02:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784601014; cv=none; b=JdwIKk4WOWhVNoo6WKVSodGDMwc31R7dD1NuAET99GCMrjxG3kbk56LIYtrBqInozS1vjL6C9rC+CGyIUA7SnlxX/29o8M4BS3lJ7zG1YYaY7fxjk+0d+FB7OuOyiTvYxeg/Rza2bP100vxDFII4JZO4IaWTj9yBTPOme72lZVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784601014; c=relaxed/simple;
	bh=tVtVWZhNqHnAwbCWzMayoyv0hYWocFMaBCXhHl8zJLA=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=XeIZ2+3El6K3wZ1JWdAJkNLajCZqmaK0SWHG3+kq0Aqre2ej0todwyvY/X/t4QRnm0J4wdfN1IcJV/SANOu5W4pToTkXYwK3RRJVAf2NEDGFof28nKLOMbhLDyYsVyI6CKDadDVDLfha7hMSGtqDWk3/Sm0NraYJsME5RriloQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=N+gZvXdV; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="N+gZvXdV"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso80517675ad.2
        for <linux-next@vger.kernel.org>; Mon, 20 Jul 2026 19:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1784601011; x=1785205811; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XO4DdepLgYWW51XzhVXC0rFBRhr2GU9N8PdLKbH9FtY=;
        b=N+gZvXdVvmcITebgkLTJDQBfNuK9pRYqaHjp8bSBU3QkBJToJdc2BoBhMx4iCPN9h5
         0T5KHsAivhaoQ4DcuMYdOEX/POZqT9S0RSI+3WYmFb8iT6fBriDTuYDqIA9ZjMqA3EV3
         9yWFz8VHvgnsaBgLsWA+tCYyU3XSLRdPckd5YIeJBbeMOTptu9FLTa2M1oToT2t/yuPy
         iHKl83JDnO0CMTk9dDRHIvOyjNn73UowqjwYQWFi/a1e2PKT2UHc4qsqKaimN7gHium4
         VCVQhCh34VLkjv2Uyo3mChBXEqo8Fdrd4DVC6IIeusnqkysTVT5p+rJLBc9zXiKZ/HoA
         AvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784601011; x=1785205811;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XO4DdepLgYWW51XzhVXC0rFBRhr2GU9N8PdLKbH9FtY=;
        b=sqxWx2EbbOIGCWQhGJtKG5XmNzP41CzB+aem3XiWSX85aDS1hkTDypDn4daxvfCjsG
         VeYqg51FBYMJfU0+GjK0QiZzCE80nYUSrWSwhlHxgqE2iuCG4lT9EfO1Xbg9MSciVUrC
         lQsZEsWeanI39C88ehhpktRaJdWx6dkyusL1dHLYIXnLezcdO8plpVs5KXixjgT2U2hF
         D3hmHpIwdYztl3O+IH0tpbzkBS9Jxstl5aQYXif+sQn5BHNMGdspmX4BMvcB0wah0A1I
         2kKgOFukm9KOgrf0krB7RIKkw5Uo0am5M36Y8jwhvgaZ8NHoX8Jxkbm7KnCQ74CRYQqg
         +yUQ==
X-Gm-Message-State: AOJu0YydvopMUT6qZRjEcKAfrm8+RRuWh8EgU6cltnBBb4/Gc1/XqDt8
	vIbfmCatg8znUPtQ8KxUUWaRtNNME93IOkubE14AhMuXe40/I2oFWNa1/3LMFD8HFX/vh9JmeMv
	0VG8s
X-Gm-Gg: AR+sD12ifDH0aGcigHUX+x7M29EffGOuLLaegaCmDE/EklirgEr2kI2SifTdsXnSRf6
	jBOs2+lkba/yj/tUYFKo96nzh1CQLV8O5OvUM0/NzX0N7aiIUbrD7Ts75dZMhIt9uKDag1Pi4/R
	EXDnedAGOnKieFsSQ2fai0nVu3m0Ifi+TKrPpyqc3UHq/Qyl2gDH1tNfSZsAU8DPT/brHFX1L6J
	3rP6kMzZ/QwwhZpAjWgwUr7Kj4M/ndNzy7r8l8WDlIZCa3RMkB9487k8RhLprGpxK6irk0pZB0l
	Sf9Yt8PPR1vppucaw637zts3X7oXU83ch1cbWLPUOJ0ejAxwfVkOW1t/HHTqJ5YS+cFnZnB90nR
	tgc2wvKTQqi65v7SeGqbRVMiORuIqJOMIS5o0pDaP5+ooA+6EKJnCi0FiurmyNOZbc7298Ss=
X-Received: by 2002:a17:903:234d:b0:2cc:f4d4:29a7 with SMTP id d9443c01a7336-2cf3499781cmr183357715ad.24.1784601010689;
        Mon, 20 Jul 2026 19:30:10 -0700 (PDT)
Received: from 4104846f2ebf ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a210571sm42314232eec.31.2026.07.20.19.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 19:30:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 3fe08b9796f36ef437ab9328e7dd1e5ff2d66603
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 21 Jul 2026 02:30:09 -0000
Message-ID: <178460100952.480.4261700909182775345@4104846f2ebf>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/3fe08b9796f36ef437ab9328e7dd1e5ff2d66603/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 3fe08b9796f36ef437ab9328e7dd1e5ff2d66603
origin: maestro
test start time: 2026-07-20 16:58:07.112000+00:00

Builds:	   71 ✅    2 ❌    0 ⚠️
Boots: 	  150 ✅    2 ❌    0 ⚠️
Tests: 	28133 ✅ 2506 ❌ 6635 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: kaanapali-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a5e8af875cb84fb216772c5
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_fp-stress
      last run: https://d.kernelci.org/test/maestro:6a5e8c3875cb84fb2167ce41
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_crypto_1dfa000
      last run: https://d.kernelci.org/test/maestro:6a5e8f1475cb84fb2167f8f4
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_9800000_dsi_9ac0000_panel_0
      last run: https://d.kernelci.org/test/maestro:6a5e8f1475cb84fb2167f8ee
      history:  > ✅  > ✅  > ❌  
            
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6a5e913f75cb84fb21682225
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6a5ea33775cb84fb2168f78f
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: qcs9100-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_crypto_1dfa000
      last run: https://d.kernelci.org/test/maestro:6a5ebc9275cb84fb21693004
      history:  > ✅  > ❌  > ❌  
            
Hardware: sm8750-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.breakpoints
      last run: https://d.kernelci.org/test/maestro:6a5e8b0775cb84fb21677506
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.breakpoints.breakpoints_step_after_suspend_test
      last run: https://d.kernelci.org/test/maestro:6a5e8cbc75cb84fb2167da79
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_crypto_1dfa000
      last run: https://d.kernelci.org/test/maestro:6a5e8eb375cb84fb2167e4a6
      history:  > ✅  > ❌  > ❌  
            
Hardware: x1e80100
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_crypto_1dfa000
      last run: https://d.kernelci.org/test/maestro:6a5e984e75cb84fb2168b2ba
      history:  > ✅  > ❌  > ❌  
            
Hardware: bcm2837-rpi-3-b-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:6a5e8e1a75cb84fb2167e1cc
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:6a5ebc8475cb84fb21692f17
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_crypto_1dfa000
      last run: https://d.kernelci.org/test/maestro:6a5ea80675cb84fb2169038b
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6a5e8b8975cb84fb2167c2f7
      history:  > ✅  > ❌  > ❌  
            
Hardware: qcs615-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.breakpoints
      last run: https://d.kernelci.org/test/maestro:6a5e8b0275cb84fb216774e0
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.breakpoints.breakpoints_step_after_suspend_test
      last run: https://d.kernelci.org/test/maestro:6a5eb28975cb84fb21691372
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_crypto_1dfa000
      last run: https://d.kernelci.org/test/maestro:6a5ebf0d75cb84fb216933b9
      history:  > ✅  > ❌  > ❌  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a5e8af475cb84fb21677108
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_fp-stress
      last run: https://d.kernelci.org/test/maestro:6a5e8c7a75cb84fb2167d648
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.breakpoints
      last run: https://d.kernelci.org/test/maestro:6a5e8b0475cb84fb216774e4
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_crypto_1dfa000
      last run: https://d.kernelci.org/test/maestro:6a5e8ee175cb84fb2167e8fd
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_iommu_3da0000
      last run: https://d.kernelci.org/test/maestro:6a5e8ee175cb84fb2167e8b5
      history:  > ✅  > ❌  > ❌  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_crypto_1dfa000
      last run: https://d.kernelci.org/test/maestro:6a5e92b375cb84fb216834d9
      history:  > ✅  > ❌  > ❌  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a5e63c675cb84fb216611be
      history:  > ✅  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: kaanapali-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.breakpoints
      last run: https://d.kernelci.org/test/maestro:6a5e8b0875cb84fb2167750d
      history:  > ❌  > ✅  
            
      - kselftest.breakpoints.breakpoints_step_after_suspend_test
      last run: https://d.kernelci.org/test/maestro:6a5e8d3975cb84fb2167dd12
      history:  > ❌  > ✅  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:6a5e8b3b75cb84fb21677e57
      history:  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:6a5e95d175cb84fb21689071
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_i2c_30a50000_eeprom_50
      last run: https://d.kernelci.org/test/maestro:6a5e981175cb84fb2168afae
      history:  > ✅  > ✅  > ❌  > ❌  > ✅  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6a5e913b75cb84fb21682217
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6a5e95b775cb84fb21688e4c
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
Hardware: qcs9100-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_22000000_displayport-controller_22154000
      last run: https://d.kernelci.org/test/maestro:6a5ebc9275cb84fb21692fff
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_22000000_displayport-controller_2215c000
      last run: https://d.kernelci.org/test/maestro:6a5ebc9275cb84fb21692ffe
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_22000000_phy_220c2a00
      last run: https://d.kernelci.org/test/maestro:6a5ebc9275cb84fb21692ffd
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_22000000_phy_220c5a00
      last run: https://d.kernelci.org/test/maestro:6a5ebc9275cb84fb21692ffc
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_af54000
      last run: https://d.kernelci.org/test/maestro:6a5ebc9275cb84fb21692ff8
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_af5c000
      last run: https://d.kernelci.org/test/maestro:6a5ebc9275cb84fb21692ff6
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_aec2a00
      last run: https://d.kernelci.org/test/maestro:6a5ebc9275cb84fb21692ff0
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_aec5a00
      last run: https://d.kernelci.org/test/maestro:6a5ebc9275cb84fb21692fef
      history:  > ✅  > ❌  > ✅  
            
Hardware: x1e80100
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.capabilities
      last run: https://d.kernelci.org/test/maestro:6a5e8b2675cb84fb21677bc0
      history:  > ✅  > ❌  > ✅  
            
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_i2c_890000_eeprom_50_nvmem-layout
      last run: https://d.kernelci.org/test/maestro:6a5ea80675cb84fb21690365
      history:  > ⚠️  > ✅  > ✅  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_display-controller_ae01000
      last run: https://d.kernelci.org/test/maestro:6a5e92b375cb84fb216834d0
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_af54000
      last run: https://d.kernelci.org/test/maestro:6a5e92b375cb84fb216834ce
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_dsi_ae94000
      last run: https://d.kernelci.org/test/maestro:6a5e92b375cb84fb216834cc
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_ethernet_23040000
      last run: https://d.kernelci.org/test/maestro:6a5e92b375cb84fb216834c6
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_ethernet_23040000_mdio_phy_8
      last run: https://d.kernelci.org/test/maestro:6a5e92b375cb84fb216834c4
      history:  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_ac0000_i2c_a80000_i2c-mux_70_i2c_0_bridge_58
      last run: https://d.kernelci.org/test/maestro:6a5e92b375cb84fb216834a4
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pci_1c00000_pcie_0_wifi_0
      last run: https://d.kernelci.org/test/maestro:6a5e92b375cb84fb21683489
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_usb_a600000
      last run: https://d.kernelci.org/test/maestro:6a5e92b375cb84fb21683419
      history:  > ✅  > ❌  > ✅  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.efivars
      last run: https://d.kernelci.org/test/maestro:6a5e63a975cb84fb216610e8
      history:  > ❌  > ✅  > ❌  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
