Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5DA280037
	for <linux-next@vger.kernel.org>; Tue,  3 Mar 2026 02:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772505053; cv=none; b=spWktGjrA3A9Hf31jL0V0Pz4mQ8TNKj5QkWIMxFAqwKz54V2QRrli1pURd1Vu6JjrdO7xkKnZwYNrL/4jO/7R8/Sp5vZsfogy2uEX/HJFxER5mVSWG5q3ltBchSK7Ps+U0HLGng5QFi8Phlqi4v77FmEM4TGgQq+YmjDzKtvtzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772505053; c=relaxed/simple;
	bh=wzUhFRQMVmMtFLazlsPkjLgXx1Vt6DJDFoImtk4KJb0=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=MF1Nze07P7B5MypXcfDjsj6P557X9ZqzDU5DW3MaGocXCugJTN0vkQAQCZdt1P6nwdlMfKE1AdBpXUlvjqJwh/fFZCfKC0/8CC5QH3kKKFN9EmN7m1oYbvobsEm0Qv+lpeFoaidr7SQUx4S6wRxrpgaFNvswTRmCz2Y5XXWDdCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=14FTi1uS; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="14FTi1uS"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2b6b0500e06so6210694eec.1
        for <linux-next@vger.kernel.org>; Mon, 02 Mar 2026 18:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1772505051; x=1773109851; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+RqdO3GhHFHqGnOjZ3fHsjhrQyJNaCj5t4YsJtDCTKM=;
        b=14FTi1uSEVB8P7Pxyr8kKgtE1YL3kyz54/S0xFYWA5y27hXB47DKBEowh5rmL/Leev
         MoMZhW5tVs6IP8usIuEqZmQiS10TvJ79eh1um25adMa1ZQn8MqV6xoBn3lB4Wel6udTi
         riTz1HBlQqQ/PaZVXZD2t1tkNCCLATVFlIXDP0NIrlt1AB6f9ivLIbt24+QXl6LdAyvl
         +xvaStnPVVB2h1a/t1y42ZRcY2vM/7ivVdqEy0LZzt+p76l1OuhowS0SrA8POzqmUxzE
         BSevKIkyHuetE+bbJBl2P5hbxcolOC1ddAhWrCs5zgPav3lAe6/BvOH3kbxyytsGa2D6
         FTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772505051; x=1773109851;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+RqdO3GhHFHqGnOjZ3fHsjhrQyJNaCj5t4YsJtDCTKM=;
        b=O7omjGNmWImFcEkfMiEPXSq5mAMzSL8QSNf/rFYos4EhbRtN7PM4WZPtgHSv9xmZTC
         NlgFCjQX05//78LJu0qecfwuizz2Do4PSJyGt8MeZxtmcXxYXj8AIDNotfD1OzzUHgvh
         E4YwxDL3aOnOWX9n5PsRLO3OprmVokU2mvxGpeuuB2YQPYnbRyxE7qcd0Dup5eovO9xJ
         6AYDWSGIDbrZMM68KTDHWVFj5Bnr4/9Bri4++JiG35gvNnSy5UQb24MH1WWdZXJgs2Kr
         l6tyquctVNw+/C+x66ifpcwWtd+eJyWFzyf3auTjEE1fxHN6J6051350bk2eoLh9i8m2
         ytYA==
X-Gm-Message-State: AOJu0Ywr5uBrOELwfgGKC9DMKWbAeENrhwJHumALUpoafsRWNI5kuVc2
	Y6ABU6iZMCYdG+kwB6kCm4r+jNJFlUPNYvtS6ceONVx0dSQAQLZfIcD2/BRBb1c9y9We7/x1n8m
	ub3bh
X-Gm-Gg: ATEYQzxyv6IUHL+A06MGL09m19hPkdUQFN1O1tyE82NdfYdHm8DDupr3ujTaOsqOXSK
	7EJ4hYt2xBvlG1vLTFMkN4XImLNP3GrH1/6wpiVae+5XUjkJH8K456wMZkvHmV/f4c+3JKgwRtH
	AfCY9b5/Hp6sneeTmM7RwZcQYJf5og9fa9QyRktx/PtTTNPLfSiqviSWeWgUrcBFSP/Ibtg5uK2
	OkId/IyQV0656G2a/I2jU+GgfeTvDL/ywKYlT+9he3IPXQizdeF4RFmNijLG2sWTLXOgnfwBrV/
	lxhU18OtwgxXVF/cF0y30W1azgQS5XD2sjlQoLtI4d9ecZYJIhfluBAF7keeDENQzcMO2HYEoj3
	EM1+78/9H+ciFfC/c4+cUsY5JMHed5VvRj8q8fDFrt8XPEp3nROReP3QBwo9SgN4ROJ1+z/y4ww
	l3BXA2tWXUCm/SpWtG
X-Received: by 2002:a05:7301:4195:b0:2b7:4157:9afc with SMTP id 5a478bee46e88-2bde1d6f3d0mr5925942eec.19.1772505050739;
        Mon, 02 Mar 2026 18:30:50 -0800 (PST)
Received: from c9e0f4cb7c74 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bded67cce6sm9645266eec.6.2026.03.02.18.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 18:30:50 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - d517cb8cea012f43b069617fc8179b45404f8018
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 03 Mar 2026 02:30:49 -0000
Message-ID: <177250504953.201.3866640938640386325@c9e0f4cb7c74>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/d517cb8cea012f43b069617fc8179b45404f8018/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: d517cb8cea012f43b069617fc8179b45404f8018
origin: maestro
test start time: 2026-03-02 15:27:08.680000+00:00

