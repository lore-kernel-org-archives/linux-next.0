Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7542F6918
	for <linux-next@vger.kernel.org>; Fri, 22 May 2026 02:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779417019; cv=none; b=ZNsQc9nv5Cm8nu+8UtWnx6zHKF9eI7Wlhw2y2HimueQ7x9nOifka8njbIa8Ih09zt9smQk6sBONWmmx10BmEKqS9p8Afh25hSU7PHGH2H3YitLehy7c3JdxU1qt9rwdwQpfnUl3ttd+kKXjboSJyozWF2x7QEAWXyd8/Csuggs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779417019; c=relaxed/simple;
	bh=63NWy7BgxRNn9t8CyGiMNi3bsFL/TaSUBwXqZvHbrJU=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=VRqUcOhtUvMm+nmVmaq0NSYsYK1xccx9azba4cuCeHtPARFnxsvycnA8H/89ggvT9yx3QOKvRvvKLWtyVIxSNmz6+a/EjtsbG3LoPdS2axL3pYxpL11cl8q6MmD+JYVhzKdPfiah0trfD3guqbFNxcYz2zCR5In+zn1J2wbJ6zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=OEQ0wjLs; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="OEQ0wjLs"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2f30a4601bbso6808994eec.1
        for <linux-next@vger.kernel.org>; Thu, 21 May 2026 19:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1779417016; x=1780021816; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FdTQ8LdMqTg9yW5n7t3xV4VK3eLwciIVzuSql3q5zgQ=;
        b=OEQ0wjLswKRoTHRgGTCEMuR4SYXXmvHaz2sW99jIALgsvdlrvVQRmVKI0EF9JoLDEt
         wQN522yVqezGfB+IJzYPDoXCFtHyiI1fYsq9WToVozw/jI3PhShMPhFtyUTxnijt9XY4
         kLMaZ+QGDCOAJnj6lISDacb0cDoF0PjCkml1H8i0zHn8lKylIYcNL2mppzJui6IPq7ZR
         JcLRu9laQJhLQCcOsCnn4+CqoZnqaa6OGu+3r1BOdrQhq5C4dVEpEWw/8R9TtyHgPdSI
         M7VM4mf32s4zmNEIh+Y2PZkb0gQu2P5EnuxWN+aRS1xTo+pA0dFaA6qu/BsPwh1sZC79
         zxGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779417016; x=1780021816;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FdTQ8LdMqTg9yW5n7t3xV4VK3eLwciIVzuSql3q5zgQ=;
        b=F7N9lsjfWx/CKdJBmhD9t6EjcxwyxyNwX40eRncszOiu4WlMG5LmQl+1wbOXhBOQt7
         zT3H2yNtarLShWIGfXqLPR4jE4w5yttGfeaDRG3fgsz9oB+2bnYKFwhGi6jZ8ubuGaPe
         QCticTAXKs4aDBKy/y0XpCe2ZV8HVCbKV58C1h0fahnd6AhJGGR1V8YvJQBedSQld5Sn
         7TupOLM9Obv9hHqrc0AXmdU5gwY79IoW1Ay9W40fmzP+4BOaR+DRo0nnZ5kcOBkdFMBU
         wDyGsjkFPqHNPVum0r4h6vovSKlvWEOY4iwxBJjBFo3Yht0oyFOBHaPvyUxSZOWne25r
         c3pQ==
X-Gm-Message-State: AOJu0YyWHQWydceYcraqg3bEc2TcfmO1UCbHAVI65IRS/H6HO7/VLlWL
	vF2HPsU6F5zOg0I1+GNA8pxtpvDdyzHwwu30BK4qLsd0YRNVhVxdhB/X7UdfhccDiVcnf9HvWjS
	+k6ct
X-Gm-Gg: Acq92OHQYw7Dh+U/8OP4bftaTL/KcEpTPWdixot2WfUYiBwRsLeC436HifS4MBF1Nh4
	EZQ5GGkfh8vjy+pcasbMS/LwYsgPFSgHNN073Ey7LKKF7C5ePRr+5aK/CkctbI7CK7jK15/vDjt
	Km5O6b6Pmfp4prl15RdV6gkl20vvHuiVZxyR9EbNcsxh61wJNgZgY4MLeAsw1Jo2idjPrEk3IYf
	cFCJwprzJ7gqYBN8QWekX3K02iYA5qmAO3PXXzKNAAbgsk+UbqXMtX3dVdffYdyY9244Npf8HvU
	SlhOL9jKaC+MTA0f5EBnkXFuNA0mV7HKTFvCiP2/TEQY9FOHDcJu03f+JM1756cgGmP+O0ZVp/A
	hlI0nn2FMEOs3WsOlc+WxObRONGil2MghxgUMtBrgFzPLEsIZr7oZrGjUouSzbcq3ruZL2tdV3i
	iAB5Xlb+1XlGQQOtQ6rAd/NgRe14w=
