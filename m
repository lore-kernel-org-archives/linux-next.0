Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B0122425B
	for <linux-next@vger.kernel.org>; Wed, 22 Jul 2026 02:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784687449; cv=none; b=PRBvMuIFADP7CZXGNYmllgThF5d7b/b3V+sctJsldmOT0oGjX0KgZ7YF5vTtbUqtYtVVzQZm+WI2OW3XdzkAxE/uJCKJoc6JjyOOBuRQTmn0XFFtGLykXIKyGzLYP+mThKCHU9I28noKp+Rycz3sHNiHqgWdXUG2MqYaW5dexug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784687449; c=relaxed/simple;
	bh=yFyihW2/WieI29bKpEX6xvAiGirj8KnTMoWiTL4V9cQ=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=kXuFMF94cE9jy6rUTJJedRSaJChS+ue1LiNBYlxBpHjcDt49oOyaFsGCc96RDZFQ12mGpOk/zCIawun03kjzFiAWRr6KUeXV3GmvVYmAh1/GBDj2kQe4itfItLxwYZ+MJLeJKZXyxDY/R1YgWc8pm0NwcXUPraI4yZ9G8H8ctGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=hySBJOez; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="hySBJOez"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso8356802a12.0
        for <linux-next@vger.kernel.org>; Tue, 21 Jul 2026 19:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1784687446; x=1785292246; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yCzzbJIkwK4GRhvuSwA74JEUN8GYmAXSUOBd3HIamsw=;
        b=hySBJOezFBig40GS9/GLJRNfYnEhT0gf+H0bIddurP9zLsxJhqVQYkuaOwPkslH1Fh
         cjIKtCtNzwJvjpD0vAcYRhzNM50F+GiSySS8JI4UaNlZr1clHNFtx/im08D7yb+c9cW2
         3fOzzlJIcCVXS1/DHQwxd2zdLW6NmjBVYIZmyCUTIpzasA5/t/DWn+qyqXFlpMSvXAij
         lhUB3MWjeuZz2RP15js23Y/VMlScccCAeSFGnwkR583/+LYxIIqrkT8LclLMFx0bWTiT
         /pMpqvMmseuL9pAEi6LpnlluXZNLv5TcNAQgkQxuvqXBXqXedZZMd/vuZji0rsKlRxD4
         txUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784687446; x=1785292246;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yCzzbJIkwK4GRhvuSwA74JEUN8GYmAXSUOBd3HIamsw=;
        b=iLt9wEEHf5H95ABPlZS8bZU6lBcvBw0PVmHjJuLWF97E9KMfO2jZn0Af+pP+qA3hNW
         7IhZHlBPnSEfVwlNE2fCswC859wcf1xHrNjpyYVQjhP8iOV4IHw6hfvIrk/0Q4oGjwil
         NE66t8iS9ab4gTT0DYpHVU4JaNidofYmZR7qxN5knE1NXxgvVYq+8RrzW86++7Ia1CQ0
         cTtfN9vscBIKmUipoG0hRCUENLRp0MjiJeiR3bbjgPWVAJds7ShA3EciFod/a1cm6ysG
         YTgjj8xwd/066ITsYayBtMtG/tp1thoJq6irbQzwHRUd3nJyUHBOLyixUGqJKDuYZ/ls
         DTcQ==
X-Gm-Message-State: AOJu0YzJszSGbBDfxw2tQaqVAaQMA1tSwD70v6Gr1jItVxMUrudpFs+9
	f0KOWbVfRtGIlIovn9BipJ51Nkl1Cj6eYvCMyTHcJa7K7GjBvVqspvcouhDHy1uivm4Dc+N/zJR
	pdWXD
X-Gm-Gg: AR+sD10PWa9odRB9xg9iEzl8OpqtG+3AaaJK10XY4cOarRj3fZYp2oIBmJU4gPHUtuT
	d/O/uUHgnWWFjq7EXihxSlV4dEfXMcKwKAA7TCV9MRgFDbLTIirpe9tE7zAUWlVt3plEMSwBWBR
	eDmBLC66++e/PWmFJC4tM4QqZFbsz0uF5dm/9bjaK/ZpKo/cFKTN9I3eVksqtH2u1bm63ud2/wh
	Eu2TkvUCv0xOJs1X9ierR8VPTOqHuxgtKNiJvsTLelpKSJCo6KDnxsIU+swZ9gYuFmMSoNd+FM4
	ZAgQ3k5gwiGzZ3axOFgkiHO2qz0SkxuV1uUoDIM8Ioo03N0nGj00dkjfMueD3Usa1Lax8OXrr4Y
	/t0wFbWqxi3zMGYuq/DmYFX8oYOqRFbUryCoErMA/7YSKf1EtFFKLgzANpgTqr4Bl73EFCck=
