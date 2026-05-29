Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C95B3A1C9
	for <linux-next@vger.kernel.org>; Fri, 29 May 2026 02:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780021833; cv=none; b=U/Vfrm2dt2EDvEZox3VYFzmQSp+O1aluM/Vma1GPOwk7XpfrPBaKXogzP5Mw1Ldy2UQEY8+Tv0RLZniZJM9r4jgMdC9gCxY7sLqnj4k2xK8oO+3Jm6c6+TKzzx6tDs/PMtUJargK4vxnFMn5iWew1ejfnQv9sUdDplQpYHOkvIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780021833; c=relaxed/simple;
	bh=Nnu8RQVkyjgWG9WbV1fq/lz2oLtYICWYrYh2fYyv4lo=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=C8LR2J1MDdJMCSp7o+Es3t5EOF7qxQpCujIE3/KD/cYxYrj/OpfuSuWrK9KBE4DLxL5jjvRSHmsI3oYXxd1vx1dIobuN0FLrYkax+P1aFecKVZ93yDnMPPbgCiqQWWBmiAHONsMURW/ZS6edCBq2jEjKt62SmBvujtOIHgPuphw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=TCY28PP4; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="TCY28PP4"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-130c9dcbd25so8023371c88.1
        for <linux-next@vger.kernel.org>; Thu, 28 May 2026 19:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1780021831; x=1780626631; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0iTtTpmPq5QuKUUiCW2KWadeOLmdqcn1bcEdyi5yjtQ=;
        b=TCY28PP4sazcGfcPG3/YbRLQf7ZB2ZbaS/6CBSikNe054mvSy6myBnmw26NE/Z6U/Z
         vCoPyiw2fVsz0BClfQkgc3XD7U+pm+TXTe/dplksSIVTTCMRdAxZEgr3qjF68dqr1H89
         NzacdUufYLog7t+RcDcHXZ58aa9/riRp5G2yrTVZOVXpTiPEr7aJjlPfCaJTgtiyRg84
         S9MZMqyTQj1Mm6CAG1/RSAZyUcpyVy+t+ipDpva91p3XCi/kalXGtK71RMAc9XDJ5zGE
         /3S55GJP6z5t7UdmX4Wh+NDRflMy9hyqARG54TqrBhTOsTxhIalWvYspUNfDdx45XPD7
         eo+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780021831; x=1780626631;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0iTtTpmPq5QuKUUiCW2KWadeOLmdqcn1bcEdyi5yjtQ=;
        b=SmNKhcXRUlPt7etmd2u8m/cAaZhLvHzeh197Oy/9ZIQXz4v37Oi/3eTZr2AOIghTcZ
         CwrR+r7UFzvkrrat7Q1h0kVp337OR2vZsmWDpuecxxs350mA8M/PWwYcKOFkwuHWvNwr
         dIQd1v11l/ow8fgsrEVsirUUjnpb/8JCmhzFwY8V+N7lMDnhtm2BLttwc9lnwKiL+sjZ
         pKC2lUvr5cNPTj8b0UFUwmn9OYWia8SZSzQD9QevJHJuunOix6B+rHv3bZNr1cZanOLZ
         f/F/D6Q+3T6gx1JQbaiyNCYzY0NlDBXSFyTeFaNncfJn7tdABjGFC1a0D3J15pk7EBzG
         OfdQ==
X-Gm-Message-State: AOJu0Yx2odZR6Wsq6qITn1Kz01g36qAuVOeJr2T7BOmWFNiLJzMO/1pQ
	E+cgYk8ocTRcRKLiVUEtE295InSSyOdRYDMR+a1ZIvDawLHhAA50WVxGBgmVbztof/w=
X-Gm-Gg: Acq92OGctKJPTkxJZ3Y6ChJQaZu6PFkircQw8DpDroBaTU8YX18DRZ4NErv4gasedof
	paMmQ0BK3QQQ5c7L+bm81u8F2a/bfpzMSpDDjeXo/Yfd7psyqQ+zOoWXiA6Zmr3qp3N28YMPpeH
	O92b5QCgQNZE1pNyMYK24WkXXHGczYp0pY8FU68AkN15xBHUB4tDMMZcNcl78ZRtWA/DT1ysy1C
	/0z8m25WsQAUTTo7XnJVWOZZThoflFHNG9cObSMeSAm4oFt/moUXq0fXFpwC4I5+lVNaLLD27WI
	b9SrascXdrgjC/O15ap6lc4HK70EGI9ifh5m1Z7Jc71U3fDIcW7x6qac+QCF1X8XmTMq5QwQKYE
	5benKsvm1wO8e9ROzHYy8Cg5U2otogkVGc4ROUG4rqFOWbjakAYujTmwbU1hgsbVzhBhqxtEdE0
	rhsu8JAcpXlZc7bcz6INqCjzLD11c=
