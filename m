Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E20C155389
	for <linux-next@vger.kernel.org>; Tue, 28 Apr 2026 02:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777343428; cv=none; b=UZ9AKeQXgqkyfdv2D+N+BEYXA6Q0quKsVJzRbgsUm83KrSaNpDVBSRQ/XbaD9j7GcfHYlo4Dv8w2lM8lSdQd6jbe+uSCbPZjgoEHBCtYhQN1AO6Wb1Jdj1YiG1+lZX12ZJ3Ott/aqinGQo5fBTRujwa1s4YCtFcatjVygd0EpXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777343428; c=relaxed/simple;
	bh=cxhOT7y1/x+XjE53OrOSZJCB1ObVm7V/CSpqNv6ftbY=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=U7dhS64a2qCXcOTfZ40vErCM2M3wzekGovC9/hbB5u5DYTzT2cYWf61gSupzBhpRuUoWkTLh6/ZGQA4ayeHX+NNdzB1dbIIFOshStDlEtlUiSc3zCZh/OteB852Jr4Mgcv1B6n4bdRJFmUcDj6IOcjx3DYVieaeewg6J0a9Zafw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=T86gautE; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="T86gautE"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2d868d014a5so10767813eec.1
        for <linux-next@vger.kernel.org>; Mon, 27 Apr 2026 19:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1777343425; x=1777948225; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zwcIVi22BNisvl+LDvjv3N+ylJbETIKMkhrBENbpI8g=;
        b=T86gautESxZqJqaiYahbaCzUELDyp2nYbhLIclWzjFCJG8qSonZhQF44icLGmeajiw
         /BlJTiHVHr9jHpIO2QsmKb9IWBr9LGY49ODUb7UFlagYGET+2LSl4YishDveUQTHghH2
         x5Un7CNPI8jHBHROL9AdxV1vgljgFOXfuCqTrhn1bLZRO+JDs+H36oMIJrLkCwNSrGFE
         w3PUZ2UC7N8HjCMaYgu4aS+KAxr7yqJ903c6ansFlHmKFpcgoUmQIKoOB95y7kiU+5y0
         udsyqEA1+9eouFNEPZtHTUv4Z2YwhagtUJ+M+EtL8vp9H0Ouec0bv+LZ9ghiH5Qq8AeJ
         2IKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777343425; x=1777948225;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zwcIVi22BNisvl+LDvjv3N+ylJbETIKMkhrBENbpI8g=;
        b=lf55qVXaDJRYsBsKMmLMbQ/Orh1Oysgpy5yj4LR3Zf1kcwMuaqsRdyO76GzdQYQXr4
         PadxnsVpuos0iwKTncKBDavUMiLfveoqAmUAWcLG1MZ/wqQ2YMzwFQZ/7Rr/Y/wVikOw
         PiND4DF7x6dT+6MPzOJsOePpCv1AnlNEVkJcxF5fSfUyJAG/gmQ1keA/lLuDL/+CNpY+
         uxz+lWEySOD6xmBsfiOj9Ub+igoiK9NzrSbWJ4CcM20gTdRBFFxSOnBji6BBfNIMzLnx
         /r0f8wO+58l0ieFFSKpD8qeprc2HwNnmfIWLBG1WKXPYGXc2gK3Vrno2/mMiAoG1f3Mc
         eTNg==
X-Gm-Message-State: AOJu0YwxLw66xGBSuhNRLLvMOEh/g7BqTdhEUDu22YukeMj2rua7WPig
	rWt6qyvS0rJxiPwD0Ws0pJvcl3HXH+IXxCbDSQ4HmzVcPexnnGKtSgeQTrHNOB9NclG/GDkj6A5
	CE/7d
X-Gm-Gg: AeBDievFkx94yisQefvKkzwDihmWwO0Ky9xU+QFE0wMgw5xzVUGzuA6a2DVdVoV5N+o
	47TGP58ByQfYihE9FTgAH2BikiEoD9I6UtWg3mbc/RjKlJ1ZU6tUL3Wu1eRdwHSZxWXIt9xE4Jc
	ZeSNv8Y7mO2u/im4HikmcuzhkYnviJitRxkISMCqI/jfSpkxuaUdF2Hvnn+SJbBqOsyNakCi9I4
	bm6gawL64GMC7pz6Ebjkyp/TlOjBzQiAqHfPtS1NcACPXsy3+xXbUisB+bGyUodF4+Z1E7kOy0g
	BUthOXwqqx2zHJvMcNdK5vBgwqZ4roh25w1sFqqrKQr1iVE4c2f1liXIFHHsPP28o70Dz4X+01g
	43PCI4/7VbNJaGg2TwdUEaSZlCp/LoLtMqkWGdDSJPnk9TU9l+j7xvLcKBLmGTSV6R2e8a0riM7
	EPbD+IQBJQaIMGElm0nuvk8KyKBUg=
