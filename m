Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0632E7623
	for <linux-next@vger.kernel.org>; Fri, 24 Jul 2026 02:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784860223; cv=none; b=VVmNVN70x8NmgFwCEUYHD0GfiQjvzoFqji6NChH0WfhXOhYH3rHIv0wTzd7qzESG41R/Afw74huD4C5JG+6bNMcFh2M0M0e25PctTrsJKuStbMtmfx1yDPdGMTzJD9+ygYjL+zgv9fcxR9GLUbxm009Wi8dYu84+rIWn+vSU7Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784860223; c=relaxed/simple;
	bh=qYK+8FK8o1iauU1H4V8ZIJqdBLxNrTZo5A9Xv1EIdj4=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=EK9U6yllWvoNQIBlp6wyCcaC/lM0fMcwwxaHPHEQGH7Czr82OQe5JK2x5sT2wsDmxs7cAC3z1PKouUKp5X3VP+q0/eFVFkW1z4ItwyDASrBeSjWL6H4u8FEbthrsGP2biba7PdWfmhw9wHq/SjwhDZkyCsQkNxNKVnqgOS4ttTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=IYvXS/nz; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="IYvXS/nz"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso787324a12.1
        for <linux-next@vger.kernel.org>; Thu, 23 Jul 2026 19:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1784860220; x=1785465020; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RgY8lWC655GEm1F5LsGfApbCS1f09yD37dJHCc2Yf2U=;
        b=IYvXS/nzornl0r7CKe7exrNKNNGG7UFDpQSjFuiF7R6Z9j1ZNUFvV7ZELy9N9yKEyT
         xuiFPpKRdAeIUzCfayzy7QLADw/Das8p705aYXFilCeJ8Qy1hRdzK4NYwrFVGjZJPekY
         sAEAsWsFQk271Lwwhnw1UIndJQ0JGcnc3LeHxlSI7Jq9p95v8I2IsL0PXt4LYaiO65mU
         R4etKEjmzZwF6rpniwgwt5JMpjJmVZ5dMlylLD58LNCssQPO4NKHGVWl60G3uNd3CtQz
         ohETgxEbN7DJY4QkEeUCQ5QziQTdrtjEeu8bXpru8yx7oAU3oxJsUgV8svlcUcr0YlZB
         oEMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784860220; x=1785465020;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RgY8lWC655GEm1F5LsGfApbCS1f09yD37dJHCc2Yf2U=;
        b=aF5l5OoR407csWagNUzHBwrsyUPXjxUajcG39i/TCRLvrh9vdyx6OjmWuqxiX57zd+
         pWN4bj/7bVkDiNKUKjIsYIALU7B01FcatkPJce4hPJfayucRvCzprf7JWLau+ZNgfd2i
         TkqxnL4oSHXyB8b9cM85QVHoyW6mdrqIbKaU4ZjkTyQIFTay/1kshStuWFfw6ijXxt7Q
         tclStJdAFcU0pUjyhDE1ONwXxpnh5eM0RBJqQrp9FkVDYCFUdDqyDwhQAUdbNN++7jC9
         R5xlUec/K3h8jAo9MBVX5LmPkdOAtC2T2SNxhUJtVqwG/hwWG3DfCR19wnl7enOv7u4Y
         97WQ==
X-Gm-Message-State: AOJu0YxvUIWgC+m+ZmBhE1778HVeNOqENCvGrUg18AEzS0LEpvaRSaLd
	1LRNMeYqIoFX59Cm0OreHNjW5rOwh/t1Q9ISFP2nIejHBSfIVT/iJPluqzZd4kWyJDgYJFfniN3
	pw7Ho
X-Gm-Gg: AR+sD12crzjVYgbQnu240ojTEQ5p2Ds+ya82r3SOAZj6oefEmM0oup5tVS6Rs8ZUxOy
	UKrpRPpVpD3Aropk0HN8UWvadN4jnYlzHuohG+N6Yf6Cyir3k5RiEGZDxG1ZTOLONYC/m4sLht9
	/J6fyRHAoHtH9e5SGmwL9E+ZZ9ewnvbCYiuGhkFixvW3gXIrE+eBRBuuEuuxolwF2aZOboDeOwh
	KcgELASuS9U2Kt/AQWOxpfCPw4FHLQVf0DUETqjFtKMFWCwy5CIvpZaugOp8Z2AZ8XN0PSbkBEO
	daKmB54Pad9pkN1WyB5DiO5mhG62U+r8JIZyfODu772vB/5DnDiptFYPNfikL06RRoMiQ+5aRmx
	ose1x0Siz+vA9p3bHVe2tIMwix5M8UjkH4E5851GST+cZQL1EPVT4to8pPZXZmp292frKBBk=
