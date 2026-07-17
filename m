Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066E319E96D
	for <linux-next@vger.kernel.org>; Fri, 17 Jul 2026 02:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784255416; cv=none; b=SX9b/oRpUyt3AnaHYwC9joJM2L6RGT9RIg7i4QKlY5n4JzJq8IZyjsp3/hR4EoRJKPeNBzQjhHdGjrZwtKNjR/ZCtb2nQE5ZL/1cXuzldoGxo3rO79IAtZ4vxX8oqcODh2aA4wHGnxLzYEqBn4/ihh5o6fIq/30lzPiaqa3+8O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784255416; c=relaxed/simple;
	bh=954xsjVdI9y9AuRQGQ4P+43Pc+9jd7EDmshSwF7Ml7s=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=kSjbGhDm01b905NcJSHs4VbRfQ2f5dzJ539k4VXYyOPZzGFhDlZe0AJAnAcCDJhpCzDeACsy6smsAckG0RuutOm8E/kBIYXZopj2kySu9ufJAI4CRABkj1NCzuecW+7WoxBa4EYRhbnqYptTr894p5sn4RJuWjyAAlB8oD/HwgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=ZZG/Nluj; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="ZZG/Nluj"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-383cb94f742so6936157a91.3
        for <linux-next@vger.kernel.org>; Thu, 16 Jul 2026 19:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1784255413; x=1784860213; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bWYLBB5tACP196qTjAL7di0p2jCa5nZt4LwUGKvXjy8=;
        b=ZZG/NlujUuscH4dbaIZJnAGeIf/TVQdfYfdlHNkQe2BNUT7Z1/50HT4o+t5fmwcDqA
         sCpVpmBk7xLhkOvdiFImBTS0s+I7iMAbvazcbJ92PrxmhLecEGUfP3q3jBsVymYeSK9J
         AJgHHEXfovDDwrPdtU2l34mceQiAI8OcEy6eNmGQ8I2nVDHHu9RyUuQlz2PcpHQrv/oZ
         PyexhCRX9IWLmu5DqIROfzCooIk5vUd+dXEMbOyJ+9mbeIxh603xLK98Gxyquq2Fpnbz
         UVczwMDT6aYBCeM/2v3SUUYLK6/qeMp5svFQPQhkQ9fDeDPqFwdyNLcZ8RRKOkkREWa2
         k/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784255413; x=1784860213;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bWYLBB5tACP196qTjAL7di0p2jCa5nZt4LwUGKvXjy8=;
        b=L02BpCGpxxOTy169rjSEK+DyajPwlLzfF0o02w/Ja8YjXzZ9g2crW8dIvZs4fSzn6A
         N6L85inuG7pEm0UfRcEoe9d7o4LrBrGfusUQGgvQqJL/GGr40Q2L05b3la41gtrsGeuv
         1HlFu8GScO/Yjj0ODWUBBo/wrAPRzCEfem+MY6po711AY1Oi+qJWxuqmxNTPo3C5P+hN
         mwyFp2gEjg+lTR5dney40aWBaCfIHilYtaIiLKI3byc/whlp1KyGQ2Xox8thgeP4ZONR
         reCNQY6LrymAq0whDVa3r1VP5DlHaBvyYhKcusTEzdLnkp/4aQnJjeQVwWtg8HVKPTNf
         lKhA==
X-Gm-Message-State: AOJu0Yzo+KCrbPFc/qQmbbfeDN/70dZz4DfhmCl/Kdx0ywskUjHGIFB6
	yqbF/jwOSqWiYrkGhwQN/ee+MPF4LDerGIq1LFucllVs0c/8SVWpUpbWKTyqdnz4iL0n8vx8YzR
	gDUHc
X-Gm-Gg: AfdE7cmGREReycnz+oggl9XKTIr9Qmys4QzodX7jkmEVpAYSfXN2zIZrb7BF6gfdceK
	pspQEvkNuzmq4x51fdubXczoO9/e7supsbIGJDg8BjebOMFoqSxoREYXxp6LSqLd5J3wk6St7/3
	VGaiUkfBbs4XxTzRVaA9OQ/wxewi4ZuwtTfzS8vjKKrJEuNbOfounNqKH6A5qF4XW+gf8tMnoiZ
	mlS9BuAUnqwyYDY4pruIEmm/lpl/6joARTIH85fVKLGC+R3QEUcRRHRpryjJJIi+KkY99tlhONE
	vnElwuvb2xhZYrOZBuT9QGqTIBMnJX3fRq/OZKhSs401e+LusTPxmeHnjCKDk+pWPu0ZQGOKekH
	wf4vHfRw+DNBDRVolOrKbfHKjta0GnrF5cbaBh9c0gpoBH+eJPo9/+/tmcGEi77ptgLKa6RA=
