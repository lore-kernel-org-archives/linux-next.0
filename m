Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5081DE2C9
	for <linux-next@vger.kernel.org>; Fri, 27 Feb 2026 02:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772159443; cv=none; b=YjkV3BNdJwMg3NCMOrRrBZ7kNM2C/evD0i9v2F6k19nK95zfDTBLkTGkklNkhFo3Sbc1Do3txU6eys/nGY2f9QWYSHpt5n2u9i446jXN3S0i0lfnUeuD07qWxWcIXqY5Cj3ogZolEUZEo+A1xWfIArS9+/pOkTod2oOFiQatROM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772159443; c=relaxed/simple;
	bh=vi4vTCg9lotQxKNmgs4x2+60lh5Yb4p9ki+J7WQH+80=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=iKuIhPajP6RNOMs/QpphGcJY6O/ljD+afUtHu2hvvMuVCFzHBYm9duzPoK5HFXvh8v9xDXpMpSChKjNXtVexOYYhrrrIdMRIQ5UDEH0atPRAKs8jkFQr7TP2ejtHG55uyhKH4Ls1KVSRBMHtt850mQ8W0QiKYlof6w3OedhUGV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=xMLUI5r1; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="xMLUI5r1"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2bdc8bb60f5so1070357eec.1
        for <linux-next@vger.kernel.org>; Thu, 26 Feb 2026 18:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1772159441; x=1772764241; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KMzdvsDiqwzBXNHBluryUpHD3Epj7DN2l8mtXdTyou8=;
        b=xMLUI5r1tmholFvLTdD9TUGw99hxNNozkXAXL4DiQvT8rb5Q3OtN6i/TRQ7v1CkFJP
         CqFC2EGHiOWGsPceg4gEQoQvzaAQ/RoUQyNSWAZ7kW1CZDhQKl31rexMUgR9S41ivpBf
         JLEsPC1f7t9IGp2iErx4l0ekkcC8AoQCko8wvI80DChi0s6OZC0StgCSN31CE8cMJhiL
         IYAZcEXS7xtK0+aWR9pVWar9kbCb5MqonqmcS/heLO0RJKfMtYnG6nr8BXYylzAwqakE
         m7t8BzeS/2QRr5NvpD7eHH0oTboNTBVVY8BOwpfzODw9bbfGK/LJ+ER/PJhm6yQOwu3m
         vPgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772159441; x=1772764241;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KMzdvsDiqwzBXNHBluryUpHD3Epj7DN2l8mtXdTyou8=;
        b=QhMcpSXRqdliH8JDQq+DQcaJu98nyRhaiwg9v1LsqUC7R5E1tLSr3NOR4wxCdatDxj
         MeIT4aqirjdXr1Xql495M2R3800POttdQzrmd89vJJwk6C2YRrVZN5EfK9Sswr/uZfQU
         9DespMzuk5WYt55YIOzOH2rMhZnWtnplf6+D9Xy4teYe4X+cmnalv+wG8n1+qwOyj4Qa
         iEqOt3yXtF7QJDfmHRjdCRYpK/NM4yz4YCWQaVUDc2rF6wuIuFZTApAow3l9m+auS4O9
         xDV4AZ0GqdSW7+O6uSWpSGcjbY1/9Q6adHfTNj31QA20qKE2Mm9ZLYbd6875bYb/TdPC
         Q3Eg==
X-Gm-Message-State: AOJu0Yz/9yTqTAzzPGgWOVJxw2/uiXN2v5sJElDAZGU4EG/JBj7uE75/
	16Dvv8M1weMRbI7yp+4DSm9tF6tz30cJe5oZlqzGv86VuHV+FZJkLXJKRzrjRMR5C94=
X-Gm-Gg: ATEYQzwyqZ93f/mlO9A6Jqd5qOSx0CnDycsEFrlgdPiwJqjg7oFhkqcaaP7oisUVTbU
	QWcTmmeGMkylH53O5CGtUBgtzfO+ejGmRH6NsbBY2qLRQUsgr2uSaDje0e49sQPxpT8tMKzU6Vq
	dUiTi0AI7xvPVBgqbG4fy+5l1Ls4i5cGgrHjmj8/WQd0nIDcBMuaAocdhnquKROwuBZU21BO3bZ
	ebJG7G1TzFN9J3EZXeAjfBDt2EzsmzLAJf1ny3gZGRtqBHzq/wpfdsTqfvdbjjMxHZ+QmFQWBki
	hSp9a6UK4tg1ZKD4tgxGCsGsslpHL+eAF3QcMMKDmtwJy+b5dGDvLEdt5E3HgBDESJ1PpVxGjs6
	HT9PXcGS446Oii30pG6GWaB6wDyihOdqum8wEu/45rKUDXiqenbQnsqVDt3H1mp7U4RPlM3yVbJ
	FmwNexk72j/bD5C7EIWwDzQr+8k3Y=
