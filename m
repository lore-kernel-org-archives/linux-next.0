Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657B2339B3D
	for <linux-next@vger.kernel.org>; Tue, 29 Sep 2026 02:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790649015; cv=none; b=G76Wpv/KRpvQfQ0MQmIaWibhFCdUlnE8gNvSUnqPFxOcdcV5afg9SNWtcQkKoflEULNFsY1peW+ome9ztCz2nBHU6KPmdLYHSZgRV8CiwO5rODnYQpftcl3yTnX8e9LUzGZxMAI/Mj6HA72i7PItLQZvHSKF3cbt5pJ1N7aP20A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790649015; c=relaxed/simple;
	bh=3k89b8IOA7UxZFJvvP/TcgDG9Q7yiK9xRAE27NBxqRU=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=sSbqsMB9zH3OfKR6wOWDYr7hV+kqf2B0cg+4i3goc7oyKbX5RLzF02Di1rLOiTwZ4U5uUeesGjVVnW52yEu+MyO4vX9yAv2FnbuM8JNixpHKmZctIIilh5Utj7KRUA4DxrqFxj6BSxnEWvkOiDX1/z3bzIbRnCGDuPaWqPnJNBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=hPazr3Nt; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="hPazr3Nt"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33c24422d4dso4308458eec.2
        for <linux-next@vger.kernel.org>; Mon, 28 Sep 2026 19:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1790649012; x=1791253812; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qsKpiEd8QR5HwxeuQ3p6JR1MbobekRWiHtrnaqflkdQ=;
        b=hPazr3Ntf51+BCwCBrBv219voTips1mj2AvH8QXquu//w7anWNWuoVXKwiSGwJ27Ok
         QLBzvUMRaSg81QV690xgjOjoz//J8AT/LQXyK/5S4/Y6Xw3sfqL5anhPZyAq+xlpTQ6b
         pru5sQu4GMzjWRL5UgESoSNIaS2KM4AjDATVpyuR0LhAxtElKxz3LtuaQfyT0oHhUpfi
         OW3q1vdwkn+eMU17QF/aBt8iz87yLLDzLNElC6k0S9mGachaVvaDoXdE8GtD9sIxeU+E
         1WeWByaCDHK4OAKr6vEWhGYm+JUnsYMRMHKshR3dYWS+mgOqp6XUQscMo4HiqKDhAAS6
         6Duw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790649012; x=1791253812;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qsKpiEd8QR5HwxeuQ3p6JR1MbobekRWiHtrnaqflkdQ=;
        b=qIMnS649FU+ah/TPRyHHWfh9ayryRrOMqeNH5EWciUiAwtqCo31YIY2nY1nRWTjjVF
         IHNI5t0f0sPz/kXGgqu8S21qNdEv9dZS+QrwHtcP8XuevJTaqp30Rz/8RyC/gjgVNMZe
         US6dQ5DXnhaYze65uUM/fdRIlxq2D2Uh6hqfF3ZeH9YCTc4fsK7JuG4HTCj0+2CkKBWX
         nHFBULegPB9dJ+EJzEVjl+OV69ac5pL1VfLVXzsAo55DD28x8A+sQmL+sDfe4V9NBCIy
         dDeYqKYUkfr/fSm7Qf+WehsltacrRo1oz9UYFRuSywdJ67engpzNy9dhbTBKDIIE+6MM
         9vqA==
X-Gm-Message-State: AFq9FYIk2rQU9ppsEIpRjAdfTTBerydPlQ9OusbY/ye2f0KdZJwOwQsA
	oZUfwZHGZdTiiA8CbQnAS7m8l2xshI4B3alN2gCZHkYt/3oif5qYG8bgIf0Qh4vQlw0=
