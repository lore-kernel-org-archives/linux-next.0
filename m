Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C16335674A
	for <linux-next@vger.kernel.org>; Sat, 17 Oct 2026 02:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792204218; cv=none; b=fHVsDDQTg0B5/uxleHrbEDD5rHfxhaTNWnRr8onDa1yZrS9oqZXcr5jRO8Sgm/0bMUCcqlC1P44Vb0QSz7Ey16L4t+QmjU6K0v601+QpGO1OY4sLK8MA5V5Jkym310RnTudmcQb0yo9RGLPA65bhzRq4bhad684gdjO9Kla97Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792204218; c=relaxed/simple;
	bh=SkOCb1COlmilt72HSiEK2r7FIi6g8T1IG1viztsfYBk=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=MEkoa0REYmNRoobDa3aYn581BaYgYsVT4o4LrNBTl+3BFuGBcGvF3a9jG/0b4BzYvkttw04oZC7W4GhLHcsnSHbLy8GVCRJkeYDOn+xLyMuyn8IVS50dPHgiYwtEq1aqSFTfvSKJdAqGLV2b/gziRmgryYdUZNZkqRfqg1tvxu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=XB8oLKR6; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="XB8oLKR6"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3282db206d3so1330173eec.0
        for <linux-next@vger.kernel.org>; Fri, 16 Oct 2026 19:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1792204215; x=1792809015; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fViz6HrTE0ey545Y0PtkL/2+q5Az32aVK7cHHP/DYyw=;
        b=XB8oLKR6OLD0yn/einYgrTPXBf4xkCjrKQVDSr7DBSbXKQHRdawgYxO/diHe38z7nt
         YdeUhFMfS0Acbi4LpddvzNKEiEmuzefI6hDEe6iQuqAVPFgPLerCU9LOIfdw5LiWPyF6
         KHCfJPA7hzDt3OjtATUXuQZw9CXEP/WmFl/TLK164PVDc+/pAqiHrBYXxgd/Lcq+M4fx
         sLtOAM37y04g6Li8AaQZ4N16IbNY6x5skPQfPJCBVxW4FF6OfWm1I1ScC33bukDDI0/K
         UN0p42u4WW7NsH4teBLuQDjFcB+yGo8kcxQy9Lej2ZDNGA12H32Zz5eFH0/RG0kKALIz
         XuEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792204215; x=1792809015;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fViz6HrTE0ey545Y0PtkL/2+q5Az32aVK7cHHP/DYyw=;
        b=mBJeQcH+FDsX78CY7hpMxAFkLzfttFbPe4vI9y1coYq9URPLbUTypq8R4gkRTBjvYa
         YK08HRI9PuntKjfSs4vnMOU5jU6tw1vawODrZoMNZjtZ3ydjW67IxRnBiHtNGHkQyEh/
         Ikow/PwEL7UJofTgf0uw1RSei6ft+YyjvBm6o5FqowfZKhp5G8UdlcUkz1D64yd8Ysgp
         +HDYO90g+brHO524C09U+u66r/OJp2/p8pYyFQmlIEp4T/G91R7I+cZ6nbWRQQLG3j/u
         TgBHuvj1dHC/gpEkar9/3FmWu+aufjTSjq4m7wNm3+uXxcZcQWkJ5ZOag8d1bWNFPeDN
         swXg==
X-Gm-Message-State: AFq9FYJ9KCyWwSg4F8Y9DRCl72F7tpKLwUktwf6ZwPjI0v6tFoAQKgoO
	sEqv9+8idPZ+kVOCHdf7yq2ijq1ydDi7teOtnZgTYkkgugWJcfZtqxsO0hN9nAu0u3lxryNp0Ve
	J2NkR
X-Gm-Gg: AYBFou2JkZO5z8LHQHdKz60ZxXBr5aRd0VQ8trMJRPnxo8RalvADa5r1eD+eDNveUki
	hHyX7bmilhkkVUCuTE/Wr5sZI55iRBbaJPGTSBEFHvTWGaND98z8bevMO2QK9DIJ+kurCt9gYP/
	wLRtw3CPHvGmfppo62g7joL+rJyf44utNHAuaSxfSjYWb1Vh0wDUysCsjFVW44aQat7u0tH5ZiT
	h2HX7ngnj/pq9YclLEvdf0ozeqYSeSeuyfMuOjbK45zr9QuWX3PN97Wz6rvNGzEhqzcUIHl9hml
	xAh/xPJ+VMzzPjqdUnpIyzY8Ty6swO/jbjxqBfiaaeJuyRWFyPWGOvH+IMEDrmIxRvOgLPp2TEj
	NS9jEde/3dlqcn6aUopKDuIlmFLDcuO2AMHYmJAU4L056Hgp+PykvQbY15tCH6/g1s6EZdBqkbJ
	HhtwMuu+/OC6TC886abcAWkhqxhPfuyN6OjA+VpFBd21u4oW2Z5lwWRiv9WTEKOeE=
X-Received: by 2002:a05:693c:8814:10b0:358:7bea:88d5 with SMTP id 5a478bee46e88-361a2354271mr2302840eec.21.1792204214978;
        Fri, 16 Oct 2026 19:30:14 -0700 (PDT)
