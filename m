Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BA03D9546
	for <linux-next@vger.kernel.org>; Fri, 14 Aug 2026 02:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786674622; cv=none; b=UDpoIfD4BF3vSTcUAEyGrDlozO7ZOSfWyxNr3rgzfGro61HdIvFWjcH7dISejItOJL2DANw+ye5auyvKeb5x30i1PF9h3Ke7LoJ6DRbmB7HTT0B4N+G3vjT+D8BkJnXNmRbmCI0T6VO/kQoivOYKkZQJ4a01yd+4lCwoWDps0FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786674622; c=relaxed/simple;
	bh=BChFvpFAKz4Obqm4j2bvSnH2gknyQ0RfFx0kGQJEdNw=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=fe/xUjRqDJM/u3JduPfp9VaoV4Uojnkr9fHfagbVJx07RNA2nIJB/u7XrzYDnfL1Uv0p12bUEjD/fU+hPPMTPcUB8FgiXZ4jLUBi9Q4v4bvqZLFvKWlJEgqbHBtXdSgmEI5PKh8DnPf7ZhcZNoV00pz2F3RwZ/IVFldvzvhtvtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=VnVWlmE3; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="VnVWlmE3"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cbb8b54fcf8so388242a12.0
        for <linux-next@vger.kernel.org>; Thu, 13 Aug 2026 19:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1786674619; x=1787279419; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=i0d+ApUQnTWCOiHga2VaoLjSjE0dCNhzxhHAxSmUn2o=;
        b=VnVWlmE3C+LONbayam1r9OUO03Gjv0xDMiaEKlbDMBpbUlYQoz/Au6RvQ5DS6xzR/M
         WVxOGC6ZwFbZhABOoSwCb8WHN+loyywvHKsZ3dE/jWZv31uNwNPy68ZBZy02apIb3tFR
         7O2cjF3HGEVSX89MNVM1SfkPoL8EE1MhRBJs4HOkNlcV6Pv92CAbm6jYzZVFfTMlS2tl
         rR+BAZ9ehpqsL4UiY3SqQF/jps0ZnWf2GDbCSkgQoaLn+YIwl09AO2YJ9tgWzFaFqrVN
         rOB1a1jSrUuEeZtCIOwQr8FBA7pQOXaWn43WSYKd/pzL4FrVvSdJ+F0VF6mPwirDu+TM
         eF9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786674619; x=1787279419;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i0d+ApUQnTWCOiHga2VaoLjSjE0dCNhzxhHAxSmUn2o=;
        b=CP7GeRHdgi1F74zVJMD1Lbe4LEXyLYw0cz5JS+FQcY5T8jHNcb9vm+smVuOFV7rMgQ
         lGW0ErC80QlpLeGRpIIX3lhvJ0L7nXIqVEWWTottbeuOJudUWw6kj4XUP90Z2tfU3jel
         JGHboNN0+AeUFmDGXzLTTebe0KyB0q1t13/hbu0RheDqywOmaCwricHQzuF/Zlgy8jy8
         j71qvuKuEutM6KM9CkePYD+Y2+llFKY1tIANGyeIkapohTZ3esyQxn7JLhpT/VH4I1O4
         1haXqiCKn6DbqqG3F6DWoqLX8TijcTdk1ZALExwPOHob8F6LP46dTPrWc3ZP8dwe20hB
         zuFg==
X-Gm-Message-State: AOJu0YxKStGeNsjItOYCBDSgdH+2gJzs8aSCk5Mt/TsXNNnpLUY6IgZw
	jg3KRH+4QQIuJnn5g81SXYuAN358rYOdPOpK9Bt9cskvbGmFISt8qmS+HeXdtw4Vyiv3hCXFUor
	joR1P
X-Gm-Gg: AR+sD112Yo/lr7AeXB512XlVTaMOQ61QnT84BUiRA2faWWjnlWiqlY3L8CZlZ0OY8uf
	ND+NYKNMqa+w0chUUw2lU3yeVc/Z4oztw+u8kYNc9yiWn9KTN8wZQmOEO0ZUfAbKF8YuQWdcmMB
	IhQC0uj5ZsjYXlOb6pr7hkebpJNBIzcpgh0yANaZE2qdO9BYcYWK67qusqPefjgJsl97KDaZumc
	ceeLH2vNNRY72snK4IXsKh3lRZ6YRCRcgzoM/rMrXhS3EvuWaKX+y7DHe60bD1D8wmN+aMNo4d8
	YVB6iiF8TfSr3TwyiiEZ8FG8nHr2CfEmMSOMJNVJ3K6DJmt5bas/ElUa8VkKCAX0hVy3e+xuLus
	UJHRl4TnwYar7OC8Eyydlc60rVxpikdTZo88WHHUk58jjc9jIpiwo5nMR/wmQvI0gjXp9D8Y9FI
	Bi+lut1/5PLtXSCon0iwlw0+nNnZdriE80SvppVRszU11V9d0ZjGvg
