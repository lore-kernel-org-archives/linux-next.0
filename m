Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3963911AA
	for <linux-next@vger.kernel.org>; Wed, 14 Oct 2026 02:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791945019; cv=none; b=XOc0dtrTdyOHkOUubUPzCRNK4FcydSYday2jEANGOVRyFSi66MGcu/Yb/5XqVi8QsmDUwT0pUTK+RTaZiwKeXImMJ9A+0S+0PFRN5WMw6sy9l1rAmjZPtxwN8Sxf9L6XH4l4LfczHMuoj4jF78Fj8DhiMc+AeAdsD46CSA/xKP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791945019; c=relaxed/simple;
	bh=6gPWxpm8gzZli+6Q92lFWAuvfj78VpjePKwvsH/gb2I=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=iNtuttWn2ojBI5Vk5edC3eMjXNxtBkT3rw198S66C2d1xAz6K7YywiUHIaxzpTwawN/YVTmlDupv4QTTK25q33d5H60/Elh7AHFByFplxxEOjcFGiMwARW3DuxeM3j9jD2TZaVvO2jq+wGUqIUMPfifnQ0s+y5t7wuL+oTBi76U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=OSPGiNau; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="OSPGiNau"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33e6279a1d7so2643511eec.1
        for <linux-next@vger.kernel.org>; Tue, 13 Oct 2026 19:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1791945016; x=1792549816; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YPP1TuTu1R4iT8oaMVieVMBwJTEQOfWGiH6zMwoTRpI=;
        b=OSPGiNauDLWzddaoWiwdGapj7MD01K8Rb1Qgudp8Ld+vbqir+zCqpEIaZyZ4Q8C3yZ
         TPcAknDw+isvVPxfgwNz/7027g/i5YeYveQUB0tm1knI6Bp0iFK4mEoXpblwiFHJZtue
         HOYpoutdGNhPWpb/fqC+D5q6KuP9aMXRcBjyZSKm9U/new/vHMHfdfBD+HGCYLisQ/LU
         11Xqidn/mQ6el1MZVR9aTUu19MV+9ukula0UGCmhk49LpLIxuoJHeW9e4LFekh1XK1n1
         bnLWN0Vaf/nVgDCxfDq9xn+SAjep0CByA91nusaqyrorqe53F9gExeblSRHL5xZCh/iZ
         mV9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791945016; x=1792549816;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YPP1TuTu1R4iT8oaMVieVMBwJTEQOfWGiH6zMwoTRpI=;
        b=SzfEXIhykVQbp82uUiJvJ6FNM4+FjZ2jS4VwLZ3sKDcts0oLLAKz7Fz5vSaXv+uH2P
         FfRH8ftP917b0NfJ5zVy65JjqFPfVN3l2nSJYqztCKxOwzpFkJT5tCJAa9QkzwffYwlu
         mgKAB7HFaX9TU9oyg92wy7kFRawitLbEbBb9B8Zh9hJYMsEPM0fuXZA05q06PzVaiG3X
         vg6srXY59CwalUIGhgcyJ5WneVgPJQZ6pADnI9nAysihiBfGisZx6nR/aUxCGjTkTPu3
         db8zHy0ltcbeEMrPUVWdLiVnvVeUUhOUoMlUTQeCAoano4iN2RoKX3NsDsYF8ZNfBiFy
         Posg==
X-Gm-Message-State: AFq9FYK9H7Qrrar0CrxzVMJXtMMakA1z21hcNbb5t/Ht2tHcNkOyYnca
	i6t2+E0qYLeDc7liifFfmkACzhXVLoXcwTyeIxXrNJlBF+um5+2ZYcWJ90qFNLemXo4fHfA/rpX
	QP5wW
X-Gm-Gg: AYBFou0XJudw9G+6G9Y/ZT7lsVpdAb2Feq7UL+k06E/pId+zFBvn6jomioHSNnpGB9y
	nHGpF+EE8c3lrijHGBynviGmKbbSYu0kiFBFVfzNZlUVUTjEPLLWjKk2Ro4Zbo9nJzbQzCDMdvM
	zvjnDv51DaxuZur5FnO9Qf2EFuBB7a8rVSGvd7o+NQGfokfsnKV5X81aysOPPI0wfmloKXI/3Fy
	EEQWoDHNyWST9slt9266OHEfojZs5Rifkm5JE+SSXBFxA+Ok92QowbHDkVo9WNaEXit/8A8e3fI
	KeJZnPlM1C7mkaDFqfPqTNCrZQnaemxqHZmjZ+NiTG0TLGcDhZpbotxB0sz3ZWpjiFjkCLymHoh
	SSdBBAu7snt2je2npuIUVUR/rlHaFVkp3wmLITkqQzfczitNMv5EM9E8kRTFkXY94YyJMkANyTl
	6rscjNRIk5lx2EkLrcc+tJreT0yPRCjZ4uuG8RBubX+XtxdP9e6sOlMcnD4LilENg=
