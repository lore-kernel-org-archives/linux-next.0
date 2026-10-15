Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FD53033E6
	for <linux-next@vger.kernel.org>; Thu, 15 Oct 2026 02:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792031442; cv=none; b=n0GsdAfz9GgXyxOF35DQIhRcxTFpeWKe0Qxtwga67rsLziN2b0iJROXfPy9dvdvX30aoW2CvP/7wx5tcWTXSKw4/cIQqL4azX5Ib3Co9MB6+6fqt01SWE9Lp4Ho9ZRcBJRyHMa+e/GMGewUD727j+zDqckzN6juCto8hpTqYuQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792031442; c=relaxed/simple;
	bh=lqz01ArfUjyhOv/941xkaIbhZEOSUYosLB1jYVBMGd0=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=RzjJLhq4UwWpboPiJsMaA8aQ88HJwjhYyDHGCX90MWHRx9q1WewzrEz9sFm5188FJahiiMkRLenpq+Ghmo3efxlUzHU54fHdbou/5IoJpG2L4izAdBUJ3NWTq6HLrY07pUebYcyQTVZuLbaZWX/m4S567GF6+J2gKZDh21RgJHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=Pm8bY021; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="Pm8bY021"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35a31bb9fb6so6674706eec.1
        for <linux-next@vger.kernel.org>; Wed, 14 Oct 2026 19:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1792031439; x=1792636239; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OSUSsdc4ok4LjuvvB8+h1Jk41uCHLoJWR0BM09NuDKc=;
        b=Pm8bY021OjarqbrdC/xpc4tQBCUy/Pgrm3wrS2QgtvD8nzch5hQxodWzyDrWC0WD9u
         EsKvY8e/hHZ7G2i8TAw5XeJ/FF8doCw6au6XiJ1m80OkD7PNTsIy4NMevZ7fDY7ki0ua
         2Wy/9cxxZ1YlVHzcgliPRoA/9WsHirwFgqVA0+bBYWh+s4LCAV7l3XJaE9bk0l8M9zXI
         wQ2nisQZyZrK+L0pCS7Nhc35I3HGtC99xf5+fwjhyTptTVQuX8gCUtEL307et3YzVlmW
         yFbFFunjfbigwu0vPXYcdPjYVEK25fqwtkPL4sy3PW7oeYC+HSxWB5gwPB9HDPEqDq88
         3Cng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792031439; x=1792636239;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OSUSsdc4ok4LjuvvB8+h1Jk41uCHLoJWR0BM09NuDKc=;
        b=DtKWZ36ii3yJBhEUgStSugXLB1Ho/XpX4jwdDcnoOxDnjFKGorYRipIOiUu/neJHzL
         Qp3E1rE9Bc7ibSFqjpX4OqZ44k3oyKRyqCxCREcDLBx4GcB22yyUs9oCetWR8DoNgUuF
         82vKzv0iHGgVLeI+8gSg4dz9+4aOoAb4iV28mdW90UwX4+8OBilDdo7G6T4JWYJi3B1c
         ddPnxF8xx6bBUtpCw2yUuvNh62S2yNdlhf8uzltLb+6G0QFqW7QRkHuZFRb4kxuBaa8y
         O8dQVJeznXb6k9uSmtUW3ycHzEvsLMLHmkOQ3HJC+4vRXGEdq602gqxQs/umRQaivSy1
         wpyw==
X-Gm-Message-State: AFq9FYKKMR6p0TBOCQzT8Q7XhHkqMhnL4Zh5YxEO0G9MTpAdd5s9pBSt
	BwC4oYOhqX3xbC7yl7RIak8Umhi4FUKmzmHoU4OeFp1Vqxn2QmSlUb+8Gvqscp7eBtF01aWlIur
	8g+wP