X-Received: by 2002:a05:6a21:117:b0:3c4:14a3:fed4 with SMTP id adf61e73a8af0-3c44b21d345mr6322196637.55.1784860219593;
        Thu, 23 Jul 2026 19:30:19 -0700 (PDT)
Received: from 92650adf53de ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147df06864sm24568316eec.15.2026.07.23.19.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 19:30:18 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 9eebf259d5352b87080d67758f483583d9e763d7
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 24 Jul 2026 02:30:18 -0000
Message-ID: <178486021812.332.3280959091842353840@92650adf53de>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/9eebf259d5352b87080d67758f483583d9e763d7/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 9eebf259d5352b87080d67758f483583d9e763d7
origin: maestro
test start time: 2026-07-23 16:24:54.439000+00:00

Builds:	   72 ✅    2 ❌    0 ⚠️
Boots: 	  156 ✅    2 ❌    0 ⚠️
Tests: 	26416 ✅ 2052 ❌ 4606 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: bcm2837-rpi-3-b-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.proc
      last run: https://d.kernelci.org/test/maestro:6a625680798ea6c1ef60ab4f
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.proc.proc_proc-self-map-files-001
      last run: https://d.kernelci.org/test/maestro:6a626653798ea6c1ef617b6b
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.proc.proc_proc-self-map-files-002
      last run: https://d.kernelci.org/test/maestro:6a626653798ea6c1ef617b6a
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:6a62563e798ea6c1ef60a8c4
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_event_spurious_wm8960audio_59
      last run: https://d.kernelci.org/test/maestro:6a625757798ea6c1ef60e4c2
      history:  > ✅  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_event_spurious_wm8960audio_62
      last run: https://d.kernelci.org/test/maestro:6a625757798ea6c1ef60e4d7
      history:  > ✅  > ❌  
            
Hardware: kaanapali-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.proc
      last run: https://d.kernelci.org/test/maestro:6a625687798ea6c1ef60ab73
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.proc.proc_proc-self-map-files-001
      last run: https://d.kernelci.org/test/maestro:6a625ed8798ea6c1ef614846
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.proc.proc_proc-self-map-files-002
      last run: https://d.kernelci.org/test/maestro:6a625ed8798ea6c1ef614845
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: sm8750-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.proc
      last run: https://d.kernelci.org/test/maestro:6a625686798ea6c1ef60ab6e
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.proc.proc_proc-self-map-files-001
      last run: https://d.kernelci.org/test/maestro:6a625b0f798ea6c1ef610828
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.proc.proc_proc-self-map-files-002
      last run: https://d.kernelci.org/test/maestro:6a625b0f798ea6c1ef610827
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a62560e798ea6c1ef60a6d3
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.arm64.arm64_fp-stress
      last run: https://d.kernelci.org/test/maestro:6a626947798ea6c1ef61872f
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.device-error-logs
      last run: https://d.kernelci.org/test/maestro:6a625655798ea6c1ef60a97a
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.proc
      last run: https://d.kernelci.org/test/maestro:6a625688798ea6c1ef60ab7d
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.proc.proc_proc-self-map-files-001
      last run: https://d.kernelci.org/test/maestro:6a626e44798ea6c1ef61e0eb
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.proc.proc_proc-self-map-files-002
      last run: https://d.kernelci.org/test/maestro:6a626e44798ea6c1ef61e0ea
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.proc
      last run: https://d.kernelci.org/test/maestro:6a625683798ea6c1ef60ab5e
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.proc.proc_proc-self-map-files-001
      last run: https://d.kernelci.org/test/maestro:6a625b83798ea6c1ef613313
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.proc.proc_proc-self-map-files-002
      last run: https://d.kernelci.org/test/maestro:6a625b83798ea6c1ef613312
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.clone3
      last run: https://d.kernelci.org/test/maestro:6a625fae798ea6c1ef614957
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.proc
      last run: https://d.kernelci.org/test/maestro:6a625684798ea6c1ef60ab64
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.efivars
      last run: https://d.kernelci.org/test/maestro:6a6248ff75cb84fb218a8935
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_mixer-test_name_wm8960audio_61
      last run: https://d.kernelci.org/test/maestro:6a625757798ea6c1ef60e4d5
      history:  > ❌  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_name_wm8960audio_62
      last run: https://d.kernelci.org/test/maestro:6a625757798ea6c1ef60e4dc
      history:  > ❌  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_name_wm8960audio_63
      last run: https://d.kernelci.org/test/maestro:6a625757798ea6c1ef60e4e3
      history:  > ❌  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_name_wm8960audio_64
      last run: https://d.kernelci.org/test/maestro:6a625757798ea6c1ef60e4ea
      history:  > ❌  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_write_default_wm8960audio_70
      last run: https://d.kernelci.org/test/maestro:6a625757798ea6c1ef60e513
      history:  > ❌  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_write_default_wm8960audio_72
      last run: https://d.kernelci.org/test/maestro:6a625757798ea6c1ef60e521
      history:  > ❌  > ✅  
            
