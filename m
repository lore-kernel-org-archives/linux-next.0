Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8452123D7F5
	for <linux-next@vger.kernel.org>; Tue, 17 Feb 2026 02:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771295410; cv=none; b=Hf7NMRu5S/8BpardegAs0Z8rCXsPIaSKXvtA8uxrsygsHakSOLI9uH2rUXS1Awf0Hd9bpoT+2tciEi60q1oTC5+mf4q16Gu2uW3o/T38vBE8WgLVFXyUwlg1hU8ohYaRAqOBx/PIDL5+xUmkRfrSVm8E2w67oopAmXp5xPhl2FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771295410; c=relaxed/simple;
	bh=m35SbUEiSeKYQyqyMS6nvy+LRMFGREi/xN5JZ6JI7rI=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=WUhYTpBWIsfND12mbc1vHTk4l2iCFLqiecVurKFnXu8NdO66dD6TlFmJlCS1nnZ6bU3W+sfqeglkhrSH1TUQ56AkI/PhQ5FkeeQ1CAjegcFtjaYcLKFDr3+WuVohcxDw9cFPr0/T2goQMF6pZHPZVwZToIUZe/SVh3kMV2Laflw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=o2hqVKTi; arc=none smtp.client-ip=74.125.82.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="o2hqVKTi"
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-1233bc1117fso3105404c88.0
        for <linux-next@vger.kernel.org>; Mon, 16 Feb 2026 18:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1771295407; x=1771900207; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ckM2Q42O6f/P7CTEFmpPCFSoxfD9TFx1TL3TyX8eRCE=;
        b=o2hqVKTiG6vGUJAo7X+6kAafsjSZrGR+VKLIMzeJOdGu0lNSzwGW08jFeu/u2MQARo
         JQT+uL4KKDFTGQoBUwY+U1M2KVeHSjXtTuDDqW6eStNTqU4W7CFcrvSxy+V/tvcs60UL
         NL9xyFmit8Mf46xGPIBTF39RCqR0qL1lUsXexyYFKPz7SfGJBn6WmwLnOeq9VKaxEkhi
         pM+Ly5Iy8umF9gNfcI01rv/NiFaFjQ1gsW8HhtYI0dhyW2FOaw271HLXnbf9yZe0gyL1
         lGMjtQf5/9sFjdqzjE2Onia3CZNAANxZXAInouyXDkLxMSbD6vn9zayyB+Sq3a/1E8uE
         zxwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771295407; x=1771900207;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ckM2Q42O6f/P7CTEFmpPCFSoxfD9TFx1TL3TyX8eRCE=;
        b=ZvgpJNAgUfu3WREwrH9SANhJS1F5JLn17M332TyBL4II8WROaRoc7vPG04a1B8XDoB
         KAkWJk7MuYqgV0clhO/OsYIYAVTg0CSWBuZ/e9lKAvaSnp0CE6F5tIaW8Tmuo4LKFxPV
         fqdlvkMceRuQmk95Q0JwlQjKtQbWr0HB6MzOLGgWNNoHuUSjTU1AAY0VeYTh0EnRYoeo
         jWQcXPWY4yRCNimqNz2Mk5WhOo+At+PeIZBcDrNsAwEw7nmcU0otXOrQLVyZyp+jJ4YS
         JScykGaLGhSeKTybdLNErbz1BpZ+wbwKY+MVLzNRyOJWPulDakRhLVj/sP/Bhlsxsbfp
         zG1Q==
X-Gm-Message-State: AOJu0YynJXj2YSKAtCA54TPovGA19UmWpEmlyD6WFb9ewIK0d1S4Mtf9
	+m3SePZKJvOadlR/fLkUbGlSvVMnfcQyqsl2ROUmBqiLCAomqXje1snLaVjtCl0ptu+gGb0vB66
	R0OgSVb4=