X-Received: by 2002:a05:6a21:62c4:b0:3c0:b3f7:e5e5 with SMTP id adf61e73a8af0-3c3ad65cc12mr21904845637.25.1784687446096;
        Tue, 21 Jul 2026 19:30:46 -0700 (PDT)
Received: from 4104846f2ebf ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147df09ac0sm3062590eec.16.2026.07.21.19.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 19:30:45 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 290aaf24a551d5a0dce037e3fab30820f9113a10
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 22 Jul 2026 02:30:45 -0000
Message-ID: <178468744498.1454.8498349023435372471@4104846f2ebf>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/290aaf24a551d5a0dce037e3fab30820f9113a10/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 290aaf24a551d5a0dce037e3fab30820f9113a10
origin: maestro
test start time: 2026-07-21 17:13:37.473000+00:00

Builds:	   64 ✅    4 ❌    0 ⚠️
Boots: 	  146 ✅    3 ❌    0 ⚠️
Tests: 	22104 ✅ 2067 ❌ 2612 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: kaanapali-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_crypto_1dfa000
      last run: https://d.kernelci.org/test/maestro:6a5fce7275cb84fb217236f0
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.devices-exist
      last run: https://d.kernelci.org/test/maestro:6a5fcb2775cb84fb2171f7d0
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_crypto_1dfa000
      last run: https://d.kernelci.org/test/maestro:6a5fef5875cb84fb2174530e
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000
      last run: https://d.kernelci.org/test/maestro:6a5fef5875cb84fb21745306
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_ae94400
      last run: https://d.kernelci.org/test/maestro:6a5fef5875cb84fb217452ff
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_aec2a00
      last run: https://d.kernelci.org/test/maestro:6a5fef5875cb84fb217452fe
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_9c0000_serial_988000_bluetooth
      last run: https://d.kernelci.org/test/maestro:6a5fef5875cb84fb217452de
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_gpu_3d00000
      last run: https://d.kernelci.org/test/maestro:6a5fef5875cb84fb217452d5
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_20c00000
      last run: https://d.kernelci.org/test/maestro:6a5fef5875cb84fb217452aa
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_26300000
      last run: https://d.kernelci.org/test/maestro:6a5fef5875cb84fb217452a5
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_video-codec_aa00000
      last run: https://d.kernelci.org/test/maestro:6a5fef5775cb84fb21745250
      history:  > ✅  > ✅  > ✅  > ❌  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a5fb5bb75cb84fb2170b490
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.breakpoints
      last run: https://d.kernelci.org/test/maestro:6a5fca6e75cb84fb2171f0ea
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_crypto_1dfa000
      last run: https://d.kernelci.org/test/maestro:6a5fea2375cb84fb21740729
      history:  > ✅  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:6a5fcaaf75cb84fb2171f2f8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: kaanapali-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.breakpoints
      last run: https://d.kernelci.org/test/maestro:6a5fca7375cb84fb2171f10a
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.breakpoints.breakpoints_step_after_suspend_test
      last run: https://d.kernelci.org/test/maestro:6a5fcc4d75cb84fb21720475
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a5fcacf75cb84fb2171f3d7
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6a5fcf3675cb84fb21723b56
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.futex.futex_run_sh_global_requeue_single
      last run: https://d.kernelci.org/test/maestro:6a5fcf3675cb84fb21723b57
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device-error-logs
      last run: https://d.kernelci.org/test/maestro:6a5fcab275cb84fb2171f302
      history:  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pci_1c00000
      last run: https://d.kernelci.org/test/maestro:6a5fef5875cb84fb217452bf
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.futex.futex_run_sh_global_requeue_single
      last run: https://d.kernelci.org/test/maestro:6a5fef9d75cb84fb2174570e
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: sm8750-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a5fcace75cb84fb2171f3d0
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6a5fe71375cb84fb2173cb83
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.futex.futex_run_sh_global_requeue_single
      last run: https://d.kernelci.org/test/maestro:6a5fe71375cb84fb2173cb84
      history:  > ❌  > ❌  > ✅  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device-error-logs
      last run: https://d.kernelci.org/test/maestro:6a5fcab175cb84fb2171f2ff
      history:  > ❌  > ✅  
            
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a5fcacb75cb84fb2171f3bf
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6a5feb0175cb84fb2174209a
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.futex.futex_run_sh_global_requeue_single
      last run: https://d.kernelci.org/test/maestro:6a5feb0175cb84fb2174209b
      history:  > ❌  > ❌  > ❌  > ✅  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a5fb5b875cb84fb2170b467
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:6a601dc275cb84fb21767856
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: kaanapali-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a5fca6275cb84fb2171f091
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_fp-stress
      last run: https://d.kernelci.org/test/maestro:6a5fcb7575cb84fb2171fea5
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_9800000_dsi_9ac0000_panel_0
      last run: https://d.kernelci.org/test/maestro:6a5fce7275cb84fb217236ea
      history:  > ✅  > ✅  > ❌  > ✅  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6a60239275cb84fb2176d3e5
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6a60241175cb84fb2176da6f
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6a60239475cb84fb2176d3f2
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6a6028dd75cb84fb21775cd2
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:6a5fca9f75cb84fb2171f21e
      history:  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_display-controller_ae01000
      last run: https://d.kernelci.org/test/maestro:6a5fef5875cb84fb21745305
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_af54000
      last run: https://d.kernelci.org/test/maestro:6a5fef5875cb84fb21745303
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_dsi_ae94000
      last run: https://d.kernelci.org/test/maestro:6a5fef5875cb84fb21745301
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_ethernet_23040000
      last run: https://d.kernelci.org/test/maestro:6a5fef5875cb84fb217452fb
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_ethernet_23040000_mdio_phy_8
      last run: https://d.kernelci.org/test/maestro:6a5fef5875cb84fb217452f9
      history:  > ⚠️  > ⚠️  > ✅  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_ac0000_i2c_a80000_i2c-mux_70_i2c_0_bridge_58
      last run: https://d.kernelci.org/test/maestro:6a5fef5875cb84fb217452d8
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pci_1c00000_pcie_0_wifi_0
      last run: https://d.kernelci.org/test/maestro:6a5fef5875cb84fb217452bd
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pci_1c10000
      last run: https://d.kernelci.org/test/maestro:6a5fef5875cb84fb217452bc
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_usb_a600000
      last run: https://d.kernelci.org/test/maestro:6a5fef5775cb84fb21745251
      history:  > ✅  > ❌  > ✅  > ✅  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.efivars
      last run: https://d.kernelci.org/test/maestro:6a5fb59675cb84fb2170b303
      history:  > ❌  > ✅  > ❌  > ❌  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a5fca5d75cb84fb2171f073
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.arm64.arm64_fp-stress
      last run: https://d.kernelci.org/test/maestro:6a5fe6ec75cb84fb2173cb0e
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_iommu_3da0000
      last run: https://d.kernelci.org/test/maestro:6a5fea2375cb84fb217406e2
      history:  > ✅  > ❌  > ❌  > ✅  
            

### NEW BUILD ISSUES
- Issue: maestro:09e03f60e36b4243ba595281bf22987cb72d812d | version: 1
  Build: maestro:6a5fae5b75cb84fb21705422
  Comment:  in expansion of macro ‘xfs_log_rtsb’ in fs/xfs/libxfs/xfs_sb.o (fs/xfs/libxfs/xfs_sb.c) [logspec:kbuild,kbuild.compiler.note]
  First seen: 2026-07-21 21:58:25.868388+00:00
  Culprit: code
- Issue: maestro:09e03f60e36b4243ba595281bf22987cb72d812d | version: 1
  Build: maestro:6a5fae6175cb84fb21705480
  Comment:  in expansion of macro ‘xfs_log_rtsb’ in fs/xfs/libxfs/xfs_sb.o (fs/xfs/libxfs/xfs_sb.c) [logspec:kbuild,kbuild.compiler.note]
  First seen: 2026-07-21 21:58:25.868388+00:00
  Culprit: code


This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