X-Gm-Gg: AYBFou1oBjP6+0/ZcgyGSNRUf3rSeIazR98T7SV0UeXKyGlqLm7s0rHdxuGUNR9pc5Q
	gdz0FqdspAtpBqpT4v8npzbvqMvb/WcPjqjFoJipLiWBZ5i4WeyfDIXYOgqHNIohBl208a0IC06
	6E2rdxhqW+1rYp+DkiF/mLXeomxhuIxQUrDqIV3n8QlPZwwFuv+1zoHhDemoi2XrSbEoqKP7BWi
	i57asFzGrisqn4KjbECfBPbxUoTJqqBvZb3//p18x0NiInbIHqwnJvphu4rjPyC5jRl1RQmYaxN
	n3Kr6bpuVvyOHvIl+aRnAg+JM0mOj5w/o7/zr5YTFcxd9kwrgyDNDrTYZrJ8Of3CnTYvcrgJ5Vz
	RkWFUwiyxcayzfIcgnfZE0CTHf1FMQCdx15mEsjMKDAJLkvEWych4eW+4SrC3qWS5l0z8mXVAIZ
	2NdKk6OLPQ+iWHyc4umcbrnxTBvkKGd++sGTwWvea8taljXpXvolJCvBu0hKz73SM=
X-Received: by 2002:a05:7300:8b14:b0:35f:f0:8edf with SMTP id 5a478bee46e88-35f00f09f07mr2229483eec.13.1792031438486;
        Wed, 14 Oct 2026 19:30:38 -0700 (PDT)
Received: from 244668f92ec4 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-359789fde97sm41988401eec.20.2026.10.14.19.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 19:30:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - d419d682257d813f6cb7a28e42b35d0edf4ad038
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 15 Oct 2026 02:30:35 -0000
Message-ID: <179203143535.339645.2547132970420575672@244668f92ec4>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/d419d682257d813f6cb7a28e42b35d0edf4ad038/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: d419d682257d813f6cb7a28e42b35d0edf4ad038
origin: maestro
test start time: 2026-10-14 15:29:47.947000+00:00

Builds:	   74 ✅    1 ❌    0 ⚠️
Boots: 	  174 ✅   10 ❌    0 ⚠️
Tests: 	42180 ✅ 3312 ❌ 5639 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - ltp.ioctl_loop02
      last run: https://d.kernelci.org/test/maestro:6acfc2eaa3f195e1aa83107d
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - ltp.ioctl_loop03
      last run: https://d.kernelci.org/test/maestro:6acfc2eaa3f195e1aa83107e
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: jetson-agx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp.ioctl_loop02
      last run: https://d.kernelci.org/test/maestro:6acfe4a5a3f195e1aa8473c1
      history:  > ✅  > ✅  > ❌  
            
      - ltp.ioctl_loop03
      last run: https://d.kernelci.org/test/maestro:6acfe4a5a3f195e1aa8473c2
      history:  > ✅  > ✅  > ❌  
            
      - ltp.prctl09
      last run: https://d.kernelci.org/test/maestro:6acfe4a2a3f195e1aa84723b
      history:  > ✅  > ❌  > ❌  
            
      - ltp.pselect01
      last run: https://d.kernelci.org/test/maestro:6acfe4a2a3f195e1aa84723c
      history:  > ✅  > ❌  > ❌  
            
Hardware: jetson-agx-orin-industrial-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp.ioctl_loop02
      last run: https://d.kernelci.org/test/maestro:6acfcf50a3f195e1aa839803
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - ltp.ioctl_loop03
      last run: https://d.kernelci.org/test/maestro:6acfcf53a3f195e1aa839aa2
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: nvidia-p3809-gb300
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_cpuset_prs_sh
      last run: https://d.kernelci.org/test/maestro:6acfe974a3f195e1aa84871c
      history:  > ✅  > ✅  > ❌  
            
      - ltp.ioctl_loop02
      last run: https://d.kernelci.org/test/maestro:6acfe97ea3f195e1aa848f92
      history:  > ✅  > ✅  > ❌  
            
      - ltp.ioctl_loop03
      last run: https://d.kernelci.org/test/maestro:6acfe97ea3f195e1aa848f93
      history:  > ✅  > ✅  > ❌  
            
