Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794277829;
	b=5mXz9ACapm/bZPWy18l89Kcwq/SorVBJ1wJby7xYR0vfEEvQy3VFFa1sfOLfnMYZ8OLr
	 gFAYvfRKoE1SvrcXQ0VMaPJiN1XNiFTf7TF5ypIy0D3tLOCC+YtvYmn2WIpftAZ2AzN/z
	 ni7zjwb7DICMDDpzjVZa6S5/M435bKuQ9UDH+mbb7I2EZcARAs6BVe6TSwIFWJo4v5kJb
	 QPc+NZb10OsILEDncRqs/geH8DHRDRGEyy+XMJHNE2exNULA3MLLJZ1M+QYbW7Df/x/ku
	 CfoGd8HnYpYr2KFoc9GGlab0cfwY6xFW0O9HVTzEvI2p0RoPS9lHfmpeUl/ANI6Jg4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794277829;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:To:Cc:Reply-To:
	 Date:Message-ID;
	bh=4x6cahJbSr2HJEHmOOn1BweOzE7fcddeHIbH6tIg+hY=;
	b=gZz0QWY7RmvyGseYrY+3e7p2fCQbr5VDYFyEpdzS8Wz5N1iHrfCVZkp/TJ6nXOvI+Fl1
	 az/nkBUT3sf+Fz0BtPupEEEuLNrX+7fKk8JGV2XY7sKfB4QlpTDJ2EfDD6Mhw+h2A4eRR
	 S+knqKQGQ404r3aWsS9tMlu3TiscKttnag1iXx4qVGZQlMhN88E9IPVtmgJ/EXhP5ee39
	 iO5OBedWFCcof6iLC2PBCG1PKtVPe3ZM/CKaVu9TNIRCqGqhclCjOgMzTNLX3x7QJx822
	 SQE8uxai6NK0mk/hD7licng6sy2vKqMj0/KQiY0C6Ec0h6DrCosY3IBL00nLPA9nu2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=DvubXCeU;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD4A606A321
	for <linux-next@vger.kernel.org>; Tue, 10 Nov 2026 02:30:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AD4A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=DvubXCeU
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36f6295304dso1994832eec.1
        for <linux-next@vger.kernel.org>; Mon, 09 Nov 2026 18:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1794277826; x=1794882626; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4x6cahJbSr2HJEHmOOn1BweOzE7fcddeHIbH6tIg+hY=;
        b=DvubXCeUiZ25FyfnV2ULBi90Nxzp1QV/JO2Vc1pcZN1SRdFXlNpQMw6woFAG7r53yk
         jF0Ghz3UK9KJJvgSGs7Jq1cPngGzaSACmWep/gJSDKIvpI4AyEoa2c0mDTLvg1LJs6Ly
         faabE8gylqE6ORZML5EDTXsbEfAYsIIZBVsNZYdPUISANmu7uhGxQh/vxlOAgvMX4OuU
         Vdhwfxh+qS+gkpY+15lXXTCtoXXwjVg7oEkbGzNK2Y9M8dAQa57Qc3Js347hz3KSdYNp
         Tojks/I+MSW9bpq0kMTYTzjMURbzPDX+rH8UlUbVXiHHledIelTncGe036ekiCeW2rfc
         C3vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794277826; x=1794882626;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4x6cahJbSr2HJEHmOOn1BweOzE7fcddeHIbH6tIg+hY=;
        b=KhG/KC1NoMxwsNs76ceVr4c0xJ0HEZcf+IFbcUjMfo/CODxc4eCsNYkiLCvrfzsl1V
         UnRjpxtaCQm0w+Mkr7Nj63JKQCAhtlgPPuWo9RXk9DuSGv4lQQrvE9fg7YC/PfJPUPEm
         nGkbRLU/bcsmfwjCxMKjRlqvNB6lfBk2j0f6TYC0nmLzxIlF9u3Corwu1ggMndGgXL5Y
         YcJPoC/W7YTS00dEXzsXV5jJCTxH4LspGm0IR6u9pRlJP0k5kOpEFKL3ZxaPXjRKMG0O
         3xXWN0lHD01gzrOa8qG5dHBGVUv7sm9IGP8MLw1pitcAOJMsA2tNEmonYhwUQf2dYyXj
         umIQ==
X-Gm-Message-State: APuU4Z+7fCzUv6QWK47DeF1u0rnnhoI81KoiVyHIU4gcySV3R4IW0asP
	yRmI0NYJCqsgbFDqQAUyBdZQExOMapAxq8qkv2m6UySHfrDTfU3spaXNTI/WAgAsTDCmdQS5z37
	8Fgqy