X-Received: by 2002:a05:7301:128d:b0:2d1:e92c:f7ff with SMTP id 5a478bee46e88-2ed0a03e7cemr698295eec.1.1777343425363;
        Mon, 27 Apr 2026 19:30:25 -0700 (PDT)
Received: from 7f5f57871823 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed0a106524sm1169783eec.23.2026.04.27.19.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 19:30:24 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 39704f00f747aba3144289870b5fd8ac230a9aaf
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 28 Apr 2026 02:30:24 -0000
Message-ID: <177734342437.1574.12624664014247643651@7f5f57871823>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/39704f00f747aba3144289870b5fd8ac230a9aaf/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 39704f00f747aba3144289870b5fd8ac230a9aaf
origin: maestro
test start time: 2026-04-27 14:33:35.980000+00:00

Builds:	   57 ✅    0 ❌    0 ⚠️
Boots: 	  178 ✅   12 ❌    0 ⚠️
Tests: 	23348 ✅ 4286 ❌ 6576 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:69ef83f89b5a9683090c05ca
      history:  > ✅  > ❌  > ❌  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:69ef9a4e9b5a9683090d09e2
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_mt8195-sound
      last run: https://d.kernelci.org/test/maestro:69ef8eca9b5a9683090ca65d
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c104000
      last run: https://d.kernelci.org/test/maestro:69ef8eca9b5a9683090ca583
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c105000
      last run: https://d.kernelci.org/test/maestro:69ef8eca9b5a9683090ca581
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c106000
      last run: https://d.kernelci.org/test/maestro:69ef8eca9b5a9683090ca57f
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c107000
      last run: https://d.kernelci.org/test/maestro:69ef8eca9b5a9683090ca57d
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c108000
      last run: https://d.kernelci.org/test/maestro:69ef8eca9b5a9683090ca57b
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c109000
      last run: https://d.kernelci.org/test/maestro:69ef8eca9b5a9683090ca579
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c10a000
      last run: https://d.kernelci.org/test/maestro:69ef8eca9b5a9683090ca577
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c10b000
      last run: https://d.kernelci.org/test/maestro:69ef8eca9b5a9683090ca575
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dp-intf_1c015000
      last run: https://d.kernelci.org/test/maestro:69ef8eca9b5a9683090ca573
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dp-intf_1c113000
      last run: https://d.kernelci.org/test/maestro:69ef8eca9b5a9683090ca571
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_hdr-engine_1c114000
      last run: https://d.kernelci.org/test/maestro:69ef8eca9b5a9683090ca55f
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: monaco-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:69ef83fd9b5a9683090c05e3
      history:  > ❌  > ❌  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:69ef84069b5a9683090c0629
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: lenovo-hr330a-7x33cto1ww-emag
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:69efb7c69b5a9683090e6869
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_spi_11010000_can_0
      last run: https://d.kernelci.org/test/maestro:69ef84c89b5a9683090c0d82
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: monaco-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.proc.proc_read
      last run: https://d.kernelci.org/test/maestro:69ef90209b5a9683090cb523
      history:  > ✅  > ❌  > ✅  
            
Hardware: qcs615-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.proc.proc_read
      last run: https://d.kernelci.org/test/maestro:69ef8f579b5a9683090cadf5
      history:  > ✅  > ✅  > ❌  > ✅  
            
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.mm.mm_ksft_gup_test_sh_gup_longterm_io_uring_fixed_buffer_with_MAP_SHARED_file_mapping_with_memfd_hugetlb_64_kB
      last run: https://d.kernelci.org/test/maestro:69efe2e79b5a9683090fcf50
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:69ef843c9b5a9683090c07db
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.uevent
      last run: https://d.kernelci.org/test/maestro:69ef9a619b5a9683090d0a5d
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.uevent.uevent_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:69ef9c709b5a9683090d195d
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.uevent.uevent_uevent_filtering_global_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:69ef9c709b5a9683090d195e
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller0_14001000
      last run: https://d.kernelci.org/test/maestro:69ef8e169b5a9683090c9c21
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58_aux-bus_panel
      last run: https://d.kernelci.org/test/maestro:69ef8e169b5a9683090c9c15
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14008000
      last run: https://d.kernelci.org/test/maestro:69ef8e169b5a9683090c9bf9
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14009000
      last run: https://d.kernelci.org/test/maestro:69ef8e169b5a9683090c9bf8
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_1400a000
      last run: https://d.kernelci.org/test/maestro:69ef8e169b5a9683090c9bf7
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400b000
      last run: https://d.kernelci.org/test/maestro:69ef8e169b5a9683090c9bec
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400c000
      last run: https://d.kernelci.org/test/maestro:69ef8e169b5a9683090c9beb
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
