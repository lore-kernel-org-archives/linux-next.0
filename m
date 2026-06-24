Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2AA17993
	for <linux-next@vger.kernel.org>; Wed, 24 Jun 2026 02:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782268215; cv=none; b=ofuFpA/PUCuomNUwAdRpF7dxSMZRBUuWTZ6hreqjq1Pf4tnqd0D8j3tfMBrnSwZUZejhLTZjrqBuysr7exhFxgK3GGhlwgn2XRCtiJCMfI+OSA10O0WDHzIll6j5iMMfsJsLTSE+Qu1t6m80LEdLiagx5baif7m3iaIdj8t1Vno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782268215; c=relaxed/simple;
	bh=20dj6uAoV3ZNCHsf6UIsEglSlYQDdM6N3+aqrrfSb4w=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=GqsWaiZbPdWVTZHrhawGhzIxmHG23PrP+YQ4ubUrcxO8pEfm6OSfNAAsK20cN66IeYW8YAGWgcXc94z/r+rm/9lqRlas9VPTdgopgYizH1SxI9mGHoF94XLUJXwMEWZcFicoZkizmX3KYLHtzipBCmaq2ssUQWwmXEI0S/oDwa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=Jg9Tc8Nc; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="Jg9Tc8Nc"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-139b5e604b9so629111c88.0
        for <linux-next@vger.kernel.org>; Tue, 23 Jun 2026 19:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1782268212; x=1782873012; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kUizYdqQ6C3sNrfb+nlTHY9HqQmZeFY9N2419la/qNU=;
        b=Jg9Tc8Ncvc4E923ttqyN1njg7jiN98FOXKwddVlKjz5BWZzKHNK5ypNiCE6ii8qvn8
         VLKkKHuao8TmJyA+JJjT3XQLnvMWRyf9twyocAQOaEiHug25GnmkYiQI3z+jH5APT6Ek
         YmMT+uxCohnDq31UmV+iq6fwoqJ/VrgPYIGO5u9Gx6I1NcaHPa6FzjrGnge4lhs/mlJD
         rB3cefnfW/nRz7O2u1DrSet+vdLdboyYlVwDiT2FDMaz2vmIUZzkMz9kZpR5/IYYOtE5
         Pp4pL1i1zy9iZiLv8v+KrOLh8fD8N6ubItPBeamzaTXwOs8qkEbk0O0n2c3+P5vmEJ+D
         B+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782268212; x=1782873012;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kUizYdqQ6C3sNrfb+nlTHY9HqQmZeFY9N2419la/qNU=;
        b=E/5MmjNCwp66tWBCcScA4JWhQw2vlQqJZJAu7p0dxYl6QUso1iRn8Cx1rKcRKOpIcc
         xByrVp/VUV9A1KuEfpDxe9PZHaVKDTO/KZSxnoHwSYZw6ew2pWzmpJyQDkVppruPGQa0
         95ikEasayYnUPtoSpP8DJphtvX1D9KGyzem3Ii/CopnlLpwPP7JSQ9oHIrYb8g6xf/Eo
         cRTvmv8riGIDGM0Q+zski8wNR2Qntx+LLtOBNOs7znNEFTCizMUofYoKusQ5Vh0QnJMn
         jvSw3qGHopQvWyTCfoEiSWCPudPFF6ChsN6TB0ItNknl6PIoHBzD8Uq9gWqrZFbmy5/R
         Immw==
X-Gm-Message-State: AOJu0Yxd6SSPyQ6tqB3/K33Leu1l3g4c0k2EAbYZQdFhp4KarTHQZ1ko
	gk6Pl0dWRK/BWd7U4V0ml2W8rxg7B5YYBStNd454ikzvRjbeAa6PXPLU7CV9Hss1Pv7CGv3BBel
	JZ9e/
X-Gm-Gg: AfdE7cnzY+70EDbUhRRTC44T8ZOJpKDSQ7pBta0cR+0ehCGrz7sAGGEuwHIwRsrxZPf
	JLYBK3/+2rNJq+8A6uxA6IA+rjfPWyDwJTWjxoPLmysyrYp9c/kXZ00VEKBpQWxvNcZFGX8zLZK
	Af5EXqcjdwpIb+lILXb2tfcYjciGZmio11yw1ZzgqDORjY/0TqY+ETt/Vl5OCjnv180moikvyIr
	Xtsz65T+37W8NKd7md15HVYCll6hnQceXwLHyxICzi/NcSSyfMsS08xtz0aUkydtSUAwbb4w0f3
	E3W5+eGt9y02XipqcyNBdQU++E7McP73+flXVTIBT8iaBUQfvul6QDxDLmXtwKIma2zltVEJ9zY
	HE2zQS1QX7O7spvdJBCc24c4++kImU0Pptv6DwP8g7sIIWstEwWCdvSwXuAYI6lBaQt67U3MtBO
	G51v51QQ==
X-Received: by 2002:a05:7300:7c11:b0:30c:5807:abbb with SMTP id 5a478bee46e88-30c58c18f30mr5112006eec.20.1782268212167;
        Tue, 23 Jun 2026 19:30:12 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1ba1c32csm21958499eec.6.2026.06.23.19.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 19:30:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 4e5dfb7c84012007c3c7061126491bbc92d71bf1
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 24 Jun 2026 02:30:11 -0000
Message-ID: <178226821078.19162.12941915368206341547@330cfa3079ca>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/4e5dfb7c84012007c3c7061126491bbc92d71bf1/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
origin: maestro
test start time: 2026-06-23 13:09:43.541000+00:00