X-Gm-Gg: AYBFou00UF/smX8OQQRaBKXlLVU+yBypalC/LBllSrGXrwjac52HuGJakMhmo88Tp9A
	Z65uaN7mih7yHyiBAV/xUdL+WdiQn3Q1HRMpc7e1ihFxgzFAoWJZgD8pnjgG1MAHQ+b45F0b6YP
	K04mIxW082xZzGcgeyTcBJW9gtZddgTk1V0HlBMNmpNBdVYPZ2bcI6X90zvR+bUb2dy2zCxJWyK
	AQ9fgaKJ5iHC8ecTmyjbVcAmI34KkmdVSybRGDKi0XUELWCPzb5ZbBBXEv3o1ZsYkgWp3WlIHHU
	1tdKAfh4rEDpPuoY7Sk08CzDYH/Mb63yPCeuia/awf835Vipm3OZv3eGToqXB4XlFegdfA4rBTh
	1BUziJYoxmBwpWjCRKNp+gMkoF3ZftiX7POizVulKbJ0bkwocw+QQdOwDfVNXdN49cPg2DEMUj1
	xtwWGUg1aFmOCge0NvmgC1VJpWqBBoA6M0UAHM9NrzBqXRZ+4oYDCO00ktWI0s4Qs9EY13V/gv5
	NvG92eCtzCW8y0Zv5fW7PDexS2uDD1Y04KQth563YZlnGoBNdimgZSM6Tt81G70zMJt8WbmEqVT
	FfdljOIZBr1wglIJejsH+g==
X-Received: by 2002:a05:7301:7d04:b0:35f:2bc:82d3 with SMTP id 5a478bee46e88-3751ef76a19mr1344627eec.15.1794277826121;
        Mon, 09 Nov 2026 18:30:26 -0800 (PST)
Received: from a3f41c651398 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375218c7c50sm4235453eec.29.2026.11.09.18.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 18:30:21 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 630059a5a632377b9b7b487baccde92b7ae1dd47
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 10 Nov 2026 02:30:20 -0000
Message-ID: <179427781961.14163.4181593418009245446@a3f41c651398>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/630059a5a632377b9b7b487baccde92b7ae1dd47/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 630059a5a632377b9b7b487baccde92b7ae1dd47
origin: maestro
test start time: 2026-11-09 15:11:45.731000+00:00

Builds:	   69 ✅    8 ❌    0 ⚠️
Boots: 	  230 ✅   12 ❌    0 ⚠️
Tests: 	52756 ✅ 3230 ❌ 8757 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.cgroup
      last run: https://d.kernelci.org/test/maestro:6af1ed9c5b429d354e2203da
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6af1fe355b429d354e233b4b
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6af1fe355b429d354e233b46
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - ltp.poll02
      last run: https://d.kernelci.org/test/maestro:6af1fe3d5b429d354e233efd
      history:  > ✅  > ✅  > ❌  > ❌  
            
Hardware: jetson-agx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp.futex_wait05
      last run: https://d.kernelci.org/test/maestro:6af24d4b5b429d354e263308
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - ltp.shmctl05
      last run: https://d.kernelci.org/test/maestro:6af24d4a5b429d354e26326b
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - ltp.splice08
      last run: https://d.kernelci.org/test/maestro:6af24d4b5b429d354e26328d
      history:  > ✅  > ✅  > ❌  > ❌  
            
Hardware: jetson-nano-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6af214cd5b429d354e24894d
      history:  > ✅  > ✅  > ❌  > ❌  
            
Hardware: jetson-orin-nano-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6af278d85b429d354e286e22
      history:  > ✅  > ❌  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6af278d85b429d354e286e1d
      history:  > ✅  > ❌  
            
Hardware: jetson-orin-nx-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6af214cc5b429d354e24893e
      history:  > ✅  > ✅  > ❌  > ❌  
            
Hardware: nvidia-e5020-vera
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6af2219d5b429d354e252c5e
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6af214cd5b429d354e248956
      history:  > ✅  > ✅  > ❌  > ❌  
            
Hardware: nvidia-igx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6af214cc5b429d354e248944
      history:  > ✅  > ✅  > ❌  > ❌  
            
Hardware: nvidia-p3809-gb300
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6af27afc5b429d354e28cf57
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6af27afc5b429d354e28cf52
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: nvidia-p5042-gh200
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6af214cd5b429d354e248959
      history:  > ✅  > ✅  > ❌  > ❌  
            
Hardware: purwa-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.tmpfs
      last run: https://d.kernelci.org/test/maestro:6af207c55b429d354e23c6c0
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: purwa-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_ae90000
      last run: https://d.kernelci.org/test/maestro:6af227ff5b429d354e254570
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_aea0000_aux-bus_panel
      last run: https://d.kernelci.org/test/maestro:6af227ff5b429d354e25456b
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_iommu_3da0000
      last run: https://d.kernelci.org/test/maestro:6af227ff5b429d354e254530
      history:  > ✅  > ❌  
            
      - kselftest.timers.timers_mqueue-lat
      last run: https://d.kernelci.org/test/maestro:6af2304b5b429d354e25973b
      history:  > ✅  > ❌  
            
      - kselftest.timers.timers_nsleep-lat
      last run: https://d.kernelci.org/test/maestro:6af2304b5b429d354e25973d
      history:  > ✅  > ❌  
            
      - kselftest.timers.timers_posix_timers
      last run: https://d.kernelci.org/test/maestro:6af2304c5b429d354e259750
      history:  > ✅  > ❌  
            
