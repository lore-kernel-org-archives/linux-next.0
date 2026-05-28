Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1082F6900
	for <linux-next@vger.kernel.org>; Thu, 28 May 2026 02:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779935421; cv=none; b=fwykSeR5hcMfu6a/HbQJlXOoefTVzETP3zaDBKzOkSf5Xy8xIefcoymEL9f4h+fW49Ibqx9nxqmt0GAgUhtcJi7UWrjgyJZkemTprQ8UugP7XY3p3uQs5rnYqPDuGs/999AGveO7O2f9TuxFoUNaGh+a18CiCEfraOafgqRF9XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779935421; c=relaxed/simple;
	bh=pD+bsI8LLgaMIdRL14crBUU8n8MdgTlJJq7Dzbe9wXw=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=mjQ5x9gPW73Hofo/aGb1b5I2dEfRF0pdWseDsdj94EmyniN4LNUjf9BfdcGZV4DN6oM8vY11MusDpU76umvj7GzLVDgfeABO+3QLPmtmCJwuAGrxEeMVpWNrYHcEX8MnIryQ8/WoHgFSowVm7j6Xan1rv8XwTTQfq/ouowje5I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=HsireS0K; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="HsireS0K"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso8682379eec.0
        for <linux-next@vger.kernel.org>; Wed, 27 May 2026 19:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1779935418; x=1780540218; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1vfweQYXmNmYMJciF/evfBGAPYBDJK5VzznTw/tzzW4=;
        b=HsireS0KgEjSltkWDqpCjxEigkRK0hFOoTwtFELWhkRRtmvEc9DsSwkO/DpIE5ILZm
         VJTcbhrVamKba61SiMqdZgnvrK51ycBQ5dNQtc8cba641UJkFa1erXb/eV+vfBHOHeg1
         nQ7u/hSMI0fxox9v6CFGEFgGwgJZLIkTC6+r+WHf076+MfWt3RecY9mmeY8USHteMrWj
         nDI1H4VCK7gX6Nb+kMDQ0gtfVfyer8NpzJFAb42WKBWAEEPahXiu2/gEOWrvRPHFkxTJ
         DjkRLjqPHdfvckx+Mb5b2WXSLdIXoPJ/RZOputh5cDaAjt9DKnQMS95QKah4QkE5bhHI
         I16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779935418; x=1780540218;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1vfweQYXmNmYMJciF/evfBGAPYBDJK5VzznTw/tzzW4=;
        b=hyL2TrJNyOIGj8S+Mke8qOwUeXDYVWznCoO7IT+TZQZ6pqwxxTVmI+6ZAqpDyQ646p
         vp3rbTAJDiDtElRYRvtd8/tOp8dhC701nhUIrqSoj9n61IJmPnNmL1OkIKgOp529N9v7
         TdCXskIubpiQN6YX5QpXKiHHCKOy+NCfjkE3IRC/OmMsAFWKM2iMO4KQK1TiWIhm6Iki
         hCJgu7MtZLb7R4nevrgXTVpEyTfdB+f1Apg5ymSLoqh8cGOIqZOqiUprgtHS+aKpGBk6
         flFMzFbDJjloMxTZPTG8ZFFbVXoGgAvxNB6Sr0CSIS/JM4t4YifSFb0Ec17cCGBMO8Ag
         YRuw==
X-Gm-Message-State: AOJu0YwTUSMHXNWVCkQO9AG8vLozf6IfOda44s5wWh4r3rwL2dkeIQi5
	XO7vamEMmobR3tTLZDJwx5GAMw62+dIwTi8IeJIo1wHysDGt72sEVhDeLW0b9jrcefXwSlVPz4U
	w+L31
X-Gm-Gg: Acq92OEwnbLUj2Aq4mSNVqsMAcxBs7jawNiD03g0qn/qoDZ6L494QZ1oJEdTW+e1QTt
	qC+Aa1Xu3kKHwBKWZpZJ+4UzSqNJ/Rn/dgpOGR5GTK1Uif+GHKi5o/9bNyag55JrcKe2769fnL0
	AJNcdaeCblC8LK6zXXgK3umSCc0YJSfySUMUKKtvT1Efx53hB86zHpRimooOQHJyi5+ulHbruGh
	YAmdc/zw2yh5hEddRk2vZqrCFvCNU5t09oneOBjT6acrLIojFuFmgjatmJ4XgoLhDLfZSu2CYj7
	5tNgY8J+ocwQQyol1RUzJPaz20pXreRA9mMdkiWERcWsBj78CrB23LcT5BIJV6OOUJxN3VF8w3N
	G5zWw0EMJp9pft8Qm9LkLaKcByvMFfSuZf20GIEs+34HNcSLbmIU4e6nvmdtZcOsy6tiwslREmI
	85mEdzMRzRt2vg4KHj/TBfMfKUBZY=
