Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC29413FEE
	for <linux-next@vger.kernel.org>; Fri, 20 Feb 2026 02:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771554619; cv=none; b=O8FUAXTindAp9z/bQXN2/IV+b1LQVjtujntHNf4NupbdRljpRtigJKQxEid+D7k/eoBevYB6c4G8yZ6qqyXm5rIORunUJcyg+v0WNXfOKmiSJvzTm0wmTPc0/u/D0YbkxZvoSekySmrmD9/KWWMpXH4xrxj8LcU4OEENU7Q7uwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771554619; c=relaxed/simple;
	bh=KAKWJPZwCK9dE/lFojcNoZxZi8SVtmmKCoDQitqfQ7o=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=V+RV+AxWJ+zPjl0OA99B7T7yOS5YxprqaEoLiPDNp/7sLLTXKPNwwG8RA2svhhb6vUDAcz0c6H6O/Exw6D8BeSLJgV1jNooE3QZVoJlKpDISzJj4AOirmIN922zcShPXHYXeDDW7k+zzyKXKWef01lLWFb4EYEinR7VH0GLB8/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=zljA6eO0; arc=none smtp.client-ip=74.125.82.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="zljA6eO0"
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-2ba895adfeaso1610125eec.0
        for <linux-next@vger.kernel.org>; Thu, 19 Feb 2026 18:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1771554617; x=1772159417; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3rf3j8+PgxKQNgJf0wPZ/8jxD+GZrJRQZemFU40UC/o=;
        b=zljA6eO0YMtub0lkKY21XUWPM165llRTYBd7IiorIsPtqnSIxvY5V3nRMb5BCM+pP4
         soWeWfyLNB9oQReM+1Kdr1sGdq3rpJeqlvM5h4P66TOmbjJNYru4M87T6UHGNM4XuZ8B
         N6OuK+AGKcDvxS2re27dP3mil2zwvCICLW2DzvsqVgUYcl+OpFqq1QUuLHQHoXFZJ516
         AyZ13i/2VLoDPgAL8PJfN9JWhacfpB0pyZO7Y0lUjUrXqIqqYp1lBaDhQRUNl3Xp/uNO
         t+PTW09LrDJErpBtgyoVGzogwwa/TjGEM/DNUFO6aMQQWxfW6wcVlhqebZ+1WPCFRn3q
         NEMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771554617; x=1772159417;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3rf3j8+PgxKQNgJf0wPZ/8jxD+GZrJRQZemFU40UC/o=;
        b=MA3MOx9lFl/ROWbhoDjQ10Pb46F7bGQdRmh9CrY1o4/eXHyy9oWyMg3qd+BNcbMfNE
         Ou2zKB167lbPIxEBMx5yAHIO7JlsJHnx2X+uWiD3XV9SumAh/ngwgGFmejrLIrr4KNdJ
         es8TqHK//PInNUPg6eAlS6l473/hCeFy+k7leIA9w4vunfnL4T6UcAOLhgVUKd9D1A1L
         koKmgsUEYNTT7o2oqAXLnCPEBJigTTBQDJspIP9tAy0OFF0on4khyOHNfSsoyAPIodJP
         n729ZhWfWNrrucYTbszyIIeCtigB7IHsnHNq+Z3+skwRsl7fvNHUiPtemZwxFugdsz2A
         6srg==
X-Gm-Message-State: AOJu0YxHaPvRVFG2BYlSdPRQ7a1TWaB3vITyzZKY+xQ1h+1TO6lgNcmL
	ZG4uTX9W3v4QYG5jKJxJOJ6iKFhq6hk5HisXlswnRgOpmxhBrH+HOZ8t1rm3c4xMVNY1qKXbBZx
	q9qNidZs=
