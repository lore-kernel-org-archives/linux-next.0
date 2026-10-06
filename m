Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D59921CC5A
	for <linux-next@vger.kernel.org>; Tue,  6 Oct 2026 02:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791253837; cv=none; b=jsaYi+3jFL/51dzC7aczf7LNNVQ7P+l+CU8OZuyBFTblaRqOLXenoRve+jFQ3SEUj8oFZ9DuvVjQeCZUBje0CrH3LBXf3tWGdD4QSvZGwg2Q/cmRU56wGWSIp3WdU7uUDcDX6sQjjQfb2vKwFkDtyKVQ38W/hjSNYFnSVXY2CCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791253837; c=relaxed/simple;
	bh=yyHAAuPwzOZmKF7dlIAEiKEgGmGm0ZC8l78pQ3Hy/lc=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=SpH84Vv1MOpCq6VCZsb9FbW9c4Ed78f07wiKOI04D8E/0j42xp6ZdvUfo9oCwk/DoAKYA8Mmr/ejKKC2LfmPevn3FIbhpCTr1vfvCiofUEONPv1TA4FelhgehcTXVJzb+bF/gG+KcrD9AHZcvoE7JnaJf0jf+0MkpT8JaDq78Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=VJ15k0aR; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="VJ15k0aR"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-34bb8b31647so3913350eec.0
        for <linux-next@vger.kernel.org>; Mon, 05 Oct 2026 19:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1791253834; x=1791858634; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=95gKhHCh26gcaSkG5PKPqWQzDJ7WEK6JOixykxHJI2Y=;
        b=VJ15k0aRgU1bs3TLW/ufP34D+HKSG6dfSqG0O1LH3i1Ct3STRsvaIX7IOfAeughJ3K
         u11E4EurWWx6vKtWMMQppWVGIIF/Aj6ph2q8c45pL6Tj24P50PllpRNN6XVRIuixlXD0
         YZTB7HDuFen+m8dsHzADzLsCAJowaFsKoIrMo0NcjZi1/HjaDk8x+6KPSCrXnAtaCCgF
         reD/onbadAjTlHbr/I03nr68X2ERVRj6wi4UuvzC4ZTs6yaERobdjPel2DHAKy26gbaG
         z4K/Xb9iUobeyGhVNcJwmJ36dCc6pUfV3sL2aX0asQTr0cuhddqP2ilFTQApj1ol7fGm
         60ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791253834; x=1791858634;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=95gKhHCh26gcaSkG5PKPqWQzDJ7WEK6JOixykxHJI2Y=;
        b=QGBlNhP+UpdkdD2kTlEhcUBQeXspfVzLotfY/40FNNgPnLhd4vykNwH8qFhatqme6m
         4TvqRN5kkeO2mTacbFE3Um0/8cFu8dz/F6PnukGAAB4kuYoAS9VqLuia/FV43JFuAbMH
         NbVXB871gSgsPY4robbb8kb+LC/ETCQ+6aIUdGkpCKohgSaoqTDJ5b78OU1iVoAtbX+B
         tufd7DFALbTffj2gwfy4HIVC8qjxI6cQQPQBzctLph1QoXYpAO7QbkK2c8JJM6XZWET7
         88XGQG3O4Mv6bAzQcci6cTJ8y6q4nUV8W7bwxR/+00eqVwoAxv4b8+7TLSThYcYP9vCG
         UhYQ==
X-Gm-Message-State: AFq9FYIWFGjUvTEyITWnTSDjHiDMvx4Wzyh4skMsKdrompaJP/HhoXOy
	bHk0VqzFNdgaL1IqBAB/kHFy/8gseGR87N7M6p+WcGBc45T9P3HPm05kHRTJAjfGaNUIbtu52vm
	IiXfV
