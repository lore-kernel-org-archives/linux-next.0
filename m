Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F491D7995
	for <linux-next@vger.kernel.org>; Wed, 20 May 2026 02:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779244229; cv=none; b=GRJqZSj/QBfa6asdaioDycuwZaHDmINKTcnDkYa3dd/Ndy34Rz0PSE4xgHCGI4i80dO5/xSNMYacPdFOQMU5BwZfeLaN8mc6jRd/OnNlylcDUfn2UbSxx6kaMXl/0V/ZPp598qiKYq/IrjqgyjhFU4RVi8Y77fjRrcmGTBI7pWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779244229; c=relaxed/simple;
	bh=J0j8njZEhVIwWLnMzq7M998MW82yU4Mxxrkm79gXWmE=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=dbMg2+JIsdl5kzRAOwrApYhgjUmD8+ZkWZjQg36Oj6D31UesfnpWv2OCPHAiTF6nhp1+KDYSpTz7XBWR+UOHICcX4Q/zcb31pmDCWdmCiyjz1yndzABsZ6PKwr56AYqMII9Tt6Zjav5mfC2r3iEuSIXW2zSkjr9dTXMmOQARRAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=YfC6xlmM; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="YfC6xlmM"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2f7020a928eso6236874eec.1
        for <linux-next@vger.kernel.org>; Tue, 19 May 2026 19:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1779244226; x=1779849026; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yhRfK6aZ7TKhlJQXVxyYoxshtJnzZbJAJYrbsrgbk4w=;
        b=YfC6xlmMPw9DYhXRf8XdTuShkFtHgF8YjJaOW4OKnsywWvZK68SyCqgNH4mZ65JsC+
         g4Uk+Ml8QSk19lQfiiXiw2yt6AHbS1k7a1FEmTW2P0ThMjwbHWJqAaF4MpZ+HHu17x3g
         WEN9IHmjH8vQW8MFPWy4l2qDBSmG3+UKBXwcgj9P4VaZELFx4xitq4IpFcMTfwSZ6rhu
         qmwLkIJ2ejSJWf34830p3D2vOzn7vXL3usTQkWUWsM1snV99IPKBs+Rhk0Xs/d2O8O9A
         7ZGdNmgGwmYKP+yLLduEYpc5P5VgVlZfl/OTdSy6tylB0VUzvVp2AqrI1Ys9BYXy6z8j
         GfPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779244226; x=1779849026;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yhRfK6aZ7TKhlJQXVxyYoxshtJnzZbJAJYrbsrgbk4w=;
        b=UCVTjkQfPL+gVZxjfPyC09bIH78zuF7mIhMYQeTM10+Mel0CzMT1aeykXg796C4FdE
         zjRG3/PR+kTO4Ew9Q8npfdhvzadht1xf7M/a+d82zaH40TilqaWvYGH/SYPMAFsz27oA
         +vt/clvEVPb2gBQ9CcNOqb6xzh/rwJJCr0LEbsmCgVDZQo3FVaRw+RqmqoDAp3SU6Fy8
         hIFEqk4E84hKsO3/RKXRQydnPw6eJhVeOBnSS6DXCY9fmbRt/gufncWRamojQiYERkk7
         abZixm5gQpZXKXjfnQT5CE2/4g1Atz7MQB/OBA3+dmKH8xHbTBKZ/m7DtUJWC7Byisdz
         Rx1A==
X-Gm-Message-State: AOJu0YzI1+qxCGD7lQra7NdmEUSoKa5cuLBhyOIAMm6czpXTP0vaxy1E
	1TMd6QRSEaVQGL9br3vcC13lmj6qdqf7dZLoioLAlWkkwyoCEVOvrDKPqjyx/ycZsAWvX41l7Zb
	vCOFX
X-Gm-Gg: Acq92OHV00kyvPfOTtWneLSmtTAx9Qjy03LacWu0v0O0nFNhb77E0wFRa8f2Jeuuuhg
	puHibywVFggZkNvW9QA3EPfQm0DUhARcWCn/gGP6d6EfcM9efZV+hEmbOzPugw5uql95qXYuRtx
	+rlVvyyCIhT/cQc+7Y25EBE7qUAM6PEHhNCwWA6uIgmlLxU8PWJJP3NVnyYmJvo9cKX+MsStgZo
	5i+IvlNjFWaOXKjlHldOx5ovSN7jtEkUq3HQOpNFy8T9d+h7xegG1xWCaCNuADxRRl4DPIIhMaZ
	MfcamMF/oKiEZvUGE57so9bzl6vf3QIW7qAXg4ErShf/ilAK9jKPhDc64gvKGn3CSbY3H5/m+Z3
	IWDppFfrwktPROdwedxIrCq4ZUYYlJwkTfyld0RL/aOO0g0vaRryJonIop/NljZuxdm5Bfds5Y9
	nmFDnuNaDlyvJJ6X8o
