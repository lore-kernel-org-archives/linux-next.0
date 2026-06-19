Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24EC40D59D
	for <linux-next@vger.kernel.org>; Fri, 19 Jun 2026 02:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781836217; cv=none; b=gJkVxYPN4YJcXCVOLObRLrEmUajMzxQB9/IcVSfPmfsBjU3/NsrTylVtwJCcxj78RLB1ntONginEm5i4wokIS+D5YoSYw1WcetgD7Qre1JGb79lHmGUPAU88c+6WdXxTfPVM897ZVUT74pre+dUrR0jKzc+Cy7VflyyVz0C1NLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781836217; c=relaxed/simple;
	bh=p+/HqoPa04/i332k8glcL/K2anyoYCPxiDsfBNbjm/Y=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=qnDTCSg8Ks1OZ//Js41iOyMxxTvB+bqcesO5UKrOiVWNh1WEkSAQATRk3tOvW+zcYcUbEsjHIiTiB+i9JNUReMxQTlpIywuQa+m82PP+uSC84oVxm7NmlapDsAdGqL08rt5PDglh3EAH6Y+nYL93JzszCS8VQyVBL0qto0GniNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=G+4OOIcw; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="G+4OOIcw"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-30bcf74e617so3527563eec.1
        for <linux-next@vger.kernel.org>; Thu, 18 Jun 2026 19:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1781836215; x=1782441015; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1qqzGAWsC8dCV1FrGN+KWTXsixw1XQRgfSd6NtIqx8=;
        b=G+4OOIcwmyFFtuDN908iYTEyxxeXnzuXBWcwW4ZWpatusLpxDBy9AtfParn+SXZA4K
         gwMXhiM7aCdRT0H1EJ4eFDMQrhgV0qHqZZDF3js6z9ltSXofX/hDS6ApL2Ree2tGbdgA
         EHeLFCE/4sVaUASlRuKJFiQ4PJDbrsGPXvMW+nfC2mXZl94LxGYLhoee+e6t7/wZwHt6
         yRkFJ/TdH80oORjuKkPtGVGk3cGA5gTMJQmCItQKCsTHfRO3ieQRJg46gHNgyJs+jYCy
         XrnpaAq5Z2+Q5C2ceBULJS3XQ5AjxblTIq4sihWvWnOnRBSJK0w9Ev57480An/uJ3+rf
         svnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781836215; x=1782441015;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b1qqzGAWsC8dCV1FrGN+KWTXsixw1XQRgfSd6NtIqx8=;
        b=DL4EmKD9lGKwfr9wj9pjqumi2S9ielphv1wNYI7GA4+jN8e6IQQhRXdZSL+PxfmguU
         voaGtIxVp8Goz9xl3I0854vIowDvfL5wBeImm+3IsFsroUISEQ/rk8QMj6/XzRRt5fJs
         FXAx/K/45zqVEkSiEKxCkNPRuyieS7NXExqwJuj4EBGPOP/09ihS7ZVhDDeDU5xmpmoq
         5rL3bOXYat6piUn5aLMdFzctx9XotsrK4B9/nvQ72/2NZds7Zt3Iysn78ivsOmYtKGDt
         fPJsf7FRvQGnsu4O1Ii2hixkdWHNLLiSRPxQYZWnxYxVyf8Up6O6GQSkDyFtsNGqgxOp
         u5iw==
X-Gm-Message-State: AOJu0Yx9vRf6XNADPadmmtlPZUCVTGNM7gqX+LN4tlI9WWpIjxdg0SJB
	MAUx2gYYkXDrAhHNfCzbgdzFwoqRol9/o0OEShskKTZ0IcrsPDgseHST+9QHUnnbB6c=
