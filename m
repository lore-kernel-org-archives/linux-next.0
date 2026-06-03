Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAFE345CD3
	for <linux-next@vger.kernel.org>; Wed,  3 Jun 2026 02:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780453815; cv=none; b=HarQeFCwYL+Li9U1S7Lt98aPMavPKWONChSBpf9EdIsPRINtfmVfawJfm+OKtqgOWkESi3H8VSxX2vtz2V2t+wQdNyTDWxtJixAloQHL/xhw86gEBLUf/AHdnUOblrRufTMsNtOE++tthXlf0FOgVHjc8RBruQBN4DtDckwOfnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780453815; c=relaxed/simple;
	bh=c/b+nTgCVEqjG4yviWRSymKDKOrs+mho4xGE963C/qc=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=tfz8H4UWJCoX3cxOQmPZNJB+hP6maZ7I8BLeknne8XnC4OsqmaBMEkZ90er+yXUwd/uir61MtET7JAmuCJ6arA/lpLRPiMOjpBVuCtxofH+c/z1eJrmzwRRM7jT/omKtpysL2JJ4LS7tuYRziGwUbJqP7voU/sZ0BoATrIPQ0jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=bq5vdF+M; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="bq5vdF+M"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-137f0aa125bso2743027c88.0
        for <linux-next@vger.kernel.org>; Tue, 02 Jun 2026 19:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1780453813; x=1781058613; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V4ABr1SRy5OPP6jbNM0B6VAYMdU1SYJzrKFNc+cRDTs=;
        b=bq5vdF+MgfCJzoA4e2DNEqKF2hNxgR+gXzKlAO9ygDzVzrdFytLXBQOpzAC+Ck0HbG
         xv2ss7rVVpiLX6f3+UA21B2jW24z4EVLVh4/8RU252lMWB6okWBHemZM8c0GDPMA9Ar+
         gZjY+rZf3/yKpvjktkytH0YEqd5+rUogRa4haWDu8sWSKx7gwedeteFHli9YpX7nx8Ai
         Hpt5/Pw6UrHfTbZ/4wjZMYqxDc0nyEhXxZGr/14DRSogU4SKDrFs7fc/LwcwqJBr5D3o
         otEtYmLaGZuKjWzgznDkcOXRxEutjgCLolgt8qfFHo/Ez3+jGmnhB7CHPdwdldhvHtKv
         0OWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780453813; x=1781058613;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V4ABr1SRy5OPP6jbNM0B6VAYMdU1SYJzrKFNc+cRDTs=;
        b=WZLJxXX89GAuxaw3bRhOr9q9055/sy/OXeuhl9uuZ5u6e0/RstTo4XWvrJBw0G1bmk
         6tlDz1UlHyQUNCCuimAXLkKiIKYUGILBroybMdInXvhLUNhynMphDDZuXzbnW6M6HE9M
         QzPiWbGc2mE21Yi4B6V6wt5MgXjwTVA/tEQqpq67LG3d0NtQ8LCA+H3PMrsa/eKZ702h
         s9g08yPcsmZwHAtmRJC1gpxr/0dT/wlNzsUg2BNEqAMTAsNFQm3/hdVa+xwG2SGuUF+P
         qHxS/TIOxDSQErsxq4J3g0MEGV61c1sGkBaC1R9KZEnnFBwTYwWhUNUTnpm70U1bVYhi
         elpw==
X-Gm-Message-State: AOJu0Yy+p9O1hvL7BOLTT2UrUKb+an3qujDNif6PSD/GQHLmg4LbEXd1
	pFVmwJaj7dZIqeglOE/pkZM++Jgi8oiMiA69c8BlSN2Y/VRNj4izamNZBKdgNca5NVkaLYASSnc
	gI0rY