Hardware: sm8750-mtp
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio.gpio_gpio-aggregator_sh
      last run: https://d.kernelci.org/test/maestro:6af212775b429d354e246719
      history:  > ✅  > ✅  > ❌  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_h265.JCT-VC-HEVC_V1-GStreamer-H-265-V4L2SL.MAXBINS_C_TI_5
      last run: https://d.kernelci.org/test/maestro:6af20c175b429d354e242e4b
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: jetson-agx-xavier-devkit
  > Config: defconfig+lab-setup
    - Architecture/compiler: arm64/gcc-15
      - tegra-tests.boot.devices
      last run: https://d.kernelci.org/test/maestro:6af21c5a5b429d354e24f15c
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: jetson-tx1-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6af214cd5b429d354e248950
      history:  > ✅  > ✅  > ❌  > ❌  
            
Hardware: jetson-tx2-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6af214cd5b429d354e248953
      history:  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: hamoa-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6af1f1c95b429d354e2269a7
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.kvm.kvm_nested_tsc_scaling_test
      last run: https://d.kernelci.org/test/maestro:6af1fe455b429d354e23436c
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.mm
      last run: https://d.kernelci.org/test/maestro:6af1ed9d5b429d354e220412
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_thp_sh
      last run: https://d.kernelci.org/test/maestro:6af1fe435b429d354e23431f
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_thp_sh_split_huge_page_test
      last run: https://d.kernelci.org/test/maestro:6af1fe435b429d354e23431c
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.x86.x86_syscall_numbering_64
      last run: https://d.kernelci.org/test/maestro:6af1fe475b429d354e23442f
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - ltp.clone304
      last run: https://d.kernelci.org/test/maestro:6af1fe3f5b429d354e233fe2
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.fanotify17
      last run: https://d.kernelci.org/test/maestro:6af1fe3f5b429d354e2340be
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.ioctl_ns06
      last run: https://d.kernelci.org/test/maestro:6af1fe3f5b429d354e2340a7
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.ioctl_pidfd02
      last run: https://d.kernelci.org/test/maestro:6af1fe3a5b429d354e233db0
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.ioctl_pidfd03
      last run: https://d.kernelci.org/test/maestro:6af1fe3a5b429d354e233db1
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.ioctl_pidfd04
      last run: https://d.kernelci.org/test/maestro:6af1fe3a5b429d354e233d3f
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.ioctl_pidfd05
      last run: https://d.kernelci.org/test/maestro:6af1fe3a5b429d354e233d40
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.ioctl_pidfd06
      last run: https://d.kernelci.org/test/maestro:6af1fe3a5b429d354e233db3
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.keyctl05
      last run: https://d.kernelci.org/test/maestro:6af1fe3f5b429d354e2340cc
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.keyctl23
      last run: https://d.kernelci.org/test/maestro:6af1fe3f5b429d354e2340ce
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.keyctl29
      last run: https://d.kernelci.org/test/maestro:6af1fe3f5b429d354e2340cf
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.mount_setattr02
      last run: https://d.kernelci.org/test/maestro:6af1fe3f5b429d354e234122
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.pivot_root01
      last run: https://d.kernelci.org/test/maestro:6af1fe415b429d354e234178
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.sendmsg03
      last run: https://d.kernelci.org/test/maestro:6af1fe415b429d354e2341ea
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.sendto03
      last run: https://d.kernelci.org/test/maestro:6af1fe415b429d354e2341ec
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.setsockopt05
      last run: https://d.kernelci.org/test/maestro:6af1fe415b429d354e234244
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.setsockopt07
      last run: https://d.kernelci.org/test/maestro:6af1fe415b429d354e234245
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.setsockopt08
      last run: https://d.kernelci.org/test/maestro:6af1fe415b429d354e234246
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.setsockopt09
      last run: https://d.kernelci.org/test/maestro:6af1fe415b429d354e234247
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.statmount03
      last run: https://d.kernelci.org/test/maestro:6af1fe3d5b429d354e233f92
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.statx01
      last run: https://d.kernelci.org/test/maestro:6af1fe415b429d354e2342b8
      history:  > ❌  > ❌  > ✅  > ✅  
            