Hardware: stm32mp157a-dhcor-avenger96
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp.shmget03
      last run: https://d.kernelci.org/test/maestro:6acfdaa3a3f195e1aa843fee
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-04
      last run: https://d.kernelci.org/test/maestro:6acfb809a3f195e1aa82dbfd
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: acer-cbv514-1h-34uz-brya
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6acfafcda3f195e1aa82211c
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: acer-cp514-2h-1130g7-volteer
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6acfafe2a3f195e1aa822647
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: acer-cp514-2h-1160g7-volteer
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6acfb00aa3f195e1aa822fcb
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: acer-cp514-3wh-r0qs-guybrush
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6acfafbca3f195e1aa8219ea
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: acer-R721T-grunt
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6acfaff1a3f195e1aa8228bb
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: asus-CM1400CXA-dalboz
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6acfaffca3f195e1aa822af9
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: asus-CX3402CVA-brya
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6acfafc3a3f195e1aa821c02
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: dell-latitude-3445-7520c-skyrim
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6acfb033a3f195e1aa823cfa
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.cgroup
      last run: https://d.kernelci.org/test/maestro:6acfb41ca3f195e1aa8280d0
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_memcontrol
      last run: https://d.kernelci.org/test/maestro:6acfc2e1a3f195e1aa830b64
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_memcontrol_test_memcg_sock
      last run: https://d.kernelci.org/test/maestro:6acfc2e1a3f195e1aa830b5e
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
Hardware: hp-x360-14a-cb0001xx-zork
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6acfb001a3f195e1aa822d09
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: jetson-agx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp.nanosleep01
      last run: https://d.kernelci.org/test/maestro:6acfe4a2a3f195e1aa8471fe
      history:  > ❌  > ✅  > ✅  
            
      - ltp.select02
      last run: https://d.kernelci.org/test/maestro:6acfe4a2a3f195e1aa8472c9
      history:  > ❌  > ❌  > ✅  
            
Hardware: lenovo-TPad-C13-Yoga-zork
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6acfb03fa3f195e1aa823f7c
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: nvidia-p3809-gb300
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6acfe974a3f195e1aa8486d5
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6acfe974a3f195e1aa8486d0
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_memcontrol_test_memcg_sock
      last run: https://d.kernelci.org/test/maestro:6acfe974a3f195e1aa8486e0
      history:  > ❌  > ✅  > ✅  
            