X-Gm-Gg: AYBFou05VFOX8PCy3QtJtX7gfguiNAUzHGrpfJ8UF3pWg9X7YkV1reiYHByQk2fATXV
	FCGOMXZ9/M2yckoaRohkSR0nLwXgr1q1SU6Gl0yoL3fVhtrKH7BSd86bZFCb/4sLZNPsuw0fHLI
	335AKa9eP0sZWXmmerZtciGTZT8ZKyxXCkUtrUNezW6s1jnmojVKWd5FnT8CBqcVSYHPaZqbwzf
	TWiiMcKZPKTC86s3LzUnFrr4LQyd1WDKxtEW4btTU55o0g8itYToaX/cAB4fCcLkNcFNrSMBCSK
	BufvQ22fgVoJdiML3SLiHoUDZXc1gCHWeewM0bdtvPp3j5K6RgXvT00lcwlR+Jv/agUHBp/6C2b
	Ly3g0gbaYzXJ/57u+0Xa+ITZFGZRO6DuoAOkqXJn5xcro5dyBHkZG+I2d1rfuG4sZ3fhQhwcnRr
	+n1++I0jCQbpesf5eJv0qNa4VYLzKM82Whvk8facxDkgviaVqw3vtZiS+mgljizLVG6tHDRLXbt
	w==
X-Received: by 2002:a05:7301:640c:b0:34b:7e89:9a7 with SMTP id 5a478bee46e88-34b7e892922mr64112eec.20.1790649012127;
        Mon, 28 Sep 2026 19:30:12 -0700 (PDT)
Received: from 5a6d9a2c18a2 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3433628f5basm23519217eec.18.2026.09.28.19.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 19:30:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 6375e61c01e93e35ee7acd336a689ac1fae4b509
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 29 Sep 2026 02:30:11 -0000
Message-ID: <179064901044.21142.5128151292922054719@5a6d9a2c18a2>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/6375e61c01e93e35ee7acd336a689ac1fae4b509/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 6375e61c01e93e35ee7acd336a689ac1fae4b509
origin: maestro
test start time: 2026-09-28 14:25:36.791000+00:00

Builds:	   51 ✅   11 ❌    0 ⚠️
Boots: 	   66 ✅   30 ❌    0 ⚠️
Tests: 	16453 ✅ 3178 ❌ 4529 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: kaanapali-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_9800000_dsi_9ac0000_panel_0
      last run: https://d.kernelci.org/test/maestro:6aba94e95ec73975aaf626dd
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_af5c000
      last run: https://d.kernelci.org/test/maestro:6aba9b4b5ec73975aaf67a9d
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: qcs615-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_i2c_888000_i2c-mux_77_i2c_0_bridge_58
      last run: https://d.kernelci.org/test/maestro:6abab02a5ec73975aaf74bfc
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_iommu_50a0000
      last run: https://d.kernelci.org/test/maestro:6abab02a5ec73975aaf74be7
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: qcs9100-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_22000000_displayport-controller_2215c000
      last run: https://d.kernelci.org/test/maestro:6aba97fc5ec73975aaf665e7
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000
      last run: https://d.kernelci.org/test/maestro:6aba97fc5ec73975aaf665e4
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_display-controller_ae01000
      last run: https://d.kernelci.org/test/maestro:6aba97fc5ec73975aaf665e3
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_af54000
      last run: https://d.kernelci.org/test/maestro:6aba97fc5ec73975aaf665e1
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_af5c000
      last run: https://d.kernelci.org/test/maestro:6aba97fc5ec73975aaf665df
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_dsi_ae94000
      last run: https://d.kernelci.org/test/maestro:6aba97fc5ec73975aaf665de
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_dsi_ae96000
      last run: https://d.kernelci.org/test/maestro:6aba97fc5ec73975aaf665dc
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_ae94400
      last run: https://d.kernelci.org/test/maestro:6aba97fc5ec73975aaf665db
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_ae96400
      last run: https://d.kernelci.org/test/maestro:6aba97fc5ec73975aaf665da
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_aec2a00
      last run: https://d.kernelci.org/test/maestro:6aba97fc5ec73975aaf665d9
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_aec5a00
      last run: https://d.kernelci.org/test/maestro:6aba97fc5ec73975aaf665d8
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_i2c_890000_i2c-mux_70_i2c_0_bridge_58
      last run: https://d.kernelci.org/test/maestro:6aba97fc5ec73975aaf665be
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_i2c_890000_i2c-mux_70_i2c_1_bridge_58
      last run: https://d.kernelci.org/test/maestro:6aba97fc5ec73975aaf665bd
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_iommu_3da0000
      last run: https://d.kernelci.org/test/maestro:6aba97fc5ec73975aaf6659e
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.kvm.kvm_set_memory_region_test
      last run: https://d.kernelci.org/test/maestro:6abaa2fe5ec73975aaf6a503
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.mm.mm_ksft_thp_sh_khugepaged
      last run: https://d.kernelci.org/test/maestro:6abaa2fd5ec73975aaf6a4df
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_thp_sh_khugepaged_-s_2
      last run: https://d.kernelci.org/test/maestro:6abaa2fd5ec73975aaf6a4e0
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
Hardware: nvidia-p3809-gb300
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.mm.mm_ksft_thp_sh_khugepaged
      last run: https://d.kernelci.org/test/maestro:6abab4675ec73975aaf75f74
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_thp_sh_khugepaged_-s_2
      last run: https://d.kernelci.org/test/maestro:6abab4675ec73975aaf75f75
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: sm8750-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.breakpoints
      last run: https://d.kernelci.org/test/maestro:6aba8c805ec73975aaf59de7
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.breakpoints.breakpoints_step_after_suspend_test
      last run: https://d.kernelci.org/test/maestro:6aba8ec05ec73975aaf5bde2
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-04
      last run: https://d.kernelci.org/test/maestro:6aba88a05ec73975aaf58552
      history:  > ❌  > ✅  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-01
      last run: https://d.kernelci.org/test/maestro:6aba87985ec73975aaf57954
      history:  > ❌  > ✅  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-02
      last run: https://d.kernelci.org/test/maestro:6aba87985ec73975aaf57953
      history:  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6aba8b0b5ec73975aaf5974e
      history:  > ❌  > ✅  > ❌  > ✅  > ❌  
            