X-Received: by 2002:a05:7300:478d:b0:2be:17b1:e49f with SMTP id 5a478bee46e88-304304f77d6mr12881976eec.4.1779935418140;
        Wed, 27 May 2026 19:30:18 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30452461cb5sm20938606eec.31.2026.05.27.19.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 19:30:17 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - e7d700e14934e68f86338c5610cf2ae76798b663
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 28 May 2026 02:30:17 -0000
Message-ID: <177993541715.6744.6709103087670836424@330cfa3079ca>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/e7d700e14934e68f86338c5610cf2ae76798b663/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: e7d700e14934e68f86338c5610cf2ae76798b663
origin: maestro
test start time: 2026-05-27 16:02:54.975000+00:00

Builds:	   58 ✅    1 ❌    0 ⚠️
Boots: 	  132 ✅   47 ❌    6 ⚠️
Tests: 	20284 ✅ 4178 ❌ 4870 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_backlight_lcd0
      last run: https://d.kernelci.org/test/maestro:6a17293aee38c2a863de53d3
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_vcodec_17020000
      last run: https://d.kernelci.org/test/maestro:6a17293aee38c2a863de5339
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_16020000
      last run: https://d.kernelci.org/test/maestro:6a17293aee38c2a863de5338
      history:  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: bcm2837-rpi-3-b-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:6a172ab2ee38c2a863de5ba4
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:6a172e8dee38c2a863de8b48
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: aws-ec2-arm64
  > Config: defconfig+aws-ec2
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a172bd6ee38c2a863de672e
      history:  > ⚠️  > ⚠️  > ✅  > ✅  > ⚠️  
            
Hardware: aws-ec2-x86_64
  > Config: x86_64_defconfig+aws-ec2
    - Architecture/compiler: x86_64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a171a82ee38c2a863ddb335
      history:  > ⚠️  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a172a8fee38c2a863de5ab0
      history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.mm.mm_ksft_memory_failure_sh
      last run: https://d.kernelci.org/test/maestro:6a1724e5ee38c2a863de4400
      history:  > ✅  > ✅  > ⚠️  
            
      - kselftest.mm.mm_ksft_userfaultfd_sh_uffd-wp-mremap
      last run: https://d.kernelci.org/test/maestro:6a1724e5ee38c2a863de42c7
      history:  > ✅  > ✅  > ⚠️  
            
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a1720dbee38c2a863de095e
      history:  > ⚠️  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: cd8180-orion-o6
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a172a4eee38c2a863de5696
      history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
  > Config: defconfig+netdev+nfs-root-boot+kselftest
    - Architecture/compiler: arm64/gcc-14
      - ltp
      last run: https://d.kernelci.org/test/maestro:6a1733c7ee38c2a863dea27a
      history:  > ⚠️  > ⚠️  > ❌  > ✅  > ✅  
            
Hardware: exynos850-e850-96
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a172a4eee38c2a863de5699
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a1720ddee38c2a863de0961
      history:  > ✅  > ⚠️  > ✅  > ⚠️  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:6a172a95ee38c2a863de5ad1
      history:  > ✅  > ❌  > ❌  > ✅  
            
      - kselftest.alsa.alsa_pcm-test
      last run: https://d.kernelci.org/test/maestro:6a17350fee38c2a863dea50b
      history:  > ✅  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:6a173985ee38c2a863ded6df
      history:  > ❌  > ✅  > ✅  > ✅  > ❌  
            
Hardware: qemu-x86_64
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a171bc3ee38c2a863ddb487
      history:  > ⚠️  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller0_14001000
      last run: https://d.kernelci.org/test/maestro:6a17293aee38c2a863de539a
      history:  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58_aux-bus_panel
      last run: https://d.kernelci.org/test/maestro:6a17293aee38c2a863de538e
      history:  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_17030000
      last run: https://d.kernelci.org/test/maestro:6a17293aee38c2a863de5383
      history:  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14008000
      last run: https://d.kernelci.org/test/maestro:6a17293aee38c2a863de5372
      history:  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14009000
      last run: https://d.kernelci.org/test/maestro:6a17293aee38c2a863de5371
      history:  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_1400a000
      last run: https://d.kernelci.org/test/maestro:6a17293aee38c2a863de5370
      history:  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400b000
      last run: https://d.kernelci.org/test/maestro:6a17293aee38c2a863de5365
      history:  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400c000
      last run: https://d.kernelci.org/test/maestro:6a17293aee38c2a863de5364
      history:  > ❌  > ✅  > ❌  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