Hardware: purwa-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_bc0000_i2c_b80000_keyboard_3a
      last run: https://d.kernelci.org/test/maestro:6ad010dca3f195e1aa8610e4
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-01
      last run: https://d.kernelci.org/test/maestro:6acfb6c9a3f195e1aa82d01f
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-02
      last run: https://d.kernelci.org/test/maestro:6acfb6c9a3f195e1aa82d01e
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-01-intra-1417
      last run: https://d.kernelci.org/test/maestro:6acfb809a3f195e1aa82dc05
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: hamoa-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6acfb089a3f195e1aa824406
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.timers.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:6ad034e5a3f195e1aa86b590
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: acer-chromebox-cxi5-brask
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6acfafa0a3f195e1aa8211e7
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.kvm.kvm_nested_tsc_scaling_test
      last run: https://d.kernelci.org/test/maestro:6acfc2f1a3f195e1aa83135e
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.kvm.kvm_set_memory_region_test
      last run: https://d.kernelci.org/test/maestro:6acfc2f0a3f195e1aa83132e
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6acfc2e5a3f195e1aa830cca
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - ltp.futex_wait05
      last run: https://d.kernelci.org/test/maestro:6acfc2e8a3f195e1aa830f7f
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
Hardware: jetson-agx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6acfe49fa3f195e1aa84700f
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - ltp.copy_file_range01
      last run: https://d.kernelci.org/test/maestro:6acfe4a7a3f195e1aa8475d9
      history:  > ✅  > ⚠️  > ✅  
            
      - ltp.copy_file_range02
      last run: https://d.kernelci.org/test/maestro:6acfe4a7a3f195e1aa8475da
      history:  > ✅  > ⚠️  > ✅  
            
      - ltp.io_uring01
      last run: https://d.kernelci.org/test/maestro:6acfe4a7a3f195e1aa8475e5
      history:  > ✅  > ⚠️  > ✅  
            
      - ltp.io_uring02
      last run: https://d.kernelci.org/test/maestro:6acfe4a7a3f195e1aa8475e6
      history:  > ✅  > ⚠️  > ✅  
            
      - ltp.io_uring03
      last run: https://d.kernelci.org/test/maestro:6acfe4a7a3f195e1aa8475e7
      history:  > ✅  > ⚠️  > ✅  
            
      - ltp.memfd_create03
      last run: https://d.kernelci.org/test/maestro:6acfe4a7a3f195e1aa8475d8
      history:  > ✅  > ⚠️  > ✅  
            
      - ltp.perf_event_open01
      last run: https://d.kernelci.org/test/maestro:6acfe4a7a3f195e1aa8475d7
      history:  > ✅  > ⚠️  > ✅  
            
      - ltp.statx01
      last run: https://d.kernelci.org/test/maestro:6acfe4a7a3f195e1aa8475db
      history:  > ❌  > ⚠️  > ❌  
            
      - ltp.statx04
      last run: https://d.kernelci.org/test/maestro:6acfe4a7a3f195e1aa8475dc
      history:  > ❌  > ⚠️  > ❌  
            
      - ltp.statx06
      last run: https://d.kernelci.org/test/maestro:6acfe4a7a3f195e1aa8475de
      history:  > ✅  > ⚠️  > ✅  
            
      - ltp.statx08
      last run: https://d.kernelci.org/test/maestro:6acfe4a7a3f195e1aa8475e0
      history:  > ✅  > ⚠️  > ✅  
            
      - ltp.statx09
      last run: https://d.kernelci.org/test/maestro:6acfe4a7a3f195e1aa8475e1
      history:  > ✅  > ⚠️  > ✅  
            
      - ltp.statx10
      last run: https://d.kernelci.org/test/maestro:6acfe4a7a3f195e1aa8475e2
      history:  > ✅  > ⚠️  > ✅  
            
      - ltp.statx11
      last run: https://d.kernelci.org/test/maestro:6acfe4a7a3f195e1aa8475e3
      history:  > ✅  > ⚠️  > ✅  
            
      - ltp.statx12
      last run: https://d.kernelci.org/test/maestro:6acfe4a7a3f195e1aa8475e4
      history:  > ✅  > ⚠️  > ✅  
            
      - ltp.utime02
      last run: https://d.kernelci.org/test/maestro:6acfe4a7a3f195e1aa8475ca
      history:  > ✅  > ⚠️  > ✅  
            
      - ltp.utime03
      last run: https://d.kernelci.org/test/maestro:6acfe4a7a3f195e1aa8475cb
      history:  > ✅  > ⚠️  > ✅  
            
      - ltp.utime04
      last run: https://d.kernelci.org/test/maestro:6acfe4a7a3f195e1aa8475cc
      history:  > ✅  > ⚠️  > ✅  
            
      - ltp.utime05
      last run: https://d.kernelci.org/test/maestro:6acfe4a7a3f195e1aa8475cd
      history:  > ✅  > ⚠️  > ✅  
            
      - ltp.utime06
      last run: https://d.kernelci.org/test/maestro:6acfe4a7a3f195e1aa8475ce
      history:  > ✅  > ⚠️  > ✅  
            
      - ltp.utimensat01
      last run: https://d.kernelci.org/test/maestro:6acfe4a7a3f195e1aa8475d0
      history:  > ✅  > ⚠️  > ✅  
            
      - ltp.utimes01
      last run: https://d.kernelci.org/test/maestro:6acfe4a7a3f195e1aa8475cf
      history:  > ✅  > ⚠️  > ✅  
            
      - ltp.vhangup01
      last run: https://d.kernelci.org/test/maestro:6acfe4a7a3f195e1aa8475d1
      history:  > ✅  > ⚠️  > ✅  
            
      - ltp.vhangup02
      last run: https://d.kernelci.org/test/maestro:6acfe4a7a3f195e1aa8475d2
      history:  > ✅  > ⚠️  > ✅  
            
      - ltp.writev02
      last run: https://d.kernelci.org/test/maestro:6acfe4a7a3f195e1aa8475d3
      history:  > ✅  > ⚠️  > ✅  
            
      - ltp.writev03
      last run: https://d.kernelci.org/test/maestro:6acfe4a7a3f195e1aa8475d4
      history:  > ✅  > ⚠️  > ✅  
            
      - ltp.writev05
      last run: https://d.kernelci.org/test/maestro:6acfe4a7a3f195e1aa8475d5
      history:  > ✅  > ⚠️  > ✅  
            
      - ltp.writev06
      last run: https://d.kernelci.org/test/maestro:6acfe4a7a3f195e1aa8475d6
      history:  > ✅  > ⚠️  > ✅  
            