X-Received: by 2002:a05:7301:d0f:b0:2ea:ed70:3ea8 with SMTP id 5a478bee46e88-304490f574fmr998149eec.29.1779417016394;
        Thu, 21 May 2026 19:30:16 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3044b998a21sm737881eec.30.2026.05.21.19.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 19:30:12 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 550604d6c9b9efc8d068aff94dc301694a7afdee
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 22 May 2026 02:30:11 -0000
Message-ID: <177941701155.3987.3325374375800328527@330cfa3079ca>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/550604d6c9b9efc8d068aff94dc301694a7afdee/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 550604d6c9b9efc8d068aff94dc301694a7afdee
origin: maestro
test start time: 2026-05-21 12:25:26.688000+00:00

Builds:	   58 ✅    1 ❌    0 ⚠️
Boots: 	  128 ✅   50 ❌    8 ⚠️
Tests: 	21062 ✅ 3485 ❌ 5461 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58_aux-bus_panel
      last run: https://d.kernelci.org/test/maestro:6a0f064404deb9f27dc752c3
      history:  > ✅  > ✅  > ❌  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_crypto_1d90000
      last run: https://d.kernelci.org/test/maestro:6a0f068804deb9f27dc7605c
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: sc7180-trogdor-lazor-limozeen
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:6a0f052e04deb9f27dc74e0e
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh
      last run: https://d.kernelci.org/test/maestro:6a0f067e04deb9f27dc75caa
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_crypto_1d90000
      last run: https://d.kernelci.org/test/maestro:6a0f067e04deb9f27dc75c84
      history:  > ✅  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:6a0f0b7204deb9f27dc7ccfd
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.alsa.alsa_pcm-test
      last run: https://d.kernelci.org/test/maestro:6a0f0ed804deb9f27dc7fee8
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_i2c_30a50000_eeprom_50
      last run: https://d.kernelci.org/test/maestro:6a0f0fc804deb9f27dc809ce
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: mt8390-genio-700-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11e00000_typec-mux_48
      last run: https://d.kernelci.org/test/maestro:6a0f0d7f04deb9f27dc7eba1
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_spi_11010000_can_0
      last run: https://d.kernelci.org/test/maestro:6a0f0d2b04deb9f27dc7e5db
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_vcodec_17020000
      last run: https://d.kernelci.org/test/maestro:6a0f064404deb9f27dc7526e
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_16020000
      last run: https://d.kernelci.org/test/maestro:6a0f064404deb9f27dc7526d
      history:  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a0f0b6b04deb9f27dc7ccd4
      history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
Hardware: bcm2837-rpi-3-b-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:6a0f0b9304deb9f27dc7cdd8
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:6a0f111a04deb9f27dc8106c
      history:  > ✅  > ❌  > ✅  > ❌  
            
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a0f028704deb9f27dc74457
      history:  > ✅  > ✅  > ⚠️  > ✅  > ⚠️  
            
Hardware: cd8180-orion-o6
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a0f0b5404deb9f27dc7cc17
      history:  > ✅  > ✅  > ⚠️  > ⚠️  > ✅  
            
  > Config: defconfig+netdev+nfs-root-boot+kselftest
    - Architecture/compiler: arm64/gcc-14
      - ltp
      last run: https://d.kernelci.org/test/maestro:6a0f084d04deb9f27dc786ca
      history:  > ❌  > ❌  > ⚠️  > ⚠️  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a0f029204deb9f27dc744bd
      history:  > ✅  > ⚠️  > ✅  > ⚠️  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:6a0f14dd04deb9f27dc82102
      history:  > ❌  > ✅  > ✅  > ❌  
            
Hardware: qemu-x86_64
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a0f073104deb9f27dc7656e
      history:  > ✅  > ⚠️  > ✅  > ⚠️  > ✅  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.uevent
      last run: https://d.kernelci.org/test/maestro:6a0f025504deb9f27dc743cf
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.uevent.uevent_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:6a0f035904deb9f27dc74792
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.uevent.uevent_uevent_filtering_global_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:6a0f035904deb9f27dc74793
      history:  > ✅  > ❌  > ✅  > ✅  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller0_14001000
      last run: https://d.kernelci.org/test/maestro:6a0f064404deb9f27dc752cf
      history:  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_17030000
      last run: https://d.kernelci.org/test/maestro:6a0f064404deb9f27dc752b8
      history:  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14008000
      last run: https://d.kernelci.org/test/maestro:6a0f064404deb9f27dc752a7
      history:  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14009000
      last run: https://d.kernelci.org/test/maestro:6a0f064404deb9f27dc752a6
      history:  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_1400a000
      last run: https://d.kernelci.org/test/maestro:6a0f064404deb9f27dc752a5
      history:  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400b000
      last run: https://d.kernelci.org/test/maestro:6a0f064404deb9f27dc7529a
      history:  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400c000
      last run: https://d.kernelci.org/test/maestro:6a0f064404deb9f27dc75299
      history:  > ❌  > ✅  > ❌  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