X-Received: by 2002:a05:7300:3c8f:b0:35c:8abb:b4ae with SMTP id 5a478bee46e88-35c8abbb713mr4955231eec.25.1791945015553;
        Tue, 13 Oct 2026 19:30:15 -0700 (PDT)
Received: from 244668f92ec4 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cacb61asm50328243eec.21.2026.10.13.19.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 19:30:15 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 1fffefb00cc0b0da1f2ae24e3d33364530ea6515
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 14 Oct 2026 02:30:14 -0000
Message-ID: <179194501452.288311.8816041941470905019@244668f92ec4>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/1fffefb00cc0b0da1f2ae24e3d33364530ea6515/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 1fffefb00cc0b0da1f2ae24e3d33364530ea6515
origin: maestro
test start time: 2026-10-13 18:44:08.892000+00:00

Builds:	   75 ✅    1 ❌    0 ⚠️
Boots: 	  150 ✅   10 ❌    0 ⚠️
Tests: 	42105 ✅ 3265 ❌ 5166 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.kvm
      last run: https://d.kernelci.org/test/maestro:6ace892ba3f195e1aa785afc
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.kvm.kvm_nested_tsc_scaling_test
      last run: https://d.kernelci.org/test/maestro:6acec135a3f195e1aa7ab991
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: jetson-agx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp.prctl09
      last run: https://d.kernelci.org/test/maestro:6aced459a3f195e1aa7af49a
      history:  > ✅  > ❌  
            
      - ltp.pselect01
      last run: https://d.kernelci.org/test/maestro:6aced459a3f195e1aa7af4a2
      history:  > ✅  > ❌  
            
Hardware: jetson-orin-nx-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6aceb9dfa3f195e1aa7a79d0
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6aceb9dfa3f195e1aa7a79cb
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: stm32mp157a-dhcor-avenger96
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp.shmctl05
      last run: https://d.kernelci.org/test/maestro:6acea5d3a3f195e1aa79d224
      history:  > ✅  > ✅  > ❌  
            
      - ltp.shmget03
      last run: https://d.kernelci.org/test/maestro:6acea5d3a3f195e1aa79d223
      history:  > ✅  > ❌  > ❌  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-02
      last run: https://d.kernelci.org/test/maestro:6ace93d2a3f195e1aa78ae48
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-03
      last run: https://d.kernelci.org/test/maestro:6ace93d2a3f195e1aa78ae47
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-04
      last run: https://d.kernelci.org/test/maestro:6ace929fa3f195e1aa78a216
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: acer-cbv514-1h-34uz-brya
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ace9daaa3f195e1aa792f42
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
Hardware: acer-cp514-2h-1130g7-volteer
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ace9d72a3f195e1aa792640
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
Hardware: acer-cp514-2h-1160g7-volteer
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ace9dc8a3f195e1aa793593
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
Hardware: acer-cp514-3wh-r0qs-guybrush
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ace9dbea3f195e1aa793190
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
Hardware: acer-R721T-grunt
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ace9e21a3f195e1aa794fc1
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
Hardware: asus-CM1400CXA-dalboz
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ace9df9a3f195e1aa793dd3
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
Hardware: asus-CX3402CVA-brya
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ace9d6ea3f195e1aa79243d
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
Hardware: dell-latitude-3445-7520c-skyrim
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ace9df9a3f195e1aa793d64
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.cgroup
      last run: https://d.kernelci.org/test/maestro:6ace892aa3f195e1aa785aed
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_memcontrol
      last run: https://d.kernelci.org/test/maestro:6acec125a3f195e1aa7ab1c2
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_memcontrol_test_memcg_sock
      last run: https://d.kernelci.org/test/maestro:6acec125a3f195e1aa7ab1bc
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - ltp.shmget03
      last run: https://d.kernelci.org/test/maestro:6acec12da3f195e1aa7ab4e0
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: hp-x360-14a-cb0001xx-zork
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ace9e20a3f195e1aa794db7
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
Hardware: jetson-agx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp.nanosleep01
      last run: https://d.kernelci.org/test/maestro:6aced459a3f195e1aa7af463
      history:  > ❌  > ✅  
            