Hardware: jetson-agx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_memcontrol
      last run: https://d.kernelci.org/test/maestro:6af24d425b429d354e262f5a
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_memcontrol_test_memcg_low
      last run: https://d.kernelci.org/test/maestro:6af24d425b429d354e262f4d
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.mm
      last run: https://d.kernelci.org/test/maestro:6af214d55b429d354e2489f6
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_thp_sh
      last run: https://d.kernelci.org/test/maestro:6af24d525b429d354e26368d
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_thp_sh_split_huge_page_test
      last run: https://d.kernelci.org/test/maestro:6af24d525b429d354e26368a
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.clone304
      last run: https://d.kernelci.org/test/maestro:6af24d4d5b429d354e263348
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.fanotify17
      last run: https://d.kernelci.org/test/maestro:6af24d4d5b429d354e263424
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.ioctl_ns06
      last run: https://d.kernelci.org/test/maestro:6af24d4d5b429d354e26340d
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.ioctl_pidfd02
      last run: https://d.kernelci.org/test/maestro:6af24d485b429d354e263111
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.ioctl_pidfd03
      last run: https://d.kernelci.org/test/maestro:6af24d485b429d354e263112
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.ioctl_pidfd04
      last run: https://d.kernelci.org/test/maestro:6af24d485b429d354e263113
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.ioctl_pidfd05
      last run: https://d.kernelci.org/test/maestro:6af24d485b429d354e263114
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.ioctl_pidfd06
      last run: https://d.kernelci.org/test/maestro:6af24d485b429d354e263115
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.keyctl05
      last run: https://d.kernelci.org/test/maestro:6af24d4d5b429d354e263432
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.keyctl23
      last run: https://d.kernelci.org/test/maestro:6af24d4d5b429d354e263434
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.keyctl29
      last run: https://d.kernelci.org/test/maestro:6af24d4d5b429d354e263435
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.madvise11
      last run: https://d.kernelci.org/test/maestro:6af24d4d5b429d354e2634ca
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.mount_setattr02
      last run: https://d.kernelci.org/test/maestro:6af24d4d5b429d354e263488
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.pivot_root01
      last run: https://d.kernelci.org/test/maestro:6af24d4f5b429d354e2634e1
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.sendmsg03
      last run: https://d.kernelci.org/test/maestro:6af24d4f5b429d354e263553
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.sendto03
      last run: https://d.kernelci.org/test/maestro:6af24d4f5b429d354e263555
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.setsockopt05
      last run: https://d.kernelci.org/test/maestro:6af24d4f5b429d354e2635ad
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.setsockopt07
      last run: https://d.kernelci.org/test/maestro:6af24d4f5b429d354e2635ae
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.setsockopt08
      last run: https://d.kernelci.org/test/maestro:6af24d4f5b429d354e2635af
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.setsockopt09
      last run: https://d.kernelci.org/test/maestro:6af24d4f5b429d354e2635b0
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.statmount03
      last run: https://d.kernelci.org/test/maestro:6af24d4b5b429d354e2632c8
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.statx01
      last run: https://d.kernelci.org/test/maestro:6af24d505b429d354e263621
      history:  > ❌  > ❌  > ✅  > ✅  
            
Hardware: jetson-agx-orin-industrial-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.mm
      last run: https://d.kernelci.org/test/maestro:6af214d55b429d354e2489f9
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_thp_sh
      last run: https://d.kernelci.org/test/maestro:6af220345b429d354e25185e
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_thp_sh_split_huge_page_test
      last run: https://d.kernelci.org/test/maestro:6af220345b429d354e25185b
      history:  > ❌  > ✅  > ✅  
            
      - ltp.clone304
      last run: https://d.kernelci.org/test/maestro:6af220f75b429d354e25232e
      history:  > ❌  > ✅  > ✅  
            
      - ltp.fanotify17
      last run: https://d.kernelci.org/test/maestro:6af220f95b429d354e25253c
      history:  > ❌  > ✅  > ✅  
            
      - ltp.ioctl_ns06
      last run: https://d.kernelci.org/test/maestro:6af220f95b429d354e252498
      history:  > ❌  > ✅  > ✅  
            
      - ltp.ioctl_pidfd02
      last run: https://d.kernelci.org/test/maestro:6af220f75b429d354e25243a
      history:  > ❌  > ✅  > ✅  
            
      - ltp.ioctl_pidfd03
      last run: https://d.kernelci.org/test/maestro:6af220f95b429d354e2524e4
      history:  > ❌  > ✅  > ✅  
            
      - ltp.ioctl_pidfd04
      last run: https://d.kernelci.org/test/maestro:6af220f95b429d354e25259a
      history:  > ❌  > ✅  > ✅  
            
      - ltp.ioctl_pidfd05
      last run: https://d.kernelci.org/test/maestro:6af221005b429d354e25279f
      history:  > ❌  > ✅  > ✅  
            
      - ltp.ioctl_pidfd06
      last run: https://d.kernelci.org/test/maestro:6af221015b429d354e25284a
      history:  > ❌  > ✅  > ✅  
            
      - ltp.keyctl05
      last run: https://d.kernelci.org/test/maestro:6af221005b429d354e2527f4
      history:  > ❌  > ✅  > ✅  
            
      - ltp.keyctl23
      last run: https://d.kernelci.org/test/maestro:6af220f75b429d354e252347
      history:  > ❌  > ✅  > ✅  
            
      - ltp.keyctl29
      last run: https://d.kernelci.org/test/maestro:6af220fc5b429d354e25274a
      history:  > ❌  > ✅  > ✅  
            
      - ltp.madvise11
      last run: https://d.kernelci.org/test/maestro:6af220f95b429d354e2524b1
      history:  > ❌  > ✅  > ✅  
            
      - ltp.mount_setattr02
      last run: https://d.kernelci.org/test/maestro:6af220f95b429d354e2524ab
      history:  > ❌  > ✅  > ✅  
            
      - ltp.pivot_root01
      last run: https://d.kernelci.org/test/maestro:6af221015b429d354e252808
      history:  > ❌  > ✅  > ✅  
            
      - ltp.sendmsg03
      last run: https://d.kernelci.org/test/maestro:6af220f95b429d354e2524c0
      history:  > ❌  > ✅  > ✅  
            
      - ltp.sendto03
      last run: https://d.kernelci.org/test/maestro:6af221015b429d354e252814
      history:  > ❌  > ✅  > ✅  
            
      - ltp.setsockopt05
      last run: https://d.kernelci.org/test/maestro:6af220fc5b429d354e2526cc
      history:  > ❌  > ✅  > ✅  
            
      - ltp.setsockopt07
      last run: https://d.kernelci.org/test/maestro:6af220f75b429d354e25236d
      history:  > ❌  > ✅  > ✅  
            
      - ltp.setsockopt08
      last run: https://d.kernelci.org/test/maestro:6af220fc5b429d354e2526cd
      history:  > ❌  > ✅  > ✅  
            
      - ltp.setsockopt09
      last run: https://d.kernelci.org/test/maestro:6af220f95b429d354e2524cb
      history:  > ❌  > ✅  > ✅  
            
      - ltp.statmount03
      last run: https://d.kernelci.org/test/maestro:6af220f95b429d354e252468
      history:  > ❌  > ✅  > ✅  
            
      - ltp.statx01
      last run: https://d.kernelci.org/test/maestro:6af220f75b429d354e25241a
      history:  > ❌  > ✅  > ✅  
            
