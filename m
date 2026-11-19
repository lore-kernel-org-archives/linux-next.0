Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795055462;
	b=gLnbF2uS7QHnLSO5xsyrW0zi41qi4zecL69hYKHQptwW1bV+xUOcrmSavm4ADihct3fG
	 bw5J1NR+9Fm9mXT9MBdSOR7zqYkq0BugJKUFrMwqvI2H1go6gfG6Ur/i7B05+yXW+AYUW
	 nLqf+tcK5nwRWt5rEUyvRPde/jQPqTm0OA2coWZ9D3ccEVn83xLr1ekoyi9bNSWBTMcz+
	 3InA/Aihumh4K4yTu0WonombRgL25RFZ60mwJ+sG87F4NM+Wplje/nI3/gEJSs8hwWN4n
	 K5HLPnDlEJ/JxzqBtuVAyZ6GP44Pa8huTVY+RJFiQGLZkWZd4iQdUc1ReulEw3wwtiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795055462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:To:Cc:Reply-To:
	 Date:Message-ID;
	bh=mpmV7nLK2Db8ttbI+WP++XGP4+fV2Fg1rBuSMZ8WDYI=;
	b=FMQPPkhzVIIm6G/jFXLjg1stRKp97oqe5x069Un9UlTUvRfhWd4zu65NGAPGHzmWv9xX
	 uF0uIrk4Blhkzr8p8gUpr5kSIvZqlAiJH7ved8cQhBZ3WSu7tAMpQ6qLOhDjsf8jpqOMr
	 F+c+tsHTWPpyMO7MWumGeO7bU1dQfQkKCmPUvJ15+Le6xIrCxV5ONU3i//hJFCa1nd+cU
	 nD9hM2IalvghaclfmqpDrXagDALxBuuazf/Gy+dbRs50jyrwt1mjNIxkcLaUjeI3CNh8f
	 3Ec2yVYyZe2Qc2rG5tPu9/8UQ3NVNIlX6WFNCNy5qzolDtB+9DLvatNjdp5/bLx9s3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=LD6Fq7yF;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E27606A31C
	for <linux-next@vger.kernel.org>; Thu, 19 Nov 2026 02:31:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5E27606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=LD6Fq7yF
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a3c08d6928so2444002c88.0
        for <linux-next@vger.kernel.org>; Wed, 18 Nov 2026 18:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1795055461; x=1795660261; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mpmV7nLK2Db8ttbI+WP++XGP4+fV2Fg1rBuSMZ8WDYI=;
        b=LD6Fq7yF03Hsp5RjGdXvgpJRsVvG9uFUf/4g9b428BEAAY/+BK/n0AbtgVwXwM80ZK
         rzMheumlAxJdPnBHlcNksSQeHgQwYXmgboQQOJAwHPa/LGO3iZ5xaF2T9jv2Si+yAVvy
         vkGTXcaRlK3TzfgJF5ExHRelcin7hgcCRP/Fjqb0Q0DRGwTJ4AuMFYs4ODZR2g4HFQv8
         0Mo9f6iNPpAAWCIR2qoLqWpDNTBxuZtbzDqrJEb8VsFo3hH/D/miop2P0Yoft2cH509j
         PYTtQzpLu2bD6sY/7oEqz4ggX9p2MbCgSOkuQzuAIlBKlfG2caFCSb+nkQG2s9S3m+VN
         pBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795055461; x=1795660261;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mpmV7nLK2Db8ttbI+WP++XGP4+fV2Fg1rBuSMZ8WDYI=;
        b=rBieHq5v9Ic3hWvptx/6impgINvFKvlnNIvfHpWBshOkKI5Eb1vzzYCa3Oj3ss675t
         iOp2weYfIUMR3LUCO5hjCOWNc3RMW3c1TsDkJ+BGmV5zqN7FhLg07j0yUIiwtgfoGIPl
         Fj3oxEFfnQv7V8B1kBfKlNCxyv/w/1qUSwZGyRy3kIMAok/XNYS8CihXBiKzCQCJgd00
         JlmwckNuChvEjdcg81Slq0NjW0PLK4yiCVlWAS2fzlZ77HF8TZv2PK8ZCULeZoCHYAxG
         nOPWgBFY1oXCI0Sphgi3cBn/wv2rYQbeQ0qRmMsgUi/sXH8hfkyUHaFXdIfOoB51/K3F
         4wCw==