X-Gm-Gg: AYBFou2TCPaGrGS66gsGYs9uumIakMX0iXvzbhb3jK+s++sFFlbrXEuKRoDpDaLG2w4
	wYk9eapjbgSCR6AaIOEqPeWESK2AyCxidaP95Cj2SkAAjvt0lSueg6pnh2XMueb2/fLMoNiakug
	kLYmLusHZ3LW6dz9j9KYW25cal36R0XTkrAExubrP7poGyyo3HRL0RwFwH/99AOcaUi5Xcvhx3m
	JxqwefruZswUDfP6/ZDttF83Y8/0bzQQmb0YjW7nBPFce0qZCuTFBQie14Zlian5le6buQ6+3n6
	godftoPMAIunbw69RSQZC/agGVJrJ2pLpLI24LcBNGTR2FjxUB8OGAZNLrogQ7zlvUOssXIx7Ki
	aafhC0jSfqUMfuvJNXDdSA2G+gluTP4Ro5wuihazuccUxag35L6uW9ChyD/suzIoWBRlmy6av+t
	nl0KA1a7VCfAuBMPtKGnR+Xb1boLidS7xnTc9Q9Kt+cY8VK1IokB5FXkUyb+kpoRBtzMmHMFxF3
	A==
X-Received: by 2002:a05:7301:1a16:b0:351:2e6c:9e1f with SMTP id 5a478bee46e88-3512e6ca15dmr6186199eec.31.1791253834001;
        Mon, 05 Oct 2026 19:30:34 -0700 (PDT)
Received: from 5a6d9a2c18a2 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146b16846sm5002602eec.28.2026.10.05.19.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 19:30:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - bf1ee2bd5c2da8992f33c8950ef194aaff74ed6c
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 06 Oct 2026 02:30:32 -0000
Message-ID: <179125383262.386589.5435824282371117273@5a6d9a2c18a2>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/bf1ee2bd5c2da8992f33c8950ef194aaff74ed6c/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: bf1ee2bd5c2da8992f33c8950ef194aaff74ed6c
origin: maestro
test start time: 2026-10-05 13:10:52.274000+00:00

Builds:	   69 ✅    1 ❌    0 ⚠️
Boots: 	  178 ✅    8 ❌    0 ⚠️
Tests: 	30292 ✅ 2759 ❌ 2194 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: dell-latitude-3445-7520c-skyrim
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:6ac3cc54a3f195e1aa3a6e78
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:6ac3cde3a3f195e1aa3aa3ca
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.kvm.kvm_set_memory_region_test
      last run: https://d.kernelci.org/test/maestro:6ac3bd61a3f195e1aa39b04a
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: jetson-agx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ac3b95ba3f195e1aa39a2eb
      history:  > ✅  > ❌  
            
Hardware: sc7180-trogdor-lazor-limozeen
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-01
      last run: https://d.kernelci.org/test/maestro:6ac3c06aa3f195e1aa39b5b4
      history:  > ✅  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp9.VP9-TEST-VECTORS-GStreamer-VP9-V4L2.vp90-2-15-segkey-webm
      last run: https://d.kernelci.org/test/maestro:6ac3c353a3f195e1aa39be29
      history:  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: acer-cbv514-1h-34uz-brya
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ac3ab77a3f195e1aa38cd5e
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ac3ac26a3f195e1aa38d14b
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
Hardware: acer-cp514-3wh-r0qs-guybrush
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ac3ab79a3f195e1aa38cd64
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ac3ac4fa3f195e1aa38d56b
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.cgroup
      last run: https://d.kernelci.org/test/maestro:6ac3acd2a3f195e1aa38e7be
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_core
      last run: https://d.kernelci.org/test/maestro:6ac3bd51a3f195e1aa39a86c
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_destroy
      last run: https://d.kernelci.org/test/maestro:6ac3bd51a3f195e1aa39a869
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6ac3bd51a3f195e1aa39a896
      history:  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_memcontrol_test_memcg_sock
      last run: https://d.kernelci.org/test/maestro:6ac3bd51a3f195e1aa39a8a6
      history:  > ❌  > ✅  
            
      - kselftest.kvm.kvm_nested_x2apic_test
      last run: https://d.kernelci.org/test/maestro:6ac3bd61a3f195e1aa39b07c
      history:  > ❌  > ❌  > ✅  > ✅  
            
