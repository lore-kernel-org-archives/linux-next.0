Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795141847;
	b=GJn0zkvrHGxvF40lQ27fV4+QHEKv6+h5g8X4pJKZr+LIbAv/yYiWUrloutEN225p2Ibq
	 eht9M1cYqnv3nbwQ2D3viOMYvAze8vXLLjkfn3odJxOJBpRt0UzjTI12acIfkeUZaYe8s
	 a9+iU69pShO/U+0AxW1yBg+hsuCDeti5coR3K30CZgaTN5DGVCKAblJ2XcYwNDqdjSIrv
	 3XlmLAPnzkelwA1lbMBVA3QJmdsSKIPEXQhbR+aw+x+R80z+8qvOspcc8rU5/4E+DbvyM
	 hshWfDDTmihTJQFbwXGEHDK9jBFZuF1dGetgspKPwzHjbP2eU2/MHYQtP4SsCG/VF/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795141847;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:To:Cc:Reply-To:
	 Date:Message-ID;
	bh=iMTV3br5ljPReKVp+mo9uKWjbAMmeRJ5DxNMyOfxQjo=;
	b=bpGiEQACoHA7ZqXqRZnFkYFjxhptedAqsQR3K0KzSdi0ffzCrfSoc3cmPyNo1yNQqFmm
	 doXlQaHlx29yHI4DLB5DNBgI38GLRPuQpPprG3S/UvduiWpagV4g0rIvCJLLmv+5jRFld
	 k1YE+gHDWYxWPKTAcHnz3L5HMyuEDA18bIDU/WE3RsVekrXEXWqce37Jr2tTDipNXhF2V
	 Qy9HA/3+K+a3vQtjHtApJvH7Y76Wx7WGKg5roNOkljc+8lP5BTnyRIU4+mPU53Ob2/DHv
	 iNYplzOHQuVKMbArRaG5TuNCz3rwyaY2MrbHRflZms8w2T/Q235ZMODynAxzohIGJow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=Dqq6B01v;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACDF606A320
	for <linux-next@vger.kernel.org>; Fri, 20 Nov 2026 02:30:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7ACDF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=Dqq6B01v
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-14394530ec6so685854c88.1
        for <linux-next@vger.kernel.org>; Thu, 19 Nov 2026 18:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1795141845; x=1795746645; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iMTV3br5ljPReKVp+mo9uKWjbAMmeRJ5DxNMyOfxQjo=;
        b=Dqq6B01viklIX8oxbo4uiS2d8O+MpzzNZT4eLFzwqr4levugOPYr9bdfVIuDdKlcGc
         09apCpORldZzj+a2QusTMRD4wBweNUIoiMk42VwDO2SN1ChRfyMys2PKN787vUi+KMEF
         +PxrNs1L/I22fDxqhYYnU2V8gSs/8DZE57iUuEpu84IksrfUH2Rp5ukCZOfB4utJg1cM
         1Wwzb202lGvOCLqxx8+E6UD8kbW4N0djvv5CAkWHcjrWCMQywxfe047A3G6A62X19SdM
         Nqw0kEq4eUG59822wL2cDoQo5SPmfxcUydAZDOdBdg6rvm4riUoDPvcCmGC0dQrwseqL
         WbUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795141845; x=1795746645;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iMTV3br5ljPReKVp+mo9uKWjbAMmeRJ5DxNMyOfxQjo=;
        b=YdJyjmraMN1E1446+Z2xFEnksYqgsV7D2PBnCnHAI9EAR/quYLB7GhRrrPNcIRYZNG
         npQynIqgXzAZ3MHpvMAA1hyWmxdvgGNHvkgHCryCp3nokMcS37SR1nvOv6g0aYa/4SNb
         yc4Fo7zbBNHNMna0HM1O0ap8+chFS1AZKOaSZZXzvMH68ByPE9ky/bNo8JguGSyx5cqv
         yxhVYu5KD1ZmnYNKu9mogYIFHEEeTk1+jyh+b1klkCPOVgUrDcaKF1RUW/TmOffK2spn
         NAI1gJWMYSYC8XxdVtZFzfyuosWBkPxMePwuMUxQ5xPeoRCWrl7nooOl+UmRQEFyj4OM
         xYnw==
