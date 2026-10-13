Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F53F3A6B66
	for <linux-next@vger.kernel.org>; Tue, 13 Oct 2026 02:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791858640; cv=none; b=LsWf4zM+GXTL+zBxfIQ9IYq7+0N4KuUS3/Wk2om9TmsNEAkHkjlAqCvmWIpSEaA2/qCtl0al4G++uXFH8JYXwqbTs75p1Au4SBPC2oqCH/DopnNusRgxBsnoXZsyo+zHLVHpwT4gBbhs9ictbgxFrXZTBMLNerFX98WoIOBxJ70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791858640; c=relaxed/simple;
	bh=iOQsw13EQetBbd6e6enyDTHfWTWbN1l2VJzLj6KNl/E=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=Yasdc/Y2ruqf9XWWBttPHPseMYa1ChsJF0hCgYXZ60F6qMI/QD8XMQ17GuO1433HklFdXA01EpaApu+ys8mGKEEJPMoXHvIbl5yxEU1ve00/fbzeZqA4Ss3DurErW0BsxrPOqfQOR+aHRs416JIPTjaTjxre2KUglWrMcEhUte4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=DAsXzwBD; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="DAsXzwBD"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-30b6dad2382so5793250eec.0
        for <linux-next@vger.kernel.org>; Mon, 12 Oct 2026 19:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1791858637; x=1792463437; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kmB600h27XYubp7nZZgLjNo8D7Bs8RVBjlDVM/yoguM=;
        b=DAsXzwBDbQA4qIFvBFP7w6rXSJZlS3Mqrz2MnSk5h6JgnyrucLStOrwXTP/xDOtbFd
         yYcZrySDdV/UfhyygnRFLimny+0QmbMIf4UVzg7KHvFVAAEuqGi4VzmKC2464r25DjLO
         1awB3ZEa3u9tb6s3fUEVLkCRuy2+6f1oBvpWa1rvz8heLgGaIg+so/vJt8dG1bEyx3sj
         fFZ7Q5GJQDq20BRM1ZDgc2Pn9GlzbxGHF7iy2BMeOsBx33dU5Q3LlF4Efnn0dfGfQgak
         5FMiYvKnnHcF33eNIaspvRCpIp842Cqe8IJCGRGDb4e5LgIs+rokd6up1JvsUM1Mz8gm
         0a/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791858637; x=1792463437;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kmB600h27XYubp7nZZgLjNo8D7Bs8RVBjlDVM/yoguM=;
        b=0bOshAdStvrs/ck0JVtncvXgl8lSn6Bt2eR/NOi0dbUgKoiLrHsUp8SAirhU1Dt27W
         oNgXTllL+uL9dPmVt48BfVzD9YMl9ClPKs2qtkmwM8LtS3jH96veEaWkBsTud8xZ76dO
         7g+LG+rgDh1icsgXIiRyaxPnpjlW+hBpgBfLMQKM9E4pLcYxUkB/tT/XJgoaVRCqIP20
         lplAwtONKFpNekiBmI0E+ELL4xFf8URsCar4hmNX6spQHBDEMuEB6TL9G3L1u1GrojLJ
         45sEEZBOJQsXI1kNWJ9f3NrYfKElHA7f+RyvUHv7HQYEVdKpRyQnZFl71lyw+Ruj07yr
         o0Eg==
X-Gm-Message-State: AFq9FYJTqAVGQWk6jkxFheduFzV4GHZCZM/9bjQhCJobu9u+m20Cc1pN
	xjngjm5w/RWMIwu+hd1eGuECG8VMcR0nfzAfBlq8mitAxd/kDHQV5vuejkbLiIlKrV/q+FORlS8
	O1Dxu
X-Gm-Gg: AYBFou1dc4PHz48LFJKsiWeMChbfjZS5zZnxNWFNqo4BLDpWy1W1q9N+f3hBXfqBOzj
	HltcmpLfwcYULIPcy8KYoqw5pEj3rBz5a+jHM6QJ+RyNmxztQhkvUi5ua+qpTy+4RbC+hUgdgiU
	8xL+70+iOpCwc2loJQNrF4u3rBUrRahCvWSFUJW3RK9iOMXuesI2zLit5H21iOv+jSV8Elt8mxd
	Z4u28oL8XiUk2IYYae4pFUmX19HwcS52rWEIVMME+LYNfvrofLHTkvAsclxkxN64n6kUXfqXcsU
	iMoIrtpamRTsRIpy4ZQ/LxNo6zhv/oa+n3RWCuGCu7Av1lX8mN3SlbMx9cmcfdBCGYHuGnlprnG
	zuXINqlP7Skzjb4nLKj1OtN+Q7sbleas/R2KhgP2YQPQlsV1aNF0kwoKKa7a/GJ5zWz0SUrK9CA
	xUK8hBnhQshTXi0pBHXDut2YokP/bI15BcugElJhmsE1oz8I5/3UF7SX0coRTUSHw=
