Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794623455;
	b=0D/vmW+8ARw0iL7nYbvDtPgjwfnxThsW+yBdJlsenKbuy+n8i6EgnyGjkHhEWf9C2ecY
	 v5TTb6BHwVhoF2s0GidvqNNC86XhyOgO0q1RYps7Tp9y0vA41HG7mjPANiQMNGbBTenez
	 sxjBglDhinJIKsAK3VW4Zigp+QhcHjHprNO5F4TiaH/m9LFDO8MjUJI/VcF0zgdzpMBvf
	 fi+ig/+DadJ62MhFGXePSiwR8C7eyhnVRnd8Sc3+mw01c+lo8ora/yaxw8zmvWnsL0K59
	 C8rRBVosf9VnxOz9RULLiFyiFTngOrsKefDVZcC0h2VQGxpgbXsfrx9VkKEUDjk7udA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794623455;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:To:Cc:Reply-To:
	 Date:Message-ID;
	bh=BjOF4B2VvMDCgiljaAMzWTU7WotwvhmuHTINwYBvAPY=;
	b=aZE1Swhzz8t+N7Y3P6G2Q6ASXlMQeTzuCQeaAfAbcptf3WIKKmUhnfa4xKzQjX6xzKtD
	 OoMG9580XUWthcKpFn3yeeZoEfxfGEVd9OOFbmBWTR6fkeWfw4ktT6qvw2o3G7LFW0EvD
	 qc2pa67v0DLsigLh4No8PlSiqSGQrXg/0HJ7gnpuaNrHjHlFBi1DAme15wK1+2LmLqb4F
	 dfTfr7/U62C2qzXSfbFuxQRbSLDa49lZhGAHuB+zt1cGwDmRXozfQvTLZDQQ4k8jjvvK9
	 C+0obwrekk8725BQ/sqMnrBlPFgykjUmpH1n2EtmfsfPvweJFodCBgTw8oxLtOAZDHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b="DTlba/mI";
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29223606A323
	for <linux-next@vger.kernel.org>; Sat, 14 Nov 2026 02:30:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29223606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=DTlba/mI
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-372bdb942dbso1768316eec.1
        for <linux-next@vger.kernel.org>; Fri, 13 Nov 2026 18:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1794623454; x=1795228254; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BjOF4B2VvMDCgiljaAMzWTU7WotwvhmuHTINwYBvAPY=;
        b=DTlba/mI4r/bRJLRO3Iy+RqvrV+s3OkMpsJpuhfv64wuKz3C7h5RohARETB3DZ+xR5
         IwgzO0t4dc4ixwHNQY7a9wCq6ux/oD6Ti5QQJn2TL+j63VpQ1uNtM1x/a4ERESGqzAJQ
         9LcrlexoHgDkFO2cA8URTN/XUJP75CJIQxEXvP9nmXwYG/l/3rgeq6377e6CKuab+Y5r
         Ez29riAPqR26c4fJB5roQwXdNomjhB9ChzEpqr50iBAwtRZH1tgAMQbxBR3uZAtb0IOV
         89ECK9JBrroz863P9rCY1kJaB1muJMofUMsyilo7SCKEnLuK7+EidTp0ugLeAuFffuCg
         /mlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794623454; x=1795228254;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BjOF4B2VvMDCgiljaAMzWTU7WotwvhmuHTINwYBvAPY=;
        b=PXd7xBv0TJJAxIwpdV7n9dQ4Io3k4BiAI3pJbXmeb8M3zQFAtuqL1+sdMVorDiB6NI
         vFL0dixtdpcGN6SIwNHpRYySuH91RAkVi6TK62Z55xS4rfEtaqmQDyHIV8Y5NuZi8Wp+
         ONPa6Cl4nSgTkOOx8b+wpG3P2w40UVj0UdO+l9TGx/9zPkKNBVLnJPFY5tT/QNAMt5eM
         nOIg4WGvNiLc3UMIohTy9Q8YgrGBBbONLTmZR4E5+raaXbAApVvuLsw/JdJEsmchlt2n
         4CVZVqFj2EchO9zm6bfy+ROjQg/G92HvzjDxHQR7PYvIe8leJOj4riyc2tqkkaUsTP0E
         M7ow==
X-Gm-Message-State: APuU4Z8IhqcemsIukCzwBsoP25vpodB0w2ScPyf1DNAFq+ja5ky9fkxB
	huvZlQauS/rVlgXM1zZFCLemu2ZKg90bp0QrdFt6xWTHrQk4YNI78D9I3XCSXNheJ60OeprNUdE
	BtrEn
