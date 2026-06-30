Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDCF21ABAA
	for <linux-next@vger.kernel.org>; Tue, 30 Jun 2026 02:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782786629; cv=none; b=SJLL8osiuS0yh4ZIZL4tp4R4PD3MHJ178JXjypYbiRQpBIsNqcszYVwy2j5PDGt8QFQFH0mRXGns5z2n/S8/Iq8FytvkWAcxc/h7HV7syrva9MsZKI6VSLSIbOcM4+eeFcDrmO3X63Hcf1H/xmQie/+n7RhzzmgO07vymL59Mrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782786629; c=relaxed/simple;
	bh=7dF9VutvZpvc6/TeKImB8UODGRChx48P53cBi7knRv4=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=gvazaNJFJDpSxhptd5uAwQ9YOkZJVRYqtbFt8KuLU6u+NYeQ9YjPMhrXvLEgpjYk7E6RLfjTDgVCKCMCJ/QGqiil6Wy/qGzM7cUJ7VyZ03L+A5NnmikBg3CF2ev4yTS/Rpe8qKTcKffvLLXRGZV1xZg///tFU33ObdGocfOtp9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=hkMk7zLV; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="hkMk7zLV"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-139edc6bfc0so7491507c88.1
        for <linux-next@vger.kernel.org>; Mon, 29 Jun 2026 19:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1782786622; x=1783391422; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ABgM6Cal6LGXdrKDMBCemAZWZnO9yOltgSJ+erP3ZU=;
        b=hkMk7zLV4tel+Crzs1qMH9HArp9AY2apv+cBNj8zsj78Qdf/hHIPPxdgp/KfemO7Rx
         355x756rb4GwxYpNr/8Cr6Rf42q7Kr7jIW5W2/iP0WCG6M9mk8Ty8vjLxloiIhqDA7wc
         qAd3WOxfrOd9h8No2WQIo8bLj1Ajqbkt5invrH3TKQK9k7R691WjCpEE3nJIZpk/oGpN
         WY0dPIXbuY7M5BfVEnk8yFJYz5GTeNwhc/FLFm7qxpx6nBm5xvS+DrekL3DjQIIwVvRg
         ZmVmohSSn4Z2BjXxxYNH57YSJhbW4ThLFAbEle5uQSg+MG5cKLZ3X0t5dvHEY+20NVLb
         2QTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782786622; x=1783391422;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8ABgM6Cal6LGXdrKDMBCemAZWZnO9yOltgSJ+erP3ZU=;
        b=XeahMCErlylLfUJkfmqXsKdIGqKfn7FySFekOXxIldXXaCpg+4ui0o+ZUiPMvs+8Kh
         40Jk2jlQy4Cdmo18yuoxgXn2pMVGbiyMcEYebKU3jzEwtrHAA1EnhV+5f6Idb1hha9f+
         BSxsg9KvkLvGLcpJ3nzqFQvNtJC1ePF9OSujWwLvjJc/zrPIl3NiNepTgFS/4hS5SR+h
         uylfByKJ8qmg5oScQjMZIhUM1xP1OwLo58jJSFTr6MJD/Xk6jcfEgWsJom51TI4fqwQy
         bTO1aVB3iYPYxeKRrNNwLPkrpGaltlQZXVEk4/yNE+FjmUeglTHK4BMwt0cn5Zc+zNuZ
         bt4Q==
X-Gm-Message-State: AOJu0YyFmv9VXYoqQVFOBvL57cvq1aMcQz23SNErfAsNgruD3lcEKUCD
	4lNASk6E8M58o63sEwvxUzenvoi/3xm9V0xCYPx/9DKS8OmP930y8xTVJTpuz83p8nBzyzzfmuc
	JHz9Y
X-Gm-Gg: AfdE7ck4ussKS0UKRR8IoZZ4IDe3/Z+VM00qZ6TwptsGp9MB7hVFK4rqAL1EArgI92X
	6g7t+OPaDzdrnmHfw6k3hgl90yHoU/y+sxrnx2wy1/Jxd85ZOEly4F8yIUKAkxmchdYSSQxo9BR
	8jrcVSdvomIqHpCFqB/rcSizY3GDBWgQLBaiCX30O1BA0yMda7YuRNmLresEQiuIb/4Dd+PV/l4
	WpUZpM0Or0Z4r7keJEeXpk0GimjNM76es0vvRjFZtyOZZxlGRRCc7nSLN/XAY6p5M2mMh1L1VJ1
	tPcYqycbZ2HL3aWxKpp7wBEGxfPI2hA7kNsH0G5u8WGPKp/ak5qUchAh6jvy52cBmoqrFhVDIYt
	dm52vwNhWrUDTxiyK8EQJ03BzLTT+6qcCI5d7ER5WdHKpMZ1lC5aqzrEhgJm8DAouIipmcbWM+k
	8WCrvtrA==
X-Received: by 2002:a05:7022:312:b0:139:7bac:db41 with SMTP id a92af1059eb24-13b2a1b5312mr1066848c88.28.1782786622020;
        Mon, 29 Jun 2026 19:30:22 -0700 (PDT)
Received: from 963b246bc1b3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2ab2dc1fsm2180892c88.6.2026.06.29.19.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 19:30:21 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 7de6ae9e12207ec146f2f3f1e58d1a99317e88bc
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 30 Jun 2026 02:30:21 -0000
Message-ID: <178278662076.2313.10642904315879465752@963b246bc1b3>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/7de6ae9e12207ec146f2f3f1e58d1a99317e88bc/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 7de6ae9e12207ec146f2f3f1e58d1a99317e88bc
origin: maestro
test start time: 2026-06-29 15:54:18.238000+00:00

