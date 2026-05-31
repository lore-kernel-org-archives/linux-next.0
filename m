Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6979188596
	for <linux-next@vger.kernel.org>; Sun, 31 May 2026 02:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780194636; cv=none; b=gOkm7Bhyk7oUUViaFLYgzlJzICxmxttEIMVNitygbMTA5WIquITyukqlYgCdrhbmTGKKczrGkcUDViFkoo5pcQiYpNELau9Nco1Oml4ZrRunB3p7iao2qfOQGd9TqvGL3Clq8/Vl0Ihmha0JpY/qpi9TWoUvtTIxNSoaLo0S9UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780194636; c=relaxed/simple;
	bh=UZ5dEyaDDsCEGA05ZqCPccCx5UQA3chvEYPjVTFOfs4=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=BMaOA4uS/jtJ8g7s7xCyFwyXfJ7kVJWwZ0HSU7xDTU5FNGNGdEc5NU6Q2LqttX+WIGVwKKsdBUP/Vm4Et4QGc2BC4MnzyNoPdIsMqDCJ5GBMFbQ/fgQC5/ik8nwp4X0ru2lgx6eITl+V/ntkuMwLx7V0F94kUJb/h/cQdYV1e6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=S8P/oMFc; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="S8P/oMFc"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-304ec41197bso1880481eec.1
        for <linux-next@vger.kernel.org>; Sat, 30 May 2026 19:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1780194634; x=1780799434; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oWIX60zipnJrb5unCN3qy788FIDlqXxzH0v3YCg+Dsk=;
        b=S8P/oMFczz0sGgHJ42olsGoNN1oZT1rhSwuywnD8JxjReI5Lhd++VVOdZUFq9fTOMw
         CJM39aqgc84RcI8E2al3yljsSnYI53fIysivalBqA/dOlFc0fGuI79zEMQtXWsc4Upzn
         k6SzS9gnyoPgZdQAHZ8gus1BFba7V1jMjM5V2uHjjVpP8RCH8KsNtAF+fBkvGlu9k6VI
         Ldunnga4ZCF0qtQiuejylMVdddmjSKtphwUPLD2HlTn+9Iq3eB/N/tq0ftPXpJ6Mlvjx
         Fjj8jpaEl1F2njQlMwMcOrv1QSfuNtvp62Bt3qVLZQPFMaHDAKA2ccXi3FOpNsVeWdKt
         UK2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780194634; x=1780799434;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oWIX60zipnJrb5unCN3qy788FIDlqXxzH0v3YCg+Dsk=;
        b=NELbnbO1rkXdh+HTrIgRCtnBD64xapcaeHvW/W8Ycq0/8CnDQ11PtBqtPYLPy3SRs3
         JuXMvCsdXSSsum6OSh3ajJuHS4RcoreOcfumeSod08dNxEoxgiG7P5+BNW0whOg2Bsji
         td8KBs/+pUAVyUpifvBSv1vI8Cbebk4q9hff3t9rr3QcUDog+v7FyFiExw2ltB4kEUMg
         6YZi4UFLBpgoqVWEXKZmg63f64o/mP0p0ilc+oTDB1bo1YjVi/IrFgbDsO6G9Lp0B3Mt
         UcsWhmXPmTeKfOjcOgvy0i/xVxMY9l4x0wBkGHrACyc1LjwHetU17Sxh03bHTWWPvINp
         Fnfw==
X-Gm-Message-State: AOJu0YyG+BsZ36rCNm5G49XuuwWSVACMVtfUvCJmgtyiA6H1yddeY+tM
	HQBR/dHyka2S3m7ZUhz9Gc6GZ1Jd6zZT0iA1fMgtu4r0QeqrR9EmlJAa5JcHYK0Ho/E=
X-Gm-Gg: Acq92OFmD/GR8UbFIB21Ah+5k04Di9EWqV4g6isj919h5ZZp08guY5AZ6ppo4M/ryjG
	Iz7DQA8/Rid5p05Jg53saNv+IBUfw1viDQbDPuDhPbE0tfi5wrYWW4ZA5uY0x8ZwvIuQr1zQ/ix
	MkmZH8l0IpbiYNqh7wES2XFKb4kAi4veNJd1/vBN5SEC6xVvJUe47bDymYmWT7/OZBEAYeGISft
	Rc+cawc3OHOoar5tbFNsbTdMuh5CHBdVYKR0tbC0UId8aR9lBZWWy8AAOSvtWA5YNpnSU/pIfCc
	ERi5LtFV8kUvrXqPIgOyHP5QHC197oW+bdQfJwJJcQi/Z1Letk5qLZgyXjDejy5aRHM/vUABuRD
	Czvbdmk6YGAfChwFRUF6KD1ZuVAcZXrhVeetm9re8I/7a6mmMsq4pxV0slqOa1FF0QkoZKCzfwb
	Sg03y0JwGZvAyhfabB026/zIqcKoI=