Hardware: lenovo-TPad-C13-Yoga-zork
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ace9e19a3f195e1aa794bb9
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
Hardware: nvidia-p3809-gb300
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6acec3bea3f195e1aa7ac6c7
      history:  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6acec3bea3f195e1aa7ac6c2
      history:  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_memcontrol_test_memcg_sock
      last run: https://d.kernelci.org/test/maestro:6acec3bea3f195e1aa7ac6d2
      history:  > ❌  > ✅  
            
Hardware: purwa-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:6aceb975a3f195e1aa7a7702
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_bc0000_i2c_b80000_keyboard_3a
      last run: https://d.kernelci.org/test/maestro:6acec26ca3f195e1aa7ac2e0
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-02
      last run: https://d.kernelci.org/test/maestro:6ace929fa3f195e1aa78a218
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - fluster.debian.v4l2.gstreamer_vp9.VP9-TEST-VECTORS-GStreamer-VP9-V4L2.vp90-2-15-segkey-webm
      last run: https://d.kernelci.org/test/maestro:6ace932ba3f195e1aa78aaa7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: acer-chromebox-cxi5-brask
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ace9e0ba3f195e1aa79498a
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: hamoa-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_bc0000_i2c_b80000_keyboard_3a
      last run: https://d.kernelci.org/test/maestro:6acec26aa3f195e1aa7ac1a1
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_bc0000_i2c_b80000_touchpad_15
      last run: https://d.kernelci.org/test/maestro:6acec26aa3f195e1aa7ac1a0
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.kvm.kvm_set_memory_region_test
      last run: https://d.kernelci.org/test/maestro:6acec135a3f195e1aa7ab961
      history:  > ✅  > ❌  > ❌  > ❌  > ✅  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6acec12aa3f195e1aa7ab314
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - ltp.futex_wait05
      last run: https://d.kernelci.org/test/maestro:6acec12da3f195e1aa7ab5ca
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
Hardware: jetson-agx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6aced456a3f195e1aa7af271
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - ltp.copy_file_range01
      last run: https://d.kernelci.org/test/maestro:6aced45ea3f195e1aa7af84b
      history:  > ✅  > ⚠️  
            
      - ltp.copy_file_range02
      last run: https://d.kernelci.org/test/maestro:6aced45ea3f195e1aa7af84c
      history:  > ✅  > ⚠️  
            
      - ltp.io_uring01
      last run: https://d.kernelci.org/test/maestro:6aced45ea3f195e1aa7af857
      history:  > ✅  > ⚠️  
            
      - ltp.io_uring02
      last run: https://d.kernelci.org/test/maestro:6aced45ea3f195e1aa7af858
      history:  > ✅  > ⚠️  
            
      - ltp.io_uring03
      last run: https://d.kernelci.org/test/maestro:6aced45ea3f195e1aa7af859
      history:  > ✅  > ⚠️  
            
      - ltp.memfd_create03
      last run: https://d.kernelci.org/test/maestro:6aced45ea3f195e1aa7af84a
      history:  > ✅  > ⚠️  
            
      - ltp.perf_event_open01
      last run: https://d.kernelci.org/test/maestro:6aced45ea3f195e1aa7af849
      history:  > ✅  > ⚠️  
            
      - ltp.statx01
      last run: https://d.kernelci.org/test/maestro:6aced45ea3f195e1aa7af84d
      history:  > ❌  > ⚠️  
            
      - ltp.statx04
      last run: https://d.kernelci.org/test/maestro:6aced45ea3f195e1aa7af84e
      history:  > ❌  > ⚠️  
            
      - ltp.statx06
      last run: https://d.kernelci.org/test/maestro:6aced45ea3f195e1aa7af850
      history:  > ✅  > ⚠️  
            
      - ltp.statx08
      last run: https://d.kernelci.org/test/maestro:6aced45ea3f195e1aa7af852
      history:  > ✅  > ⚠️  
            
      - ltp.statx09
      last run: https://d.kernelci.org/test/maestro:6aced45ea3f195e1aa7af853
      history:  > ✅  > ⚠️  
            
      - ltp.statx10
      last run: https://d.kernelci.org/test/maestro:6aced45ea3f195e1aa7af854
      history:  > ✅  > ⚠️  
            
      - ltp.statx11
      last run: https://d.kernelci.org/test/maestro:6aced45ea3f195e1aa7af855
      history:  > ✅  > ⚠️  
            
      - ltp.statx12
      last run: https://d.kernelci.org/test/maestro:6aced45ea3f195e1aa7af856
      history:  > ✅  > ⚠️  
            
      - ltp.utime02
      last run: https://d.kernelci.org/test/maestro:6aced45ea3f195e1aa7af83c
      history:  > ✅  > ⚠️  
            
      - ltp.utime03
      last run: https://d.kernelci.org/test/maestro:6aced45ea3f195e1aa7af83d
      history:  > ✅  > ⚠️  
            
      - ltp.utime04
      last run: https://d.kernelci.org/test/maestro:6aced45ea3f195e1aa7af83e
      history:  > ✅  > ⚠️  
            
      - ltp.utime05
      last run: https://d.kernelci.org/test/maestro:6aced45ea3f195e1aa7af83f
      history:  > ✅  > ⚠️  
            
      - ltp.utime06
      last run: https://d.kernelci.org/test/maestro:6aced45ea3f195e1aa7af840
      history:  > ✅  > ⚠️  
            
      - ltp.utimensat01
      last run: https://d.kernelci.org/test/maestro:6aced45ea3f195e1aa7af842
      history:  > ✅  > ⚠️  
            
      - ltp.utimes01
      last run: https://d.kernelci.org/test/maestro:6aced45ea3f195e1aa7af841
      history:  > ✅  > ⚠️  
            
      - ltp.vhangup01
      last run: https://d.kernelci.org/test/maestro:6aced45ea3f195e1aa7af843
      history:  > ✅  > ⚠️  
            
      - ltp.vhangup02
      last run: https://d.kernelci.org/test/maestro:6aced45ea3f195e1aa7af844
      history:  > ✅  > ⚠️  
            
      - ltp.writev02
      last run: https://d.kernelci.org/test/maestro:6aced45ea3f195e1aa7af845
      history:  > ✅  > ⚠️  
            
      - ltp.writev03
      last run: https://d.kernelci.org/test/maestro:6aced45ea3f195e1aa7af846
      history:  > ✅  > ⚠️  
            
      - ltp.writev05
      last run: https://d.kernelci.org/test/maestro:6aced45ea3f195e1aa7af847
      history:  > ✅  > ⚠️  
            
      - ltp.writev06
      last run: https://d.kernelci.org/test/maestro:6aced45ea3f195e1aa7af848
      history:  > ✅  > ⚠️  
            
