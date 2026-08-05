Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135E43BB9F4
	for <linux-next@vger.kernel.org>; Wed,  5 Aug 2026 02:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785897016; cv=none; b=eD9PLL2bOeZml20SiWRKrfQ2QlkPGaa76mInp6bFhPoiOw0+o2ubiTb/H7OqxVvuIZFO3PRA61nXP/sjESgGJQcmTFI/al5K404tQH0p1wgaBycMRVyDBczToCMsZJSRaY5Fj1HZaAGMhIJ3PMmQ1IyAG/QNifk92apjNS98nZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785897016; c=relaxed/simple;
	bh=Takff4S6rPI8NplniC025VV7Z4vmW+wHwU9/Bdb2Vnk=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=VJAwAkXWNWgvmTVMZzmnracmoJKbda9wY3E9ppK19mUImTEE/NaygUmJe4bIZDaeO2yJeT5n4j2NRO0lJVNjiIWquzVwFjCz0Usd2PyukOJsT8NKnPQ3Db+lt1h2DeoZfuj1UiTCuSBpz24tsOLp2RlygrA4P4pDyB4/CoRUKu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=hei/hkIL; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="hei/hkIL"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cb5a6aa8760so231851a12.1
        for <linux-next@vger.kernel.org>; Tue, 04 Aug 2026 19:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1785897013; x=1786501813; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M869V8/zLJ70Ohdp0g0xgPig2e+dW1xn5STJRYY/eYI=;
        b=hei/hkILrodMCvNozNupQXcVzKFSuY4fbJ66Ms6n5fW2QLqDSRzJ3dESJYC3KQAVQp
         IRYrjh1Ak9xn6Nnz5vo8OalMtT4bKnvSVJPjNy1TZi1FaanJIx6a6IQiycz8nFFGLOqa
         lanhzTdFzpM6AnPYCC37uHtz4euMb1Pk4JnQ3GFL+qiGqA4YGM5AZBVHw2ukC8FBXC/E
         Zi4AHVWmCp/UaR1jU0KOgMYj+ij9QeB6EhGS9Uc49Zfv+IsGpvg/PtWqAfEKFbEb3A1V
         D96NbQHAHJjGr5uDze+ykKVIjiqqDy6xfopQKd+RMZjQEjxelKt06aED0BihLnPANCir
         AYkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785897013; x=1786501813;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M869V8/zLJ70Ohdp0g0xgPig2e+dW1xn5STJRYY/eYI=;
        b=dGeBP32wLdhv06w95odxFZtMlIU1Gr4KTYec6blK413otVHSRS8OVQ0Sbi0qH6p0Hr
         viltJ357zUsH1HLVlJd16or9cgRf+5bL3fHhpTzx/J/5rPUlIE79A+52jx1PXvr01bov
         9RROrnlwoByCXvFN0sItGYnoNS1KY3MybSlpzLbjKF53h13ienID2I5MQ+vwhfUW52tY
         2QtSazO43j9uc34DFndw/Wx1TT80z70v4khneNYsqD3ena8B+MUe73zzoRO1IPV803KM
         K/rTAlIbo3IfmX7ORrYrib5MbfPsml2bgcrtgZglqI2B+3QVdA87ZVMjsMXRM0eCZZqd
         AUNA==
X-Gm-Message-State: AOJu0YxfFxUjmbSXPTwMNXzyZ9rHU2eLRBJrrevWYN7RbmNKeWI+M/UH
	mE6gD6jShNM97Ea6J5yUwqGXDIVHEGdxOGdzEU/R9JW74NIjSBdoa+RuXFIrsgcWVHLA5+cyf2w
	l/6dd
X-Gm-Gg: AR+sD13YK6/wXNCbHVX5Kc047/mphePg99GvW5nIky0QA4RfwjikgTU82rAZmldChxa
	3GAfZKXzlDET8nzqHvtWVX74FZBp0GxPSWKWdNX3f0cSXEH3mvgwCpo+X3XpzuvTm3nxVdbePLN
	7V8UI0Sz7pJQ5vyISzLYU2KJOtfBXbjwe59VSPoP6adx2c8ATiMSj7gRsqq8UDisTC0UcLdY1p7
	22NTI31jMLlyazjomFND8GZfOOZd377kq+eT1SsRESzIGsHRteOe7GUw4sxAINalu0zv0TnMbP9
	2QtUjWGHThD4nSa4NC+6iHyIjfzGZBuMnO0sajukiDXlW8JmgMlIvy6C0zZL9jsf50F8b1WSmFn
	4XkIzFlGQ5EbYOcZOzPntqo6gZ410CTLs5ylyZoY5Bx80oeX/08AHVbdXynBsSdEMveVSYnB24m
	xFP5+4QC8xRLyXBQXX/hPjAOZl7LOkK934ESXlOAsdCMIhkFBV7orkaA==