X-Received: by 2002:a05:7300:ea10:b0:35b:bd35:6ba0 with SMTP id 5a478bee46e88-35bbd35868emr2789949eec.6.1791858636811;
        Mon, 12 Oct 2026 19:30:36 -0700 (PDT)
Received: from 244668f92ec4 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35c89429484sm1155957eec.23.2026.10.12.19.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 19:30:36 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 4eb2586bd40db27d77cc5b724ca9386ed0c71d53
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 13 Oct 2026 02:30:36 -0000
Message-ID: <179185863562.236562.2378077359279960869@244668f92ec4>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/4eb2586bd40db27d77cc5b724ca9386ed0c71d53/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 4eb2586bd40db27d77cc5b724ca9386ed0c71d53
origin: maestro
test start time: 2026-10-12 18:45:50.698000+00:00

Builds:	   74 ✅    1 ❌    0 ⚠️
Boots: 	  112 ✅    0 ❌    0 ⚠️
Tests: 	44131 ✅ 3286 ❌ 6271 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:6acd5cb1a3f195e1aa7055d2
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: jetson-agx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp.futex_wait05
      last run: https://d.kernelci.org/test/maestro:6acd8d78a3f195e1aa72e853
      history:  > ✅  > ❌  
            
Hardware: jetson-orin-nano-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6acd7f71a3f195e1aa726f14
      history:  > ✅  > ❌  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6acd7f71a3f195e1aa726f0f
      history:  > ✅  > ❌  
            
Hardware: nvidia-p3809-gb300
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6acd7ea9a3f195e1aa725cf7
      history:  > ✅  > ❌  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6acd7ea9a3f195e1aa725cf2
      history:  > ✅  > ❌  
            
      - kselftest.cgroup.cgroup_test_memcontrol_test_memcg_sock
      last run: https://d.kernelci.org/test/maestro:6acd7ea9a3f195e1aa725d02
      history:  > ✅  > ❌  
            
Hardware: purwa-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_bc0000_i2c_b80000_keyboard_3a
      last run: https://d.kernelci.org/test/maestro:6acd6731a3f195e1aa714aa2
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: stm32mp157a-dhcor-avenger96
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp.shmget03
      last run: https://d.kernelci.org/test/maestro:6acd71bea3f195e1aa71c04d
      history:  > ✅  > ❌  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-02
      last run: https://d.kernelci.org/test/maestro:6acd4412a3f195e1aa6f877b
      history:  > ✅  > ❌  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-03
      last run: https://d.kernelci.org/test/maestro:6acd4412a3f195e1aa6f877a
      history:  > ✅  > ❌  > ❌  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-04
      last run: https://d.kernelci.org/test/maestro:6acd4438a3f195e1aa6f88cc
      history:  > ✅  > ✅  > ❌  > ❌  
            
