Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E47F2AE68
	for <linux-next@vger.kernel.org>; Sun, 19 Jul 2026 02:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784428216; cv=none; b=gNzaMUFZX+HSqUYL7+Txd+7YreaXVeDxdcIRrbNFs/XWN2ps+OuVXzhlQNHWdEHEz3SNsXgC8NywYEatx/KcVIVFD7UbCvQYaiJvgNCQzOd7ENrxvQJdtCXDViT8ophEnul5SD7nIK2j0jCAj/GYUu0wUUUOY7VMXvCy/OKQxmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784428216; c=relaxed/simple;
	bh=bvRd/rpEb3EqyqLj7MpEHGCdPg/xN4yiDT70inRPdB0=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=a3cO6F38QGqc1R0lu8w5GjmW0e+9mTYaHh3+J1lji17LbIOlkXGrO7NWhOEj+l3ZIwJEZE5gIMXoHNlBlBuD2Ewq0d+Gi8/ChjlxSOL2Y2ytUTVbn1UA4y7NxzVQcJA0G9obdwZ+/ef0R4l7iVqzJoD5Xn6RdVR/bLUwOgruUr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=dQ3urySF; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="dQ3urySF"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso6462271a91.1
        for <linux-next@vger.kernel.org>; Sat, 18 Jul 2026 19:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1784428213; x=1785033013; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AA3WZVAd7QUN0gwfekrp/jxE6Y0oh0JOR/LlWKmB2OI=;
        b=dQ3urySFnC5Yn5Wep46gTxfYYLGqYgEFMDz4gPgznCtYZEhVoJrcjLW81u5AI+or41
         2jlUx+FPA6i0TpbbSQbCSRGqfbDsHMOHAwTRj+FWpCr4XO7pgCHGcWIG2YCl0kUCzTaI
         rLVueCEU3QsQSGqsvyWam9zUHWRbGYW+QVg3/I1Vv6OI2BhXtytGIEV3aMtfY6muK53n
         +GPUJ6TfWxbiti2qi7QwxnYd/RJ9Q16QJzY6zq0Vy/+/S1gIoauLEjzyAc+F/7mDVm7L
         hdW+L5qHryV2I660i50juZS73Tx2K+SVYJ+e922ssOIUIS1715ThMfuNzSrY0cpIKwle
         jg0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784428213; x=1785033013;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AA3WZVAd7QUN0gwfekrp/jxE6Y0oh0JOR/LlWKmB2OI=;
        b=k0uZF/3T774Ac5zjaUgO7g6Y41MnM73dQdal+J4pjyoiiDwuURdBjUsIuuB7yNJf46
         xy2eukb5ztLv78dI3wbaOw2dJrn3t10nh1Y7NIwtW9a39ADPRk+1jBPXjJ5LgdV7Qufa
         ZIGB8KaiLnAqHYRW9u6wDFD+tlK/ZsGj2sUFBGbqkuUc+0EbAUFz8VYszFlt0gwkUQYV
         +iBenigo4o5u0DPnU/84z8hgWrceoeZaQhShwkZmM5Th1EBywToq/snah38NzwxKo8AU
         vYYDk9mvAnT8nbxoA1S1msm00zGr+X1l4uvFni/c7Pj2Liho2PlmGo+0lAwF/wua5Ika
         AMug==
X-Gm-Message-State: AOJu0YxEfVWgSqqI/ClGy3ZdRf5qM652QPM46ZLW5Yhi9d7sAheUBvZK
	iN3yVo4iWR9R8eivrBHX2RFH0I2eqLDfJpThjQ6P4bsHB064HPaKcEKSpJmuxWnsDSc=