Hardware: imx6q-sabrelite
  > Config: multi_v7_defconfig+preempt_rt
    - Architecture/compiler: arm/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ac3a9d9a3f195e1aa38c4e8
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ac3aa62a3f195e1aa38c798
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: jetson-agx-orin-industrial-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_core
      last run: https://d.kernelci.org/test/maestro:6ac3c829a3f195e1aa3a195a
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_destroy
      last run: https://d.kernelci.org/test/maestro:6ac3c829a3f195e1aa3a1957
      history:  > ❌  > ✅  > ✅  
            
Hardware: jetson-orin-nano-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_core
      last run: https://d.kernelci.org/test/maestro:6ac3cf10a3f195e1aa3aafe2
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_destroy
      last run: https://d.kernelci.org/test/maestro:6ac3cf10a3f195e1aa3aafdf
      history:  > ❌  > ✅  > ✅  
            
Hardware: jetson-orin-nx-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_core
      last run: https://d.kernelci.org/test/maestro:6ac3c6c0a3f195e1aa39d01f
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_destroy
      last run: https://d.kernelci.org/test/maestro:6ac3c6c0a3f195e1aa39d01c
      history:  > ❌  > ✅  > ✅  
            
Hardware: nvidia-igx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_core
      last run: https://d.kernelci.org/test/maestro:6ac3c738a3f195e1aa39d721
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_destroy
      last run: https://d.kernelci.org/test/maestro:6ac3c738a3f195e1aa39d71e
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6ac3c738a3f195e1aa39d74b
      history:  > ❌  > ✅  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-03
      last run: https://d.kernelci.org/test/maestro:6ac3ae5ba3f195e1aa39005f
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-04
      last run: https://d.kernelci.org/test/maestro:6ac3ae5ba3f195e1aa39005e
      history:  > ❌  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ac3aad6a3f195e1aa38c8f4
      history:  > ❌  > ❌  > ✅  > ✅  > ❌  
            
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.cgroup.cgroup_test_core_test_cgcore_internal_process_constraint
      last run: https://d.kernelci.org/test/maestro:6ac3bd51a3f195e1aa39a860
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_invalid_domain
      last run: https://d.kernelci.org/test/maestro:6ac3bd51a3f195e1aa39a865
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_lesser_ns_open
      last run: https://d.kernelci.org/test/maestro:6ac3bd51a3f195e1aa39a86b
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_no_internal_process_constraint_on_threads
      last run: https://d.kernelci.org/test/maestro:6ac3bd51a3f195e1aa39a863
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_parent_becomes_threaded
      last run: https://d.kernelci.org/test/maestro:6ac3bd51a3f195e1aa39a864
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_populated
      last run: https://d.kernelci.org/test/maestro:6ac3bd51a3f195e1aa39a866
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_top_down_constraint_disable
      last run: https://d.kernelci.org/test/maestro:6ac3bd51a3f195e1aa39a862
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_top_down_constraint_enable
      last run: https://d.kernelci.org/test/maestro:6ac3bd51a3f195e1aa39a861
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_cpu
      last run: https://d.kernelci.org/test/maestro:6ac3bd51a3f195e1aa39a876
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_cpuset
      last run: https://d.kernelci.org/test/maestro:6ac3bd51a3f195e1aa39a87b
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_cpuset_prs_sh
      last run: https://d.kernelci.org/test/maestro:6ac3bd51a3f195e1aa39a9ae
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_freezer
      last run: https://d.kernelci.org/test/maestro:6ac3bd51a3f195e1aa39a88d
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_kill
      last run: https://d.kernelci.org/test/maestro:6ac3bd51a3f195e1aa39a894
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6ac3bd51a3f195e1aa39a89b
      history:  > ⚠️  > ⚠️  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_memcontrol
      last run: https://d.kernelci.org/test/maestro:6ac3bd51a3f195e1aa39a8ac
      history:  > ⚠️  > ⚠️  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_pids
      last run: https://d.kernelci.org/test/maestro:6ac3bd51a3f195e1aa39a8af
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_stress_sh
      last run: https://d.kernelci.org/test/maestro:6ac3bd51a3f195e1aa39a9ad
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.kvm.kvm_nested_tsc_scaling_test
      last run: https://d.kernelci.org/test/maestro:6ac3bd61a3f195e1aa39b07a
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ac3acd3a3f195e1aa38e7ee
      history:  > ❌  > ✅  > ❌  > ✅  > ❌  
            