X-Gm-Gg: AfdE7clnW4ueU7ApTBmDfvFnAJqoipoht5DDUFumFHac+THuxsh6a/w2nlG7pMC8r4v
	HmQPpBFjKUQVG5IOzStzQ7GRIbyiAN58VTlg1Px6S9eO9TeYGRgmLXBOpiRaWmthWaiB58yG7zw
	K7/i/FnIoua+Mqt3gJhLA4HmJdANV2nDjJBFZtZ9B5vhRhAZ72bIBJsYd5V94dQmT7h2axe23BI
	IK2RvcyY7HYt+Yf2gsgHwZPsIkaTvSPIngTr4OyhGvNW+BAANOLZLYdW5JA0AA/iL6PPTRTBSCw
	LZ8eAfM5q9GXXNDVDzKgZie0v3hHVIdZrlZ9tupk9JWtZfbZzMPw7LyO5XJXTKBoc18nJS+Jk/1
	E2RUZ4xcvNw51d9Ml1J7Nv6Xby8eA66hFw6v0l2n7OSKFQYmbhhGbtnJcFigr+lvjky6RA6bj2O
	i7pevMUg==
X-Received: by 2002:a05:7300:e60d:b0:304:de28:1b16 with SMTP id 5a478bee46e88-30c0724112bmr1110800eec.28.1781836214620;
        Thu, 18 Jun 2026 19:30:14 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c066cc1cdsm1198081eec.4.2026.06.18.19.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 19:30:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 598c7067dd8b65b93f3ccada47e9014a13137f1b
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 19 Jun 2026 02:30:13 -0000
Message-ID: <178183621334.16863.18116480971840410458@330cfa3079ca>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/598c7067dd8b65b93f3ccada47e9014a13137f1b/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 598c7067dd8b65b93f3ccada47e9014a13137f1b
origin: maestro
test start time: 2026-06-18 14:31:10.542000+00:00

Builds:	   65 ✅    2 ❌    0 ⚠️
Boots: 	  199 ✅    3 ❌    6 ⚠️
Tests: 	28762 ✅ 4823 ❌ 5577 ⚠️

### POSSIBLE REGRESSIONS

  No possible regressions observed.


### FIXED REGRESSIONS
    
Hardware: kaanapali-mtp
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.efivars
      last run: https://d.kernelci.org/test/maestro:6a3409a0ec8c0238939a5d8b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: kaanapali-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:6a340fa3ec8c0238939a90a1
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.capabilities
      last run: https://d.kernelci.org/test/maestro:6a340f8aec8c0238939a8fec
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.clone3
      last run: https://d.kernelci.org/test/maestro:6a340f95ec8c0238939a903d
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6a340fc0ec8c0238939a9115
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.timers.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:6a34186fec8c0238939b3b32
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a340fd2ec8c0238939a9182
      history:  > ⚠️  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a341048ec8c0238939a9469
      history:  > ✅  > ⚠️  > ✅  > ✅  > ⚠️  
            
Hardware: imx6dl-riotboard
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a341048ec8c0238939a9473
      history:  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a341052ec8c0238939a94da
      history:  > ✅  > ⚠️  > ✅  > ⚠️  > ✅  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_i2c_30a50000_eeprom_50
      last run: https://d.kernelci.org/test/maestro:6a341369ec8c0238939ad721
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.kvm
      last run: https://d.kernelci.org/test/maestro:6a3409efec8c0238939a5f19
      history:  > ❌  > ❌  > ✅  > ❌  
            
Hardware: qemu-x86_64
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a340770ec8c0238939a311b
      history:  > ⚠️  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller0_14001000
      last run: https://d.kernelci.org/test/maestro:6a340c88ec8c0238939a7c83
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dsi_14014000
      last run: https://d.kernelci.org/test/maestro:6a340c88ec8c0238939a7c80
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58
      last run: https://d.kernelci.org/test/maestro:6a340c88ec8c0238939a7c78
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58_aux-bus_panel
      last run: https://d.kernelci.org/test/maestro:6a340c88ec8c0238939a7c77
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14008000
      last run: https://d.kernelci.org/test/maestro:6a340c88ec8c0238939a7c5b
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14009000
      last run: https://d.kernelci.org/test/maestro:6a340c88ec8c0238939a7c5a
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_1400a000
      last run: https://d.kernelci.org/test/maestro:6a340c88ec8c0238939a7c59
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400b000
      last run: https://d.kernelci.org/test/maestro:6a340c88ec8c0238939a7c4e
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400c000
      last run: https://d.kernelci.org/test/maestro:6a340c88ec8c0238939a7c4d
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