Hardware: nvidia-p3809-gb300
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6aba89de5ec73975aaf590ff
      history:  > ❌  > ✅  > ❌  > ✅  > ❌  
            
Hardware: qcs615-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.breakpoints
      last run: https://d.kernelci.org/test/maestro:6aba8c7c5ec73975aaf59dc6
      history:  > ✅  > ✅  > ❌  > ❌  > ✅  
            
      - kselftest.breakpoints.breakpoints_step_after_suspend_test
      last run: https://d.kernelci.org/test/maestro:6aba9e0b5ec73975aaf68420
      history:  > ✅  > ✅  > ❌  > ❌  > ✅  
            
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6aba8cdf5ec73975aaf5a089
      history:  > ❌  > ❌  > ✅  > ✅  > ❌  
            
      - kselftest.timers.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:6abac03f5ec73975aaf7b34a
      history:  > ❌  > ❌  > ✅  > ✅  > ❌  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000
      last run: https://d.kernelci.org/test/maestro:6aba9c715ec73975aaf67fc9
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_display-controller_ae01000
      last run: https://d.kernelci.org/test/maestro:6aba9c715ec73975aaf67fc8
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_dsi_ae94000
      last run: https://d.kernelci.org/test/maestro:6aba9c715ec73975aaf67fc4
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_edp_aea0000
      last run: https://d.kernelci.org/test/maestro:6aba9c715ec73975aaf67fc2
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_ae94400
      last run: https://d.kernelci.org/test/maestro:6aba9c715ec73975aaf67fc0
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_aec2a00
      last run: https://d.kernelci.org/test/maestro:6aba9c715ec73975aaf67fbf
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: qemu-arm64
  > Config: defconfig+netdev+nfs-root-boot+ltp
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6aba936e5ec73975aaf61d1b
      history:  > ❌  > ✅  > ✅  > ❌  > ✅  
            
Hardware: sun50i-a64-pine64-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_pcm-test_default_time7_sun50ia64audio_0_0_PLAYBACK
      last run: https://d.kernelci.org/test/maestro:6aba8f0d5ec73975aaf5be69
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            



This branch has 10 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
