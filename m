Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C322121E091
	for <linux-next@vger.kernel.org>; Tue, 31 Mar 2026 02:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774924217; cv=none; b=JHHXH9z9l3loxZ/HSWpPR8KlfKolcH4gTV7KFqM5GRh14EFWANFBuUn563DLPFvg4QD8F6U2FN3S1Wn0m+T8yvpWc1AuHpe/lzhx+kIaN0jJYnau63f8Km5U0rFNclJRh4zqpjsSN/tWy7v0xC3yffFAihabpkcODe8A4hGjrms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774924217; c=relaxed/simple;
	bh=vl5pwS+aFi37/thT0mK0B+1NOnhWQ8USaYridJfucUU=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=gZOTBMMOsDgCZbyKz6DMEqifEIma1v83qjKO0Wa+/0xydAhU2gmS6JStklXlYUsf5+WWbz0JYOEds/HHjqbyglaM/iYHih+Xwl5HFs2MIth/5BXedtflkfv87Z/64B/nQ1C5og47EM96/oCyRYuXRhV69mQE7u+fma0jB0xZTmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=zYFUt5xc; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="zYFUt5xc"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-128b9b7e3edso208614c88.0
        for <linux-next@vger.kernel.org>; Mon, 30 Mar 2026 19:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1774924215; x=1775529015; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJ3Xuxsut09k5cZLaRh1MAn/ilcZcdD+3/vbDu2zjtk=;
        b=zYFUt5xc2YiM9SNuKI9EoDp+3LqMgjOzfQ6bJen2JoqFd/wPjzVuQuKaFix0Dg+bFY
         SMvGA2OERU2kbUSYfAvtut/Z7EevOI2Avj4vkHRDvJgIeVEotXFdNFDMUEs3/tOjl/Mv
         iae26anuSG1QaKYrolkBWLNq6SmKVBPG0I54eyvvoa0AEJQnzUe5SWpSky/Rk+TlmQXD
         qvlpZG6vzH+06erGPU/VcttabKkpUavCwJJX9VtLAnjQOVrTfRe0lbgD+OJtPjX4BQg1
         3Se4cUWJRmkxu8f72HILyZ+IaYz2UUXQ1pXOriQ3I5Wxv6GA4zfn4q8HF4WcDpqsFu37
         t+Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774924215; x=1775529015;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GJ3Xuxsut09k5cZLaRh1MAn/ilcZcdD+3/vbDu2zjtk=;
        b=S6+86T0db9EjcXe5eBY9+0yOpdwz2mzRkRg1hPbFjnOmTYnDei3Wc91mE+q+fvnDSP
         s7/CHI6sbMEsC5B3LgaYkh3OR0dQwdXMxkYxUaNyvyopinAT8CbRr+hAQBiG5ahWPKYD
         DGI/vnYVRiS5I+hDbuDzm42DNWafM8wRGJ5DGxk7wSRAVHPGnNFWM41w/CRwzuMayYPZ
         AHnL+PVgRMXhCMNIhaILeY/bJFqjJ9/Go0sApbXhN4fGAL7MWX3o81NfT29XFkOlXzya
         n5p4tssKkeA44tw7ZembI2mafxkneFJnAHYdcF8WDEYsv57uYV77VVnqdszBNg7zvHIa
         A5gg==
X-Gm-Message-State: AOJu0YxpaLSOe4AJ5voTk/7dgOX3nDLvpXwpWk6OXLy1OEIxq+68QCrM
	DhDybVmVSSQV4OYerzKWndiFy85ak7S52yql9+mD8SFd5DpLQEoA2PgooPjrIbx5Tzl2oNY5HQU
	keWpA