Hardware: jetson-agx-orin-industrial-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6acfcf4aa3f195e1aa8395c7
      history:  > ❌  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6acfcf4aa3f195e1aa8395c2
      history:  > ❌  > ❌  > ✅  > ❌  > ✅  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6acfcf4ea3f195e1aa839652
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
Hardware: jetson-orin-nx-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_cpuset_prs_sh
      last run: https://d.kernelci.org/test/maestro:6acfccafa3f195e1aa837122
      history:  > ⚠️  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6acfccafa3f195e1aa8370cf
      history:  > ✅  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6acfccafa3f195e1aa8370ca
      history:  > ✅  > ❌  > ❌  > ❌  > ✅  
            
Hardware: nvidia-igx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6acfcddba3f195e1aa838b7d
      history:  > ✅  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6acfcddba3f195e1aa838b78
      history:  > ✅  > ❌  > ✅  > ❌  > ❌  
            
Hardware: nvidia-p3809-gb300
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6acfe978a3f195e1aa84876d
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
Hardware: purwa-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:6acfb04aa3f195e1aa8241b3
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
Hardware: qemu-arm64
  > Config: defconfig+netdev+nfs-root-boot+ltp
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6acfade6a3f195e1aa81fb43
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
Hardware: stm32mp157a-dhcor-avenger96
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp.dirtyc0w_shmem
      last run: https://d.kernelci.org/test/maestro:6acfdaa2a3f195e1aa843da7
      history:  > ✅  > ✅  > ⚠️  > ✅  
            
      - ltp.shmctl05
      last run: https://d.kernelci.org/test/maestro:6acfdaa3a3f195e1aa843fb7
      history:  > ✅  > ✅  > ❌  > ✅  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-04
      last run: https://d.kernelci.org/test/maestro:6acfb6c9a3f195e1aa82d01c
      history:  > ✅  > ❌  > ❌  > ✅  
            
      - fluster.debian.v4l2.gstreamer_vp9.VP9-TEST-VECTORS-GStreamer-VP9-V4L2.vp90-2-15-segkey-webm
      last run: https://d.kernelci.org/test/maestro:6acfb799a3f195e1aa82d8a4
      history:  > ✅  > ❌  > ✅  > ❌  > ✅  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-01-intra-1416
      last run: https://d.kernelci.org/test/maestro:6acfb809a3f195e1aa82dc06
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-01
      last run: https://d.kernelci.org/test/maestro:6acfb809a3f195e1aa82dc00
      history:  > ❌  > ✅  > ❌  > ✅  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-02
      last run: https://d.kernelci.org/test/maestro:6acfb809a3f195e1aa82dbff
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-03
      last run: https://d.kernelci.org/test/maestro:6acfb809a3f195e1aa82dbfe
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp9.VP9-TEST-VECTORS-GStreamer-VP9-V4L2.vp90-2-15-segkey-webm
      last run: https://d.kernelci.org/test/maestro:6acfb89ea3f195e1aa82e18a
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
Hardware: hamoa-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_bc0000_i2c_b80000_keyboard_3a
      last run: https://d.kernelci.org/test/maestro:6ad02d7fa3f195e1aa86abc9
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_bc0000_i2c_b80000_touchpad_15
      last run: https://d.kernelci.org/test/maestro:6ad02d7fa3f195e1aa86abc8
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