X-Gm-Message-State: APuU4Z8yqaaJedYxWYQTX6SVNYqTwm2EnUGVEJpjL0cQuPI+loEVIGe3
	yVz6gVaqdMUJGiF9H+7hlWJzmNa/QcqQf8JiauDZwfIUVcEbVmKZu3zCvgGeGO/Q5h4dlAm7Lfh
	goLI7
X-Gm-Gg: AYBFou3BzPno4MTqOPJ1gNwp01qoWFBX22Kx/KzkgH7Iq3GqWVvXP4KcrbfnmJEceB/
	h/giah9xwi54aXXNYkdX6oWhIfcMFcJqKkDnIuRfMOWUAkRd7IZ/yYn40zMhcyu6LwQNJei5jNA
	o6jcHbRw6B0PXJrf46JJsG5hdZDsnpVWc/cIQ6nr9uHtoZ0o5argPEMrwgpEkraEHDHxwf30b+S
	FKkziwZVtK7ybPZvRKWIidHhmQhGxrtc6yFZn6BaVJ2giqD13c8Nk3pYqomWCfgclRFQ9nmt6IW
	e0PValHN4GIMy+ocb5YTOq7Ah+2wWS3tZGYhZYph5bPR0UQXHoHYtugVM3sfOpLve1IMzSe43Vj
	m70qcpfC4LKGmt+XqrVZnLpZMqST2XAlMb2+jDGlmNIekZuSiYMc1T07Jny7KPPOFNFxcMGPqqy
	V5T/W48gdyMJcGFQHE5GIl92V1UvBbbXmMtUj5JLZfgrtnkMj3LrNKdEXu+/CaKxWkN5PC2XpW6
	hNrpzMPOR+9hnl7IhZPBZWwf+xpnYrB7xNJAajhteFpuIe+TTAonqVLUYGXvKrtVsKc57z0IFKu
	qxeOMwbs4jtLq26laBjHIw==
X-Received: by 2002:a05:7022:b88a:b0:1ab:faad:cba with SMTP id a92af1059eb24-1b543d06698mr3831303c88.34.1795055460615;
        Wed, 18 Nov 2026 18:31:00 -0800 (PST)
Received: from 053d53608e16 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447c1193sm10191219c88.7.2026.11.18.18.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 18:31:00 -0800 (PST)
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
Subject: [STATUS] next/master - e8017d29067fd1310a65c3494ce1a1b492adbac6
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 19 Nov 2026 02:31:00 -0000
Message-ID: <179505545975.24774.18002823096894827481@053d53608e16>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/e8017d29067fd1310a65c3494ce1a1b492adbac6/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: e8017d29067fd1310a65c3494ce1a1b492adbac6
origin: maestro
test start time: 2026-11-18 18:48:42.637000+00:00

