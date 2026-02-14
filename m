Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0C225776
	for <linux-next@vger.kernel.org>; Sat, 14 Feb 2026 02:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771036254; cv=none; b=J/6wHRPLeRJGMa+ysZ/MRaTP2CcFd58rzqgizI5HyODVD2jUcz2Vns5dgk5+P/n/bofn6czpTzGMK1XARha0dUpVXFqaOtzASXDOxdRhDdMoqWbq9AyLWbRUxmb8OxzssnetkSFl0TO/VyNtVUSnI8kw4N/48EgmB23vRVCvf44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771036254; c=relaxed/simple;
	bh=bwY5rKNvVo6rJcWFVcDUhonCqLAg1xvVQoLVPUupYhY=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=m/ORBZQ1ky7GJxIct1ojrJumFgUtKPFT/sUM4UTaLMrtiTp81zIAU/HnXqIc74KWOy6Ph2yPeOlxheWMKsSQZqCHZWR31hA8B4qGL2rNHiUxRcCUwXHpBMNdD28SZBCLUDNR/z9ytEOoQCgcm4kVooDgH5NLq0wPifC59nDbTFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=0BXV2D7L; arc=none smtp.client-ip=74.125.82.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="0BXV2D7L"
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-2b86ce04c5cso3038389eec.1
        for <linux-next@vger.kernel.org>; Fri, 13 Feb 2026 18:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1771036252; x=1771641052; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XDam/SnGy24fc7/hl4E8R+177EvN78exM7KtWj6KFk4=;
        b=0BXV2D7LgucZj3uSpQc/McqWCrYNtfjss0v2dEypYzXhu6H4VqiUm7vPI6ZCEtlMaF
         uRnyLQh+JQxa7Gekid+jnlg1uIXazAGQNtSh9YyPxXB0VbdzrB3NYdQQHQOd8Xbj1HuD
         ctn6Ei1neKNnl94VVtRMqWuxKJS6SEAbYjV/Zm0P/2jKHPZvmJn+7xr7w39XGsYBRpdZ
         PJudcsje7W/aUb22N6vZuYDMi72CnwZz7IR4yz4oU1Ht9y3kjCPhWOvUQP2QZvHYX/Ge
         l/RRGliQDoFoVfjwqPVTD0ImwmJTJ9v6/E6dIJT+GIjXivxyT1VM5cdt1yR4ZRTHGvPt
         HtTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771036252; x=1771641052;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XDam/SnGy24fc7/hl4E8R+177EvN78exM7KtWj6KFk4=;
        b=bIMORY+eGUamspEx3brEoUnDf+W8ZWumrOGJapkY5bbOGamRMRvzqaiCbl3KUSBPu1
         mcLwtt8LPGhymf7f9PoOGSaNr4EeXVkewc62ZobQoIrYYqIgF7IDXxSZz9S4Lf3rZXER
         +gURULEZpCIEd0yv/+hMrGj9oswqZBZpHSs9cL8mIvBdq1F0uAZ6XdOmc8VZiu7wSb+Q
         MPe2Dn8JgkN+9h/WKygW6t7dkGpG7vLLK59vheo/0ppFiu8za66ZSeJUp6+ePXIhYjBR
         eeoTSBbKWx49dbc1aEGavCODw3ZCV71fma+k60lklUAcmzkEhgoz/fFB/eTAJwZEVLyI
         j4fA==
X-Gm-Message-State: AOJu0Yx9NqEh1tUbXgwUyu06O5Sm9Q89f5OhYkNszibZF1aK5p3wfhU1
	MuIhD8VQrDsjbvrYicWA3k0tnoSB4iaZOcA5ue7Tn35ePFkyBO0GqcFdkt85XoTTIlQ=
X-Gm-Gg: AZuq6aKlr1B6DsMalVsHZm2pVGBr8gBY9YqbFjxhTkFlbNIOq4duWDU6mzxqxLrvz8V
	k4fvoLHycGqTjVMVyjd9tinyetdhyGpnnb0cyi05ET7NLSJEel+s85ILjBJz57B8ReCT0zlxvb6
	gbVg8oAbWYjofxwRxy+asLdAW3vB5KO3NqM6utZlXsAEDLTIEytqqMz/w0SM/lSLY6xb2nHqJ25
	F0PDZstwVFHfN1zzQFVb6ECoWuzMRoXjm+kSjCzX/IDGEwKdUBbVPVvm+ses+LeFQ6B2qJtfTmQ
	YdPdKqmfBUECXdacksGZ0KNnGHd0oqVJuKJR8LoVhuMsEULoKa1CJ5OBgaOVdTXbiIrPDM4vQiL
	m4kVFVo/d/En/xxtd1A2ca571cGnoiqLnu8TkIKFKWVJIC3elRFhVVb1WOSjhsu+6n0cR5Vahn0
	YvXaYsmclg3RQKPnzR
X-Received: by 2002:a05:7300:3215:b0:2b9:dde1:33e0 with SMTP id 5a478bee46e88-2babc3aae22mr1650452eec.2.1771036251500;
        Fri, 13 Feb 2026 18:30:51 -0800 (PST)
Received: from f55b40a4666e ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb543e8dsm575221eec.5.2026.02.13.18.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 18:30:50 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 635c467cc14ebdffab3f77610217c1dacaf88e8c
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sat, 14 Feb 2026 02:30:50 -0000
Message-ID: <177103625044.1550.8218019583326550337@f55b40a4666e>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/635c467cc14ebdffab3f77610217c1dacaf88e8c/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 635c467cc14ebdffab3f77610217c1dacaf88e8c
origin: maestro
test start time: 2026-02-13 17:55:35.849000+00:00