X-Gm-Gg: Acq92OH5sCb3Dx3ZXX2W1yPJ2iwxAghzMcayTozEQC+bNiL592iUYMuB2HeFk9vDgpw
	jBkdPmX1qUN34zcT92vvW9QPJ2dbvM1cr10YBoKg333huenQYcFSRjPI3FmVJIX3gov+M8im+VI
	aiSxceM9fUZTRgiDgs8CmSKQo6e7Kwli7kqevy3JYAToFeW+edCj76fSaaIG/7SiZDj9sRByMBM
	NoCALAPoaKnDosOEACg2m56VqEkF/PDTcrHGlQnwYDxPtuACPdWogvwxt/3j1CfRFabjk9kr1mK
	T0pgJbLEwhm8JdCqBRT3LTQDJXC9iUqdVyr2gNazl2JRyw8BkHgy+II1ihmCL9flWvPfd2c3OWE
	Cyh8Aa189mQJUAnwUT5kIkBapgLMXGgYzBTpdY0hKFsNyXPB3ZrCDet2FxRIG0OublnTe8mkqcN
	D0Rf9lhEXkNwLaCpucVijf7SmGffw=
X-Received: by 2002:a05:7022:f8b:b0:127:33e0:ea44 with SMTP id a92af1059eb24-137f6bd9117mr513959c88.29.1780453812570;
        Tue, 02 Jun 2026 19:30:12 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f554f732sm983729c88.12.2026.06.02.19.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 19:30:12 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - b7bee4ca5688e30ca50fbc87b1b8f7eed7006c17
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 03 Jun 2026 02:30:11 -0000
Message-ID: <178045381161.9506.10215697161480030682@330cfa3079ca>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/b7bee4ca5688e30ca50fbc87b1b8f7eed7006c17/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: b7bee4ca5688e30ca50fbc87b1b8f7eed7006c17
origin: maestro
test start time: 2026-06-02 17:19:18.315000+00:00

