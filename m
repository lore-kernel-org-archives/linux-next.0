Received: from mail-dy1-f195.google.com (mail-dy1-f195.google.com [74.125.82.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFC5239E75
	for <linux-next@vger.kernel.org>; Thu, 19 Feb 2026 02:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771468225; cv=none; b=jBqpSfwrcVogPyShmrI836iDDpnZ1wmT/oiEI7020rnNtlMaefr5fzEHlnhpv4OrJ9GrFDSL/onAtXBZqAiq7e7uLjJ/eJzdNTeQQbXgXsXBzD3ArKQjVGhQa4himBxBp9YIzCwCURmwiDDhg2kmZZ6XGgnufRMgUe2hCsczJ+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771468225; c=relaxed/simple;
	bh=9TJWWpOE1dLVRVrVXzLAdlGOzXqpH803+jOT1MBG1LI=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=Sp/S0Q7TwSQ5YdGKRcirVRxXBLxlwbwGEb6kO+RRUrQ7oaMcYVtr/bf/yzVAwuS7Y1zmFQDOJ6aP7xdXaKAWV5aVl+Lp5ho3jq5HFNk8uXPbIE5pW7x5EDUEJrg7fEulfIPm/+u/1XeGB8XKhhl8e60w/Pn+rXHaXUW/c7zrFNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=xmbwCbF/; arc=none smtp.client-ip=74.125.82.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="xmbwCbF/"
Received: by mail-dy1-f195.google.com with SMTP id 5a478bee46e88-2ba94dbf739so488968eec.1
        for <linux-next@vger.kernel.org>; Wed, 18 Feb 2026 18:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1771468223; x=1772073023; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPIMpi/4bgscStrO+86+FnRyj72rBuplBTxAW9JsSTo=;
        b=xmbwCbF/4P+v8jg5B+PRjEGfWuO7t4v1HZmtb/Sgm41LKQQBDvdbrWrvgnz4Qrwxki
         znG0Bvn6zl0NWXPCqzwEX3tvh26h0c+WV0zwAPDSUku0SYIza1oOnOWm5env+oI2yvuO
         2kOyrGLD8O6STvtTPx7ihpjuym5WqRgBUrM5UQYbrh7gegFNXo2SPk+qZjAWIOzJ3GDk
         ETAd09xTcsPIzUojDywQPz7+I3k+jnRTYjCHPh0wej6jv5kUJ/3wATA3eZ7XWaVTdh2U
         L7Iad0vSUaWK8lMo65MdcEzSiuulcbsdgoos4XUzgf1sVGNtHsSugROemxVAQE73rIZ9
         11Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771468223; x=1772073023;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TPIMpi/4bgscStrO+86+FnRyj72rBuplBTxAW9JsSTo=;
        b=SKHIOvX3B1IrS3nkzB2lmDoDVxDYcEttnVgQ2QPtnJunFIyL+GyfIl/T5MUIkwChav
         gHHYLySB7Q44KBd0MJORLKraMHR6WqSqdNbJC6Ra4Fw2DiAYGHy1P96CMKQXmwNGPIh8
         glVmS1Noy2BoznBRZPsmJXtzZeJeQ41s6YikaEh/gxNZ5PGWl9U013nGG2VfICyAgffV
         t2iDZlZCbaY6nrpxUfrNLgQ3LW9Hv0wBngVpqJQxppr4tVN2GPAWHD0+kUrWi8Wfg3Cw
         C3zyCIY12skERwzTkojO/SHTQybf23NG91Ef5FEH5zaRFK8oKZvwPnI3zJI36m6vVyYU
         ppoA==
X-Gm-Message-State: AOJu0YxD3ZcYZ9+SZziOq9ZMEqHnMciWoM8k8y0bJgyi4JFR6isnlDMH
	z/PiqDt5oxcJM7Wc5BT5WIMKOQtYAj7kgcU2+QERZGbTROTOAQM3HHNxPaKAP7ug8P5KrDn6dY2
	uThtS0pc=
X-Gm-Gg: AZuq6aLEVA3bT1mLk4dArrzIIA5uQM6BBZESGAu0K8pBUFqdKcqf/sPCt7pDFd4EbVD
	+tKTzNzTYlrZoNoSU2d0J65mJfumEJOt3vsA/gSmHtKbV2rbV6VPa7lQUaKwJQm8ETERqRQcxf1
	Zt/NAZUq5ClUZ7je1eKvnCPWEpb7MLhHp9X49nPS2+dS+2fyNjwG1/Zeo1YXedqIEWo0VO07y/b
	pQdMYWvhaej/KdF1g3YH+fXAV+sxGcZGIx9Y9GabqKtCNGJbWJDag2h34uTFDzZ8RLu7VmhxtPY
	sItLETaTcm7kPtTs1LAsmNaLRGm7l2h3RGihwiA4f4EHY9ciiBoqStIgGPqGsmI6oFHE4Xv/w55
	cYv5uk2EWvODC8t6mbT4hNcFyanKKA9WYZ5i8q9Vc5CNBGYcoQ26V3MfxpDtbBLpXumu5jW8MFS
	wn9Ts0gtJ+D55C/tjj
X-Received: by 2002:a05:693c:3011:b0:2ba:8496:498 with SMTP id 5a478bee46e88-2bd4fecdf89mr2388921eec.7.1771468222854;
        Wed, 18 Feb 2026 18:30:22 -0800 (PST)
Received: from f55b40a4666e ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb543e8dsm20001875eec.5.2026.02.18.18.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 18:30:21 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 50f68cc7be0a2cbf54d8f6aaf17df32fb01acc3f
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 19 Feb 2026 02:30:21 -0000
Message-ID: <177146822141.3854.11938931350362196154@f55b40a4666e>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/50f68cc7be0a2cbf54d8f6aaf17df32fb01acc3f/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 50f68cc7be0a2cbf54d8f6aaf17df32fb01acc3f
origin: maestro
test start time: 2026-02-18 13:36:02.225000+00:00

Builds:	   61 ✅    0 ❌    0 ⚠️
Boots: 	  194 ✅    3 ❌    0 ⚠️
Tests: 	16331 ✅ 3229 ❌ 4920 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_h265.JCT-VC-HEVC_V1-GStreamer-H-265-V4L2SL-Gst1-0.MVDL1ZERO_A_docomo_4
      last run: https://d.kernelci.org/test/maestro:6995d27ac56bb21d1a7a663f
      history:  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6995d378c56bb21d1a7a7149
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp
      last run: https://d.kernelci.org/test/maestro:6995d48ec56bb21d1a7a8101
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:6995dd11c56bb21d1a7aa919
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6995d2b3c56bb21d1a7a68e7
      history:  > ❌  > ❌  > ✅  > ❌  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_10
      last run: https://d.kernelci.org/test/maestro:6995d539c56bb21d1a7a8ee3
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_22
      last run: https://d.kernelci.org/test/maestro:6995d539c56bb21d1a7a8f37
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_9
      last run: https://d.kernelci.org/test/maestro:6995d539c56bb21d1a7a8edc
      history:  > ✅  > ❌  > ✅  > ✅  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6995d2cbc56bb21d1a7a6912
      history:  > ❌  > ❌  > ✅  > ❌  > ✅  
            
Hardware: mt8186-corsola-steelix-sku131072
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.iommu
      last run: https://d.kernelci.org/test/maestro:6995cfbdc56bb21d1a7a4eda
      history:  > ❌  > ✅  > ❌  > ❌  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_mt8195-sound
      last run: https://d.kernelci.org/test/maestro:6995d07bc56bb21d1a7a537a
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f08000
      last run: https://d.kernelci.org/test/maestro:6995d07bc56bb21d1a7a5306
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f09000
      last run: https://d.kernelci.org/test/maestro:6995d07bc56bb21d1a7a5305
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f0a000
      last run: https://d.kernelci.org/test/maestro:6995d07bc56bb21d1a7a5304
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f23000
      last run: https://d.kernelci.org/test/maestro:6995d07bc56bb21d1a7a5303
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f24000
      last run: https://d.kernelci.org/test/maestro:6995d07bc56bb21d1a7a5302
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f25000
      last run: https://d.kernelci.org/test/maestro:6995d07bc56bb21d1a7a5301
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c104000
      last run: https://d.kernelci.org/test/maestro:6995d07bc56bb21d1a7a5300
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c105000
      last run: https://d.kernelci.org/test/maestro:6995d07bc56bb21d1a7a52ff
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c106000
      last run: https://d.kernelci.org/test/maestro:6995d07bc56bb21d1a7a52fe
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c107000
      last run: https://d.kernelci.org/test/maestro:6995d07bc56bb21d1a7a52fd
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c108000
      last run: https://d.kernelci.org/test/maestro:6995d07bc56bb21d1a7a52fc
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c109000
      last run: https://d.kernelci.org/test/maestro:6995d07bc56bb21d1a7a52fb
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c10a000
      last run: https://d.kernelci.org/test/maestro:6995d07bc56bb21d1a7a52fa
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c10b000
      last run: https://d.kernelci.org/test/maestro:6995d07bc56bb21d1a7a52f9
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dp-intf_1c015000
      last run: https://d.kernelci.org/test/maestro:6995d07bc56bb21d1a7a52f8
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dp-intf_1c113000
      last run: https://d.kernelci.org/test/maestro:6995d07bc56bb21d1a7a52f7
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dp-tx_1c600000
      last run: https://d.kernelci.org/test/maestro:6995d07bc56bb21d1a7a52f6
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_edp-tx_1c500000
      last run: https://d.kernelci.org/test/maestro:6995d07bc56bb21d1a7a52f3
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_edp-tx_1c500000_aux-bus_panel
      last run: https://d.kernelci.org/test/maestro:6995d07bc56bb21d1a7a52f2
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_hdr-engine_1c114000
      last run: https://d.kernelci.org/test/maestro:6995d07bc56bb21d1a7a52ee
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000
      last run: https://d.kernelci.org/test/maestro:6995d07bc56bb21d1a7a52dd
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_0_0
      last run: https://d.kernelci.org/test/maestro:6995d07bc56bb21d1a7a52dc
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_0_10000
      last run: https://d.kernelci.org/test/maestro:6995d07bc56bb21d1a7a52db
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_1_0
      last run: https://d.kernelci.org/test/maestro:6995d07bc56bb21d1a7a52da
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000
      last run: https://d.kernelci.org/test/maestro:6995d07bc56bb21d1a7a52d9
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000_jpgenc_0_0
      last run: https://d.kernelci.org/test/maestro:6995d07bc56bb21d1a7a52d8
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000_jpgenc_1_0
      last run: https://d.kernelci.org/test/maestro:6995d07bc56bb21d1a7a52d7
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_1c000000
      last run: https://d.kernelci.org/test/maestro:6995d07bc56bb21d1a7a52ae
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1c002000
      last run: https://d.kernelci.org/test/maestro:6995d07bc56bb21d1a7a52a4
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000
      last run: https://d.kernelci.org/test/maestro:6995d07bc56bb21d1a7a528d
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_10000
      last run: https://d.kernelci.org/test/maestro:6995d07bc56bb21d1a7a528c
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_2000
      last run: https://d.kernelci.org/test/maestro:6995d07bc56bb21d1a7a528b
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_25000
      last run: https://d.kernelci.org/test/maestro:6995d07bc56bb21d1a7a528a
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_1a020000
      last run: https://d.kernelci.org/test/maestro:6995d07bc56bb21d1a7a5289
      history:  > ✅  > ❌  > ✅  > ✅  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_h264_frext.JVT-FR-EXT-GStreamer-H-264-V4L2-Gst1-0.FRExt_MMCO4_Sony_B
      last run: https://d.kernelci.org/test/maestro:6995d263c56bb21d1a7a64b6
      history:  > ✅  > ❌  > ✅  > ✅  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