Builds:	   66 ✅    2 ❌    0 ⚠️
Boots: 	  171 ✅    3 ❌    0 ⚠️
Tests: 	32197 ✅ 5402 ❌ 7161 ⚠️

### POSSIBLE REGRESSIONS

  No possible regressions observed.


### FIXED REGRESSIONS
    
Hardware: qcs9100-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest-device-error-logs-ramdisk
      last run: https://d.kernelci.org/test/maestro:6a42a41abb83f6a3e867d2a2
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: x1e80100
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6a42a44bbb83f6a3e867d3fa
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.timers.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:6a42b690bb83f6a3e8689bc3
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: cd8180-orion-o6
  > Config: defconfig+netdev+nfs-root-boot+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a42a5c3bb83f6a3e8681bc5
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6a42a5c3bb83f6a3e8681bbc
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: dell-latitude-3445-7520c-skyrim
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:6a42a604bb83f6a3e8681dec
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:6a42a728bb83f6a3e8683e18
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller0_14001000
      last run: https://d.kernelci.org/test/maestro:6a429df6bb83f6a3e8679b37
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58_aux-bus_panel
      last run: https://d.kernelci.org/test/maestro:6a429df6bb83f6a3e8679b2b
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14008000
      last run: https://d.kernelci.org/test/maestro:6a429df6bb83f6a3e8679b0f
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14009000
      last run: https://d.kernelci.org/test/maestro:6a429df6bb83f6a3e8679b0e
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_1400a000
      last run: https://d.kernelci.org/test/maestro:6a429df6bb83f6a3e8679b0d
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400b000
      last run: https://d.kernelci.org/test/maestro:6a429df6bb83f6a3e8679b02
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400c000
      last run: https://d.kernelci.org/test/maestro:6a429df6bb83f6a3e8679b01
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_mt8195-sound
      last run: https://d.kernelci.org/test/maestro:6a429df9bb83f6a3e8679d1a
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c104000
      last run: https://d.kernelci.org/test/maestro:6a429df9bb83f6a3e8679cb7
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c105000
      last run: https://d.kernelci.org/test/maestro:6a429df9bb83f6a3e8679cb6
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c106000
      last run: https://d.kernelci.org/test/maestro:6a429df9bb83f6a3e8679cb5
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c107000
      last run: https://d.kernelci.org/test/maestro:6a429df9bb83f6a3e8679cb4
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c108000
      last run: https://d.kernelci.org/test/maestro:6a429df9bb83f6a3e8679cb3
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c109000
      last run: https://d.kernelci.org/test/maestro:6a429df9bb83f6a3e8679cb2
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c10a000
      last run: https://d.kernelci.org/test/maestro:6a429df9bb83f6a3e8679cb1
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c10b000
      last run: https://d.kernelci.org/test/maestro:6a429df9bb83f6a3e8679cb0
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dp-intf_1c015000
      last run: https://d.kernelci.org/test/maestro:6a429df9bb83f6a3e8679caf
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dp-intf_1c113000
      last run: https://d.kernelci.org/test/maestro:6a429df9bb83f6a3e8679cae
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_hdr-engine_1c114000
      last run: https://d.kernelci.org/test/maestro:6a429df9bb83f6a3e8679ca5
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000
      last run: https://d.kernelci.org/test/maestro:6a429df9bb83f6a3e8679c94
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_0_0
      last run: https://d.kernelci.org/test/maestro:6a429df9bb83f6a3e8679c93
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_0_10000
      last run: https://d.kernelci.org/test/maestro:6a429df9bb83f6a3e8679c92
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_1_0
      last run: https://d.kernelci.org/test/maestro:6a429df9bb83f6a3e8679c90
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000
      last run: https://d.kernelci.org/test/maestro:6a429df9bb83f6a3e8679c8e
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000_jpgenc_0_0
      last run: https://d.kernelci.org/test/maestro:6a429df9bb83f6a3e8679c8c
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000_jpgenc_1_0
      last run: https://d.kernelci.org/test/maestro:6a429df9bb83f6a3e8679c8a
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_1c000000
      last run: https://d.kernelci.org/test/maestro:6a429df9bb83f6a3e8679c5d
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1c002000
      last run: https://d.kernelci.org/test/maestro:6a429df9bb83f6a3e8679c52
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000
      last run: https://d.kernelci.org/test/maestro:6a429df9bb83f6a3e8679d35
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_10000
      last run: https://d.kernelci.org/test/maestro:6a429df9bb83f6a3e8679d34
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_2000
      last run: https://d.kernelci.org/test/maestro:6a429df9bb83f6a3e8679d33
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_25000
      last run: https://d.kernelci.org/test/maestro:6a429df9bb83f6a3e8679d32
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_1a020000
      last run: https://d.kernelci.org/test/maestro:6a429df9bb83f6a3e8679d31
      history:  > ❌  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: glymur-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pci_1c00000
      last run: https://d.kernelci.org/test/maestro:6a42b08bbb83f6a3e868914a
      history:  > ✅  > ❌  > ✅  > ✅  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:6a42a40bbb83f6a3e867d209
      history:  > ❌  > ✅  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_ethernet_23040000_mdio_phy_8
      last run: https://d.kernelci.org/test/maestro:6a42a8a6bb83f6a3e8686713
      history:  > ✅  > ⚠️  > ✅  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pci_1c00000_pcie_0_wifi_0
      last run: https://d.kernelci.org/test/maestro:6a42a8a6bb83f6a3e86866d8
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6a42a444bb83f6a3e867d3b2
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.timers.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:6a42acefbb83f6a3e8688609
      history:  > ✅  > ❌  > ✅  > ✅  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a429dafbb83f6a3e867994b
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