Hardware: jetson-agx-orin-industrial-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6acebb47a3f195e1aa7a8b18
      history:  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6acebb47a3f195e1aa7a8b13
      history:  > ❌  > ❌  > ✅  > ❌  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6acec1dda3f195e1aa7abb05
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
Hardware: jetson-orin-nx-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_cpuset_prs_sh
      last run: https://d.kernelci.org/test/maestro:6aceb9dfa3f195e1aa7a7a23
      history:  > ⚠️  > ⚠️  > ✅  > ⚠️  
            
Hardware: nvidia-p3809-gb300
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6acec3c2a3f195e1aa7ac75e
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
Hardware: qemu-arm64
  > Config: defconfig+netdev+nfs-root-boot+ltp
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6acebaf6a3f195e1aa7a8a00
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
Hardware: stm32mp157a-dhcor-avenger96
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp.dirtyc0w_shmem
      last run: https://d.kernelci.org/test/maestro:6acea5d2a3f195e1aa79cfb0
      history:  > ✅  > ✅  > ⚠️  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-04
      last run: https://d.kernelci.org/test/maestro:6ace93d2a3f195e1aa78ae46
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp9.VP9-TEST-VECTORS-GStreamer-VP9-V4L2.vp90-2-15-segkey-webm
      last run: https://d.kernelci.org/test/maestro:6ace93e5a3f195e1aa78aee5
      history:  > ❌  > ✅  > ❌  > ✅  > ❌  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-01-intra-1416
      last run: https://d.kernelci.org/test/maestro:6ace929fa3f195e1aa78a21f
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-01
      last run: https://d.kernelci.org/test/maestro:6ace929fa3f195e1aa78a219
      history:  > ❌  > ❌  > ✅  > ❌  > ✅  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-03
      last run: https://d.kernelci.org/test/maestro:6ace929fa3f195e1aa78a217
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
Hardware: nvidia-igx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6aceba57a3f195e1aa7a7bdc
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6aceba57a3f195e1aa7a7bd7
      history:  > ✅  > ❌  > ✅  > ❌  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