Hardware: jetson-xavier-nx-devkit
  > Config: defconfig+lab-setup
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_freezer_test_cgfreezer_vfork
      last run: https://d.kernelci.org/test/maestro:6af214b05b429d354e2486c4
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: nvidia-p3809-gb300
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_cpuset_prs_sh
      last run: https://d.kernelci.org/test/maestro:6af27afc5b429d354e28cfab
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.mm
      last run: https://d.kernelci.org/test/maestro:6af214d55b429d354e2489fc
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_thp_sh
      last run: https://d.kernelci.org/test/maestro:6af27b0a5b429d354e28d657
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_thp_sh_split_huge_page_test
      last run: https://d.kernelci.org/test/maestro:6af27b0a5b429d354e28d654
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.clock_nanosleep02
      last run: https://d.kernelci.org/test/maestro:6af27b025b429d354e28d184
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - ltp.clone304
      last run: https://d.kernelci.org/test/maestro:6af27b055b429d354e28d319
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.fanotify17
      last run: https://d.kernelci.org/test/maestro:6af27b055b429d354e28d3f5
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.ioctl_ns06
      last run: https://d.kernelci.org/test/maestro:6af27b055b429d354e28d3de
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.ioctl_pidfd02
      last run: https://d.kernelci.org/test/maestro:6af27b005b429d354e28d125
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.ioctl_pidfd03
      last run: https://d.kernelci.org/test/maestro:6af27b005b429d354e28d127
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.ioctl_pidfd04
      last run: https://d.kernelci.org/test/maestro:6af27b005b429d354e28d128
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.ioctl_pidfd05
      last run: https://d.kernelci.org/test/maestro:6af27b005b429d354e28d0ee
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.ioctl_pidfd06
      last run: https://d.kernelci.org/test/maestro:6af27b005b429d354e28d0b7
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.keyctl05
      last run: https://d.kernelci.org/test/maestro:6af27b055b429d354e28d403
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.keyctl23
      last run: https://d.kernelci.org/test/maestro:6af27b055b429d354e28d405
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.keyctl29
      last run: https://d.kernelci.org/test/maestro:6af27b055b429d354e28d406
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.madvise11
      last run: https://d.kernelci.org/test/maestro:6af27b055b429d354e28d49b
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.mount_setattr02
      last run: https://d.kernelci.org/test/maestro:6af27b055b429d354e28d459
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.pivot_root01
      last run: https://d.kernelci.org/test/maestro:6af27b075b429d354e28d4af
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.pselect01
      last run: https://d.kernelci.org/test/maestro:6af27b035b429d354e28d241
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.select02
      last run: https://d.kernelci.org/test/maestro:6af27b035b429d354e28d2e0
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.sendmsg03
      last run: https://d.kernelci.org/test/maestro:6af27b075b429d354e28d521
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.sendto03
      last run: https://d.kernelci.org/test/maestro:6af27b075b429d354e28d523
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.setsockopt05
      last run: https://d.kernelci.org/test/maestro:6af27b075b429d354e28d57b
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.setsockopt07
      last run: https://d.kernelci.org/test/maestro:6af27b075b429d354e28d57c
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.setsockopt08
      last run: https://d.kernelci.org/test/maestro:6af27b075b429d354e28d57d
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.setsockopt09
      last run: https://d.kernelci.org/test/maestro:6af27b075b429d354e28d57e
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.setsockopt11
      last run: https://d.kernelci.org/test/maestro:6af27b035b429d354e28d2e6
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.statmount03
      last run: https://d.kernelci.org/test/maestro:6af27b035b429d354e28d275
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.statx01
      last run: https://d.kernelci.org/test/maestro:6af27b085b429d354e28d5ef
      history:  > ❌  > ❌  > ✅  > ✅  
            
