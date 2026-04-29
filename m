Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D40B3822A5
	for <linux-next@vger.kernel.org>; Wed, 29 Apr 2026 02:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777429815; cv=none; b=q8+uLfWhulWMl+0xXyQ0cQAgJW8D9dIZV17M0358uYzhOvDqjh7ur9nSFwuBkFLWqZISg9bd/i3mrXVpiPjatP6zu1kvm6ISm3t+7nUUu/YGSsxnhNgP1H8LGWBphlmfbE8LY2aIRlq5QevqTE15M8JOeuCjlIvucCiKuU5Ql0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777429815; c=relaxed/simple;
	bh=U1/xG3yg16K8TSYz5KUlN2B0fVTxrji1vZF5t0u8sl0=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=CvEbUWuoM9FHLGRPtSy80WQNCe4cd4RubpFHqvrxjNQjbOSWpRfta2sD/Dujp9X9v8YSgFA4rb/mdz2UTC7fQ2Z5MuAXOvypuOwmvSlr0+vrsnhX5NNbGmTmwe2kfo47kWE8PGER1y7Q1320fuS/PWWwyepfM6IHidYukGdCMDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=Xjn91E7o; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="Xjn91E7o"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2bdd40d3c61so11751261eec.1
        for <linux-next@vger.kernel.org>; Tue, 28 Apr 2026 19:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1777429813; x=1778034613; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T0urfR4uHcoSl5CHjzNyzJatstIUWuXUdPWg+hNWiaY=;
        b=Xjn91E7ovckiuXBuLOpnORejoDnoJbU3627ViPcQ+Nd0S0HXoPimy4i3wWFQP/veY/
         FacMbOqrd9RJjSiPJZsVEzHpbqLKBjkyxcUVKLZag0aJWBY/knUW7tdmA3ixRpUSgcWM
         5ZaDXDLGltfr/jvHlKNbkDE2yBS4Ee1VE02HRC7z/R0UwXgPqpRlbd6ZIP157X6p2Ps4
         O86g8wOwSmTr/AmIGH9jxnQ3rs3XZ8zD0T38OofNztmcxu6vKGfR1Xeut+psfXSRoZmL
         iM41Ixc4HRZBIt873mnFzxf5emJLl4E4vM0816Y0iMgcxkznQxi1TYNadB+6+c58msXG
         japg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777429813; x=1778034613;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T0urfR4uHcoSl5CHjzNyzJatstIUWuXUdPWg+hNWiaY=;
        b=V5HBCIA5WFfIVrDzb1iWUar18RN00n8Fjx0ODS0ZX2npMJtJeER4z4jorEfuiMjz+2
         24S8rIdi37MpGYyTUxr4sBrOUfiRvoNhlnl0MdtkeVVyL0EtaxK8U0OLJiaXlduBGimB
         Df78BEnfXKo4eLb55lP8oWdk94+piDSN9wZJR43EwWLAUxzh4Tg4uXxMkmjdKuUpTArt
         7zEdQM8xdisPNHL92VFyH5WxaH/ZJk1yKiPeznpLSI1JijX537/dnXCRD9QtgveTxTqj
         O2Rp1fosCOhk1ghjZMxXDpdUhsErVy8QBDj2JZ7mrNIMKtqATRP7nfna9Ta4/nQXSWnF
         l6Bg==
X-Gm-Message-State: AOJu0YwWcpWkJeVBzhDxEL6kv4Eu0mOWjIz3hTWZv0toBI4nLS73Sfjb
	f7WFfPeaV9H299GdFoBX2YdTdhVKfz1FCLoOAIVnh8iTs3CJfxAs0EIkOvnIsF27ah5kflOO9YU
	iCyzq
X-Gm-Gg: AeBDietpTq5LfG6+mqWJs0KTvQK3wnXhxrVDO2GYhWGLXpTZ2KAPdmM8B7/l0AfxdMj
	8240PwVwOL3i9mTxnTdHA0suuweZiOO+UmZ9t0iTLwF98hcfeGd9SDvHZtTUR9Ar5pnq5Hwzjis
	eVZ4Tw1vL1sUbCFibAsBBZCphU/6nb5YgrDgMrzqLExHgkHTYZMMCPULkTYMc61lrTFGM24TTYj
	DjiK27+Tbw4JZMYOkDFXBuAzNmayLdNE43puN2Bzpx9cgyexwPfxx/6wL88imkAMWYpv6oMPJRK
	9ovGe+n2AEjZ22uAIllalEhSVxkKwMwS0GtQSsLgboqSUoJKTK95mhfgG4xgQdc1qpexiB4kUfG
	mURfm9VpxSyDWFw44kvXGKN/RkNRJfc2JG+cWo+wUNKUP7mUwH61uJm7LXFeiq7Ivh8TL7KiSBM
	s/xoI0KmbHOaB5oDYYBcvEOa0s6hA=