X-Gm-Message-State: APuU4Z8Jejp5iDUW7jibDmmhs5V3YIh6jjKTFoOGazF9NZgLsRa5eA+k
	lQdNTekrv129Sc2VAQhyUxl1xJblve6gQup8+JDwv1kTS8+Gg4ZYlnjiUA0Bk2XDPKkyNe5K5Ep
	HJZm+
X-Gm-Gg: AYBFou254RpQz00k7SpPUabjlYQnMkP3wv+nCLg4RxOh4fmhn4jxpYdae/Hrs3W3lwQ
	nz5zBEfMt90XWhGRn9G8RrYFGh39YxJ4jxUmOe/vntHiWaTX429ottaw7rGEmuESPURftht830H
	0GmAVyvNJh4QR16H5v+dUKLkuQ1kJQDHwEP34k5auemP/dmZt7PwJiKxWuPh0q+AoXcj8HQQac6
	NcU3s8B8DFe46OYUijNOMkB3Rf54la7NyhYNbwA2n9OoqseQtaD3arFqH0oJoB5bL/UQEArRtW5
	yZnjohV36XyLxmUy+wdvEkedSYf0Pl40XG+9WxEhsO7EQv7wR8ib9YIcmTRFi6kQktnJHieYAUe
	q9rsnRJWvEJ8w1Fw95tIcbQ7vbSGOXAQEJXrqzlBZtfv+hrtf+hmI0DhryVGFuVxZAmNaZHIFGf
	ZyiVQOspvU64oY1W/8uauBPS68ZiLKAAAwNpEHCTpKD+KnJUM5v9PD097i0MCvitvQ8tZPkTqMh
	bt3OdvrsM6W/birth9V7HU+2g5dJRa/L1PqHKmgILCssGWNBNb7dkzPsm0y6I4Mpii7LMRxl4K/
	Y5DOVw5PbScqhSXhifFAmw==
X-Received: by 2002:a05:7022:3a83:b0:1b0:20:6444 with SMTP id a92af1059eb24-1b55690779bmr1390808c88.39.1795141845366;
        Thu, 19 Nov 2026 18:30:45 -0800 (PST)
Received: from ccc7006dfe57 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567e2bd1sm2692352c88.3.2026.11.19.18.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 18:30:44 -0800 (PST)
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
Subject: [STATUS] next/master - adcad7f4e6332cff3d6d7165f41584899f598534
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 20 Nov 2026 02:30:44 -0000
Message-ID: <179514184449.17965.10229823875452163076@ccc7006dfe57>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/adcad7f4e6332cff3d6d7165f41584899f598534/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: adcad7f4e6332cff3d6d7165f41584899f598534
origin: maestro
test start time: 2026-11-19 18:39:23.370000+00:00