Builds:	   57 ✅    0 ❌    0 ⚠️
Boots: 	  174 ✅    8 ❌    0 ⚠️
Tests: 	12820 ✅ 1971 ❌ 3811 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: beaglebone-black
  > Config: multi_v7_defconfig+kselftest
    - Architecture/compiler: arm/gcc-14
      - kselftest.uevent
      last run: https://d.kernelci.org/test/maestro:69a5b4317136242fe3914f2b
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.uevent.uevent_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:69a60d267136242fe394ab94
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.uevent.uevent_uevent_filtering_global_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:69a60d267136242fe394ab95
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_pruss_30040000_interrupt-controller_20000
      last run: https://d.kernelci.org/test/maestro:69a613437136242fe394d1b5
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_pruss_30040000_pru_34000
      last run: https://d.kernelci.org/test/maestro:69a613437136242fe394d1b4
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_pruss_30040000_pru_38000
      last run: https://d.kernelci.org/test/maestro:69a613437136242fe394d1b3
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+arm64-chromebook+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:69a5b9a77136242fe39173a1
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:69a5ba727136242fe39174a0
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_h265.validate-fluster-results
      last run: https://d.kernelci.org/test/maestro:69a5dafd7136242fe3928dc4
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.sigwaittest
      last run: https://d.kernelci.org/test/maestro:69a5c3c17136242fe391bf53
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: qcs9100-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:69a5e7bf7136242fe39301bc
      history:  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_22
      last run: https://d.kernelci.org/test/maestro:69a5bf737136242fe39192fb
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_22
      last run: https://d.kernelci.org/test/maestro:69a5bf617136242fe39190f8
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_gpu_fd00000
      last run: https://d.kernelci.org/test/maestro:69a613437136242fe394d1cc
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.cpufreq.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:69a5d1c47136242fe3923539
      history:  > ❌  > ✅  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_h264.validate-fluster-results
      last run: https://d.kernelci.org/test/maestro:69a5dac47136242fe3928a1b
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: monaco-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:69a5c0af7136242fe39197a7
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:69a5c0e07136242fe39198e0
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:69a5c0f67136242fe391991a
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.cpufreq
      last run: https://d.kernelci.org/test/maestro:69a5c0dc7136242fe39198d0
      history:  > ✅  > ❌  > ✅  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.validate-fluster-results
      last run: https://d.kernelci.org/test/maestro:69a5dae27136242fe3928c5f
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_mt8195-sound
      last run: https://d.kernelci.org/test/maestro:69a5da4e7136242fe3927d5c
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c104000
      last run: https://d.kernelci.org/test/maestro:69a5da4e7136242fe3927cfb
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c105000
      last run: https://d.kernelci.org/test/maestro:69a5da4e7136242fe3927cfa
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c106000
      last run: https://d.kernelci.org/test/maestro:69a5da4e7136242fe3927cf9
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c107000
      last run: https://d.kernelci.org/test/maestro:69a5da4e7136242fe3927cf8
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c108000
      last run: https://d.kernelci.org/test/maestro:69a5da4e7136242fe3927cf7
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c109000
      last run: https://d.kernelci.org/test/maestro:69a5da4e7136242fe3927cf6
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c10a000
      last run: https://d.kernelci.org/test/maestro:69a5da4e7136242fe3927cf5
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c10b000
      last run: https://d.kernelci.org/test/maestro:69a5da4e7136242fe3927cf4
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dp-intf_1c015000
      last run: https://d.kernelci.org/test/maestro:69a5da4e7136242fe3927cf3
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dp-intf_1c113000
      last run: https://d.kernelci.org/test/maestro:69a5da4e7136242fe3927cf2
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dp-tx_1c600000
      last run: https://d.kernelci.org/test/maestro:69a5da4e7136242fe3927cf1
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_edp-tx_1c500000
      last run: https://d.kernelci.org/test/maestro:69a5da4e7136242fe3927cee
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_edp-tx_1c500000_aux-bus_panel
      last run: https://d.kernelci.org/test/maestro:69a5da4e7136242fe3927ced
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_hdr-engine_1c114000
      last run: https://d.kernelci.org/test/maestro:69a5da4e7136242fe3927ce9
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000
      last run: https://d.kernelci.org/test/maestro:69a5da4e7136242fe3927cd8
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_0_0
      last run: https://d.kernelci.org/test/maestro:69a5da4e7136242fe3927cd7
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_0_10000
      last run: https://d.kernelci.org/test/maestro:69a5da4e7136242fe3927cd6
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_1_0
      last run: https://d.kernelci.org/test/maestro:69a5da4e7136242fe3927cd5
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000
      last run: https://d.kernelci.org/test/maestro:69a5da4e7136242fe3927cd4
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000_jpgenc_0_0
      last run: https://d.kernelci.org/test/maestro:69a5da4e7136242fe3927cd3
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000_jpgenc_1_0
      last run: https://d.kernelci.org/test/maestro:69a5da4e7136242fe3927cd2
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_1c000000
      last run: https://d.kernelci.org/test/maestro:69a5da4e7136242fe3927ca9
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1c002000
      last run: https://d.kernelci.org/test/maestro:69a5da4e7136242fe3927c9f
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000
      last run: https://d.kernelci.org/test/maestro:69a5da4e7136242fe3927c7b
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_10000
      last run: https://d.kernelci.org/test/maestro:69a5da4e7136242fe3927c7a
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_2000
      last run: https://d.kernelci.org/test/maestro:69a5da4e7136242fe3927c79
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_25000
      last run: https://d.kernelci.org/test/maestro:69a5da4e7136242fe3927c78
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_1a020000
      last run: https://d.kernelci.org/test/maestro:69a5da4e7136242fe3927c77
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:69a5c0aa7136242fe3919791
      history:  > ❌  > ✅  > ❌  > ❌  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