Received: from 6e52bff8000c ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360820a02b8sm11044538eec.17.2026.10.16.19.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 19:30:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sat, 17 Oct 2026 02:30:14 -0000
Message-ID: <179220421385.16163.13349917433266043348@6e52bff8000c>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
origin: maestro
test start time: 2026-10-16 14:06:43.161000+00:00

Builds:	   74 ✅    2 ❌    0 ⚠️
Boots: 	  173 ✅    5 ❌    0 ⚠️
Tests: 	24755 ✅ 3278 ❌ 3548 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - ltp.futex_wait05
      last run: https://d.kernelci.org/test/maestro:6ad29c657c0a66b9cb3fea26
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - ltp.ioctl_loop02
      last run: https://d.kernelci.org/test/maestro:6ad29c677c0a66b9cb3feb24
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
      - ltp.ioctl_loop03
      last run: https://d.kernelci.org/test/maestro:6ad29c677c0a66b9cb3feb25
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
Hardware: jetson-agx-orin-industrial-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp.ioctl_loop02
      last run: https://d.kernelci.org/test/maestro:6ad24730a3f195e1aa93de6c
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
      - ltp.ioctl_loop03
      last run: https://d.kernelci.org/test/maestro:6ad24732a3f195e1aa93e106
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ad236b7a3f195e1aa932879
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: stm32mp157a-dhcor-avenger96
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp.shmget03
      last run: https://d.kernelci.org/test/maestro:6ad24e78a3f195e1aa9412b2
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.kvm
      last run: https://d.kernelci.org/test/maestro:6ad23e5ea3f195e1aa936bcf
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.kvm.kvm_nested_tsc_scaling_test
      last run: https://d.kernelci.org/test/maestro:6ad29c6c7c0a66b9cb3fedef
      history:  > ✅  > ❌  > ✅  > ✅  > ❌  
            
      - kselftest.kvm.kvm_set_memory_region_test
      last run: https://d.kernelci.org/test/maestro:6ad29c6c7c0a66b9cb3fedbf
      history:  > ❌  > ✅  > ❌  > ✅  > ✅  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ad29c637c0a66b9cb3fe768
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - ltp.shmget03
      last run: https://d.kernelci.org/test/maestro:6ad29c657c0a66b9cb3fea0c
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: jetson-agx-orin-industrial-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6ad246b0a3f195e1aa93da5e
      history:  > ✅  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6ad246b0a3f195e1aa93da59
      history:  > ✅  > ❌  > ✅  > ❌  > ❌  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ad2472da3f195e1aa93dcb9
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
Hardware: jetson-orin-nx-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_cpuset_prs_sh
      last run: https://d.kernelci.org/test/maestro:6ad245bca3f195e1aa93d0f4
      history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6ad245bca3f195e1aa93d0a1
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6ad245bca3f195e1aa93d09c
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
Hardware: nvidia-igx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6ad245f8a3f195e1aa93d307
      history:  > ✅  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6ad245f8a3f195e1aa93d302
      history:  > ✅  > ❌  > ❌  > ❌  > ✅  
            
Hardware: qemu-arm64
  > Config: defconfig+netdev+nfs-root-boot+ltp
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ad23989a3f195e1aa9344c0
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
Hardware: stm32mp157a-dhcor-avenger96
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp.dirtyc0w_shmem
      last run: https://d.kernelci.org/test/maestro:6ad24e77a3f195e1aa941054
      history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
      - ltp.epoll_pwait03
      last run: https://d.kernelci.org/test/maestro:6ad24e78a3f195e1aa94144a
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
      - ltp.shmctl05
      last run: https://d.kernelci.org/test/maestro:6ad24e78a3f195e1aa9412b3
      history:  > ✅  > ❌  > ✅  > ✅  > ❌  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_timer_10017000
      last run: https://d.kernelci.org/test/maestro:6ad23912a3f195e1aa933b10
      history:  > ⚠️  > ⚠️  > ✅  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_timer_10017000
      last run: https://d.kernelci.org/test/maestro:6ad23932a3f195e1aa933f72
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-01
      last run: https://d.kernelci.org/test/maestro:6ad23b7ea3f195e1aa93578b
      history:  > ❌  > ❌  > ✅  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-02
      last run: https://d.kernelci.org/test/maestro:6ad23b7ea3f195e1aa93578a
      history:  > ❌  > ❌  > ✅  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-04
      last run: https://d.kernelci.org/test/maestro:6ad23b7ea3f195e1aa935788
      history:  > ❌  > ❌  > ✅  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp9.VP9-TEST-VECTORS-GStreamer-VP9-V4L2.vp90-2-15-segkey-webm
      last run: https://d.kernelci.org/test/maestro:6ad23bbda3f195e1aa935cf2
      history:  > ✅  > ❌  > ✅  > ❌  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-01-intra-1417
      last run: https://d.kernelci.org/test/maestro:6ad23ad2a3f195e1aa935517
      history:  > ❌  > ❌  > ✅  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-01
      last run: https://d.kernelci.org/test/maestro:6ad23ad2a3f195e1aa935512
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-02
      last run: https://d.kernelci.org/test/maestro:6ad23ad2a3f195e1aa935511
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp9.VP9-TEST-VECTORS-GStreamer-VP9-V4L2.vp90-2-15-segkey-webm
      last run: https://d.kernelci.org/test/maestro:6ad23baba3f195e1aa9358ac
      history:  > ❌  > ✅  > ❌  > ❌  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
