Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FC33515F1
	for <linux-next@vger.kernel.org>; Tue,  4 Aug 2026 02:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785810699; cv=none; b=lsD5+xdlGNN0AoGl22nzEHL7fRwh3o0Y5tbD0SgA+1JVRH36iMK4zG1NAwcyk2gxsHHPm0GBS9ezKLfi1/ww1BIAQyuPJYScj6wNADCzt/zX8XMKNOoR50w2A2efftjQDl8+FY27w/k9Z88apvYp9AqFSph4ddG+thJLS6/J3oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785810699; c=relaxed/simple;
	bh=rsQvl0hwQiOEM3M6xlc6KhdCFUV6GQu5aKsCkrHTS2U=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=JRPFKgDdKlGli1VUxFzWg5NU2ActDpXBBQve8GFU/ok+smjISQzBmv7jIsbwyA77If8w5YjozyPHzhMukbgGjSVDGLjY1fZurc1gBRpZnzBzr8wgOs8rhDbOzQfRWleY4dFCWkLy8TPh3bKYilestCxicVW8AgTIFdTYwZ5B9QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=N3WDGUos; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="N3WDGUos"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso3112512a91.3
        for <linux-next@vger.kernel.org>; Mon, 03 Aug 2026 19:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1785810697; x=1786415497; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=li98uaCLepjDQWHznRSP/+j0a7Rrm0g7oyErG2EzLrQ=;
        b=N3WDGUospvhThr8UOAHS2d9JKk4EpiRhxb0HoT5N0twL1NuAXeRVXFWOh4/U5qXua7
         iaqWrlIodXEOmT9/y6249D25E6PH52Rf7TcV1RQtnidSk00Oe8B9AR70B/nktayL+wia
         7p4AYe0YDXGqe4z47WM5p9insIVLkeU11g378s/tW56uga8kZqVMn5Uj15iOWV80VQgH
         txiz5grpyPoG3NeBrMlOaiFHcKeXNbqDBneiH+w8MI1Ukv3vlIQIQJVELcSCQpsIcbQc
         q5XGnV7C1+d8/9OPp86V0rRxbrNKobkl4Upda/g2cWTxOukpHm3hjV281TmTcjAMobLS
         jjpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785810697; x=1786415497;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=li98uaCLepjDQWHznRSP/+j0a7Rrm0g7oyErG2EzLrQ=;
        b=hNAYLCehBwGMp6gXSewvx7AcOu8oFyv4NPWm5lvuPixhp83yqPU7qO7m4yh6Jtk2Oe
         4DzN+urycdPoxGNswMYrFpE3xYS18wjeyg8RCLZItirv/Bb6fNwjO/teuf/NFcOG0FzY
         ZFU+V9VFEJFuEMjEyITczL8KTUJYdOHRiCyO3l4VX2PMj2n0J3L2vU7rfx+t1Ed2nnYc
         HzEBgzBfnrpVybOaHlU8ZKQkBLHp+z5hqW7VRH0KdkJx2yUOolNS1PbcVxTEvjNLjAno
         h+RqqGOxYDsyZJVkRsF5+/yjkKkhTma2glmJ0SzLJrcbBlEbAJDpUfb4scfPTnugc94G
         y/Rw==
X-Gm-Message-State: AOJu0YxgDsV9TNGKIR60wmKe4oufZTMmMgabmjUsFq1KADxTJM5UmJn3
	C0MEj5W5cUUr5W8truPay5x/bBc3AdlBBjOpFyFb0+NWXQPjRySw1wbOmxq6lDW4WFv5tEkc8UZ
	jLVDI
X-Gm-Gg: AR+sD11g3dmpNXOoo7yJ/2bdAvhL0fqb8p9222TXBQaom9/DPeLwKhAu5Qn1799eB9X
	QRIaUIIPNkXcRUcuxKwL2WfpKs23UZ2/6AdwPqLiB4c9kw+yj0a8U/z89Ol7MlC2vQ+CY4a8W50
	7zKklgHs59ctGsOo4WwyM8Yl94mpF1vU/FFbUmtL9zuLsMGKyJcpWx8+emdeF723Jp9LrBC0dPC
	iJhF31U+lj8gEw2t5CXrZVo+lBjxXE09jHWggW6ehfSO6iT7HlswvLESdj3bH5DoGnYV9W3/lvR
	Q3OBSsVI+0DgwzlJMYsneXOENtFwabn5ShiwbysCMGfSiNjgEM0gHYuun48AEcDA5C8W34L7Vrc
	TEB58s+nMnErXGIcwX5HJvSTlPVl5mJvaxZrnUAFTw7m35QtlAcTIySVaw2U36vXo6Pb2bDEm4+
	RqqbZoNOhJXUJvJUph0wn/6J4CT6TXR16Apiu6g6n8h0mKZZIHYJkhhguvs0k62s0t