X-Received: by 2002:a05:7300:ed18:b0:2ba:858b:3751 with SMTP id 5a478bee46e88-2bde1ba035dmr554703eec.3.1772159440436;
        Thu, 26 Feb 2026 18:30:40 -0800 (PST)
Received: from d14e337afe00 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdd1f7e955sm3134759eec.32.2026.02.26.18.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 18:30:39 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 7d6661873f6b54c75195780a40d66bad3d482d8f
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 27 Feb 2026 02:30:39 -0000
Message-ID: <177215943947.3529.1901787208068018566@d14e337afe00>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/7d6661873f6b54c75195780a40d66bad3d482d8f/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 7d6661873f6b54c75195780a40d66bad3d482d8f
origin: maestro
test start time: 2026-02-26 14:40:52.218000+00:00

Builds:	   59 ✅    2 ❌    0 ⚠️
Boots: 	  190 ✅    7 ❌    0 ⚠️
Tests: 	17857 ✅ 2800 ❌ 5519 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_pruss_30040000_interrupt-controller_20000
      last run: https://d.kernelci.org/test/maestro:69a08b331f24bb6946405e70
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_pruss_30040000_pru_34000
      last run: https://d.kernelci.org/test/maestro:69a08b331f24bb6946405e6f
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_pruss_30040000_pru_38000
      last run: https://d.kernelci.org/test/maestro:69a08b331f24bb6946405e6e
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
Hardware: mt8192-asurada-spherion-r0
  > Config: defconfig+arm64-chromebook+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rtla-osnoise
      last run: https://d.kernelci.org/test/maestro:69a065541f24bb69463f5496
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_mt8195-sound
      last run: https://d.kernelci.org/test/maestro:69a06b121f24bb69463f805d
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c104000
      last run: https://d.kernelci.org/test/maestro:69a06b121f24bb69463f8100
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c105000
      last run: https://d.kernelci.org/test/maestro:69a06b121f24bb69463f80ff
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c106000
      last run: https://d.kernelci.org/test/maestro:69a06b121f24bb69463f80fe
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c107000
      last run: https://d.kernelci.org/test/maestro:69a06b121f24bb69463f80fd
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c108000
      last run: https://d.kernelci.org/test/maestro:69a06b121f24bb69463f80fc
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c109000
      last run: https://d.kernelci.org/test/maestro:69a06b121f24bb69463f80fb
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c10a000
      last run: https://d.kernelci.org/test/maestro:69a06b121f24bb69463f80fa
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c10b000
      last run: https://d.kernelci.org/test/maestro:69a06b121f24bb69463f80f9
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dp-intf_1c015000
      last run: https://d.kernelci.org/test/maestro:69a06b121f24bb69463f80f8
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dp-intf_1c113000
      last run: https://d.kernelci.org/test/maestro:69a06b121f24bb69463f80f7
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dp-tx_1c600000
      last run: https://d.kernelci.org/test/maestro:69a06b121f24bb69463f80f6
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_edp-tx_1c500000
      last run: https://d.kernelci.org/test/maestro:69a06b121f24bb69463f80f3
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_edp-tx_1c500000_aux-bus_panel
      last run: https://d.kernelci.org/test/maestro:69a06b121f24bb69463f80f2
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_hdr-engine_1c114000
      last run: https://d.kernelci.org/test/maestro:69a06b121f24bb69463f80ee
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000
      last run: https://d.kernelci.org/test/maestro:69a06b121f24bb69463f80dd
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_0_0
      last run: https://d.kernelci.org/test/maestro:69a06b121f24bb69463f80dc
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_0_10000
      last run: https://d.kernelci.org/test/maestro:69a06b121f24bb69463f80db
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_1_0
      last run: https://d.kernelci.org/test/maestro:69a06b121f24bb69463f80da
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000
      last run: https://d.kernelci.org/test/maestro:69a06b121f24bb69463f80d9
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000_jpgenc_0_0
      last run: https://d.kernelci.org/test/maestro:69a06b121f24bb69463f80d8
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000_jpgenc_1_0
      last run: https://d.kernelci.org/test/maestro:69a06b121f24bb69463f80d7
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_1c000000
      last run: https://d.kernelci.org/test/maestro:69a06b121f24bb69463f80ae
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1c002000
      last run: https://d.kernelci.org/test/maestro:69a06b121f24bb69463f80a4
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000
      last run: https://d.kernelci.org/test/maestro:69a06b121f24bb69463f8070
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_10000
      last run: https://d.kernelci.org/test/maestro:69a06b121f24bb69463f806f
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_2000
      last run: https://d.kernelci.org/test/maestro:69a06b121f24bb69463f806e
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_25000
      last run: https://d.kernelci.org/test/maestro:69a06b121f24bb69463f806d
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_1a020000
      last run: https://d.kernelci.org/test/maestro:69a06b121f24bb69463f806c
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.cpufreq
      last run: https://d.kernelci.org/test/maestro:69a092171f24bb694640717c
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.cpufreq.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:69a092171f24bb694640717d
      history:  > ✅  > ❌  
            
      - kselftest.proc
      last run: https://d.kernelci.org/test/maestro:69a08e2e1f24bb69464063aa
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: monaco-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.tmpfs
      last run: https://d.kernelci.org/test/maestro:69a0ab3e1f24bb694640e123
      history:  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: beaglebone-black
  > Config: multi_v7_defconfig+kselftest
    - Architecture/compiler: arm/gcc-14
      - kselftest.ipc
      last run: https://d.kernelci.org/test/maestro:69a07a4f1f24bb69463ff120
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:69a080071f24bb6946400388
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_gpu_fd00000
      last run: https://d.kernelci.org/test/maestro:69a08b331f24bb6946405e87
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_av1.AV1-TEST-VECTORS-GStreamer-AV1-V4L2SL-Gst1-0.av1-1-b8-00-quantizer-24
      last run: https://d.kernelci.org/test/maestro:69a06a3a1f24bb69463f697d
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64.arm64_hwcap_sigbus_LSE2
      last run: https://d.kernelci.org/test/maestro:69a0809e1f24bb6946400a45
      history:  > ❌  > ✅  
            
      - kselftest.capabilities
      last run: https://d.kernelci.org/test/maestro:69a07fb91f24bb694640014d
      history:  > ❌  > ❌  > ✅  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.ipc
      last run: https://d.kernelci.org/test/maestro:69a079fc1f24bb69463fef5f
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: monaco-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.capabilities
      last run: https://d.kernelci.org/test/maestro:69a097621f24bb694640756d
      history:  > ❌  > ✅  
            
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:69a07fd21f24bb6946400245
      history:  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: beaglebone-black
  > Config: multi_v7_defconfig+kselftest
    - Architecture/compiler: arm/gcc-14
      - kselftest.ipc.ipc_msgque
      last run: https://d.kernelci.org/test/maestro:69a098a71f24bb69464076e5
      history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
      - kselftest.uevent
      last run: https://d.kernelci.org/test/maestro:69a07a631f24bb69463ff152
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.uevent.uevent_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:69a0b8b31f24bb69464147d6
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.uevent.uevent_uevent_filtering_global_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:69a0b8b31f24bb69464147d7
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_22
      last run: https://d.kernelci.org/test/maestro:69a063051f24bb69463f48ac
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:69a061ee1f24bb69463f44fa
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_regulator-pcie
      last run: https://d.kernelci.org/test/maestro:69a083f11f24bb69464035a0
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_regulator-usb-hub
      last run: https://d.kernelci.org/test/maestro:69a083f11f24bb694640359f
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_i2c_30a50000_eeprom_50
      last run: https://d.kernelci.org/test/maestro:69a083f11f24bb6946403569
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_33800000
      last run: https://d.kernelci.org/test/maestro:69a083f11f24bb6946403536
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_usb_32f10108_usb_38200000_usb-hub_1
      last run: https://d.kernelci.org/test/maestro:69a083f11f24bb694640352f
      history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_usb_32f10108_usb_38200000_usb-hub_2
      last run: https://d.kernelci.org/test/maestro:69a083f11f24bb694640352e
      history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_av1.validate-fluster-results
      last run: https://d.kernelci.org/test/maestro:69a06a3a1f24bb69463f69d7
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - fluster.debian.v4l2.gstreamer_h264.validate-fluster-results
      last run: https://d.kernelci.org/test/maestro:69a06abc1f24bb69463f79ff
      history:  > ❌  > ✅  > ❌  > ✅  > ✅  
            
      - fluster.debian.v4l2.gstreamer_vp8.validate-fluster-results
      last run: https://d.kernelci.org/test/maestro:69a06ad21f24bb69463f7c7c
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:69a07fce1f24bb69464001b8
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.ipc.ipc_msgque
      last run: https://d.kernelci.org/test/maestro:69a07b2c1f24bb69463ff317
      history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:69a06f911f24bb69463fa150
      history:  > ❌  > ✅  > ❌  > ❌  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:69a070d51f24bb69463fa679
      history:  > ❌  > ✅  > ❌  > ❌  > ✅  
            



This branch has 2 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