Builds:	   66 ✅    2 ❌    0 ⚠️
Boots: 	  136 ✅    4 ❌    0 ⚠️
Tests: 	25709 ✅ 5004 ❌ 3637 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: dell-latitude-3445-7520c-skyrim
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:6a3a991c6de4dcc0f43409b0
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:6a3a9ab66de4dcc0f4343521
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller0_14001000
      last run: https://d.kernelci.org/test/maestro:6a3a8fca6de4dcc0f433c604
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58_aux-bus_panel
      last run: https://d.kernelci.org/test/maestro:6a3a8fca6de4dcc0f433c5f8
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14008000
      last run: https://d.kernelci.org/test/maestro:6a3a8fca6de4dcc0f433c5dc
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14009000
      last run: https://d.kernelci.org/test/maestro:6a3a8fca6de4dcc0f433c5db
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_1400a000
      last run: https://d.kernelci.org/test/maestro:6a3a8fca6de4dcc0f433c5da
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400b000
      last run: https://d.kernelci.org/test/maestro:6a3a8fca6de4dcc0f433c5cf
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400c000
      last run: https://d.kernelci.org/test/maestro:6a3a8fca6de4dcc0f433c5ce
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_mt8195-sound
      last run: https://d.kernelci.org/test/maestro:6a3a90396de4dcc0f433d4a1
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c104000
      last run: https://d.kernelci.org/test/maestro:6a3a90396de4dcc0f433d43e
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c105000
      last run: https://d.kernelci.org/test/maestro:6a3a90396de4dcc0f433d43d
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c106000
      last run: https://d.kernelci.org/test/maestro:6a3a90396de4dcc0f433d43c
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c107000
      last run: https://d.kernelci.org/test/maestro:6a3a90396de4dcc0f433d43b
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c108000
      last run: https://d.kernelci.org/test/maestro:6a3a90396de4dcc0f433d43a
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c109000
      last run: https://d.kernelci.org/test/maestro:6a3a90396de4dcc0f433d439
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c10a000
      last run: https://d.kernelci.org/test/maestro:6a3a90396de4dcc0f433d438
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c10b000
      last run: https://d.kernelci.org/test/maestro:6a3a90396de4dcc0f433d437
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dp-intf_1c015000
      last run: https://d.kernelci.org/test/maestro:6a3a90396de4dcc0f433d436
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dp-intf_1c113000
      last run: https://d.kernelci.org/test/maestro:6a3a90396de4dcc0f433d435
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_hdr-engine_1c114000
      last run: https://d.kernelci.org/test/maestro:6a3a90396de4dcc0f433d42c
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000
      last run: https://d.kernelci.org/test/maestro:6a3a90396de4dcc0f433d41b
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_0_0
      last run: https://d.kernelci.org/test/maestro:6a3a90396de4dcc0f433d41a
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_0_10000
      last run: https://d.kernelci.org/test/maestro:6a3a90396de4dcc0f433d419
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_1_0
      last run: https://d.kernelci.org/test/maestro:6a3a90396de4dcc0f433d418
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000
      last run: https://d.kernelci.org/test/maestro:6a3a90396de4dcc0f433d417
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000_jpgenc_0_0
      last run: https://d.kernelci.org/test/maestro:6a3a90396de4dcc0f433d416
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000_jpgenc_1_0
      last run: https://d.kernelci.org/test/maestro:6a3a90396de4dcc0f433d415
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_1c000000
      last run: https://d.kernelci.org/test/maestro:6a3a90396de4dcc0f433d3eb
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1c002000
      last run: https://d.kernelci.org/test/maestro:6a3a90396de4dcc0f433d3e0
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000
      last run: https://d.kernelci.org/test/maestro:6a3a90396de4dcc0f433d3ac
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_10000
      last run: https://d.kernelci.org/test/maestro:6a3a90396de4dcc0f433d3ab
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_2000
      last run: https://d.kernelci.org/test/maestro:6a3a90396de4dcc0f433d3aa
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_25000
      last run: https://d.kernelci.org/test/maestro:6a3a90396de4dcc0f433d3a9
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_1a020000
      last run: https://d.kernelci.org/test/maestro:6a3a90396de4dcc0f433d3a8
      history:  > ✅  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.clone3
      last run: https://d.kernelci.org/test/maestro:6a3a91466de4dcc0f433e0f6
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: kaanapali-mtp
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.efivars
      last run: https://d.kernelci.org/test/maestro:6a3a9b446de4dcc0f4343739
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a3a8b7c6de4dcc0f433b02c
      history:  > ✅  > ⚠️  > ✅  > ⚠️  > ✅  
            
Hardware: imx6dl-riotboard
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a3a8bb86de4dcc0f433b0dd
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  > ✅  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a3a8ba86de4dcc0f433b09e
      history:  > ⚠️  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6a3a91706de4dcc0f433e215
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.timers.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:6a3a9fa66de4dcc0f43495b9
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: qemu-x86_64
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a3a99626de4dcc0f4340a87
      history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
Hardware: cd8180-orion-o6
  > Config: defconfig+netdev+nfs-root-boot+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a3aa7ad6de4dcc0f434b648
      history:  > ✅  > ✅  > ⚠️  > ✅  > ❌  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6a3aa7ad6de4dcc0f434b63f
      history:  > ✅  > ✅  > ⚠️  > ✅  > ❌  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
