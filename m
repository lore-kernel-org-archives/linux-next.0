Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A74B1A5B9E
	for <linux-next@vger.kernel.org>; Sat,  6 Jun 2026 02:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780713029; cv=none; b=daZ3v29NE0lwCw/okzevVBtAHzk4vEfnSADZElHjeNr+6D8Q2qv1I3OTPhOyPjkA8mM0hoEto0cSY1m0FwDbnv38LoPvEQdq5AUW/1ELo9mQY2oRB+4B6fVrMThwT68bKDcjH4tihcQ83nmsKv4DCc/z35JRN2ej5c8ewOzPMmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780713029; c=relaxed/simple;
	bh=gTAmVs2kRwZtaygHiL+8VnovGLTcy/sgAMqLcfZkP4g=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=XaSOaqXJZLXOim+QEE3RQJ4fP+v/OjxSpLOrvQmpJu3Thh/eWqAe1X0XupR/dKT1S+eVEVYG5xZ60fv3NdnYHAOxfaHisGvVq0cy0D0XsUWujtIGmy3g37p2bFrIKCFhpTKVAXIwQ5sD49awp/S2rs0Wki8PEZZD+Hl3Gk2qggo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=b8ctvRFd; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="b8ctvRFd"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-30759632453so2452128eec.1
        for <linux-next@vger.kernel.org>; Fri, 05 Jun 2026 19:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1780713028; x=1781317828; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+lDyXWzPfROs08Ncd2HKrot7r997xUo91Tvbi5FKXg=;
        b=b8ctvRFdXhxBDjjNd2vLpBn3OpIsF5e8mrDV9fJJdb73/qElS7lztH8eqQNFNYUxzn
         QAba3VP13+Ufv+yfNoVLfN0LMw2jvp/zXVvTPEofkz7wfm5PEBnwhF4s6U2Tn0FDOFTx
         SCjevUZgF2ZyUJ8FFjcWpi2zEArn92MoE3C610OaYjKDSJQBmXAfB58tWgLFx2tryUjk
         t125ZfGXGGZQwSd45dAmGQ83CoKMB1fFQiO+TGXPnn6D/GnvSxiBGFl/3GaztydVRl99
         +TbST5k/c5sJQoP+5Sa//+Y1Bd+eaK8hmB/ij81jfiaVy0Dzii/oOF1BzxhsSgNXaIH0
         vxbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780713028; x=1781317828;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p+lDyXWzPfROs08Ncd2HKrot7r997xUo91Tvbi5FKXg=;
        b=LuAg6bqXcd88QkFy7UEZq0DOBECfnoQepCExUGgelxmkB2zQqg99OiLU0PPbrmUumD
         XeODvVaZA3I5f0i+UssnGiVu5Iqt14rVk55xtrBdlEJy3qVCu3zbqTLEOYa6XXhaXnWA
         xOpMHLMp+BvV7PJhq6eHw/oRQtgJngLQsKcWAUIE5+Q44QNkhVVVSgx9ySWh3uT0pMQc
         bjfHswuOiNNfSh6GsCSsEW4ETC149x1B/KCPjtTJ2fVJ8vbsAX25FKVkkf6LiFhhh8lV
         xcbkkbxhjU2RyfsihmDJvbTx9m/z7YTaEHxTFePz22k8sDcyHIBuHvdbHkeZiuphOVCL
         4c9w==
X-Gm-Message-State: AOJu0Yzs/AXFHL7OzgR31JA8cjuwx+K+K1NIm2gb3cJ22wLKtMKEYn99
	yw8tRUkVtgDxQ/WgTT3dO9KYQDwiN+t9L+2uEMKWRLkQTWYzKu8iRF8L//RRBpvRxJA=