Builds:	   76 ✅    1 ❌    0 ⚠️
Boots: 	  216 ✅   21 ❌    0 ⚠️
Tests: 	32223 ✅ 1797 ❌ 1791 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-01
      last run: https://d.kernelci.org/test/maestro:6aff554199c74e1a998e76f6
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: exynos850-e850-96
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6aff6dfc99c74e1a99902e29
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.breakpoints
      last run: https://d.kernelci.org/test/maestro:6aff6dfc99c74e1a99902e2c
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6aff6dfc99c74e1a99902e23
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: dell-latitude-3445-7520c-skyrim
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:6aff50ab99c74e1a998da76c
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:6aff521f99c74e1a998dc4ef
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: mahua-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:6aff52d399c74e1a998df1df
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6aff8b5499c74e1a99932fd1
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6aff8bce99c74e1a999339fe
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: acer-R721T-grunt
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:6aff4f2399c74e1a998d96b3
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: glymur-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1bf0000
      last run: https://d.kernelci.org/test/maestro:6aff56a099c74e1a998ed53d
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1bf0000_pcie_0
      last run: https://d.kernelci.org/test/maestro:6aff56a099c74e1a998ed53b
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1bf0000_pcie_0_wifi_0
      last run: https://d.kernelci.org/test/maestro:6aff56a099c74e1a998ed53a
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_32300000_glink-edge_fastrpc_compute-cb_1
      last run: https://d.kernelci.org/test/maestro:6aff56a099c74e1a998ed522
      history:  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_32300000_glink-edge_fastrpc_compute-cb_2
      last run: https://d.kernelci.org/test/maestro:6aff56a099c74e1a998ed521
      history:  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_32300000_glink-edge_fastrpc_compute-cb_3
      last run: https://d.kernelci.org/test/maestro:6aff56a099c74e1a998ed520
      history:  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_32300000_glink-edge_fastrpc_compute-cb_4
      last run: https://d.kernelci.org/test/maestro:6aff56a099c74e1a998ed51f
      history:  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_32300000_glink-edge_fastrpc_compute-cb_5
      last run: https://d.kernelci.org/test/maestro:6aff56a099c74e1a998ed51e
      history:  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_32300000_glink-edge_fastrpc_compute-cb_6
      last run: https://d.kernelci.org/test/maestro:6aff56a099c74e1a998ed51d
      history:  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_32300000_glink-edge_fastrpc_compute-cb_7
      last run: https://d.kernelci.org/test/maestro:6aff56a099c74e1a998ed51c
      history:  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_32300000_glink-edge_fastrpc_compute-cb_8
      last run: https://d.kernelci.org/test/maestro:6aff56a099c74e1a998ed51b
      history:  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_32300000_glink-edge_fastrpc_compute-cb_c
      last run: https://d.kernelci.org/test/maestro:6aff56a099c74e1a998ed51a
      history:  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_32300000_glink-edge_fastrpc_compute-cb_d
      last run: https://d.kernelci.org/test/maestro:6aff56a099c74e1a998ed519
      history:  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_32300000_glink-edge_fastrpc_compute-cb_e
      last run: https://d.kernelci.org/test/maestro:6aff56a099c74e1a998ed518
      history:  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_6800000_glink-edge_fastrpc_compute-cb_3
      last run: https://d.kernelci.org/test/maestro:6aff56a099c74e1a998ed515
      history:  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_6800000_glink-edge_fastrpc_compute-cb_4
      last run: https://d.kernelci.org/test/maestro:6aff56a099c74e1a998ed514
      history:  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_6800000_glink-edge_fastrpc_compute-cb_5
      last run: https://d.kernelci.org/test/maestro:6aff56a099c74e1a998ed513
      history:  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_6800000_glink-edge_fastrpc_compute-cb_6
      last run: https://d.kernelci.org/test/maestro:6aff56a099c74e1a998ed512
      history:  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_6800000_glink-edge_fastrpc_compute-cb_7
      last run: https://d.kernelci.org/test/maestro:6aff56a099c74e1a998ed511
      history:  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_6800000_glink-edge_fastrpc_compute-cb_8
      last run: https://d.kernelci.org/test/maestro:6aff56a099c74e1a998ed510
      history:  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: qemu-arm64
  > Config: defconfig+netdev+nfs-root-boot+ltp+crypto+ima
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6aff528f99c74e1a998de64f
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_h264.JVT-AVC_V1-GStreamer-H-264-V4L2SL.BA3_SVA_C
      last run: https://d.kernelci.org/test/maestro:6aff519799c74e1a998db873
      history:  > ✅  > ❌  > ✅  > ✅  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-04
      last run: https://d.kernelci.org/test/maestro:6aff532e99c74e1a998df81f
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