X-Gm-Gg: AYBFou3ohzA6zswvBY+xPU5Mv1i1s83i9uqnJByK/PEYrem2cBllKIfVtYowYKduAag
	1r0/FBugiqpGVIGMiPIC0hnTrgoSQ9+AxabsbQnShtzKgopByuympcqvXjqsabtugSWJIS+Yo1N
	KJ9lfKYE9rgcLfZVdWTmEnttsCn35FQDD1ALV2HEWcYZdPmqn+/a/cZpPWek7u5XmgoxargoKIZ
	Udv/2xpwIbuHH9dfeMl6wXbfyX9KjPLWBJqjTuF4xE7CqlZ/pDM+3ra9VHzQwVKCeBVbT4RxPIt
	BSYGwwwRfRPGi5n0j/5aUOW743cQOdDuhWgThigJEqRJxRNzMsmhV6/WNuvBopc1vUsXQVBLnez
	AxUM3QWw6htOzW01NccrjfxS0C6DP6F2qyZA26Y/KA09CwqBMcR3uU4QkO41Zh9n3RxF6sugco0
	ifRY6aGKyVjjTBxL0eQqgYHe4grYE7+aEUW6f497GeYfymSqpj6WcV3y1HKCzVmFHHqd2z0QivA
	5ILLyS4njpT2pOAWj7xBOep4I8rbAUX1y0T1Cwv12s2ez+WqKcEXlrMk0Bagj10yVlQWKUDyVHL
	EFp7WGsRnZ51+YwvNawSVSc2z5ZxjMlnkyZCTMkLVos=
X-Received: by 2002:a05:7300:d40d:b0:360:d4c5:7243 with SMTP id 5a478bee46e88-37966e3a7cfmr4126685eec.11.1794623453988;
        Fri, 13 Nov 2026 18:30:53 -0800 (PST)
Received: from 8439c401ee69 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3797f98b9b2sm11136938eec.6.2026.11.13.18.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 18:30:51 -0800 (PST)
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
Subject: [STATUS] next/master - 84abb955b1015477aa11a96e2f3ac1b938b77f48
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sat, 14 Nov 2026 02:30:50 -0000
Message-ID: <179462345046.64779.8604094617584349476@8439c401ee69>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/84abb955b1015477aa11a96e2f3ac1b938b77f48/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 84abb955b1015477aa11a96e2f3ac1b938b77f48
origin: maestro
test start time: 2026-11-13 17:49:40.299000+00:00