X-Received: by 2002:a05:6a21:7111:b0:3c3:90e6:48b9 with SMTP id adf61e73a8af0-3c3ada516e8mr634852637.66.1784255413153;
        Thu, 16 Jul 2026 19:30:13 -0700 (PDT)
Received: from 963b246bc1b3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2cbb6e8sm244562c88.9.2026.07.16.19.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 19:30:12 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 1a1757b76427f6201bfe0bf1bea9f7574f332a93
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 17 Jul 2026 02:30:12 -0000
Message-ID: <178425541168.11791.12744157396998971322@963b246bc1b3>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/1a1757b76427f6201bfe0bf1bea9f7574f332a93/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 1a1757b76427f6201bfe0bf1bea9f7574f332a93
origin: maestro
test start time: 2026-07-16 16:02:07.983000+00:00

Builds:	   72 ✅    2 ❌    0 ⚠️
Boots: 	  169 ✅    3 ❌    0 ⚠️
Tests: 	30584 ✅ 5581 ❌ 5627 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_i2c_30a50000_eeprom_50
      last run: https://d.kernelci.org/test/maestro:6a59531f3427a5b0fbe97cb3
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a591f2d3427a5b0fbe5d0e2
      history:  > ✅  > ❌  
            
      - kselftest.arm64.arm64_hwcap_sigbus_LSE2
      last run: https://d.kernelci.org/test/maestro:6a592bc23427a5b0fbe6947e
      history:  > ✅  > ❌  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.efivars
      last run: https://d.kernelci.org/test/maestro:6a5912dc3427a5b0fbe54308
      history:  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.breakpoints
      last run: https://d.kernelci.org/test/maestro:6a591f3b3427a5b0fbe5d24f
      history:  > ❌  > ❌  > ✅  
            
Hardware: cd8180-orion-o6
  > Config: defconfig+netdev+nfs-root-boot+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a5909fa3427a5b0fbe4fc71
      history:  > ❌  > ✅  > ✅  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6a5909fa3427a5b0fbe4fc68
      history:  > ❌  > ✅  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:6a591f693427a5b0fbe5fb2e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.alsa.alsa_pcm-test
      last run: https://d.kernelci.org/test/maestro:6a597d803427a5b0fbeabdc5
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: qcs8300-ride
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a5912fa3427a5b0fbe5448d
      history:  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_usb_a800000_hub_2
      last run: https://d.kernelci.org/test/maestro:6a5985173427a5b0fbeb7c67
      history:  > ⚠️  > ⚠️  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:6a5980ff3427a5b0fbeb32ab
      history:  > ❌  > ✅  > ✅  > ❌  > ✅  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller0_14001000
      last run: https://d.kernelci.org/test/maestro:6a5909a73427a5b0fbe4ec31
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dsi_14014000
      last run: https://d.kernelci.org/test/maestro:6a5909a73427a5b0fbe4ec2d
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58
      last run: https://d.kernelci.org/test/maestro:6a5909a73427a5b0fbe4ec25
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58_aux-bus_panel
      last run: https://d.kernelci.org/test/maestro:6a5909a73427a5b0fbe4ec24
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14008000
      last run: https://d.kernelci.org/test/maestro:6a5909a73427a5b0fbe4ec08
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14009000
      last run: https://d.kernelci.org/test/maestro:6a5909a73427a5b0fbe4ec07
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_1400a000
      last run: https://d.kernelci.org/test/maestro:6a5909a73427a5b0fbe4ec06
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400b000
      last run: https://d.kernelci.org/test/maestro:6a5909a73427a5b0fbe4ebfb
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400c000
      last run: https://d.kernelci.org/test/maestro:6a5909a73427a5b0fbe4ebfa
      history:  > ❌  > ✅  > ❌  > ✅  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