Hardware: purwa-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers.timers_set-timer-lat
      last run: https://d.kernelci.org/test/maestro:6af2304b5b429d354e25973c
      history:  > ❌  > ✅  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-04
      last run: https://d.kernelci.org/test/maestro:6af20d635b429d354e2440e9
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: jetson-tx2-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6af214d45b429d354e2489e4
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_500000_broadcast_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6af21b4b5b429d354e24be8c
      history:  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: hamoa-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:6af1f17d5b429d354e2267f0
      history:  > ❌  > ✅  > ❌  > ❌  
            
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.kvm.kvm_set_memory_region_test
      last run: https://d.kernelci.org/test/maestro:6af1fe455b429d354e23433c
      history:  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.mm.mm_ksft_gup_test_sh
      last run: https://d.kernelci.org/test/maestro:6af1fe435b429d354e2342d2
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_gup_test_sh_gup
      last run: https://d.kernelci.org/test/maestro:6af1fe435b429d354e2342d0
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_hmm_sh
      last run: https://d.kernelci.org/test/maestro:6af1fe435b429d354e2342d4
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_hmm_sh_test_hmm_sh_smoke
      last run: https://d.kernelci.org/test/maestro:6af1fe435b429d354e2342d3
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_memory_failure_sh
      last run: https://d.kernelci.org/test/maestro:6af1fe435b429d354e2342f8
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_memory_failure_sh_memory-failure
      last run: https://d.kernelci.org/test/maestro:6af1fe435b429d354e2342f7
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_thp_sh_khugepaged_race
      last run: https://d.kernelci.org/test/maestro:6af1fe435b429d354e234317
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_thp_sh_khugepaged_sync_check
      last run: https://d.kernelci.org/test/maestro:6af1fe435b429d354e234316
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_vmalloc_sh
      last run: https://d.kernelci.org/test/maestro:6af1fe435b429d354e23432b
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_vmalloc_sh_test_vmalloc_sh_smoke
      last run: https://d.kernelci.org/test/maestro:6af1fe435b429d354e23432a
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - ltp.epoll_wait02
      last run: https://d.kernelci.org/test/maestro:6af1fe3d5b429d354e233eba
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - ltp.futex_wait05
      last run: https://d.kernelci.org/test/maestro:6af1fe3d5b429d354e233f3f
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - ltp.macsec02
      last run: https://d.kernelci.org/test/maestro:6af1fe345b429d354e233b08
      history:  > ⚠️  > ⚠️  > ❌  > ❌  
            
      - ltp.prctl09
      last run: https://d.kernelci.org/test/maestro:6af1fe3d5b429d354e233f02
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - ltp.shmget03
      last run: https://d.kernelci.org/test/maestro:6af1fe3d5b429d354e233f0b
      history:  > ✅  > ❌  > ✅  > ❌  
            
Hardware: jetson-agx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.mm.mm_ksft_gup_test_sh
      last run: https://d.kernelci.org/test/maestro:6af24d525b429d354e263641
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_gup_test_sh_gup
      last run: https://d.kernelci.org/test/maestro:6af24d525b429d354e26363f
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_hmm_sh
      last run: https://d.kernelci.org/test/maestro:6af24d525b429d354e263643
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_hmm_sh_test_hmm_sh_smoke
      last run: https://d.kernelci.org/test/maestro:6af24d525b429d354e263642
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_memory_failure_sh
      last run: https://d.kernelci.org/test/maestro:6af24d525b429d354e263667
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_memory_failure_sh_memory-failure
      last run: https://d.kernelci.org/test/maestro:6af24d525b429d354e263666
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_thp_sh_khugepaged_race
      last run: https://d.kernelci.org/test/maestro:6af24d525b429d354e263685
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_thp_sh_khugepaged_sync_check
      last run: https://d.kernelci.org/test/maestro:6af24d525b429d354e263684
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_vmalloc_sh
      last run: https://d.kernelci.org/test/maestro:6af24d525b429d354e263699
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_vmalloc_sh_test_vmalloc_sh_smoke
      last run: https://d.kernelci.org/test/maestro:6af24d525b429d354e263698
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - ltp.epoll_pwait03
      last run: https://d.kernelci.org/test/maestro:6af24d4a5b429d354e2631c2
      history:  > ❌  > ❌  > ✅  > ❌  
            
      - ltp.macsec02
      last run: https://d.kernelci.org/test/maestro:6af24d415b429d354e262f0d
      history:  > ⚠️  > ⚠️  > ❌  > ❌  
            
      - ltp.nanosleep01
      last run: https://d.kernelci.org/test/maestro:6af24d4a5b429d354e2631f9
      history:  > ❌  > ❌  > ✅  > ❌  
            
      - ltp.pselect01
      last run: https://d.kernelci.org/test/maestro:6af24d4a5b429d354e26323f
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - ltp.shmget03
      last run: https://d.kernelci.org/test/maestro:6af24d4a5b429d354e26326c
      history:  > ❌  > ❌  > ✅  > ❌  
            