X-Gm-Gg: ATEYQzwVcZ20nq71Db9SNAy5rX6/RhPqBsQOBCtsPe9p4lGlMb+kGiEiz7vJCnAyH31
	DSqUtrHS5ZZ5A1xb5Us364RPVnMH8QXVYTmKvIEHDQ3zuZPnYYCDapK7F200Bp7o3y0tokHmYF7
	XqT2fWnNiWy9T0dvmG+BCLahLAHgIkjwwlU8Zjwbr9yoNMf122bxMxXMyLqR4WwGsYrtHiBGK7L
	O074n4cU7w7HWwuARX423ZTZRHfZQfsbXtyz8AdOpGUeRFi+xZAxMs3wGiK+PcCmk2OAVWgYKbp
	y0b+7HPb7grYW+vY9OXvvd+s/O3oI74wdhUKyNur3fujZdoTArqkoLSwZxpqV2uUXogMph/8G1x
	4/gK0eYvIwnYEsCV0qWIMFGkAqVbXbOUibQy8yVpI824exVgR6zoZ6DyOf9z72f7oZyEpfSJlBU
	Cm9oeC75tPpt0iQ1dm
X-Received: by 2002:a05:7022:f102:b0:11d:fd26:234e with SMTP id a92af1059eb24-12ab28cdebbmr8781415c88.16.1774924214488;
        Mon, 30 Mar 2026 19:30:14 -0700 (PDT)
Received: from 984b78e0ad75 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12aba581027sm13921491c88.4.2026.03.30.19.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 19:30:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - cf7c3c02fdd0dfccf4d6611714273dcb538af2cb
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 31 Mar 2026 02:30:13 -0000
Message-ID: <177492421323.345.6003596771436215612@984b78e0ad75>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/cf7c3c02fdd0dfccf4d6611714273dcb538af2cb/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: cf7c3c02fdd0dfccf4d6611714273dcb538af2cb
origin: maestro
test start time: 2026-03-30 20:56:35.827000+00:00

Builds:	   57 ✅    0 ❌    0 ⚠️
Boots: 	   98 ✅   89 ❌    0 ⚠️
Tests: 	11899 ✅ 3374 ❌ 4256 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: qcs9100-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.cpufreq
      last run: https://d.kernelci.org/test/maestro:69caf0cadcae953c05650e25
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.cpufreq.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:69caf61cdcae953c056555cc
      history:  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_utimer-test
      last run: https://d.kernelci.org/test/maestro:69cb0607dcae953c0565db93
      history:  > ❌  > ❌  > ✅  > ✅  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_utimer-test
      last run: https://d.kernelci.org/test/maestro:69caf25ddcae953c05652a3d
      history:  > ❌  > ❌  > ✅  > ✅  
            
Hardware: meson-gxl-s905x-libretech-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_utimer-test
      last run: https://d.kernelci.org/test/maestro:69caf222dcae953c056528af
      history:  > ❌  > ❌  > ✅  > ✅  
            
Hardware: sun50i-a64-pine64-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_utimer-test
      last run: https://d.kernelci.org/test/maestro:69caf39cdcae953c0565458f
      history:  > ❌  > ❌  > ✅  > ✅  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:69caf0f9dcae953c05650f16
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.alsa.alsa_utimer-test
      last run: https://d.kernelci.org/test/maestro:69caf1ffdcae953c05652777
      history:  > ❌  > ❌  > ✅  > ✅  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_17030000
      last run: https://d.kernelci.org/test/maestro:69caf1cfdcae953c05652342
      history:  > ❌  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: acer-R721T-grunt
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:69cae91fdcae953c0564d587
      history:  > ⚠️  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller0_14001000
      last run: https://d.kernelci.org/test/maestro:69caf1cfdcae953c05652359
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dsi_14014000
      last run: https://d.kernelci.org/test/maestro:69caf1cfdcae953c05652356
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58
      last run: https://d.kernelci.org/test/maestro:69caf1cfdcae953c0565234e
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58_aux-bus_panel
      last run: https://d.kernelci.org/test/maestro:69caf1cfdcae953c0565234d
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14008000
      last run: https://d.kernelci.org/test/maestro:69caf1cfdcae953c05652331
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14009000
      last run: https://d.kernelci.org/test/maestro:69caf1cfdcae953c05652330
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_1400a000
      last run: https://d.kernelci.org/test/maestro:69caf1cfdcae953c0565232f
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400b000
      last run: https://d.kernelci.org/test/maestro:69caf1cfdcae953c05652324
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400c000
      last run: https://d.kernelci.org/test/maestro:69caf1cfdcae953c05652323
      history:  > ❌  > ✅  > ❌  > ✅  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