X-Gm-Gg: AZuq6aKF5KxFEXqqddqwz4D2lfvSC3A1FZ9DZBoDbsji80AGEY+Vy1eTZghbGljxhkN
	gf6u/RnE21fIbV0W/sK6EVP61v7TRb7jcrU35OScBitFWtU05ZhOwTRQJRysjhaVHu6zHoozDnF
	MbNGQyINq3X9F/JFBKQqZ0/xegTZn+Y1DyBdtXSRGXK4sp7NQCQzNMUWHk5KPSRsOybCdtxcNgz
	FbUBWTl5j4jHmYbBf2CLD9L94WXA+ZWBoca8G7IVYd5R0F9cmEAEtldY6wx9o0ebeBzlVHl5NfS
	NcSGMOlCKMdIFe+T3kmn7HibtxhriQb9VLMkGaeBwdeEXTetoe1ninV1ds0fVWYyrWCblwL1Chf
	0wC1vqDf4q+pexkllPKTUVlyqbujhjjUSgM6boRl2ZN7U2LRFF73bPEhLxTnYT3XKmNGZin+r2d
	D2xdKBIPkIQ1VRTtRa
X-Received: by 2002:a05:7300:6c9e:b0:2ba:640e:2ce8 with SMTP id 5a478bee46e88-2bac720088cmr5004069eec.7.1771295407294;
        Mon, 16 Feb 2026 18:30:07 -0800 (PST)
Received: from f55b40a4666e ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb658fc4sm13836046eec.22.2026.02.16.18.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 18:30:06 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 350adaf7fde9fdbd9aeed6d442a9ae90c6a3ab97
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 17 Feb 2026 02:30:06 -0000
Message-ID: <177129540617.2933.18330915124125163884@f55b40a4666e>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/350adaf7fde9fdbd9aeed6d442a9ae90c6a3ab97/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 350adaf7fde9fdbd9aeed6d442a9ae90c6a3ab97
origin: maestro
test start time: 2026-02-16 16:05:52.966000+00:00

Builds:	   55 ✅    0 ❌    0 ⚠️
Boots: 	   64 ✅    0 ❌    0 ⚠️
Tests: 	17037 ✅ 2240 ❌ 4402 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:69937136a1ae387ffbdd782a
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:69934a4fa1ae387ffbdcc91a
      history:  > ✅  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp
      last run: https://d.kernelci.org/test/maestro:699349a8a1ae387ffbdcc759
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:69934a2fa1ae387ffbdcc882
      history:  > ❌  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_10
      last run: https://d.kernelci.org/test/maestro:69934a9ba1ae387ffbdccad7
      history:  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_22
      last run: https://d.kernelci.org/test/maestro:69934a9ba1ae387ffbdccb2b
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_9
      last run: https://d.kernelci.org/test/maestro:69934a9ba1ae387ffbdccad0
      history:  > ✅  > ✅  > ❌  > ✅  
            