Hardware: jetson-agx-orin-industrial-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.mm.mm_ksft_gup_test_sh
      last run: https://d.kernelci.org/test/maestro:6af220345b429d354e251812
      history:  > ⚠️  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_gup_test_sh_gup
      last run: https://d.kernelci.org/test/maestro:6af220345b429d354e251810
      history:  > ⚠️  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_hmm_sh
      last run: https://d.kernelci.org/test/maestro:6af220345b429d354e251814
      history:  > ⚠️  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_hmm_sh_test_hmm_sh_smoke
      last run: https://d.kernelci.org/test/maestro:6af220345b429d354e251813
      history:  > ⚠️  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_memory_failure_sh
      last run: https://d.kernelci.org/test/maestro:6af220345b429d354e251838
      history:  > ⚠️  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_memory_failure_sh_memory-failure
      last run: https://d.kernelci.org/test/maestro:6af220345b429d354e251837
      history:  > ⚠️  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_thp_sh_khugepaged_race
      last run: https://d.kernelci.org/test/maestro:6af220345b429d354e251856
      history:  > ⚠️  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_thp_sh_khugepaged_sync_check
      last run: https://d.kernelci.org/test/maestro:6af220345b429d354e251855
      history:  > ⚠️  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_vmalloc_sh
      last run: https://d.kernelci.org/test/maestro:6af220345b429d354e25186a
      history:  > ⚠️  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_vmalloc_sh_test_vmalloc_sh_smoke
      last run: https://d.kernelci.org/test/maestro:6af220345b429d354e251869
      history:  > ⚠️  > ✅  > ✅  
            
      - ltp.macsec02
      last run: https://d.kernelci.org/test/maestro:6af220f15b429d354e2521fb
      history:  > ⚠️  > ❌  > ❌  
            
Hardware: jetson-nano-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6af21b855b429d354e24c1ba
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6af21b855b429d354e24c1b5
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - ltp.macsec02
      last run: https://d.kernelci.org/test/maestro:6af21b835b429d354e24c180
      history:  > ⚠️  > ⚠️  > ❌  > ❌  
            
Hardware: jetson-orin-nx-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_cpuset_prs_sh
      last run: https://d.kernelci.org/test/maestro:6af21ddd5b429d354e24f967
      history:  > ❌  > ⚠️  > ⚠️  > ❌  
            
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6af21ddd5b429d354e24f913
      history:  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6af21ddd5b429d354e24f90e
      history:  > ❌  > ❌  > ✅  > ❌  
            
      - ltp.macsec02
      last run: https://d.kernelci.org/test/maestro:6af21ddb5b429d354e24f8bd
      history:  > ⚠️  > ⚠️  > ❌  > ❌  
            
Hardware: jetson-xavier-nx-devkit
  > Config: defconfig+lab-setup
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_freezer
      last run: https://d.kernelci.org/test/maestro:6af214b05b429d354e2486cc
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_freezer_test_cgfreezer_ptrace
      last run: https://d.kernelci.org/test/maestro:6af214b05b429d354e2486c1
      history:  > ✅  > ✅  > ❌  > ✅  
            
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000
      last run: https://d.kernelci.org/test/maestro:6af23e5b5b429d354e25e597
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_display-controller_ae01000
      last run: https://d.kernelci.org/test/maestro:6af23e5b5b429d354e25e596
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_af54000
      last run: https://d.kernelci.org/test/maestro:6af23e5b5b429d354e25e594
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_aec2a00
      last run: https://d.kernelci.org/test/maestro:6af23e5b5b429d354e25e591
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_aec5a00
      last run: https://d.kernelci.org/test/maestro:6af23e5b5b429d354e25e590
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_usb_a800000_hub_2
      last run: https://d.kernelci.org/test/maestro:6af23e5b5b429d354e25e4ba
      history:  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: nvidia-e5020-vera
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp.macsec02
      last run: https://d.kernelci.org/test/maestro:6af2219c5b429d354e252c20
      history:  > ⚠️  > ⚠️  > ❌  > ❌  
            