X-Received: by 2002:a05:7022:4594:b0:136:4bbe:9523 with SMTP id a92af1059eb24-137ae515c99mr433052c88.8.1780021831157;
        Thu, 28 May 2026 19:30:31 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137b3c69c0asm291988c88.11.2026.05.28.19.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 19:30:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - f7af91adc230aa99e23330ecf85bc9badd9780ad
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 29 May 2026 02:30:30 -0000
Message-ID: <178002182993.7203.8183126307347457586@330cfa3079ca>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/f7af91adc230aa99e23330ecf85bc9badd9780ad/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: f7af91adc230aa99e23330ecf85bc9badd9780ad
origin: maestro
test start time: 2026-05-28 17:51:18.994000+00:00

Builds:	   58 ✅    1 ❌    0 ⚠️
Boots: 	  120 ✅   54 ❌    6 ⚠️
Tests: 	16818 ✅ 4056 ❌ 1104 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller0_14001000
      last run: https://d.kernelci.org/test/maestro:6a18aebaee38c2a863e42e1d
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58_aux-bus_panel
      last run: https://d.kernelci.org/test/maestro:6a18aebaee38c2a863e42e06
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_17030000
      last run: https://d.kernelci.org/test/maestro:6a18aebaee38c2a863e42df2
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14008000
      last run: https://d.kernelci.org/test/maestro:6a18aebaee38c2a863e42dc9
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14009000
      last run: https://d.kernelci.org/test/maestro:6a18aebaee38c2a863e42dc7
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_1400a000
      last run: https://d.kernelci.org/test/maestro:6a18aebaee38c2a863e42dc5
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400b000
      last run: https://d.kernelci.org/test/maestro:6a18aebaee38c2a863e42daf
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400c000
      last run: https://d.kernelci.org/test/maestro:6a18aebaee38c2a863e42dad
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_vcodec_17020000
      last run: https://d.kernelci.org/test/maestro:6a18aebaee38c2a863e42d71
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_16020000
      last run: https://d.kernelci.org/test/maestro:6a18aebaee38c2a863e42d6f
      history:  > ✅  > ❌  > ❌  
            


### FIXED REGRESSIONS

  No fixed regressions observed.


### UNSTABLE TESTS
    
Hardware: aws-ec2-arm64
  > Config: defconfig+aws-ec2
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a18935fee38c2a863e35648
      history:  > ⚠️  > ✅  > ✅  > ⚠️  > ⚠️  
            
Hardware: aws-ec2-x86_64
  > Config: x86_64_defconfig+aws-ec2
    - Architecture/compiler: x86_64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a188e29ee38c2a863e31c50
      history:  > ⚠️  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a1891f9ee38c2a863e34dc8
      history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a188ad6ee38c2a863e31843
      history:  > ✅  > ⚠️  > ✅  > ✅  > ⚠️  
            
Hardware: cd8180-orion-o6
  > Config: defconfig+netdev+nfs-root-boot+kselftest
    - Architecture/compiler: arm64/gcc-14
      - ltp
      last run: https://d.kernelci.org/test/maestro:6a18b0edee38c2a863e45310
      history:  > ⚠️  > ❌  > ✅  > ✅  > ✅  
            
Hardware: exynos850-e850-96
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a1891a1ee38c2a863e34ba4
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  > ✅  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a188ad6ee38c2a863e31848
      history:  > ⚠️  > ✅  > ⚠️  > ✅  > ⚠️  
            
Hardware: qemu-x86_64
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a188f32ee38c2a863e31dd4
      history:  > ⚠️  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_backlight_lcd0
      last run: https://d.kernelci.org/test/maestro:6a18aebaee38c2a863e42e8d
      history:  > ✅  > ❌  > ✅  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