Hardware: jetson-agx-orin-industrial-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_core_test_cgcore_internal_process_constraint
      last run: https://d.kernelci.org/test/maestro:6ac3c829a3f195e1aa3a191b
      history:  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_invalid_domain
      last run: https://d.kernelci.org/test/maestro:6ac3c829a3f195e1aa3a1953
      history:  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_lesser_ns_open
      last run: https://d.kernelci.org/test/maestro:6ac3c829a3f195e1aa3a1959
      history:  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_no_internal_process_constraint_on_threads
      last run: https://d.kernelci.org/test/maestro:6ac3c829a3f195e1aa3a1950
      history:  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_parent_becomes_threaded
      last run: https://d.kernelci.org/test/maestro:6ac3c829a3f195e1aa3a1952
      history:  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_populated
      last run: https://d.kernelci.org/test/maestro:6ac3c829a3f195e1aa3a1954
      history:  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_top_down_constraint_disable
      last run: https://d.kernelci.org/test/maestro:6ac3c829a3f195e1aa3a194f
      history:  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_top_down_constraint_enable
      last run: https://d.kernelci.org/test/maestro:6ac3c829a3f195e1aa3a191c
      history:  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_cpu
      last run: https://d.kernelci.org/test/maestro:6ac3c829a3f195e1aa3a1964
      history:  > ⚠️  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_cpuset
      last run: https://d.kernelci.org/test/maestro:6ac3c829a3f195e1aa3a1969
      history:  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_cpuset_prs_sh
      last run: https://d.kernelci.org/test/maestro:6ac3c829a3f195e1aa3a19d0
      history:  > ⚠️  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_freezer
      last run: https://d.kernelci.org/test/maestro:6ac3c829a3f195e1aa3a197b
      history:  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_kill
      last run: https://d.kernelci.org/test/maestro:6ac3c829a3f195e1aa3a1982
      history:  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6ac3c829a3f195e1aa3a1989
      history:  > ⚠️  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_memcontrol
      last run: https://d.kernelci.org/test/maestro:6ac3c829a3f195e1aa3a199a
      history:  > ⚠️  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_pids
      last run: https://d.kernelci.org/test/maestro:6ac3c829a3f195e1aa3a199d
      history:  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_stress_sh
      last run: https://d.kernelci.org/test/maestro:6ac3c829a3f195e1aa3a19cf
      history:  > ⚠️  > ✅  > ✅  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ac3b95ca3f195e1aa39a2ee
      history:  > ❌  > ✅  > ❌  > ✅  > ❌  
            
      - ltp.madvise09
      last run: https://d.kernelci.org/test/maestro:6ac3ccdea3f195e1aa3a70db
      history:  > ❌  > ⚠️  
            
      - ltp.sched_getscheduler01
      last run: https://d.kernelci.org/test/maestro:6ac3ccdea3f195e1aa3a7189
      history:  > ✅  > ⚠️  
            