X-Received: by 2002:a05:6a20:728f:b0:3c4:397a:69b8 with SMTP id adf61e73a8af0-3cc71d1f54emr1973381637.21.1786674618637;
        Thu, 13 Aug 2026 19:30:18 -0700 (PDT)
Received: from 9a65d8f5b626 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebcb6a9a3sm12500853eec.12.2026.08.13.19.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 19:30:17 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 2697ef8943c9985c14708a6429e21812693857b2
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 14 Aug 2026 02:30:17 -0000
Message-ID: <178667461662.3192.8271205647015064503@9a65d8f5b626>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/2697ef8943c9985c14708a6429e21812693857b2/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 2697ef8943c9985c14708a6429e21812693857b2
origin: maestro
test start time: 2026-08-13 16:23:44.519000+00:00

Builds:	   65 ✅    2 ❌    0 ⚠️
Boots: 	  173 ✅    1 ❌    0 ⚠️
Tests: 	34063 ✅ 5316 ❌ 8184 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:6a7df8b862f33761c0bdde38
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_crypto_30900000_jr_2000
      last run: https://d.kernelci.org/test/maestro:6a7dfff562f33761c0bea581
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_crypto_30900000_jr_2000
      last run: https://d.kernelci.org/test/maestro:6a7e0b0562f33761c0bf4605
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_crypto_30900000_jr_3000
      last run: https://d.kernelci.org/test/maestro:6a7e0b0562f33761c0bf4604
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: sun50i-a64-pine64-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:6a7df8e162f33761c0bddf36
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_af54000
      last run: https://d.kernelci.org/test/maestro:6a7e101962f33761c0bf7812
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.mm.mm_ksft_hugetlb_sh_thuge-gen
      last run: https://d.kernelci.org/test/maestro:6a7e2e5262f33761c0c0647d
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:6a7dfff562f33761c0bea52d
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_ac0000_i2c_a80000_i2c-mux_70_i2c_0_bridge_58
      last run: https://d.kernelci.org/test/maestro:6a7e101962f33761c0bf77e7
      history:  > ❌  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.mm.mm_ksft_hugetlb_sh
      last run: https://d.kernelci.org/test/maestro:6a7e2e5262f33761c0c0647a
      history:  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: kaanapali-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.clone3
      last run: https://d.kernelci.org/test/maestro:6a7df87462f33761c0bdd982
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_clock-controller_3d64000
      last run: https://d.kernelci.org/test/maestro:6a7e0c4762f33761c0bf53a4
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6a7df8d262f33761c0bddee6
      history:  > ❌  > ✅  > ❌  > ✅  > ❌  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.clone3
      last run: https://d.kernelci.org/test/maestro:6a7df86f62f33761c0bdd95b
      history:  > ✅  > ❌  > ❌  > ✅  > ✅  
            
Hardware: qcs9100-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_22000000_displayport-controller_2215c000
      last run: https://d.kernelci.org/test/maestro:6a7e13e762f33761c0bf8f2c
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_i2c_890000_i2c-mux_70_i2c_1_bridge_58
      last run: https://d.kernelci.org/test/maestro:6a7e13e762f33761c0bf8f00
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_iommu_3da0000
      last run: https://d.kernelci.org/test/maestro:6a7e13e762f33761c0bf8ee1
      history:  > ✅  > ❌  > ❌  > ✅  
            
Hardware: sm8750-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.clone3
      last run: https://d.kernelci.org/test/maestro:6a7df87262f33761c0bdd97d
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_ethernet_23040000_mdio_phy_8
      last run: https://d.kernelci.org/test/maestro:6a7e101962f33761c0bf7808
      history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_iommu_3da0000
      last run: https://d.kernelci.org/test/maestro:6a7e101962f33761c0bf77d1
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1c00000
      last run: https://d.kernelci.org/test/maestro:6a7e101962f33761c0bf77cf
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a7e13b462f33761c0bf8dc7
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6a7e13b462f33761c0bf8dd4
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.proc
      last run: https://d.kernelci.org/test/maestro:6a7df8bf62f33761c0bdde5b
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.proc.proc_read
      last run: https://d.kernelci.org/test/maestro:6a7e114762f33761c0bf8128
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