X-Received: by 2002:a05:7300:c89:b0:2ed:e14:7f5b with SMTP id 5a478bee46e88-303986b0a86mr9003370eec.31.1779244226328;
        Tue, 19 May 2026 19:30:26 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302978ad18asm17466472eec.26.2026.05.19.19.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 19:30:25 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 6a50ba100ace43f43c87384367eb2d2605fcc16c
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 20 May 2026 02:30:25 -0000
Message-ID: <177924422502.3070.992297252604219292@330cfa3079ca>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/6a50ba100ace43f43c87384367eb2d2605fcc16c/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 6a50ba100ace43f43c87384367eb2d2605fcc16c
origin: maestro
test start time: 2026-05-19 12:31:14.816000+00:00

Builds:	   58 ✅    1 ❌    0 ⚠️
Boots: 	  135 ✅   52 ❌    7 ⚠️
Tests: 	21566 ✅ 4224 ❌ 5343 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: bcm2837-rpi-3-b-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:6a0c60a0744d1c1da0213435
      history:  > ✅  > ❌  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:6a0c63a1744d1c1da02182e7
      history:  > ✅  > ❌  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.uevent
      last run: https://d.kernelci.org/test/maestro:6a0c63a3744d1c1da02182fc
      history:  > ✅  > ❌  
            
      - kselftest.uevent.uevent_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:6a0c64a4744d1c1da02191c5
      history:  > ✅  > ❌  
            
      - kselftest.uevent.uevent_uevent_filtering_global_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:6a0c64a4744d1c1da02191c6
      history:  > ✅  > ❌  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_crypto_1d90000
      last run: https://d.kernelci.org/test/maestro:6a0c6230744d1c1da0216643
      history:  > ✅  > ❌  
            
Hardware: sc7180-trogdor-lazor-limozeen
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:6a0c60f9744d1c1da0213ac6
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh
      last run: https://d.kernelci.org/test/maestro:6a0c62df744d1c1da0217b89
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_crypto_1d90000
      last run: https://d.kernelci.org/test/maestro:6a0c62df744d1c1da0217b63
      history:  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:6a0c800f744d1c1da021fedd
      history:  > ❌  > ✅  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_i2c_30a50000_eeprom_50
      last run: https://d.kernelci.org/test/maestro:6a0c64e6744d1c1da0219428
      history:  > ❌  > ✅  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller0_14001000
      last run: https://d.kernelci.org/test/maestro:6a0c6216744d1c1da0215ee1
      history:  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_17030000
      last run: https://d.kernelci.org/test/maestro:6a0c6216744d1c1da0215eca
      history:  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14008000
      last run: https://d.kernelci.org/test/maestro:6a0c6216744d1c1da0215eb9
      history:  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14009000
      last run: https://d.kernelci.org/test/maestro:6a0c6216744d1c1da0215eb8
      history:  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_1400a000
      last run: https://d.kernelci.org/test/maestro:6a0c6216744d1c1da0215eb7
      history:  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400b000
      last run: https://d.kernelci.org/test/maestro:6a0c6216744d1c1da0215eac
      history:  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400c000
      last run: https://d.kernelci.org/test/maestro:6a0c6216744d1c1da0215eab
      history:  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_vcodec_17020000
      last run: https://d.kernelci.org/test/maestro:6a0c6216744d1c1da0215e80
      history:  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_16020000
      last run: https://d.kernelci.org/test/maestro:6a0c6216744d1c1da0215e7f
      history:  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a0c5fe2744d1c1da0211d94
      history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a0c5eaa744d1c1da021163b
      history:  > ⚠️  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a0c5eac744d1c1da021163e
      history:  > ⚠️  > ✅  > ⚠️  > ✅  
            
Hardware: qemu-x86_64
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a0c5f78744d1c1da0211aaf
      history:  > ⚠️  > ✅  > ✅  > ⚠️  > ✅  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