Builds:	   76 ✅    1 ❌    0 ⚠️
Boots: 	  143 ✅   19 ❌    0 ⚠️
Tests: 	40793 ✅ 2574 ❌ 4424 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: dell-latitude-3445-7520c-skyrim
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:6af7744d5b429d354e51a2d8
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:6af775f35b429d354e51d003
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: jetson-nano-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_freezer
      last run: https://d.kernelci.org/test/maestro:6af772e05b429d354e51937b
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.cgroup.cgroup_test_freezer_test_cgfreezer_time_migrate
      last run: https://d.kernelci.org/test/maestro:6af772e05b429d354e519377
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6af769fb5b429d354e511890
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6af772e25b429d354e5193e3
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-04
      last run: https://d.kernelci.org/test/maestro:6af76cdb5b429d354e514ab7
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: jetson-tx1-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6af769fb5b429d354e511893
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_broadcast_locked_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6af7735a5b429d354e519a90
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: jetson-orin-nx-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6af7731c5b429d354e519601
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6af7731c5b429d354e5195fc
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: purwa-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_ae90000
      last run: https://d.kernelci.org/test/maestro:6af7684a5b429d354e510206
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_iommu_3da0000
      last run: https://d.kernelci.org/test/maestro:6af7684a5b429d354e5101c8
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.timers.timers_mqueue-lat
      last run: https://d.kernelci.org/test/maestro:6af779165b429d354e5210a7
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.timers.timers_nsleep-lat
      last run: https://d.kernelci.org/test/maestro:6af779165b429d354e52107c
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.timers.timers_posix_timers
      last run: https://d.kernelci.org/test/maestro:6af779165b429d354e521090
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: qcs615-ride
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.efivars
      last run: https://d.kernelci.org/test/maestro:6af75b735b429d354e5011f0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000
      last run: https://d.kernelci.org/test/maestro:6af75d905b429d354e504840
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_display-controller_ae01000
      last run: https://d.kernelci.org/test/maestro:6af75d905b429d354e50483f
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_dsi_ae94000
      last run: https://d.kernelci.org/test/maestro:6af75d905b429d354e50483b
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_edp_aea0000
      last run: https://d.kernelci.org/test/maestro:6af75d905b429d354e504839
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_ae94400
      last run: https://d.kernelci.org/test/maestro:6af75d905b429d354e504837
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_aec2a00
      last run: https://d.kernelci.org/test/maestro:6af75d905b429d354e504836
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_iommu_3da0000
      last run: https://d.kernelci.org/test/maestro:6af75d905b429d354e504802
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_h265.JCT-VC-HEVC_V1-GStreamer-H-265-V4L2SL.MAXBINS_C_TI_5
      last run: https://d.kernelci.org/test/maestro:6af76b225b429d354e512fff
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-01
      last run: https://d.kernelci.org/test/maestro:6af76cdb5b429d354e514aba
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: jetson-agx-xavier-devkit
  > Config: defconfig+lab-setup
    - Architecture/compiler: arm64/gcc-15
      - tegra-tests.boot.devices
      last run: https://d.kernelci.org/test/maestro:6af777f45b429d354e51fe88
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: glymur-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1bf0000
      last run: https://d.kernelci.org/test/maestro:6af75d385b429d354e503ee2
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1bf0000_pcie_0
      last run: https://d.kernelci.org/test/maestro:6af75d385b429d354e503ee0
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1bf0000_pcie_0_wifi_0
      last run: https://d.kernelci.org/test/maestro:6af75d385b429d354e503edf
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1c00000
      last run: https://d.kernelci.org/test/maestro:6af75d385b429d354e503f98
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: jetson-nano-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6af772e05b429d354e51938b
      history:  > ✅  > ✅  > ❌  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6af772e05b429d354e519386
      history:  > ✅  > ✅  > ❌  > ❌  > ✅  
            
Hardware: jetson-orin-nx-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_cpuset_prs_sh
      last run: https://d.kernelci.org/test/maestro:6af7731c5b429d354e519655
      history:  > ❌  > ⚠️  > ⚠️  > ❌  > ⚠️  
            
Hardware: jetson-xavier-nx-devkit
  > Config: defconfig+lab-setup
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_freezer
      last run: https://d.kernelci.org/test/maestro:6af770215b429d354e516a5e
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_freezer_test_cgfreezer_time_migrate
      last run: https://d.kernelci.org/test/maestro:6af770215b429d354e516a5a
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: kaanapali-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_tn_111b8000
      last run: https://d.kernelci.org/test/maestro:6af7609a5b429d354e508f7a
      history:  > ⚠️  > ❌  > ❌  > ❌  > ❌  
            
Hardware: mahua-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device-error-logs
      last run: https://d.kernelci.org/test/maestro:6af75abc5b429d354e50076d
      history:  > ❌  > ✅  > ❌  > ❌  
            
Hardware: nvidia-e5020-vera
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6af771f05b429d354e517de9
      history:  > ❌  > ✅  > ❌  > ✅  > ✅  
            
Hardware: purwa-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:6af75aba5b429d354e500767
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.devices-exist
      last run: https://d.kernelci.org/test/maestro:6af75b2c5b429d354e500c87
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.timers.timers_nanosleep
      last run: https://d.kernelci.org/test/maestro:6af779165b429d354e521083
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.timers.timers_nanosleep_CLOCK_TAI_remaining
      last run: https://d.kernelci.org/test/maestro:6af779165b429d354e521084
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: qcs615-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000
      last run: https://d.kernelci.org/test/maestro:6af764325b429d354e50c7a1
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_display-controller_ae01000
      last run: https://d.kernelci.org/test/maestro:6af764325b429d354e50c7a0
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_ae90000
      last run: https://d.kernelci.org/test/maestro:6af764325b429d354e50c79e
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_dsi_ae94000
      last run: https://d.kernelci.org/test/maestro:6af764325b429d354e50c79c
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_ae94400
      last run: https://d.kernelci.org/test/maestro:6af764325b429d354e50c79a
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
Hardware: qemu-arm64
  > Config: defconfig+netdev+nfs-root-boot+ltp+crypto+ima
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6af7715e5b429d354e517534
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-02
      last run: https://d.kernelci.org/test/maestro:6af76c9d5b429d354e51440b
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