X-Gm-Gg: AZuq6aJpm52WnmISykksrYJeQokUFkAdtShW+zLa4XJycKFfvtFC608KJlRLtgBDQK4
	yGlIDnP7lk7yPIlUAPEgSrLe5omK2SIS42ee0/bBOZJsKK/XMBnccX4J760sm0DxPtNMT9GEcXC
	5EK+ccQmcXQsvCyaXvYZ5StuU1SZ+A6bpQ8jtPt9uyvgqdqjyoBZhKvWFyokQzwQHJ2WMxhW9H+
	1zgRKmtAGPvBabWxkyl3ai06VujqQBi4VCDGFnT4DUVULS08eC1csZkLBbIHE2qDgXXca7kf7jA
	9Pi9/sc2oaA6lmXUu121G45JCFXm/CnAK9hGh4UZREzYyf/2MxcRGKNLyfIW5ndeRMYArsPIbir
	5VPxoXHFgtl1DgXz1Jf5NMMcoodvf6Wwazsm+6srLpKNQADmtSJ74aoCVgTeaVjXh5oeLRYFKvv
	DP03KIa6FE67P/yk//IQXDcWEVJyI=
X-Received: by 2002:a05:7301:2e89:b0:2ae:5e6b:dc41 with SMTP id 5a478bee46e88-2bd500901f0mr3069312eec.14.1771554616691;
        Thu, 19 Feb 2026 18:30:16 -0800 (PST)
Received: from d14e337afe00 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb66b746sm26952961eec.25.2026.02.19.18.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 18:30:16 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 44982d352c33767cd8d19f8044e7e1161a587ff7
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 20 Feb 2026 02:30:15 -0000
Message-ID: <177155461561.304.1386012981374064945@d14e337afe00>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/44982d352c33767cd8d19f8044e7e1161a587ff7/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 44982d352c33767cd8d19f8044e7e1161a587ff7
origin: maestro
test start time: 2026-02-19 13:20:09.907000+00:00