Hardware: kaanapali-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a625679798ea6c1ef60ab06
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6a625e39798ea6c1ef6144b9
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh_global_requeue_single
      last run: https://d.kernelci.org/test/maestro:6a625e39798ea6c1ef6144ba
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
Hardware: meson-gxl-s905x-libretech-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a62567a798ea6c1ef60ab11
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6a6282b5798ea6c1ef62393d
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh_global_requeue_single
      last run: https://d.kernelci.org/test/maestro:6a6282b5798ea6c1ef62393e
      history:  > ❌  > ❌  > ✅  > ✅  
            
Hardware: sm8750-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.breakpoints
      last run: https://d.kernelci.org/test/maestro:6a62561b798ea6c1ef60a744
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.breakpoints.breakpoints_step_after_suspend_test
      last run: https://d.kernelci.org/test/maestro:6a625800798ea6c1ef60f0ae
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a625678798ea6c1ef60aafe
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6a625afb798ea6c1ef6107ac
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh_global_requeue_single
      last run: https://d.kernelci.org/test/maestro:6a625afb798ea6c1ef6107ad
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.breakpoints
      last run: https://d.kernelci.org/test/maestro:6a62561d798ea6c1ef60a753
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.futex.futex_run_sh_global_requeue_single
      last run: https://d.kernelci.org/test/maestro:6a626d2f798ea6c1ef6199bf
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6a625697798ea6c1ef60abd2
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.timers.timers_posix_timers
      last run: https://d.kernelci.org/test/maestro:6a627175798ea6c1ef61e3ec
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_iommu_3da0000
      last run: https://d.kernelci.org/test/maestro:6a625c56798ea6c1ef613748
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a625674798ea6c1ef60aae7
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6a625b46798ea6c1ef6109d2
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh_global_requeue_single
      last run: https://d.kernelci.org/test/maestro:6a625b46798ea6c1ef6109d3
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_ethernet_23040000
      last run: https://d.kernelci.org/test/maestro:6a625e6d798ea6c1ef6145a1
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pci_1c00000
      last run: https://d.kernelci.org/test/maestro:6a625e6d798ea6c1ef614560
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pci_1c00000_pcie_0_wifi_0
      last run: https://d.kernelci.org/test/maestro:6a625e6d798ea6c1ef61455e
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pci_1c10000
      last run: https://d.kernelci.org/test/maestro:6a625e6d798ea6c1ef61455d
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_usb_a600000
      last run: https://d.kernelci.org/test/maestro:6a625e6c798ea6c1ef6144f1
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a625675798ea6c1ef60aaed
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6a625f72798ea6c1ef61491d
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh_global_requeue_single
      last run: https://d.kernelci.org/test/maestro:6a625f72798ea6c1ef61491e
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.ring-buffer
      last run: https://d.kernelci.org/test/maestro:6a62493f75cb84fb218a8ab8
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: bcm2837-rpi-3-b-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:6a625659798ea6c1ef60a992
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:6a625ea6798ea6c1ef614701
      history:  > ✅  > ❌  > ✅  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_mixer-test_write_invalid_wm8960audio_69
      last run: https://d.kernelci.org/test/maestro:6a625757798ea6c1ef60e50a
      history:  > ⚠️  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_write_invalid_wm8960audio_70
      last run: https://d.kernelci.org/test/maestro:6a625757798ea6c1ef60e511
      history:  > ⚠️  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_write_invalid_wm8960audio_71
      last run: https://d.kernelci.org/test/maestro:6a625757798ea6c1ef60e518
      history:  > ⚠️  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_write_invalid_wm8960audio_72
      last run: https://d.kernelci.org/test/maestro:6a625757798ea6c1ef60e51f
      history:  > ⚠️  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_write_valid_wm8960audio_69
      last run: https://d.kernelci.org/test/maestro:6a625757798ea6c1ef60e50b
      history:  > ⚠️  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_write_valid_wm8960audio_70
      last run: https://d.kernelci.org/test/maestro:6a625757798ea6c1ef60e512
      history:  > ⚠️  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_write_valid_wm8960audio_71
      last run: https://d.kernelci.org/test/maestro:6a625757798ea6c1ef60e519
      history:  > ⚠️  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_write_valid_wm8960audio_72
      last run: https://d.kernelci.org/test/maestro:6a625757798ea6c1ef60e520
      history:  > ⚠️  > ✅  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:6a62566f798ea6c1ef60aaae
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
Hardware: kaanapali-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a62560d798ea6c1ef60a6cf
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_fp-stress
      last run: https://d.kernelci.org/test/maestro:6a625750798ea6c1ef60df8c
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_9800000_dsi_9ac0000_panel_0
      last run: https://d.kernelci.org/test/maestro:6a625dbd798ea6c1ef6143be
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6a625243798ea6c1ef60991f
      history:  > ✅  > ❌  > ❌  > ✅  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6a6252cf798ea6c1ef609ae0
      history:  > ✅  > ❌  > ❌  > ✅  > ✅  
            
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6a625245798ea6c1ef609941
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6a625791798ea6c1ef60ee0e
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.devices-probe
      last run: https://d.kernelci.org/test/maestro:6a625703798ea6c1ef60d6ac
      history:  > ❌  > ✅  > ❌  > ❌  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a625608798ea6c1ef60a6be
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.arm64.arm64_fp-stress
      last run: https://d.kernelci.org/test/maestro:6a625755798ea6c1ef60e250
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:6a625646798ea6c1ef60a919
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.device-error-logs
      last run: https://d.kernelci.org/test/maestro:6a62565a798ea6c1ef60a998
      history:  > ❌  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_reboot-mode
      last run: https://d.kernelci.org/test/maestro:6a625c56798ea6c1ef6137a6
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_edp_aea0000
      last run: https://d.kernelci.org/test/maestro:6a625c56798ea6c1ef61377f
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_aec2a00
      last run: https://d.kernelci.org/test/maestro:6a625c56798ea6c1ef61377c
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_9c0000_serial_99c000_bluetooth
      last run: https://d.kernelci.org/test/maestro:6a625c56798ea6c1ef613760
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_phy_88e8000
      last run: https://d.kernelci.org/test/maestro:6a625c56798ea6c1ef61373b
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_adc_3100
      last run: https://d.kernelci.org/test/maestro:6a625c56798ea6c1ef613706
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_adc-tm_3400
      last run: https://d.kernelci.org/test/maestro:6a625c56798ea6c1ef613707
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_nvram_7000
      last run: https://d.kernelci.org/test/maestro:6a625c56798ea6c1ef613704
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_nvram_7100
      last run: https://d.kernelci.org/test/maestro:6a625c56798ea6c1ef613703
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_nvram_7400
      last run: https://d.kernelci.org/test/maestro:6a625c56798ea6c1ef613741
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_nvram_7c00
      last run: https://d.kernelci.org/test/maestro:6a625c56798ea6c1ef613702
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_nvram_7d00
      last run: https://d.kernelci.org/test/maestro:6a625c56798ea6c1ef613701
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_nvram_8400
      last run: https://d.kernelci.org/test/maestro:6a625c56798ea6c1ef613700
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_nvram_8500
      last run: https://d.kernelci.org/test/maestro:6a625c56798ea6c1ef6136ff
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_nvram_8600
      last run: https://d.kernelci.org/test/maestro:6a625c56798ea6c1ef6136fe
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_nvram_9800
      last run: https://d.kernelci.org/test/maestro:6a625c56798ea6c1ef6136fd
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_nvram_9d00
      last run: https://d.kernelci.org/test/maestro:6a625c56798ea6c1ef6136fc
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_pon_1300
      last run: https://d.kernelci.org/test/maestro:6a625c56798ea6c1ef6136fb
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_pon_1300_pwrkey
      last run: https://d.kernelci.org/test/maestro:6a625c56798ea6c1ef6136fa
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_pon_1300_resin
      last run: https://d.kernelci.org/test/maestro:6a625c56798ea6c1ef6136f9
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_0_rtc_6100
      last run: https://d.kernelci.org/test/maestro:6a625c56798ea6c1ef6136f8
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_1_temp-alarm_a00
      last run: https://d.kernelci.org/test/maestro:6a625c56798ea6c1ef6136f5
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_2_pwm
      last run: https://d.kernelci.org/test/maestro:6a625c56798ea6c1ef6136f2
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_2_temp-alarm_a00
      last run: https://d.kernelci.org/test/maestro:6a625c56798ea6c1ef6136f1
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_8_adc_3100
      last run: https://d.kernelci.org/test/maestro:6a625c56798ea6c1ef6136ef
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_spmi_c440000_pmic_8_temp-alarm_2400
      last run: https://d.kernelci.org/test/maestro:6a625c56798ea6c1ef6136ed
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_usb_a600000
      last run: https://d.kernelci.org/test/maestro:6a625c56798ea6c1ef6136cc
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_video-codec_aa00000
      last run: https://d.kernelci.org/test/maestro:6a625c56798ea6c1ef6136cb
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_wcn6750-pmu
      last run: https://d.kernelci.org/test/maestro:6a625c56798ea6c1ef6136c6
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a62492075cb84fb218a8a0b
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:6a625647798ea6c1ef60a91e
      history:  > ❌  > ✅  > ❌  > ❌  > ✅  
            
      - kselftest.device-error-logs
      last run: https://d.kernelci.org/test/maestro:6a62565b798ea6c1ef60a99f
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.devices-exist
      last run: https://d.kernelci.org/test/maestro:6a6256f3798ea6c1ef60d647
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000
      last run: https://d.kernelci.org/test/maestro:6a625e6d798ea6c1ef6145ac
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_display-controller_ae01000
      last run: https://d.kernelci.org/test/maestro:6a625e6d798ea6c1ef6145ab
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_af54000
      last run: https://d.kernelci.org/test/maestro:6a625e6d798ea6c1ef6145a9
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_dsi_ae94000
      last run: https://d.kernelci.org/test/maestro:6a625e6d798ea6c1ef6145a7
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_ae94400
      last run: https://d.kernelci.org/test/maestro:6a625e6d798ea6c1ef6145a5
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_aec2a00
      last run: https://d.kernelci.org/test/maestro:6a625e6d798ea6c1ef6145a4
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_ethernet_23040000_mdio_phy_8
      last run: https://d.kernelci.org/test/maestro:6a625e6d798ea6c1ef61459f
      history:  > ⚠️  > ✅  > ⚠️  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_9c0000_serial_988000_bluetooth
      last run: https://d.kernelci.org/test/maestro:6a625e6d798ea6c1ef614585
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_ac0000_i2c_a80000_i2c-mux_70_i2c_0_bridge_58
      last run: https://d.kernelci.org/test/maestro:6a625e6d798ea6c1ef61457f
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_gpu_3d00000
      last run: https://d.kernelci.org/test/maestro:6a625e6d798ea6c1ef61457c
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_20c00000
      last run: https://d.kernelci.org/test/maestro:6a625e6d798ea6c1ef61454c
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_26300000
      last run: https://d.kernelci.org/test/maestro:6a625e6d798ea6c1ef614547
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_video-codec_aa00000
      last run: https://d.kernelci.org/test/maestro:6a625e6c798ea6c1ef6144f0
      history:  > ✅  > ✅  > ❌  > ✅  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