X-Gm-Gg: Acq92OHWjTdxMSQEgIkytiawaH5UNNRMbjXT5S6kwZ9QCf6oi6Xk3/RdkN5VusANsNx
	3TEyU9op9ZpsaMz0OcqeFeFH2BdOMsqGkiLUWJsp18P84ZrhMKQccwq+iaCdT2hgvEU7SN/gjDb
	zD/Zy+S89ustmX2XNoXUaZPjIvaFZ7LkeKT7eO1j2zDGJ9hzIOD4XZhxl/EqZ1KyVEk0miCPEVF
	xZHNks+XjOcoxapbuD1fmW4CH65AJ3nvrTUd/g2AMPs8yY+lvzdyrFWP69e2RqzBmYxk8nShAAQ
	FnhMq6xbm3Dp7moEgWKMjSOfhSrimKRwsHIVw1P16PuK6soE4ZW3Lgi2FEHclrVlZRiyOYC27PU
	PP7hC0u9MW55JAc8tx6UJL0LotnQkuaCOea3Iw/YUVU1D0DdPCxt7OhpJ5XW4F32UbzuPK0OyTD
	CuLfJn30oum91EFxUAVn5qh/O/51U=
X-Received: by 2002:a05:7300:7486:b0:2dd:6937:79d1 with SMTP id 5a478bee46e88-3077b0688e9mr3946044eec.15.1780713027471;
        Fri, 05 Jun 2026 19:30:27 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dea9226sm9483367eec.19.2026.06.05.19.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 19:30:27 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 6e845bcb78c95af935094040bd4edc3c2b6dd784
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sat, 06 Jun 2026 02:30:26 -0000
Message-ID: <178071302663.10884.7440646938920399289@330cfa3079ca>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/6e845bcb78c95af935094040bd4edc3c2b6dd784/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 6e845bcb78c95af935094040bd4edc3c2b6dd784
origin: maestro
test start time: 2026-06-05 13:57:53.901000+00:00

Builds:	   58 ✅    1 ❌    0 ⚠️
Boots: 	  158 ✅   10 ❌    5 ⚠️
Tests: 	23517 ✅ 3672 ❌ 3720 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6a22e01246e71b76f9f5daff
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6a22e09a46e71b76f9f5e157
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:6a22e2e046e71b76f9f60586
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.alsa.alsa_pcm-test
      last run: https://d.kernelci.org/test/maestro:6a22f83e46e71b76f9f6d1ff
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_backlight_lcd0
      last run: https://d.kernelci.org/test/maestro:6a22dfdf46e71b76f9f5d19e
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller0_14001000
      last run: https://d.kernelci.org/test/maestro:6a22dfdf46e71b76f9f5d165
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58_aux-bus_panel
      last run: https://d.kernelci.org/test/maestro:6a22dfdf46e71b76f9f5d159
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14008000
      last run: https://d.kernelci.org/test/maestro:6a22dfdf46e71b76f9f5d13d
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14009000
      last run: https://d.kernelci.org/test/maestro:6a22dfdf46e71b76f9f5d13c
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_1400a000
      last run: https://d.kernelci.org/test/maestro:6a22dfdf46e71b76f9f5d13b
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400b000
      last run: https://d.kernelci.org/test/maestro:6a22dfdf46e71b76f9f5d130
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400c000
      last run: https://d.kernelci.org/test/maestro:6a22dfdf46e71b76f9f5d12f
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: aws-ec2-arm64
  > Config: defconfig+aws-ec2
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a22e14246e71b76f9f5f4e3
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
Hardware: aws-ec2-x86_64
  > Config: x86_64_defconfig+aws-ec2
    - Architecture/compiler: x86_64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a22da0846e71b76f9f5a85e
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  > ✅  
            
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a22e2d946e71b76f9f60562
      history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a22db0c46e71b76f9f5aafd
      history:  > ⚠️  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: exynos850-e850-96
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a22e27f46e71b76f9f60081
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a22db0346e71b76f9f5aac8
      history:  > ⚠️  > ✅  > ⚠️  > ✅  > ⚠️  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_i2c_30a50000_eeprom_50
      last run: https://d.kernelci.org/test/maestro:6a22ec3f46e71b76f9f69796
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: qemu-x86_64
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a22dde546e71b76f9f5b5a6
      history:  > ⚠️  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:6a2306a646e71b76f9f6e878
      history:  > ❌  > ❌  > ✅  > ❌  > ✅  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