Hardware: qemu-arm64
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rtla-osnoise
      last run: https://d.kernelci.org/test/maestro:69937d67a1ae387ffbdd9040
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - rt-tests.rtla-timerlat
      last run: https://d.kernelci.org/test/maestro:69937d74a1ae387ffbdd90fc
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:69937d5aa1ae387ffbdd8f83
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rtla-timerlat
      last run: https://d.kernelci.org/test/maestro:69937d73a1ae387ffbdd90f9
      history:  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_mt8195-sound
      last run: https://d.kernelci.org/test/maestro:69936663a1ae387ffbdd4671
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f08000
      last run: https://d.kernelci.org/test/maestro:69936663a1ae387ffbdd4688
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f09000
      last run: https://d.kernelci.org/test/maestro:69936663a1ae387ffbdd4687
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f0a000
      last run: https://d.kernelci.org/test/maestro:69936663a1ae387ffbdd4686
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f23000
      last run: https://d.kernelci.org/test/maestro:69936663a1ae387ffbdd4618
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f24000
      last run: https://d.kernelci.org/test/maestro:69936663a1ae387ffbdd4617
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f25000
      last run: https://d.kernelci.org/test/maestro:69936663a1ae387ffbdd4616
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c104000
      last run: https://d.kernelci.org/test/maestro:69936663a1ae387ffbdd4615
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c105000
      last run: https://d.kernelci.org/test/maestro:69936663a1ae387ffbdd4614
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c106000
      last run: https://d.kernelci.org/test/maestro:69936663a1ae387ffbdd4613
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c107000
      last run: https://d.kernelci.org/test/maestro:69936663a1ae387ffbdd4612
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c108000
      last run: https://d.kernelci.org/test/maestro:69936663a1ae387ffbdd4611
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c109000
      last run: https://d.kernelci.org/test/maestro:69936663a1ae387ffbdd4610
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c10a000
      last run: https://d.kernelci.org/test/maestro:69936663a1ae387ffbdd460f
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c10b000
      last run: https://d.kernelci.org/test/maestro:69936663a1ae387ffbdd460e
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dp-intf_1c015000
      last run: https://d.kernelci.org/test/maestro:69936663a1ae387ffbdd460d
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dp-intf_1c113000
      last run: https://d.kernelci.org/test/maestro:69936663a1ae387ffbdd460c
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dp-tx_1c600000
      last run: https://d.kernelci.org/test/maestro:69936663a1ae387ffbdd460b
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_edp-tx_1c500000
      last run: https://d.kernelci.org/test/maestro:69936663a1ae387ffbdd4608
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_edp-tx_1c500000_aux-bus_panel
      last run: https://d.kernelci.org/test/maestro:69936663a1ae387ffbdd4607
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_hdr-engine_1c114000
      last run: https://d.kernelci.org/test/maestro:69936663a1ae387ffbdd4603
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000
      last run: https://d.kernelci.org/test/maestro:69936663a1ae387ffbdd45f2
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_0_0
      last run: https://d.kernelci.org/test/maestro:69936663a1ae387ffbdd45f1
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_0_10000
      last run: https://d.kernelci.org/test/maestro:69936663a1ae387ffbdd45f0
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_1_0
      last run: https://d.kernelci.org/test/maestro:69936663a1ae387ffbdd45ef
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000
      last run: https://d.kernelci.org/test/maestro:69936663a1ae387ffbdd45ee
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000_jpgenc_0_0
      last run: https://d.kernelci.org/test/maestro:69936663a1ae387ffbdd45ed
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000_jpgenc_1_0
      last run: https://d.kernelci.org/test/maestro:69936663a1ae387ffbdd45ec
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_1c000000
      last run: https://d.kernelci.org/test/maestro:69936663a1ae387ffbdd45c3
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1c002000
      last run: https://d.kernelci.org/test/maestro:69936663a1ae387ffbdd45b9
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000
      last run: https://d.kernelci.org/test/maestro:69936663a1ae387ffbdd4584
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_10000
      last run: https://d.kernelci.org/test/maestro:69936663a1ae387ffbdd4583
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_2000
      last run: https://d.kernelci.org/test/maestro:69936663a1ae387ffbdd4582
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_25000
      last run: https://d.kernelci.org/test/maestro:69936663a1ae387ffbdd4581
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_1a020000
      last run: https://d.kernelci.org/test/maestro:69936663a1ae387ffbdd4580
      history:  > ✅  > ❌  > ✅  
            
Hardware: mt8186-corsola-steelix-sku131072
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.iommu
      last run: https://d.kernelci.org/test/maestro:6993643da1ae387ffbdd3c8a
      history:  > ❌  > ✅  > ❌  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_h264_frext.JVT-FR-EXT-GStreamer-H-264-V4L2-Gst1-0.FRExt_MMCO4_Sony_B
      last run: https://d.kernelci.org/test/maestro:69936754a1ae387ffbdd550f
      history:  > ✅  > ❌  > ✅  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