X-Received: by 2002:a05:7022:439d:b0:12b:ebc9:2464 with SMTP id a92af1059eb24-12ddd98e9f7mr2180723c88.22.1777429812791;
        Tue, 28 Apr 2026 19:30:12 -0700 (PDT)
Received: from 7f5f57871823 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12de32615ebsm847061c88.10.2026.04.28.19.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 19:30:12 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 9974969c14031a097d6b45bcb7a06bb4aa525c40
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 29 Apr 2026 02:30:11 -0000
Message-ID: <177742981150.2033.9691312097191948810@7f5f57871823>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/9974969c14031a097d6b45bcb7a06bb4aa525c40/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 9974969c14031a097d6b45bcb7a06bb4aa525c40
origin: maestro
test start time: 2026-04-28 13:19:47.989000+00:00

Builds:	   57 ✅    0 ❌    0 ⚠️
Boots: 	  181 ✅   10 ❌    0 ⚠️
Tests: 	22632 ✅ 4284 ❌ 5644 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: monaco-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:69f0d8ca9b5a9683091579e8
      history:  > ✅  > ❌  > ❌  
            
Hardware: bcm2837-rpi-3-b-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:69f0ca1e9b5a968309150b8d
      history:  > ✅  > ❌  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:69f0d1c69b5a968309157435
      history:  > ✅  > ❌  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:69f0ca379b5a968309150c52
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:69f0c9f29b5a9683091509a4
      history:  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: monaco-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:69f0c9f79b5a9683091509c0
      history:  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.proc.proc_read
      last run: https://d.kernelci.org/test/maestro:69f0d66a9b5a9683091578c2
      history:  > ✅  > ❌  > ✅  > ✅  
            
Hardware: qcs615-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.proc.proc_read
      last run: https://d.kernelci.org/test/maestro:69f0f0809b5a968309164732
      history:  > ✅  > ❌  > ✅  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:69f0c9ff9b5a9683091509ec
      history:  > ❌  > ❌  > ✅  > ✅  > ❌  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.uevent
      last run: https://d.kernelci.org/test/maestro:69f0c0179b5a96830914cd3f
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.uevent.uevent_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:69f0c11f9b5a96830914d2bf
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.uevent.uevent_uevent_filtering_global_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:69f0c11f9b5a96830914d2c0
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller0_14001000
      last run: https://d.kernelci.org/test/maestro:69f0dee69b5a968309158e59
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58_aux-bus_panel
      last run: https://d.kernelci.org/test/maestro:69f0dee69b5a968309158e4d
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14008000
      last run: https://d.kernelci.org/test/maestro:69f0dee69b5a968309158e31
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14009000
      last run: https://d.kernelci.org/test/maestro:69f0dee69b5a968309158e30
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_1400a000
      last run: https://d.kernelci.org/test/maestro:69f0dee69b5a968309158dfd
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400b000
      last run: https://d.kernelci.org/test/maestro:69f0dee69b5a968309158df2
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400c000
      last run: https://d.kernelci.org/test/maestro:69f0dee69b5a968309158df1
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_mt8195-sound
      last run: https://d.kernelci.org/test/maestro:69f0df129b5a968309159945
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c104000
      last run: https://d.kernelci.org/test/maestro:69f0df129b5a9683091598e3
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c105000
      last run: https://d.kernelci.org/test/maestro:69f0df129b5a9683091598e2
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c106000
      last run: https://d.kernelci.org/test/maestro:69f0df129b5a9683091598e1
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c107000
      last run: https://d.kernelci.org/test/maestro:69f0df129b5a9683091598e0
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c108000
      last run: https://d.kernelci.org/test/maestro:69f0df129b5a9683091598df
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c109000
      last run: https://d.kernelci.org/test/maestro:69f0df129b5a9683091598de
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c10a000
      last run: https://d.kernelci.org/test/maestro:69f0df129b5a9683091598dd
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c10b000
      last run: https://d.kernelci.org/test/maestro:69f0df129b5a9683091598dc
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dp-intf_1c015000
      last run: https://d.kernelci.org/test/maestro:69f0df129b5a9683091598db
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dp-intf_1c113000
      last run: https://d.kernelci.org/test/maestro:69f0df129b5a9683091598da
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_hdr-engine_1c114000
      last run: https://d.kernelci.org/test/maestro:69f0df129b5a9683091598d1
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: lenovo-hr330a-7x33cto1ww-emag
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:69f0c3d09b5a96830914e064
      history:  > ❌  > ✅  > ✅  > ✅  > ❌  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
