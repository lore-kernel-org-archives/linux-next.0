Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1A813AD26
	for <linux-next@vger.kernel.org>; Sat, 28 Feb 2026 02:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772245813; cv=none; b=p2w2QvNR9dt1LQ9mektKFboLj46yEMp+YHwjVrOYv3jVQp0G/gUStvRR38WTWhIDkXRAn4RDxo+Q47wSnDV2FBhSeac3eRa4ZxJsCsyghpCV8ebRyN0AK3IDzHcY5diDJrjdPJWQfdL9D0aLZrxu3FJRaGtiaJupqwiPaf0uXrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772245813; c=relaxed/simple;
	bh=linHQMvOf3WP72+ZhJ8VAG321rwIsgsK1HzqjO/k3BQ=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=e6SWMnJcC0Dv3zFf+LUwxbwfdHngabo9/bSdvZKkdawwIpdpduT/r1CgkbUX2YDFNyHvA5Cy7xc4HOpjZkTVntadguEYbihi3OOTZolNi8mlN7kd72eiqhXSDk/JGwTvpGaH6gMy9w3A3WidV90MUS11v6O85pDqkknhkd/S1Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Jpk3ks7R; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Jpk3ks7R"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-124afd03fd1so3670521c88.0
        for <linux-next@vger.kernel.org>; Fri, 27 Feb 2026 18:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1772245811; x=1772850611; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+bNDP+gTJo8ofC23tJUzuThIbR3QjOY+qMBID4ebw8=;
        b=Jpk3ks7Rv+EF1wHqltyvYeTjZBltQNC5v9yqXwc903dQf15b/94lSNld+jvdoulGBo
         OoiWwJxvwpbg08yX68Q4HgZ8AQsI9aebDt/COdlgXZsoBu1Qg4uvX+5tRTkZh6KEuT+k
         zcDEt+Avrv3DnEOAJ09SQqigD3RUzpMOXYciusph3ceUMYzcNfCG1MNEnNq9UQd113xP
         X4wYrG9WmFpcIZpx1C7Ub3CpigPNHcraUuF4qGf1+nD/CyBCnxjBzgRRshRLPvJFJngF
         TiKpOXc6NQ99JlKdtPXUWBi1CHtR3X66PCcBcLK/HyA/1bKBC/RjyUEYMU8giTX2HiKJ
         iIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772245811; x=1772850611;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J+bNDP+gTJo8ofC23tJUzuThIbR3QjOY+qMBID4ebw8=;
        b=NxAMf7bR3pCupvSlA3RVt5w/TBA7jRz6mbkXkmk6QqWuvaKNEJLArI3/2O54wyrj8K
         N1tRYMWU7jeb4PV9A58dQQ05i1FOr/e4F8+JqSOU+BCqqeR0hscrHE0VPA5OwX6XITwS
         4YETPOGKmonDGG3o/C7TiPO1vUNO9WsgxtnUrH6D/wwmlXL3z4im8XdSA7kbAtSErHzp
         M2efDvaqHGSwRK9JahWtUtUzA1joIYqQsIAfcgJrwxdv7mNaNK7/RNdk9Pe/mgwoB5F8
         TUIvojwFri9mMo4rHSrXEArSPocaCEMSdr/Ze9cCHtRVQ1hcEZkC03GTCm167357oRrT
         fWqg==
X-Gm-Message-State: AOJu0YzboIeMYtYi0nEUutFbB4ByKnjcd3UhzyNK/UENptKWvQFBRAkP
	k1DrNNb3TiZ9Td5lVTKFYl+1CrIKlUcaDLtTW3COZ+LkzYgalUMlaGhZhAbtWRZUmeE=
X-Gm-Gg: ATEYQzzVWYolpdNz/LnbsaTkXFLGRKLkD2m/c6JsmCKv6HJWom/fLFdXwyDuAh3C6NL
	gvrMni9ASGHW4H5J/GXvqeJ9QcdCnvpv6iJYD6W5VPobffT9oNQwmhC3KBWkrr7VEXSScA2wDIz
	nTDLkaafgpLSsApeughQo4qAGF15VnAYsBnZ4x3rSJ9r4siv8tfcPsS281/o57xmbemCMx5GiHo
	vbOmkNE0rW6lLnFJ5Gc5pHncb+246mkN7/oNFh9hxIOYr8i8qbUoG9iA0NOth8/8q4Eh3Ha1w89
	t3fxwedHGxdaP+EAEXm90lJNb05zVPO3I3df8MIQ3vjOb6OIb9QOK2ZQi3htGAsf3/keVv/XiPm
	RwWdBfuwuhuZYXfKSg5msGSIdR0WFt/pGtcjpXDOc5lD4E+vKpDuspAhTHt7u+gnbEBr0rpp4ei
	PZLiYHthCYKsF/LbOh