X-Received: by 2002:a05:6a21:6915:b0:3c6:3c5b:f2e1 with SMTP id adf61e73a8af0-3cb86028b71mr3850134637.32.1785897012699;
        Tue, 04 Aug 2026 19:30:12 -0700 (PDT)
Received: from 92650adf53de ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca8df89asm16215149c88.9.2026.08.04.19.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 19:30:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 0f6da28aab51b16762ed82e8fdeaa5042da45b08
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 05 Aug 2026 02:30:11 -0000
Message-ID: <178589701126.6517.17715930953883810975@92650adf53de>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/0f6da28aab51b16762ed82e8fdeaa5042da45b08/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 0f6da28aab51b16762ed82e8fdeaa5042da45b08
origin: maestro
test start time: 2026-08-04 17:34:26.178000+00:00

Builds:	   72 ✅    2 ❌    0 ⚠️
Boots: 	  169 ✅    3 ❌    0 ⚠️
Tests: 	26541 ✅ 5193 ❌ 2832 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: bcm2837-rpi-3-b-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a7241df54179f15da9db309
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:6a72563354179f15da9ec68f
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:6a72563354179f15da9ec68e
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:6a72563354179f15da9ec68d
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:6a72563354179f15da9ec68c
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a7241e054179f15da9db32b
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:6a72458c54179f15da9dda54
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:6a72458c54179f15da9dda53
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:6a72458c54179f15da9dda52
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:6a72458c54179f15da9dda51
      history:  > ✅  > ✅  > ❌  > ❌  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a7241e254179f15da9db33b
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:6a7247bd54179f15da9e1d96
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:6a7247bd54179f15da9e1d95
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:6a7247bd54179f15da9e1d94
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:6a7247bd54179f15da9e1d93
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_i2c_30a50000_eeprom_50
      last run: https://d.kernelci.org/test/maestro:6a72553c54179f15da9ebd2d
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a7241e454179f15da9db33e
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:6a7242ed54179f15da9dc12d
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:6a7242ed54179f15da9dc12c
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:6a7242ed54179f15da9dc259
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:6a7242ed54179f15da9dc234
      history:  > ✅  > ✅  > ❌  > ❌  
            
Hardware: meson-gxl-s905x-libretech-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a7241e654179f15da9db349
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:6a7268e854179f15da9faa9f
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:6a7268e854179f15da9faa9e
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:6a7268e854179f15da9faa9d
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:6a7268e854179f15da9faa9c
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a7241e954179f15da9db3ac
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:6a72468654179f15da9e06ff
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:6a72468654179f15da9e06fe
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:6a72468654179f15da9e06fd
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:6a72468654179f15da9e06fc
      history:  > ✅  > ❌  > ❌  
            
Hardware: sun50i-a64-pine64-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a7241e854179f15da9db3a9
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:6a72445854179f15da9dcdb3
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:6a72445854179f15da9dcdb2
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:6a72445854179f15da9dcdb1
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:6a72445854179f15da9dcdb0
      history:  > ✅  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.kvm.shardfile-kvm
      last run: https://d.kernelci.org/test/maestro:6a726f8454179f15daa02d6f
      history:  > ❌  > ❌  > ✅  
            
Hardware: dell-latitude-3445-7520c-skyrim
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:6a7246da54179f15da9e0e5e
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:6a7247bc54179f15da9e1d83
      history:  > ❌  > ✅  > ✅  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.kvm.shardfile-kvm
      last run: https://d.kernelci.org/test/maestro:6a7237a554179f15da9ce4f4
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: sun50i-a64-pine64-plus
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.kvm.shardfile-kvm
      last run: https://d.kernelci.org/test/maestro:6a72375354179f15da9ce266
      history:  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_mixer-test_write_default_wm8960audio_69
      last run: https://d.kernelci.org/test/maestro:6a7244af54179f15da9dd41c
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_write_default_wm8960audio_70
      last run: https://d.kernelci.org/test/maestro:6a7244af54179f15da9dd423
      history:  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:6a7249c654179f15da9e48ba
      history:  > ✅  > ❌  > ✅  > ✅  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