X-Received: by 2002:a17:90b:3912:b0:38e:6a44:671b with SMTP id 98e67ed59e1d1-38fbc0a436emr11930294a91.0.1785810697057;
        Mon, 03 Aug 2026 19:31:37 -0700 (PDT)
Received: from 92650adf53de ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4cb50dsm59805398c88.10.2026.08.03.19.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 19:31:36 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 9a4cdc958dd79fc6c3b20b51a10debec6ca09fec
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 04 Aug 2026 02:31:36 -0000
Message-ID: <178581069573.6069.15297598572599819526@92650adf53de>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/9a4cdc958dd79fc6c3b20b51a10debec6ca09fec/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 9a4cdc958dd79fc6c3b20b51a10debec6ca09fec
origin: maestro
test start time: 2026-08-03 17:30:22.334000+00:00

Builds:	   71 ✅    3 ❌    0 ⚠️
Boots: 	  171 ✅    3 ❌    0 ⚠️
Tests: 	26290 ✅ 5187 ❌ 2777 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: bcm2837-rpi-3-b-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a70e0fd54179f15da95bf8d
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:6a70e40f54179f15da9616a1
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:6a70e40f54179f15da9616a0
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:6a70e40f54179f15da96169f
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:6a70e40f54179f15da96169e
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_mixer-test_write_default_wm8960audio_69
      last run: https://d.kernelci.org/test/maestro:6a70e25254179f15da95cf1e
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a70e0ff54179f15da95bf90
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:6a70e33754179f15da95fc00
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:6a70e33754179f15da95fbff
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:6a70e33754179f15da95fbfe
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:6a70e33754179f15da95fbfd
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a70e10054179f15da95bfcd
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:6a70e30e54179f15da95f6ea
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:6a70e30e54179f15da95f6e9
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:6a70e30f54179f15da95f816
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:6a70e30f54179f15da95f815
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_i2c_30a50000_eeprom_50
      last run: https://d.kernelci.org/test/maestro:6a70e48954179f15da961aba
      history:  > ✅  > ✅  > ❌  > ❌  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a70e10254179f15da95bfd0
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:6a70e1f054179f15da95c309
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:6a70e1f054179f15da95c308
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:6a70e1f054179f15da95c307
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:6a70e1f054179f15da95c306
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: meson-gxl-s905x-libretech-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a70e10354179f15da95bfd7
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:6a70e32454179f15da95f98c
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:6a70e32454179f15da95f98b
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:6a70e32454179f15da95f98a
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:6a70e32454179f15da95f989
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: sun50i-a64-pine64-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a70e10554179f15da95bfe5
      history:  > ✅  > ❌  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:6a70e37054179f15da9600d0
      history:  > ✅  > ❌  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:6a70e37054179f15da9600cf
      history:  > ✅  > ❌  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:6a70e37054179f15da9600ce
      history:  > ✅  > ❌  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:6a70e37054179f15da9600cd
      history:  > ✅  > ❌  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a70e10654179f15da95bfe9
      history:  > ✅  > ❌  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:6a70e22a54179f15da95c6c9
      history:  > ✅  > ❌  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:6a70e22a54179f15da95c6c8
      history:  > ✅  > ❌  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:6a70e22a54179f15da95c6c7
      history:  > ✅  > ❌  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:6a70e22a54179f15da95c6c6
      history:  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: dell-latitude-3445-7520c-skyrim
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:6a70dc4054179f15da9577a0
      history:  > ❌  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:6a70dd5154179f15da9590a7
      history:  > ❌  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_mixer-test_write_default_wm8960audio_70
      last run: https://d.kernelci.org/test/maestro:6a70e25254179f15da95cf25
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: gs101-oriole
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6a70da2e54179f15da956c2a
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:6a70e0f454179f15da95bf5d
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.alsa.alsa_pcm-test
      last run: https://d.kernelci.org/test/maestro:6a70e25254179f15da95ccab
      history:  > ✅  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:6a70e5f154179f15da961d6c
      history:  > ✅  > ✅  > ❌  > ✅  
            



This branch has 2 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