X-Gm-Gg: AfdE7clM7b/S08FKy36lgdR/0svIqFPb5wdO0Z0DaTRaL8ydoQ9MbeYlQCUfu+Gr+P4
	8EGux0dR5I36jKqRUAN4Q2z6lhDwZN2gnuvcx1bEPOOTBF1N7NhoWIFNEeKQzKPrfSenR2JSk8f
	9gwV/3kC5bwCmdeSPnT3fFAZe1skb8tpqAmICpo6DGiNYALox0tIPNz4S4IwBDDcNG/iGJ+TyQ9
	c7U6UoIHyp275KGMQPVd1L3i23Hg9Oy/nlvQ9iDmEuX4kTsME+QtClV9W9TwMYuEVTonFe18pty
	bykjnWoukJ0ItmEd01Rj5V5B4V1eUQzUaI2GFF7X4ZOpjqnzEtLUcTuVJNEbKr2cYqktLyiLLLi
	RDCB7ZnEEYpAR0XtoREY1EtcT5NmQ5uvVCX6p2LUnPHDGIPq93WeAFModDEp1QEsds7HTxww=
X-Received: by 2002:a17:90b:51c5:b0:38e:120d:df09 with SMTP id 98e67ed59e1d1-38e4b5455bfmr9571502a91.25.1784428213391;
        Sat, 18 Jul 2026 19:30:13 -0700 (PDT)
Received: from 963b246bc1b3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2ddfb35sm18582076c88.14.2026.07.18.19.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 19:30:12 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 0718283ab28bc3907e10b61a6b4be6fefa1cbb2f
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sun, 19 Jul 2026 02:30:12 -0000
Message-ID: <178442821202.12747.729944418541945447@963b246bc1b3>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/0718283ab28bc3907e10b61a6b4be6fefa1cbb2f/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 0718283ab28bc3907e10b61a6b4be6fefa1cbb2f
origin: maestro
test start time: 2026-07-18 00:17:56.916000+00:00

Builds:	   72 ✅    2 ❌    0 ⚠️
Boots: 	  151 ✅    3 ❌    0 ⚠️
Tests: 	29068 ✅ 2552 ❌ 6788 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: qcs9100-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_crypto_1dfa000
      last run: https://d.kernelci.org/test/maestro:6a5c18ae3427a5b0fbfba8de
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_22000000_displayport-controller_22154000
      last run: https://d.kernelci.org/test/maestro:6a5c18ae3427a5b0fbfba8d9
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_22000000_displayport-controller_2215c000
      last run: https://d.kernelci.org/test/maestro:6a5c18ae3427a5b0fbfba8d8
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_22000000_phy_220c2a00
      last run: https://d.kernelci.org/test/maestro:6a5c18ae3427a5b0fbfba8d7
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_22000000_phy_220c5a00
      last run: https://d.kernelci.org/test/maestro:6a5c18ae3427a5b0fbfba8d6
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_af54000
      last run: https://d.kernelci.org/test/maestro:6a5c18ae3427a5b0fbfba8d2
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_af5c000
      last run: https://d.kernelci.org/test/maestro:6a5c18ae3427a5b0fbfba8d0
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_aec2a00
      last run: https://d.kernelci.org/test/maestro:6a5c18ae3427a5b0fbfba8ca
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_aec5a00
      last run: https://d.kernelci.org/test/maestro:6a5c18ae3427a5b0fbfba8c9
      history:  > ✅  > ✅  > ❌  
            
Hardware: sm8750-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.breakpoints
      last run: https://d.kernelci.org/test/maestro:6a5ad1f83427a5b0fbf60007
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.breakpoints.breakpoints_step_after_suspend_test
      last run: https://d.kernelci.org/test/maestro:6a5ad4593427a5b0fbf65d01
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_crypto_1dfa000
      last run: https://d.kernelci.org/test/maestro:6a5ad6bb3427a5b0fbf67820
      history:  > ✅  > ✅  > ❌  
            
Hardware: x1e80100
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.capabilities
      last run: https://d.kernelci.org/test/maestro:6a5ad2233427a5b0fbf60127
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_crypto_1dfa000
      last run: https://d.kernelci.org/test/maestro:6a5adcb63427a5b0fbf69014
      history:  > ✅  > ✅  > ❌  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_i2c_30a50000_eeprom_50
      last run: https://d.kernelci.org/test/maestro:6a5ad53e3427a5b0fbf66e37
      history:  > ✅  > ✅  > ❌  > ❌  
            
Hardware: kaanapali-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_crypto_1dfa000
      last run: https://d.kernelci.org/test/maestro:6a5ad7d83427a5b0fbf67de9
      history:  > ✅  > ❌  
            