Hardware: jetson-orin-nano-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_core_test_cgcore_internal_process_constraint
      last run: https://d.kernelci.org/test/maestro:6ac3cf10a3f195e1aa3aafd6
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_invalid_domain
      last run: https://d.kernelci.org/test/maestro:6ac3cf10a3f195e1aa3aafdb
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_lesser_ns_open
      last run: https://d.kernelci.org/test/maestro:6ac3cf10a3f195e1aa3aafe1
      history:  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_parent_becomes_threaded
      last run: https://d.kernelci.org/test/maestro:6ac3cf10a3f195e1aa3aafda
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_populated
      last run: https://d.kernelci.org/test/maestro:6ac3cf10a3f195e1aa3aafdc
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_top_down_constraint_disable
      last run: https://d.kernelci.org/test/maestro:6ac3cf10a3f195e1aa3aafd8
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_top_down_constraint_enable
      last run: https://d.kernelci.org/test/maestro:6ac3cf10a3f195e1aa3aafd7
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_cpuset
      last run: https://d.kernelci.org/test/maestro:6ac3cf10a3f195e1aa3aafe8
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_freezer
      last run: https://d.kernelci.org/test/maestro:6ac3cf10a3f195e1aa3aaffa
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_kill
      last run: https://d.kernelci.org/test/maestro:6ac3cf10a3f195e1aa3ab001
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6ac3cf10a3f195e1aa3ab010
      history:  > ⚠️  > ⚠️  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_memcontrol
      last run: https://d.kernelci.org/test/maestro:6ac3cf10a3f195e1aa3ab021
      history:  > ⚠️  > ⚠️  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_pids
      last run: https://d.kernelci.org/test/maestro:6ac3cf10a3f195e1aa3ab024
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_stress_sh
      last run: https://d.kernelci.org/test/maestro:6ac3cf10a3f195e1aa3ab07a
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
Hardware: jetson-orin-nx-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_core_test_cgcore_internal_process_constraint
      last run: https://d.kernelci.org/test/maestro:6ac3c6c0a3f195e1aa39d013
      history:  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_invalid_domain
      last run: https://d.kernelci.org/test/maestro:6ac3c6c0a3f195e1aa39d018
      history:  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_lesser_ns_open
      last run: https://d.kernelci.org/test/maestro:6ac3c6c0a3f195e1aa39d01e
      history:  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_no_internal_process_constraint_on_threads
      last run: https://d.kernelci.org/test/maestro:6ac3c6c0a3f195e1aa39d016
      history:  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_parent_becomes_threaded
      last run: https://d.kernelci.org/test/maestro:6ac3c6c0a3f195e1aa39d017
      history:  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_populated
      last run: https://d.kernelci.org/test/maestro:6ac3c6c0a3f195e1aa39d019
      history:  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_top_down_constraint_disable
      last run: https://d.kernelci.org/test/maestro:6ac3c6c0a3f195e1aa39d015
      history:  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_top_down_constraint_enable
      last run: https://d.kernelci.org/test/maestro:6ac3c6c0a3f195e1aa39d014
      history:  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_cpu
      last run: https://d.kernelci.org/test/maestro:6ac3c6c0a3f195e1aa39d029
      history:  > ⚠️  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_cpuset
      last run: https://d.kernelci.org/test/maestro:6ac3c6c0a3f195e1aa39d02e
      history:  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_freezer
      last run: https://d.kernelci.org/test/maestro:6ac3c6c0a3f195e1aa39d040
      history:  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_kill
      last run: https://d.kernelci.org/test/maestro:6ac3c6c0a3f195e1aa39d047
      history:  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6ac3c6c0a3f195e1aa39d04e
      history:  > ⚠️  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_memcontrol
      last run: https://d.kernelci.org/test/maestro:6ac3c6c0a3f195e1aa39d05f
      history:  > ⚠️  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_pids
      last run: https://d.kernelci.org/test/maestro:6ac3c6c0a3f195e1aa39d062
      history:  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_stress_sh
      last run: https://d.kernelci.org/test/maestro:6ac3c6c0a3f195e1aa39d0a0
      history:  > ⚠️  > ✅  > ✅  
            