Builds:	   76 ✅    1 ❌    0 ⚠️
Boots: 	  164 ✅    5 ❌    0 ⚠️
Tests: 	31697 ✅ 2002 ❌ 1467 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp9.VP9-TEST-VECTORS-GStreamer-VP9-V4L2.vp90-2-15-segkey-webm
      last run: https://d.kernelci.org/test/maestro:6afe0a7099c74e1a99859083
      history:  > ✅  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6afe099c99c74e1a99858789
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6afe107999c74e1a9985ca70
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: acer-R721T-grunt
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:6afe022699c74e1a99849e72
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: dell-latitude-3445-7520c-skyrim
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:6afe172499c74e1a99862b58
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:6afe184a99c74e1a9986432c
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: glymur-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1bf0000
      last run: https://d.kernelci.org/test/maestro:6afe171e99c74e1a99862a66
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1bf0000_pcie_0
      last run: https://d.kernelci.org/test/maestro:6afe171e99c74e1a99862a64
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1bf0000_pcie_0_wifi_0
      last run: https://d.kernelci.org/test/maestro:6afe171e99c74e1a99862a63
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_32300000_glink-edge_fastrpc_compute-cb_1
      last run: https://d.kernelci.org/test/maestro:6afe171e99c74e1a99862a48
      history:  > ❌  > ❌  > ⚠️  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_32300000_glink-edge_fastrpc_compute-cb_2
      last run: https://d.kernelci.org/test/maestro:6afe171e99c74e1a99862a47
      history:  > ❌  > ❌  > ⚠️  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_32300000_glink-edge_fastrpc_compute-cb_3
      last run: https://d.kernelci.org/test/maestro:6afe171e99c74e1a99862a46
      history:  > ❌  > ❌  > ⚠️  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_32300000_glink-edge_fastrpc_compute-cb_4
      last run: https://d.kernelci.org/test/maestro:6afe171e99c74e1a99862a45
      history:  > ❌  > ❌  > ⚠️  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_32300000_glink-edge_fastrpc_compute-cb_5
      last run: https://d.kernelci.org/test/maestro:6afe171e99c74e1a99862a44
      history:  > ❌  > ❌  > ⚠️  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_32300000_glink-edge_fastrpc_compute-cb_6
      last run: https://d.kernelci.org/test/maestro:6afe171e99c74e1a99862a43
      history:  > ❌  > ❌  > ⚠️  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_32300000_glink-edge_fastrpc_compute-cb_7
      last run: https://d.kernelci.org/test/maestro:6afe171e99c74e1a99862a42
      history:  > ❌  > ❌  > ⚠️  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_32300000_glink-edge_fastrpc_compute-cb_8
      last run: https://d.kernelci.org/test/maestro:6afe171e99c74e1a99862a41
      history:  > ❌  > ❌  > ⚠️  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_32300000_glink-edge_fastrpc_compute-cb_c
      last run: https://d.kernelci.org/test/maestro:6afe171e99c74e1a99862a40
      history:  > ❌  > ❌  > ⚠️  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_32300000_glink-edge_fastrpc_compute-cb_d
      last run: https://d.kernelci.org/test/maestro:6afe171e99c74e1a99862a3f
      history:  > ❌  > ❌  > ⚠️  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_32300000_glink-edge_fastrpc_compute-cb_e
      last run: https://d.kernelci.org/test/maestro:6afe171e99c74e1a99862a3e
      history:  > ❌  > ❌  > ⚠️  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_6800000_glink-edge_fastrpc_compute-cb_3
      last run: https://d.kernelci.org/test/maestro:6afe171e99c74e1a99862a3b
      history:  > ❌  > ❌  > ⚠️  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_6800000_glink-edge_fastrpc_compute-cb_4
      last run: https://d.kernelci.org/test/maestro:6afe171e99c74e1a99862a3a
      history:  > ❌  > ❌  > ⚠️  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_6800000_glink-edge_fastrpc_compute-cb_5
      last run: https://d.kernelci.org/test/maestro:6afe171e99c74e1a99862a39
      history:  > ❌  > ❌  > ⚠️  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_6800000_glink-edge_fastrpc_compute-cb_6
      last run: https://d.kernelci.org/test/maestro:6afe171e99c74e1a99862a38
      history:  > ❌  > ❌  > ⚠️  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_6800000_glink-edge_fastrpc_compute-cb_7
      last run: https://d.kernelci.org/test/maestro:6afe171e99c74e1a99862a37
      history:  > ❌  > ❌  > ⚠️  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_remoteproc_6800000_glink-edge_fastrpc_compute-cb_8
      last run: https://d.kernelci.org/test/maestro:6afe171e99c74e1a99862a36
      history:  > ❌  > ❌  > ⚠️  > ⚠️  
            
Hardware: qemu-arm64
  > Config: defconfig+netdev+nfs-root-boot+ltp+crypto+ima
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6afe19d499c74e1a99866b31
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_h264.JVT-AVC_V1-GStreamer-H-264-V4L2SL.BA3_SVA_C
      last run: https://d.kernelci.org/test/maestro:6afe070799c74e1a998527a9
      history:  > ✅  > ✅  > ❌  > ✅  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-04
      last run: https://d.kernelci.org/test/maestro:6afe094a99c74e1a9985824a
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