Hardware: qcs615-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.breakpoints
      last run: https://d.kernelci.org/test/maestro:6a5ad1f13427a5b0fbf5ffe2
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.breakpoints.breakpoints_step_after_suspend_test
      last run: https://d.kernelci.org/test/maestro:6a5bdb473427a5b0fbf9ed71
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_crypto_1dfa000
      last run: https://d.kernelci.org/test/maestro:6a5be4073427a5b0fbfa1a21
      history:  > ✅  > ✅  > ❌  
            
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_crypto_1dfa000
      last run: https://d.kernelci.org/test/maestro:6a5b3cee3427a5b0fbf7fc65
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6a5ad2c73427a5b0fbf6065e
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.timers.timers_posix_timers
      last run: https://d.kernelci.org/test/maestro:6a5b415e3427a5b0fbf7feed
      history:  > ✅  > ✅  > ❌  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_crypto_1dfa000
      last run: https://d.kernelci.org/test/maestro:6a5ad6183427a5b0fbf675bf
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_iommu_3da0000
      last run: https://d.kernelci.org/test/maestro:6a5ad6183427a5b0fbf67579
      history:  > ✅  > ✅  > ❌  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a5ad1d33427a5b0fbf5ff32
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.arm64.arm64_hwcap_sigbus_LSE2
      last run: https://d.kernelci.org/test/maestro:6a5ad2fb3427a5b0fbf6383a
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_crypto_1dfa000
      last run: https://d.kernelci.org/test/maestro:6a5ad99b3427a5b0fbf685da
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_display-controller_ae01000
      last run: https://d.kernelci.org/test/maestro:6a5ad99b3427a5b0fbf685d1
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_af54000
      last run: https://d.kernelci.org/test/maestro:6a5ad99b3427a5b0fbf685cf
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_dsi_ae94000
      last run: https://d.kernelci.org/test/maestro:6a5ad99b3427a5b0fbf685cd
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_ethernet_23040000
      last run: https://d.kernelci.org/test/maestro:6a5ad99b3427a5b0fbf685c7
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_ac0000_i2c_a80000_i2c-mux_70_i2c_0_bridge_58
      last run: https://d.kernelci.org/test/maestro:6a5ad99b3427a5b0fbf685a4
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pci_1c00000_pcie_0_wifi_0
      last run: https://d.kernelci.org/test/maestro:6a5ad99b3427a5b0fbf68589
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pci_1c10000
      last run: https://d.kernelci.org/test/maestro:6a5ad99b3427a5b0fbf68588
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_usb_a600000
      last run: https://d.kernelci.org/test/maestro:6a5ad99b3427a5b0fbf6852c
      history:  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: cd8180-orion-o6
  > Config: defconfig+netdev+nfs-root-boot+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a5acf3d3427a5b0fbf5e75f
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6a5acf3c3427a5b0fbf5e756
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:6a5ad1a73427a5b0fbf5fd92
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6a5ad0b43427a5b0fbf5f68b
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6a5ad1ac3427a5b0fbf5fe2e
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest-devices-probe-ramdisk
      last run: https://d.kernelci.org/test/maestro:6a5ad31c3427a5b0fbf64154
      history:  > ❌  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:6a5ad5053427a5b0fbf66c0a
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_i2c_890000_eeprom_50_nvmem-layout
      last run: https://d.kernelci.org/test/maestro:6a5b3ced3427a5b0fbf7fc3f
      history:  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_usb_a800000_hub_2
      last run: https://d.kernelci.org/test/maestro:6a5b3ced3427a5b0fbf7fb99
      history:  > ⚠️  > ✅  > ✅  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.breakpoints
      last run: https://d.kernelci.org/test/maestro:6a5ad1f23427a5b0fbf5ffe9
      history:  > ❌  > ✅  > ❌  
            
Hardware: qcs8300-ride
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.efivars
      last run: https://d.kernelci.org/test/maestro:6a5ad3e83427a5b0fbf6570a
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a5ad4113427a5b0fbf659d9
      history:  > ❌  > ✅  > ❌  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