Hardware: nvidia-igx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_core_test_cgcore_internal_process_constraint
      last run: https://d.kernelci.org/test/maestro:6ac3c738a3f195e1aa39d715
      history:  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_invalid_domain
      last run: https://d.kernelci.org/test/maestro:6ac3c738a3f195e1aa39d71a
      history:  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_lesser_ns_open
      last run: https://d.kernelci.org/test/maestro:6ac3c738a3f195e1aa39d720
      history:  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_no_internal_process_constraint_on_threads
      last run: https://d.kernelci.org/test/maestro:6ac3c738a3f195e1aa39d718
      history:  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_parent_becomes_threaded
      last run: https://d.kernelci.org/test/maestro:6ac3c738a3f195e1aa39d719
      history:  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_populated
      last run: https://d.kernelci.org/test/maestro:6ac3c738a3f195e1aa39d71b
      history:  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_top_down_constraint_disable
      last run: https://d.kernelci.org/test/maestro:6ac3c738a3f195e1aa39d717
      history:  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_top_down_constraint_enable
      last run: https://d.kernelci.org/test/maestro:6ac3c738a3f195e1aa39d716
      history:  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_cpu
      last run: https://d.kernelci.org/test/maestro:6ac3c738a3f195e1aa39d72b
      history:  > ⚠️  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_cpuset
      last run: https://d.kernelci.org/test/maestro:6ac3c738a3f195e1aa39d730
      history:  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_cpuset_prs_sh
      last run: https://d.kernelci.org/test/maestro:6ac3c738a3f195e1aa39d797
      history:  > ⚠️  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_freezer
      last run: https://d.kernelci.org/test/maestro:6ac3c738a3f195e1aa39d742
      history:  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_kill
      last run: https://d.kernelci.org/test/maestro:6ac3c738a3f195e1aa39d749
      history:  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6ac3c738a3f195e1aa39d750
      history:  > ⚠️  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_memcontrol
      last run: https://d.kernelci.org/test/maestro:6ac3c738a3f195e1aa39d761
      history:  > ⚠️  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_pids
      last run: https://d.kernelci.org/test/maestro:6ac3c738a3f195e1aa39d764
      history:  > ⚠️  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_stress_sh
      last run: https://d.kernelci.org/test/maestro:6ac3c738a3f195e1aa39d796
      history:  > ⚠️  > ✅  > ✅  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp9.VP9-TEST-VECTORS-GStreamer-VP9-V4L2.vp90-2-15-segkey-webm
      last run: https://d.kernelci.org/test/maestro:6ac3af5ea3f195e1aa390479
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-01-intra-1416
      last run: https://d.kernelci.org/test/maestro:6ac3ae47a3f195e1aa38f53b
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-01-intra-1417
      last run: https://d.kernelci.org/test/maestro:6ac3ae47a3f195e1aa38f53a
      history:  > ❌  > ❌  > ✅  > ✅  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-01
      last run: https://d.kernelci.org/test/maestro:6ac3ae47a3f195e1aa38f535
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-02
      last run: https://d.kernelci.org/test/maestro:6ac3ae47a3f195e1aa38f534
      history:  > ✅  > ❌  > ✅  > ✅  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-03
      last run: https://d.kernelci.org/test/maestro:6ac3ae47a3f195e1aa38f533
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp9.VP9-TEST-VECTORS-GStreamer-VP9-V4L2.vp90-2-15-segkey-webm
      last run: https://d.kernelci.org/test/maestro:6ac3ae08a3f195e1aa38edef
      history:  > ❌  > ✅  > ✅  > ❌  > ✅  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