X-Received: by 2002:a05:7022:6713:b0:123:35cb:96e3 with SMTP id a92af1059eb24-1278fc6bee0mr2170522c88.46.1772245810894;
        Fri, 27 Feb 2026 18:30:10 -0800 (PST)
Received: from d14e337afe00 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127899df391sm7274624c88.5.2026.02.27.18.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 18:30:10 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 3fa5e5702a82d259897bd7e209469bc06368bf31
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sat, 28 Feb 2026 02:30:09 -0000
Message-ID: <177224580950.4021.4140881645206713253@d14e337afe00>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/3fa5e5702a82d259897bd7e209469bc06368bf31/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 3fa5e5702a82d259897bd7e209469bc06368bf31
origin: maestro
test start time: 2026-02-27 15:08:12.555000+00:00

Builds:	   59 ✅    2 ❌    0 ⚠️
Boots: 	  196 ✅    6 ❌    0 ⚠️
Tests: 	19641 ✅ 3272 ❌ 5964 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.mm
      last run: https://d.kernelci.org/test/maestro:69a1cb5c1f24bb6946441d3a
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:69a1bd1f1f24bb6946438f10
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_pruss_30040000_interrupt-controller_20000
      last run: https://d.kernelci.org/test/maestro:69a21e837136242fe389debb
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_pruss_30040000_pru_34000
      last run: https://d.kernelci.org/test/maestro:69a21e837136242fe389deba
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_pruss_30040000_pru_38000
      last run: https://d.kernelci.org/test/maestro:69a21e837136242fe389deb9
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_h265.JCT-VC-HEVC_V1-GStreamer-H-265-V4L2SL-Gst1-0.AMVP_B_MTK_4
      last run: https://d.kernelci.org/test/maestro:69a1c9cd1f24bb6946440bc0
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:69a1c3db1f24bb694643d5e2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_gpu_fd00000
      last run: https://d.kernelci.org/test/maestro:69a21e837136242fe389ded2
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_av1.AV1-TEST-VECTORS-GStreamer-AV1-V4L2SL-Gst1-0.av1-1-b8-00-quantizer-24
      last run: https://d.kernelci.org/test/maestro:69a1c8bb1f24bb694643f539
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: monaco-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.capabilities
      last run: https://d.kernelci.org/test/maestro:69a1c3a91f24bb694643d490
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:69a1c3bc1f24bb694643d508
      history:  > ❌  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:69a1c3c81f24bb694643d56c
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
Hardware: beaglebone-black
  > Config: multi_v7_defconfig+kselftest
    - Architecture/compiler: arm/gcc-14
      - kselftest.uevent
      last run: https://d.kernelci.org/test/maestro:69a1b9ea1f24bb6946438a63
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.uevent.uevent_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:69a204801f24bb6946451445
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.uevent.uevent_uevent_filtering_global_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:69a204801f24bb6946451446
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_22
      last run: https://d.kernelci.org/test/maestro:69a1ce871f24bb694644265d
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_22
      last run: https://d.kernelci.org/test/maestro:69a1d02b1f24bb69464429b2
      history:  > ❌  > ✅  > ❌  > ✅  > ✅  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_regulator-pcie
      last run: https://d.kernelci.org/test/maestro:69a1f6031f24bb69464470c8
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_regulator-usb-hub
      last run: https://d.kernelci.org/test/maestro:69a1f6031f24bb69464470c7
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_i2c_30a50000_eeprom_50
      last run: https://d.kernelci.org/test/maestro:69a1f6031f24bb6946447091
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_33800000
      last run: https://d.kernelci.org/test/maestro:69a1f6031f24bb694644705f
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_usb_32f10108_usb_38200000_usb-hub_1
      last run: https://d.kernelci.org/test/maestro:69a1f6031f24bb6946447058
      history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_usb_32f10108_usb_38200000_usb-hub_2
      last run: https://d.kernelci.org/test/maestro:69a1f6031f24bb6946447057
      history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:69a1c3f31f24bb694643d661
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
Hardware: mt8192-asurada-spherion-r0
  > Config: defconfig+arm64-chromebook+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rtla-osnoise
      last run: https://d.kernelci.org/test/maestro:69a1be951f24bb694643a335
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_av1.validate-fluster-results
      last run: https://d.kernelci.org/test/maestro:69a1c8bc1f24bb694643f59d
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - fluster.debian.v4l2.gstreamer_h264.validate-fluster-results
      last run: https://d.kernelci.org/test/maestro:69a1c9051f24bb694643f9f5
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - fluster.debian.v4l2.gstreamer_vp8.validate-fluster-results
      last run: https://d.kernelci.org/test/maestro:69a1c9801f24bb69464407dd
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_mt8195-sound
      last run: https://d.kernelci.org/test/maestro:69a1c8a91f24bb694643f1fa
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c104000
      last run: https://d.kernelci.org/test/maestro:69a1c8a91f24bb694643f186
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c105000
      last run: https://d.kernelci.org/test/maestro:69a1c8a91f24bb694643f185
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c106000
      last run: https://d.kernelci.org/test/maestro:69a1c8a91f24bb694643f184
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c107000
      last run: https://d.kernelci.org/test/maestro:69a1c8a91f24bb694643f183
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c108000
      last run: https://d.kernelci.org/test/maestro:69a1c8a91f24bb694643f182
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c109000
      last run: https://d.kernelci.org/test/maestro:69a1c8a91f24bb694643f181
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c10a000
      last run: https://d.kernelci.org/test/maestro:69a1c8a91f24bb694643f180
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c10b000
      last run: https://d.kernelci.org/test/maestro:69a1c8a91f24bb694643f17f
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dp-intf_1c015000
      last run: https://d.kernelci.org/test/maestro:69a1c8a91f24bb694643f17e
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dp-intf_1c113000
      last run: https://d.kernelci.org/test/maestro:69a1c8a91f24bb694643f17d
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dp-tx_1c600000
      last run: https://d.kernelci.org/test/maestro:69a1c8a91f24bb694643f17c
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_edp-tx_1c500000
      last run: https://d.kernelci.org/test/maestro:69a1c8a91f24bb694643f179
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_edp-tx_1c500000_aux-bus_panel
      last run: https://d.kernelci.org/test/maestro:69a1c8a91f24bb694643f178
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_hdr-engine_1c114000
      last run: https://d.kernelci.org/test/maestro:69a1c8a91f24bb694643f174
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000
      last run: https://d.kernelci.org/test/maestro:69a1c8a91f24bb694643f163
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_0_0
      last run: https://d.kernelci.org/test/maestro:69a1c8a91f24bb694643f162
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_0_10000
      last run: https://d.kernelci.org/test/maestro:69a1c8a91f24bb694643f161
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_1_0
      last run: https://d.kernelci.org/test/maestro:69a1c8a91f24bb694643f160
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000
      last run: https://d.kernelci.org/test/maestro:69a1c8a91f24bb694643f15f
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000_jpgenc_0_0
      last run: https://d.kernelci.org/test/maestro:69a1c8a91f24bb694643f15e
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000_jpgenc_1_0
      last run: https://d.kernelci.org/test/maestro:69a1c8a91f24bb694643f15d
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_1c000000
      last run: https://d.kernelci.org/test/maestro:69a1c8a91f24bb694643f134
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1c002000
      last run: https://d.kernelci.org/test/maestro:69a1c8a91f24bb694643f12a
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000
      last run: https://d.kernelci.org/test/maestro:69a1c8a81f24bb694643f106
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_10000
      last run: https://d.kernelci.org/test/maestro:69a1c8a81f24bb694643f105
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_2000
      last run: https://d.kernelci.org/test/maestro:69a1c8a81f24bb694643f104
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_25000
      last run: https://d.kernelci.org/test/maestro:69a1c8a81f24bb694643f103
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_1a020000
      last run: https://d.kernelci.org/test/maestro:69a1c8a81f24bb694643f102
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:69a1bc591f24bb6946438bfc
      history:  > ✅  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:69a1bef21f24bb694643b2c9
      history:  > ✅  > ❌  > ❌  > ✅  > ❌  
            
Hardware: monaco-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.tmpfs
      last run: https://d.kernelci.org/test/maestro:69a1c3df1f24bb694643d5f7
      history:  > ✅  > ✅  > ❌  > ✅  
            



This branch has 2 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