Builds:	   61 ✅    0 ❌    0 ⚠️
Boots: 	  203 ✅    2 ❌    0 ⚠️
Tests: 	18631 ✅ 3169 ❌ 5550 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_10
      last run: https://d.kernelci.org/test/maestro:699719887b34c3305538ee02
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: mt8186-corsola-steelix-sku131072
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.iommu
      last run: https://d.kernelci.org/test/maestro:699735ae7b34c33055397efe
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_h264.JVT-AVC_V1-GStreamer-H-264-V4L2SL-Gst1-0.CANL1_TOSHIBA_G
      last run: https://d.kernelci.org/test/maestro:699737047b34c33055398c66
      history:  > ✅  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp
      last run: https://d.kernelci.org/test/maestro:699718cb7b34c3305538e9b4
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_22
      last run: https://d.kernelci.org/test/maestro:699719887b34c3305538ee56
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_9
      last run: https://d.kernelci.org/test/maestro:699719887b34c3305538edfb
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:699736507b34c33055397ff3
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_mt8195-sound
      last run: https://d.kernelci.org/test/maestro:6997366d7b34c33055398238
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f08000
      last run: https://d.kernelci.org/test/maestro:6997366d7b34c330553981dd
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f09000
      last run: https://d.kernelci.org/test/maestro:6997366d7b34c330553981dc
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f0a000
      last run: https://d.kernelci.org/test/maestro:6997366d7b34c330553981db
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f23000
      last run: https://d.kernelci.org/test/maestro:6997366d7b34c330553981da
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f24000
      last run: https://d.kernelci.org/test/maestro:6997366d7b34c330553981d9
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f25000
      last run: https://d.kernelci.org/test/maestro:6997366d7b34c330553981d8
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c104000
      last run: https://d.kernelci.org/test/maestro:6997366d7b34c330553981d7
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c105000
      last run: https://d.kernelci.org/test/maestro:6997366d7b34c330553981d6
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c106000
      last run: https://d.kernelci.org/test/maestro:6997366d7b34c330553981d5
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c107000
      last run: https://d.kernelci.org/test/maestro:6997366d7b34c330553981d4
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c108000
      last run: https://d.kernelci.org/test/maestro:6997366d7b34c330553981d3
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c109000
      last run: https://d.kernelci.org/test/maestro:6997366d7b34c330553981d2
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c10a000
      last run: https://d.kernelci.org/test/maestro:6997366d7b34c330553981d1
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c10b000
      last run: https://d.kernelci.org/test/maestro:6997366d7b34c330553981d0
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dp-intf_1c015000
      last run: https://d.kernelci.org/test/maestro:6997366d7b34c330553981cf
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dp-intf_1c113000
      last run: https://d.kernelci.org/test/maestro:6997366d7b34c330553981ce
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dp-tx_1c600000
      last run: https://d.kernelci.org/test/maestro:6997366d7b34c330553981cd
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_edp-tx_1c500000
      last run: https://d.kernelci.org/test/maestro:6997366d7b34c33055398255
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_edp-tx_1c500000_aux-bus_panel
      last run: https://d.kernelci.org/test/maestro:6997366d7b34c33055398254
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_hdr-engine_1c114000
      last run: https://d.kernelci.org/test/maestro:6997366d7b34c33055398250
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000
      last run: https://d.kernelci.org/test/maestro:6997366d7b34c330553981bd
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_0_0
      last run: https://d.kernelci.org/test/maestro:6997366d7b34c330553981bc
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_0_10000
      last run: https://d.kernelci.org/test/maestro:6997366d7b34c330553981bb
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_1_0
      last run: https://d.kernelci.org/test/maestro:6997366d7b34c330553981ba
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000
      last run: https://d.kernelci.org/test/maestro:6997366d7b34c330553981b9
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000_jpgenc_0_0
      last run: https://d.kernelci.org/test/maestro:6997366d7b34c330553981b8
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000_jpgenc_1_0
      last run: https://d.kernelci.org/test/maestro:6997366d7b34c330553981b7
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_1c000000
      last run: https://d.kernelci.org/test/maestro:6997366d7b34c3305539818e
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1c002000
      last run: https://d.kernelci.org/test/maestro:6997366d7b34c33055398184
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000
      last run: https://d.kernelci.org/test/maestro:6997366d7b34c3305539814f
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_10000
      last run: https://d.kernelci.org/test/maestro:6997366d7b34c3305539814e
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_2000
      last run: https://d.kernelci.org/test/maestro:6997366d7b34c3305539814d
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_25000
      last run: https://d.kernelci.org/test/maestro:6997366d7b34c3305539814c
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_1a020000
      last run: https://d.kernelci.org/test/maestro:6997366d7b34c3305539814b
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_h264_frext.JVT-FR-EXT-GStreamer-H-264-V4L2-Gst1-0.FRExt_MMCO4_Sony_B
      last run: https://d.kernelci.org/test/maestro:699737847b34c33055399236
      history:  > ❌  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:69972bff7b34c33055393c68
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:69972c4d7b34c33055393f71
      history:  > ❌  > ❌  > ✅  > ❌  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:69972c087b34c33055393c83
      history:  > ❌  > ✅  > ❌  > ✅  > ❌  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_h265.JCT-VC-HEVC_V1-GStreamer-H-265-V4L2SL-Gst1-0.MVDL1ZERO_A_docomo_4
      last run: https://d.kernelci.org/test/maestro:6997379c7b34c3305539934d
      history:  > ✅  > ✅  > ❌  > ✅  
            
Hardware: qemu-arm64
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rtla-osnoise
      last run: https://d.kernelci.org/test/maestro:69972a9d7b34c330553937ba
      history:  > ✅  > ⚠️  > ✅  > ✅  
            
      - rt-tests.rtla-timerlat
      last run: https://d.kernelci.org/test/maestro:69972ab37b34c330553937f2
      history:  > ✅  > ⚠️  > ✅  > ✅  
            
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:69972a877b34c33055393799
      history:  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:69972c287b34c33055393ce9
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:69972d447b34c330553944f7
      history:  > ✅  > ✅  > ❌  > ✅  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