Hardware: hamoa-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_bc0000_i2c_b80000_keyboard_3a
      last run: https://d.kernelci.org/test/maestro:6acd6762a3f195e1aa714c7f
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_bc0000_i2c_b80000_touchpad_15
      last run: https://d.kernelci.org/test/maestro:6acd6762a3f195e1aa714c7e
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: acer-cbv514-1h-34uz-brya
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6acd6174a3f195e1aa70b38b
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: acer-cp514-2h-1130g7-volteer
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6acd5fd4a3f195e1aa7076a4
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: acer-cp514-2h-1160g7-volteer
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6acd5ff9a3f195e1aa7080e9
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: acer-cp514-3wh-r0qs-guybrush
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6acd606fa3f195e1aa709b96
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: acer-R721T-grunt
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6acd63eba3f195e1aa70c6ec
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: asus-CM1400CXA-dalboz
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6acd6018a3f195e1aa708d74
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: asus-CX3402CVA-brya
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6acd6059a3f195e1aa70994c
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: dell-latitude-3445-7520c-skyrim
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6acd5feda3f195e1aa707f2b
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.cgroup
      last run: https://d.kernelci.org/test/maestro:6acd5fe7a3f195e1aa707d0a
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_memcontrol
      last run: https://d.kernelci.org/test/maestro:6acd7c03a3f195e1aa724353
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_memcontrol_test_memcg_sock
      last run: https://d.kernelci.org/test/maestro:6acd7c03a3f195e1aa72434d
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.futex_wait05
      last run: https://d.kernelci.org/test/maestro:6acd7c0ca3f195e1aa724745
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: hp-x360-14a-cb0001xx-zork
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6acd601fa3f195e1aa708fbf
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: jetson-agx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp.prctl09
      last run: https://d.kernelci.org/test/maestro:6acd8d77a3f195e1aa72e7bd
      history:  > ❌  > ✅  
            
      - ltp.pselect01
      last run: https://d.kernelci.org/test/maestro:6acd8d77a3f195e1aa72e7c3
      history:  > ❌  > ✅  
            
Hardware: jetson-agx-orin-industrial-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6acd76d5a3f195e1aa720418
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6acd76d5a3f195e1aa720413
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: jetson-orin-nano-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_freezer
      last run: https://d.kernelci.org/test/maestro:6acd7f71a3f195e1aa726f06
      history:  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_freezer_test_cgfreezer_ptrace
      last run: https://d.kernelci.org/test/maestro:6acd7f71a3f195e1aa726efb
      history:  > ❌  > ✅  
            
Hardware: lenovo-TPad-C13-Yoga-zork
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6acd60c8a3f195e1aa70a359
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: rk3588-rock-5b
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6acd5dcba3f195e1aa705c88
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6acd5e3da3f195e1aa705eb3
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: acer-chromebox-cxi5-brask
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6acd600ba3f195e1aa7087a9
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp
      last run: https://d.kernelci.org/test/maestro:6acd6840a3f195e1aa717c1a
      history:  > ❌  > ✅  > ✅  > ❌  > ❌  
            
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.kvm
      last run: https://d.kernelci.org/test/maestro:6acd5fe8a3f195e1aa707d19
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.kvm.kvm_set_memory_region_test
      last run: https://d.kernelci.org/test/maestro:6acd7c15a3f195e1aa724aed
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6acd7c09a3f195e1aa72448e
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - ltp.shmget03
      last run: https://d.kernelci.org/test/maestro:6acd7c0ca3f195e1aa724724
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: jetson-agx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6acd8d74a3f195e1aa72e597
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
Hardware: jetson-agx-orin-industrial-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6acd76d9a3f195e1aa7204a3
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
Hardware: jetson-orin-nx-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_cpuset_prs_sh
      last run: https://d.kernelci.org/test/maestro:6acd756da3f195e1aa71d8c3
      history:  > ✅  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6acd756ca3f195e1aa71d835
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6acd756ca3f195e1aa71d82b
      history:  > ❌  > ✅  > ❌  > ❌  
            
Hardware: nvidia-igx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6acd756ca3f195e1aa71d814
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6acd756ca3f195e1aa71d80a
      history:  > ❌  > ✅  > ❌  > ✅  
            
Hardware: nvidia-p3809-gb300
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6acd7eada3f195e1aa725da7
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
Hardware: qemu-arm64
  > Config: defconfig+netdev+nfs-root-boot+ltp
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6acd4464a3f195e1aa6f8e6e
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-04
      last run: https://d.kernelci.org/test/maestro:6acd4412a3f195e1aa6f8779
      history:  > ❌  > ✅  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp9.VP9-TEST-VECTORS-GStreamer-VP9-V4L2.vp90-2-15-segkey-webm
      last run: https://d.kernelci.org/test/maestro:6acd4403a3f195e1aa6f8606
      history:  > ❌  > ✅  > ❌  > ✅  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-01-intra-1416
      last run: https://d.kernelci.org/test/maestro:6acd4438a3f195e1aa6f88d5
      history:  > ❌  > ❌  > ✅  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-01
      last run: https://d.kernelci.org/test/maestro:6acd4438a3f195e1aa6f88cf
      history:  > ❌  > ❌  > ✅  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-03
      last run: https://d.kernelci.org/test/maestro:6acd4438a3f195e1aa6f88cd
      history:  > ❌  > ❌  > ✅  > ❌  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