Builds:	   58 ✅    1 ❌    0 ⚠️
Boots: 	  158 ✅    9 ❌    5 ⚠️
Tests: 	17976 ✅ 3158 ❌ 3504 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: bcm2837-rpi-3-b-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:6a1f1ff92cc72b6e94b4a3ec
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:6a1f2b8c2cc72b6e94b51e59
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: asus-CX3402CVA-brya
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kernelci_sleep
      last run: https://d.kernelci.org/test/maestro:6a1f32372cc72b6e94b576b0
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kernelci_sleep.rtcwake-freeze-1
      last run: https://d.kernelci.org/test/maestro:6a1f340d2cc72b6e94b5aec7
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kernelci_sleep.rtcwake-freeze-10
      last run: https://d.kernelci.org/test/maestro:6a1f340d2cc72b6e94b5aebe
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kernelci_sleep.rtcwake-freeze-2
      last run: https://d.kernelci.org/test/maestro:6a1f340d2cc72b6e94b5aec6
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kernelci_sleep.rtcwake-freeze-3
      last run: https://d.kernelci.org/test/maestro:6a1f340d2cc72b6e94b5aec5
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kernelci_sleep.rtcwake-freeze-4
      last run: https://d.kernelci.org/test/maestro:6a1f340d2cc72b6e94b5aec4
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kernelci_sleep.rtcwake-freeze-5
      last run: https://d.kernelci.org/test/maestro:6a1f340d2cc72b6e94b5aec3
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kernelci_sleep.rtcwake-freeze-6
      last run: https://d.kernelci.org/test/maestro:6a1f340d2cc72b6e94b5aec2
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kernelci_sleep.rtcwake-freeze-7
      last run: https://d.kernelci.org/test/maestro:6a1f340d2cc72b6e94b5aec1
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kernelci_sleep.rtcwake-freeze-8
      last run: https://d.kernelci.org/test/maestro:6a1f340d2cc72b6e94b5aec0
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kernelci_sleep.rtcwake-freeze-9
      last run: https://d.kernelci.org/test/maestro:6a1f340d2cc72b6e94b5aebf
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kernelci_sleep.rtcwake-mem-1
      last run: https://d.kernelci.org/test/maestro:6a1f340d2cc72b6e94b5aed1
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kernelci_sleep.rtcwake-mem-10
      last run: https://d.kernelci.org/test/maestro:6a1f340d2cc72b6e94b5aec8
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kernelci_sleep.rtcwake-mem-2
      last run: https://d.kernelci.org/test/maestro:6a1f340d2cc72b6e94b5aed0
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kernelci_sleep.rtcwake-mem-3
      last run: https://d.kernelci.org/test/maestro:6a1f340d2cc72b6e94b5aecf
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kernelci_sleep.rtcwake-mem-4
      last run: https://d.kernelci.org/test/maestro:6a1f340d2cc72b6e94b5aece
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kernelci_sleep.rtcwake-mem-5
      last run: https://d.kernelci.org/test/maestro:6a1f340d2cc72b6e94b5aecd
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kernelci_sleep.rtcwake-mem-6
      last run: https://d.kernelci.org/test/maestro:6a1f340d2cc72b6e94b5aecc
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kernelci_sleep.rtcwake-mem-7
      last run: https://d.kernelci.org/test/maestro:6a1f340d2cc72b6e94b5aecb
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kernelci_sleep.rtcwake-mem-8
      last run: https://d.kernelci.org/test/maestro:6a1f340d2cc72b6e94b5aeca
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kernelci_sleep.rtcwake-mem-9
      last run: https://d.kernelci.org/test/maestro:6a1f340d2cc72b6e94b5aec9
      history:  > ✅  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: meson-gxl-s905x-libretech-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.clone3
      last run: https://d.kernelci.org/test/maestro:6a1f1ff42cc72b6e94b4a3de
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.clone3.clone3_clone3_cap_checkpoint_restore
      last run: https://d.kernelci.org/test/maestro:6a1f301b2cc72b6e94b5677f
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.clone3.clone3_clone3_cap_checkpoint_restore_global_clone3_cap_checkpoint_restore
      last run: https://d.kernelci.org/test/maestro:6a1f301b2cc72b6e94b56780
      history:  > ❌  > ❌  > ✅  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_17030000
      last run: https://d.kernelci.org/test/maestro:6a1f28d82cc72b6e94b4d2a3
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_vcodec_17020000
      last run: https://d.kernelci.org/test/maestro:6a1f28d82cc72b6e94b4d259
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_16020000
      last run: https://d.kernelci.org/test/maestro:6a1f28d82cc72b6e94b4d258
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a1f1f1f2cc72b6e94b4a1c5
      history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a1f16fa2cc72b6e94b471c4
      history:  > ✅  > ⚠️  > ✅  > ⚠️  > ✅  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a1f172f2cc72b6e94b471fa
      history:  > ✅  > ⚠️  > ✅  > ⚠️  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:6a1f1f4a2cc72b6e94b4a293
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.alsa.alsa_pcm-test
      last run: https://d.kernelci.org/test/maestro:6a1f23072cc72b6e94b4a9b2
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:6a1f25752cc72b6e94b4bbfc
      history:  > ❌  > ✅  > ❌  > ❌  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6a1f47482cc72b6e94b68292
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6a1f47bc2cc72b6e94b68486
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
Hardware: qemu-x86_64
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a1f32322cc72b6e94b576a7
      history:  > ⚠️  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rtla-osnoise
      last run: https://d.kernelci.org/test/maestro:6a1f475e2cc72b6e94b682f4
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_backlight_lcd0
      last run: https://d.kernelci.org/test/maestro:6a1f28d82cc72b6e94b4d2f3
      history:  > ❌  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller0_14001000
      last run: https://d.kernelci.org/test/maestro:6a1f28d82cc72b6e94b4d2ba
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58_aux-bus_panel
      last run: https://d.kernelci.org/test/maestro:6a1f28d82cc72b6e94b4d2ae
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14008000
      last run: https://d.kernelci.org/test/maestro:6a1f28d82cc72b6e94b4d292
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14009000
      last run: https://d.kernelci.org/test/maestro:6a1f28d82cc72b6e94b4d291
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_1400a000
      last run: https://d.kernelci.org/test/maestro:6a1f28d82cc72b6e94b4d290
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400b000
      last run: https://d.kernelci.org/test/maestro:6a1f28d82cc72b6e94b4d285
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400c000
      last run: https://d.kernelci.org/test/maestro:6a1f28d82cc72b6e94b4d284
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