X-Received: by 2002:a05:7300:80c9:b0:2e0:1f09:d924 with SMTP id 5a478bee46e88-304fa526036mr2912355eec.5.1780194633874;
        Sat, 30 May 2026 19:30:33 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed2bdda4sm4865280eec.2.2026.05.30.19.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 19:30:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 7da7f07112610a520567421dd2ffcb51beaefbcc
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sun, 31 May 2026 02:30:33 -0000
Message-ID: <178019463278.8123.12502111798890151071@330cfa3079ca>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/7da7f07112610a520567421dd2ffcb51beaefbcc/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 7da7f07112610a520567421dd2ffcb51beaefbcc
origin: maestro
test start time: 2026-05-30 00:23:33.367000+00:00

Builds:	   58 ✅    1 ❌    0 ⚠️
Boots: 	  136 ✅   52 ❌    6 ⚠️
Tests: 	20480 ✅ 4154 ❌ 4573 ⚠️

### POSSIBLE REGRESSIONS

  No possible regressions observed.


### FIXED REGRESSIONS
    
Hardware: cd8180-orion-o6
  > Config: defconfig+netdev+nfs-root-boot+kselftest
    - Architecture/compiler: arm64/gcc-14
      - ltp
      last run: https://d.kernelci.org/test/maestro:6a1a4752ee38c2a863ef0bbf
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:6a1a3839ee38c2a863ed9d45
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.alsa.alsa_pcm-test
      last run: https://d.kernelci.org/test/maestro:6a1a3c66ee38c2a863ee546b
      history:  > ❌  > ✅  > ✅  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_backlight_lcd0
      last run: https://d.kernelci.org/test/maestro:6a1a3c2dee38c2a863ee4baf
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller0_14001000
      last run: https://d.kernelci.org/test/maestro:6a1a3c2dee38c2a863ee4b3d
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58_aux-bus_panel
      last run: https://d.kernelci.org/test/maestro:6a1a3c2dee38c2a863ee4b25
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_17030000
      last run: https://d.kernelci.org/test/maestro:6a1a3c2dee38c2a863ee4b0f
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14008000
      last run: https://d.kernelci.org/test/maestro:6a1a3c2dee38c2a863ee4af4
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14009000
      last run: https://d.kernelci.org/test/maestro:6a1a3c2dee38c2a863ee4af2
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_1400a000
      last run: https://d.kernelci.org/test/maestro:6a1a3c2dee38c2a863ee4af0
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400b000
      last run: https://d.kernelci.org/test/maestro:6a1a3c2dee38c2a863ee4ae4
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400c000
      last run: https://d.kernelci.org/test/maestro:6a1a3c2dee38c2a863ee4ae3
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_vcodec_17020000
      last run: https://d.kernelci.org/test/maestro:6a1a3c2dee38c2a863ee4ab8
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_16020000
      last run: https://d.kernelci.org/test/maestro:6a1a3c2dee38c2a863ee4ab7
      history:  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: aws-ec2-arm64
  > Config: defconfig+aws-ec2
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a1a40afee38c2a863ee8cd9
      history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: aws-ec2-x86_64
  > Config: x86_64_defconfig+aws-ec2
    - Architecture/compiler: x86_64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a1a3317ee38c2a863ed6215
      history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a1a3833ee38c2a863ed9b3f
      history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a1a434dee38c2a863ee9884
      history:  > ⚠️  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: exynos850-e850-96
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a1a37e3ee38c2a863ed9997
      history:  > ⚠️  > ⚠️  > ✅  > ✅  > ✅  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a1a4351ee38c2a863ee993f
      history:  > ⚠️  > ✅  > ⚠️  > ⚠️  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:6a1a3eccee38c2a863ee808c
      history:  > ✅  > ✅  > ❌  > ✅  
            
Hardware: qemu-x86_64
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a1a3a60ee38c2a863eddf2d
      history:  > ⚠️  > ✅  > ✅  > ⚠️  > ✅  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