Builds:	   55 ✅    0 ❌    0 ⚠️
Boots: 	  111 ✅    0 ❌    0 ⚠️
Tests: 	14255 ✅ 1950 ❌ 3142 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:698f97b8a1ae387ffbd6c26f
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_mt8195-sound
      last run: https://d.kernelci.org/test/maestro:698f800aa1ae387ffbd6377d
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f08000
      last run: https://d.kernelci.org/test/maestro:698f800aa1ae387ffbd63721
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f09000
      last run: https://d.kernelci.org/test/maestro:698f800aa1ae387ffbd63720
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f0a000
      last run: https://d.kernelci.org/test/maestro:698f800aa1ae387ffbd6371f
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f23000
      last run: https://d.kernelci.org/test/maestro:698f800aa1ae387ffbd6371e
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f24000
      last run: https://d.kernelci.org/test/maestro:698f800aa1ae387ffbd6371d
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f25000
      last run: https://d.kernelci.org/test/maestro:698f800aa1ae387ffbd6371c
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c104000
      last run: https://d.kernelci.org/test/maestro:698f800aa1ae387ffbd6371b
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c105000
      last run: https://d.kernelci.org/test/maestro:698f800aa1ae387ffbd6371a
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c106000
      last run: https://d.kernelci.org/test/maestro:698f800aa1ae387ffbd63719
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c107000
      last run: https://d.kernelci.org/test/maestro:698f800aa1ae387ffbd63718
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c108000
      last run: https://d.kernelci.org/test/maestro:698f800aa1ae387ffbd63717
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c109000
      last run: https://d.kernelci.org/test/maestro:698f800aa1ae387ffbd63716
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c10a000
      last run: https://d.kernelci.org/test/maestro:698f800aa1ae387ffbd63715
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c10b000
      last run: https://d.kernelci.org/test/maestro:698f800aa1ae387ffbd63714
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dp-intf_1c015000
      last run: https://d.kernelci.org/test/maestro:698f800aa1ae387ffbd63713
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dp-intf_1c113000
      last run: https://d.kernelci.org/test/maestro:698f800aa1ae387ffbd63712
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dp-tx_1c600000
      last run: https://d.kernelci.org/test/maestro:698f800aa1ae387ffbd63711
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_edp-tx_1c500000
      last run: https://d.kernelci.org/test/maestro:698f800aa1ae387ffbd6370e
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_edp-tx_1c500000_aux-bus_panel
      last run: https://d.kernelci.org/test/maestro:698f800aa1ae387ffbd6370d
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_hdr-engine_1c114000
      last run: https://d.kernelci.org/test/maestro:698f800aa1ae387ffbd63709
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000
      last run: https://d.kernelci.org/test/maestro:698f800aa1ae387ffbd636f8
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_0_0
      last run: https://d.kernelci.org/test/maestro:698f800aa1ae387ffbd636f7
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_0_10000
      last run: https://d.kernelci.org/test/maestro:698f800aa1ae387ffbd636f6
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_1_0
      last run: https://d.kernelci.org/test/maestro:698f800aa1ae387ffbd636f5
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000
      last run: https://d.kernelci.org/test/maestro:698f800aa1ae387ffbd636f4
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000_jpgenc_0_0
      last run: https://d.kernelci.org/test/maestro:698f800aa1ae387ffbd636f3
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000_jpgenc_1_0
      last run: https://d.kernelci.org/test/maestro:698f800aa1ae387ffbd636f2
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_1c000000
      last run: https://d.kernelci.org/test/maestro:698f800aa1ae387ffbd636d5
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1c002000
      last run: https://d.kernelci.org/test/maestro:698f800aa1ae387ffbd636cb
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000
      last run: https://d.kernelci.org/test/maestro:698f800aa1ae387ffbd63696
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_10000
      last run: https://d.kernelci.org/test/maestro:698f800aa1ae387ffbd63695
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_2000
      last run: https://d.kernelci.org/test/maestro:698f800aa1ae387ffbd63694
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_25000
      last run: https://d.kernelci.org/test/maestro:698f800aa1ae387ffbd63693
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_1a020000
      last run: https://d.kernelci.org/test/maestro:698f800aa1ae387ffbd63692
      history:  > ✅  > ❌  
            
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:698fb4eaa1ae387ffbd75395
      history:  > ✅  > ❌  > ❌  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_h264_frext.JVT-FR-EXT-GStreamer-H-264-V4L2-Gst1-0.FRExt_MMCO4_Sony_B
      last run: https://d.kernelci.org/test/maestro:698f810fa1ae387ffbd63faf
      history:  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: mt8186-corsola-steelix-sku131072
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.iommu
      last run: https://d.kernelci.org/test/maestro:698f7f13a1ae387ffbd62927
      history:  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rtla-timerlat
      last run: https://d.kernelci.org/test/maestro:698f7d74a1ae387ffbd622a8
      history:  > ✅  > ✅  > ⚠️  
            
Hardware: qemu-arm64
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rtla-osnoise
      last run: https://d.kernelci.org/test/maestro:698f7803a1ae387ffbd61533
      history:  > ✅  > ✅  > ✅  > ⚠️  
            
      - rt-tests.rtla-timerlat
      last run: https://d.kernelci.org/test/maestro:698f782aa1ae387ffbd615d0
      history:  > ✅  > ✅  > ✅  > ⚠️  
            
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:698f77fea1ae387ffbd61524
      history:  > ✅  > ✅  > ✅  > ⚠️  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