Hardware: nvidia-igx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp.macsec02
      last run: https://d.kernelci.org/test/maestro:6af21ddb5b429d354e24f8cd
      history:  > ⚠️  > ⚠️  > ❌  > ❌  
            
Hardware: nvidia-p3809-gb300
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.mm.mm_ksft_gup_test_sh
      last run: https://d.kernelci.org/test/maestro:6af27b0a5b429d354e28d60b
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_gup_test_sh_gup
      last run: https://d.kernelci.org/test/maestro:6af27b0a5b429d354e28d609
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_hmm_sh
      last run: https://d.kernelci.org/test/maestro:6af27b0a5b429d354e28d60d
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_hmm_sh_test_hmm_sh_smoke
      last run: https://d.kernelci.org/test/maestro:6af27b0a5b429d354e28d60c
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_memory_failure_sh
      last run: https://d.kernelci.org/test/maestro:6af27b0a5b429d354e28d631
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_memory_failure_sh_memory-failure
      last run: https://d.kernelci.org/test/maestro:6af27b0a5b429d354e28d630
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_thp_sh_khugepaged_race
      last run: https://d.kernelci.org/test/maestro:6af27b0a5b429d354e28d64f
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_thp_sh_khugepaged_sync_check
      last run: https://d.kernelci.org/test/maestro:6af27b0a5b429d354e28d64e
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_vmalloc_sh
      last run: https://d.kernelci.org/test/maestro:6af27b0a5b429d354e28d663
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_vmalloc_sh_test_vmalloc_sh_smoke
      last run: https://d.kernelci.org/test/maestro:6af27b0a5b429d354e28d662
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - ltp.epoll_wait02
      last run: https://d.kernelci.org/test/maestro:6af27b035b429d354e28d1cc
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - ltp.macsec02
      last run: https://d.kernelci.org/test/maestro:6af27afa5b429d354e28cf13
      history:  > ⚠️  > ⚠️  > ❌  > ❌  
            
      - ltp.shmget03
      last run: https://d.kernelci.org/test/maestro:6af27b035b429d354e28d23e
      history:  > ✅  > ✅  > ❌  > ✅  
            
Hardware: nvidia-p5042-gh200
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp.macsec02
      last run: https://d.kernelci.org/test/maestro:6af21ff85b429d354e2515ec
      history:  > ⚠️  > ⚠️  > ❌  > ❌  
            
Hardware: qcs615-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.devices-probe
      last run: https://d.kernelci.org/test/maestro:6af1f2135b429d354e226e57
      history:  > ❌  > ✅  > ❌  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.devices-exist
      last run: https://d.kernelci.org/test/maestro:6af1f2045b429d354e226c53
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000
      last run: https://d.kernelci.org/test/maestro:6af20e8b5b429d354e2450f7
      history:  > ❌  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_display-controller_ae01000
      last run: https://d.kernelci.org/test/maestro:6af20e8b5b429d354e2450f6
      history:  > ❌  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_dsi_ae94000
      last run: https://d.kernelci.org/test/maestro:6af20e8b5b429d354e2450f2
      history:  > ❌  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_edp_aea0000
      last run: https://d.kernelci.org/test/maestro:6af20e8b5b429d354e2450f0
      history:  > ❌  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_ae94400
      last run: https://d.kernelci.org/test/maestro:6af20e8b5b429d354e2450ee
      history:  > ❌  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_aec2a00
      last run: https://d.kernelci.org/test/maestro:6af20e8b5b429d354e2450ed
      history:  > ❌  > ✅  > ✅  > ❌  
            
Hardware: qemu-arm64
  > Config: defconfig+netdev+nfs-root-boot+ltp+crypto+ima
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6af1eebc5b429d354e220dfa
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
Hardware: sun50i-a64-pine64-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_pcm-test_default_time7_sun50ia64audio_0_0_CAPTURE
      last run: https://d.kernelci.org/test/maestro:6af1f91d5b429d354e22cae0
      history:  > ✅  > ❌  > ✅  > ✅  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-01-intra-1417
      last run: https://d.kernelci.org/test/maestro:6af20d545b429d354e243fda
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp9.VP9-TEST-VECTORS-GStreamer-VP9-V4L2.vp90-2-15-segkey-webm
      last run: https://d.kernelci.org/test/maestro:6af20f6d5b429d354e24558c
      history:  > ❌  > ✅  > ✅  > ❌  
            
Hardware: jetson-tx1-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp.macsec02
      last run: https://d.kernelci.org/test/maestro:6af21c385b429d354e24efe7
      history:  > ⚠️  > ⚠️  > ❌  > ❌  
            
Hardware: jetson-tx2-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp.macsec02
      last run: https://d.kernelci.org/test/maestro:6af21b475b429d354e24bdf7
      history:  > ⚠️  > ⚠️  > ❌  
            



This branch has 8 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
