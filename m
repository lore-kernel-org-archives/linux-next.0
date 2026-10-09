Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8C433FE05
	for <linux-next@vger.kernel.org>; Fri,  9 Oct 2026 02:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791513039; cv=none; b=Ii8xO/ukzd63aLG5M/R3YPv5ETjj38v208umcd4lp3RzNkf/WD354VPnKX8MDchrzdDe2WqA5clJb6z2yxTJNdgsAnu+CCdF0rD3Hlhs9adWfGsZ4/OP8TIoN31sMkoaL5cMJUm/Ph8P4W9RjtTqW/Db0ulSbWcOO0sWcrgwQgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791513039; c=relaxed/simple;
	bh=r6czwh6s7vj5O7xKEC7FBHzr2i0IULVHtW4acW0ttEQ=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=VlZhU80nOYrZL7+N2+yBSFH0yqsdPXcAM6cEzKqiP8aCvXA7EabMhq2bboNIr54deTKDleNKqhwB4hicUxnR1yoeeqft8VVygOHBV8IrrXI1sCgmorgBv5sjKkt/w872A8nvr+I+4uijLgDy81wnbrcboyt/uYTSyy64kEH9XjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=L2qxeFlx; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="L2qxeFlx"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33e6279a1d7so4014038eec.1
        for <linux-next@vger.kernel.org>; Thu, 08 Oct 2026 19:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1791513035; x=1792117835; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fydACd3l0MUtvzkaTJ9JY+eujNdhkb8KODPOKcdTzPI=;
        b=L2qxeFlxMcaPTD7YZy1FiKEKMeXeZ7xPv8qxQNpAOyJWgvrckbehHUXQTaNTU4CMD4
         ar4czM13N7lui8LfXefSVw0qI7DxQ91k3zTc7LXWMKUpWVdOWJ9ar+sfBKrVfA4Vyoe7
         tY59sRqMPnbax8NLIf+4NAUpSaKnWa12rv0YQdOCAV+pivs8kAyU/6A4G8zmCDPgUjly
         dKcYqUEkZ9dvxyXrcJTfm1RXQwOhxlbwtZ6nPCEEn9JkXESELec5jMBzHugGEyTU0ro8
         fQxzwawgiZdyFko0GLIX45aLefKvbnTygtVVaGlXu4TXkaDXbwz2UBU8yi3yPFWjSqub
         nyLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791513035; x=1792117835;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fydACd3l0MUtvzkaTJ9JY+eujNdhkb8KODPOKcdTzPI=;
        b=0Vts62f2cKTUT29SXcPxLVuqIEa0fazZMDb7x3DeWwBthlqYlBTOOelrHiHxGdB74e
         4IfuJzmzzzruCk78ZHRvK/Cmwp9xOsxewyWQKtvCjCQrV/YPjaUJQZT3sQXBO5I85Qy+
         miyXLlQYWB5DO9Oc8TAjSw0YAdsJAQXMMPZ2I6y6eDeubxRs6iqhf5hBB1VBUGq55TB7
         Ms4CuPsJONSRZ3zHb97eOQAoOmzfMONG9+9eFiI033JV1LkQrCUt6WuVAbj9KSc5djMS
         FJ8wcLBgIEJk6lE0hJrua9PuuaAnzx+ThqgoiKJrMDLmDmgSJiOJt0Zx+R0oqYVTHToq
         bgyQ==
X-Gm-Message-State: AFuF++lTqccs7Zsqozth+qxaTtaiFgbS0HxvkaOP1ylUfkCcKlBwHZ/H
	1aNRUl1TvrE48eC6TzbgPY7Di4daKKMe+jTPfqPcmbrNOJY+nusjIMCu+BFW2Rh6CkZxoSHO/PN
	aixmJ
X-Gm-Gg: AYBFou08zvhUs6fQjUAyg2NIcpaw/1JyIu+6XcRGjNsYgCG74CjNB+tt6g2xPADfARz
	cZxj/PeP2yf3oIn5oF3bdeGuRvOKtb8FY30kAqbA71gMAkqN0fNcpOWry3LcDs6ZrlxMX0hWyUn
	iNhyKl7z6xHkR/x8S4Vwnp7aK39xHSvKvLkXShG6UaSmHOV4k6xQlj7A8ESgkoV+BGgtpk7+jio
	G+teXSkjjYqQ1urVkpkxPow2sr16LvwkGMBZNi9vg5Cd/xl0qoFE8OlkcQ/a5jdP6UK43LpI1nl
	r1sVkfddbNHNPtT27NG2ISfwwmlkM9ld7QDKAocNSz1duXQ08FVmQuX3PhgAmpfA9m3UsS0gVud
	OsVlJU6GYWPLvcV/OjjCmsKbSx4V3YFl5Xn5phJZ+CjTU58yGhfpVUJmIqjkEzGyBS2QViv+N8o
	k3lwKlElQ04/6HtKyxJKOQ/b8sdgMYh0DaJTUBQgb6Gpngvf9/Vbuui+gk9kJBy9w=
X-Received: by 2002:a05:7300:b0a8:b0:34b:7892:4961 with SMTP id 5a478bee46e88-3537e0a25b0mr1003341eec.22.1791513032964;
        Thu, 08 Oct 2026 19:30:32 -0700 (PDT)
Received: from 244668f92ec4 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cad9e53sm2283594eec.22.2026.10.08.19.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 19:30:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - aac26bee2287c88af5be5a5ff96d783b19a28790
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 09 Oct 2026 02:30:32 -0000
Message-ID: <179151303184.20051.14707028401344627115@244668f92ec4>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/aac26bee2287c88af5be5a5ff96d783b19a28790/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: aac26bee2287c88af5be5a5ff96d783b19a28790
origin: maestro
test start time: 2026-10-08 10:50:56.431000+00:00

Builds:	   73 ✅    1 ❌    0 ⚠️
Boots: 	  170 ✅   10 ❌    0 ⚠️
Tests: 	24174 ✅ 3333 ❌ 4213 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: acer-cbv514-1h-34uz-brya
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ac77f11a3f195e1aa521e87
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
Hardware: acer-cp514-2h-1130g7-volteer
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ac77f80a3f195e1aa523a96
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
Hardware: acer-cp514-2h-1160g7-volteer
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ac77f5aa3f195e1aa522c86
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
Hardware: acer-cp514-3wh-r0qs-guybrush
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ac77f9ba3f195e1aa5242e8
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
Hardware: acer-R721T-grunt
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ac77fbaa3f195e1aa524b7e
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
Hardware: asus-CM1400CXA-dalboz
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ac77f9ea3f195e1aa5244ec
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
Hardware: asus-CX3402CVA-brya
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ac77f41a3f195e1aa5228bb
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
Hardware: dell-latitude-3445-7520c-skyrim
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ac77f3ea3f195e1aa522568
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
Hardware: hp-x360-14a-cb0001xx-zork
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ac77faaa3f195e1aa52471d
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: lenovo-TPad-C13-Yoga-zork
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ac77fe7a3f195e1aa524e4f
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-01-intra-1417
      last run: https://d.kernelci.org/test/maestro:6ac78804a3f195e1aa52b156
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-02
      last run: https://d.kernelci.org/test/maestro:6ac78804a3f195e1aa52b150
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-03
      last run: https://d.kernelci.org/test/maestro:6ac78804a3f195e1aa52b14f
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: acer-chromebox-cxi5-brask
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ac77f88a3f195e1aa523ee0
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6ac7c952a3f195e1aa5599aa
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6ac7c952a3f195e1aa5599a5
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.kvm.kvm_nested_tsc_scaling_test
      last run: https://d.kernelci.org/test/maestro:6ac7c963a3f195e1aa55a264
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - ltp.fanotify10
      last run: https://d.kernelci.org/test/maestro:6ac7c95da3f195e1aa559f91
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
Hardware: jetson-orin-nx-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6ac7c548a3f195e1aa557d55
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6ac7c548a3f195e1aa557d50
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp9.VP9-TEST-VECTORS-GStreamer-VP9-V4L2.vp90-2-15-segkey-webm
      last run: https://d.kernelci.org/test/maestro:6ac78a60a3f195e1aa52cf5e
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-04
      last run: https://d.kernelci.org/test/maestro:6ac78804a3f195e1aa52b14e
      history:  > ❌  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: dell-latitude-3445-7520c-skyrim
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:6ac77f6aa3f195e1aa5234b6
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.cgroup
      last run: https://d.kernelci.org/test/maestro:6ac78d46a3f195e1aa532769
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_memcontrol
      last run: https://d.kernelci.org/test/maestro:6ac7c952a3f195e1aa5599bb
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_memcontrol_test_memcg_sock
      last run: https://d.kernelci.org/test/maestro:6ac7c952a3f195e1aa5599b5
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.kvm
      last run: https://d.kernelci.org/test/maestro:6ac78d47a3f195e1aa532778
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.kvm.kvm_set_memory_region_test
      last run: https://d.kernelci.org/test/maestro:6ac7c963a3f195e1aa55a234
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ac7c957a3f195e1aa559b11
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - ltp.fanotify01
      last run: https://d.kernelci.org/test/maestro:6ac7c95da3f195e1aa559f8b
      history:  > ⚠️  > ⚠️  > ✅  > ✅  > ✅  
            
      - ltp.fanotify02
      last run: https://d.kernelci.org/test/maestro:6ac7c95da3f195e1aa559f8c
      history:  > ⚠️  > ⚠️  > ✅  > ✅  > ✅  
            
      - ltp.fanotify04
      last run: https://d.kernelci.org/test/maestro:6ac7c95da3f195e1aa559f8e
      history:  > ⚠️  > ⚠️  > ✅  > ✅  > ✅  
            
      - ltp.fanotify05
      last run: https://d.kernelci.org/test/maestro:6ac7c95da3f195e1aa559f8f
      history:  > ⚠️  > ⚠️  > ✅  > ✅  > ✅  
            
      - ltp.fanotify06
      last run: https://d.kernelci.org/test/maestro:6ac7c95da3f195e1aa559f90
      history:  > ⚠️  > ⚠️  > ✅  > ✅  > ✅  
            
      - ltp.fanotify11
      last run: https://d.kernelci.org/test/maestro:6ac7c95da3f195e1aa559f92
      history:  > ⚠️  > ⚠️  > ✅  > ✅  > ✅  
            
      - ltp.fanotify12
      last run: https://d.kernelci.org/test/maestro:6ac7c95da3f195e1aa559f93
      history:  > ⚠️  > ⚠️  > ✅  > ✅  > ✅  
            
      - ltp.fanotify13
      last run: https://d.kernelci.org/test/maestro:6ac7c95da3f195e1aa559f94
      history:  > ⚠️  > ⚠️  > ✅  > ✅  > ✅  
            
      - ltp.fanotify14
      last run: https://d.kernelci.org/test/maestro:6ac7c95da3f195e1aa559f95
      history:  > ⚠️  > ⚠️  > ✅  > ✅  > ✅  
            
      - ltp.fanotify15
      last run: https://d.kernelci.org/test/maestro:6ac7c95da3f195e1aa559f96
      history:  > ⚠️  > ⚠️  > ✅  > ✅  > ✅  
            
      - ltp.fanotify16
      last run: https://d.kernelci.org/test/maestro:6ac7c95da3f195e1aa559f97
      history:  > ⚠️  > ⚠️  > ✅  > ✅  > ✅  
            
      - ltp.fanotify17
      last run: https://d.kernelci.org/test/maestro:6ac7c95da3f195e1aa559f98
      history:  > ⚠️  > ⚠️  > ❌  > ❌  > ❌  
            
      - ltp.fanotify18
      last run: https://d.kernelci.org/test/maestro:6ac7c95da3f195e1aa559f99
      history:  > ⚠️  > ⚠️  > ✅  > ✅  > ✅  
            
      - ltp.fanotify19
      last run: https://d.kernelci.org/test/maestro:6ac7c95da3f195e1aa559f9a
      history:  > ⚠️  > ⚠️  > ✅  > ✅  > ✅  
            
      - ltp.fanotify20
      last run: https://d.kernelci.org/test/maestro:6ac7c95da3f195e1aa559f9b
      history:  > ⚠️  > ⚠️  > ❌  > ❌  > ❌  
            
      - ltp.fanotify21
      last run: https://d.kernelci.org/test/maestro:6ac7c95da3f195e1aa559f9c
      history:  > ⚠️  > ⚠️  > ❌  > ❌  > ❌  
            
      - ltp.fanotify22
      last run: https://d.kernelci.org/test/maestro:6ac7c95da3f195e1aa559f9d
      history:  > ⚠️  > ⚠️  > ✅  > ✅  > ✅  
            
      - ltp.fanotify23
      last run: https://d.kernelci.org/test/maestro:6ac7c95da3f195e1aa559f9e
      history:  > ⚠️  > ⚠️  > ✅  > ✅  > ✅  
            
      - ltp.fanotify25
      last run: https://d.kernelci.org/test/maestro:6ac7c95da3f195e1aa559fa0
      history:  > ⚠️  > ⚠️  > ✅  > ✅  > ✅  
            
      - ltp.shmget03
      last run: https://d.kernelci.org/test/maestro:6ac7c95aa3f195e1aa559dce
      history:  > ✅  > ❌  > ✅  > ❌  > ✅  
            
      - ltp.statx07
      last run: https://d.kernelci.org/test/maestro:6ac7c960a3f195e1aa55a1b7
      history:  > ⚠️  > ❌  > ❌  > ❌  > ❌  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:6ac7898aa3f195e1aa52c4f5
      history:  > ❌  > ❌  > ✅  > ❌  
            
Hardware: jetson-agx-orin-industrial-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ac7cd0aa3f195e1aa55c237
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
Hardware: jetson-orin-nx-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_cpuset_prs_sh
      last run: https://d.kernelci.org/test/maestro:6ac7c548a3f195e1aa557da8
      history:  > ⚠️  > ⚠️  > ✅  > ⚠️  
            
Hardware: nvidia-igx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6ac7c547a3f195e1aa557cc0
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6ac7c547a3f195e1aa557cbb
      history:  > ❌  > ✅  > ❌  > ✅  
            
Hardware: purwa-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_bc0000_i2c_b80000_keyboard_3a
      last run: https://d.kernelci.org/test/maestro:6ac797d0a3f195e1aa53dba4
      history:  > ❌  > ✅  > ❌  > ❌  
            
Hardware: qemu-arm64
  > Config: defconfig+netdev+nfs-root-boot+ltp
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ac78d75a3f195e1aa532a94
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-02
      last run: https://d.kernelci.org/test/maestro:6ac789d8a3f195e1aa52c667
      history:  > ❌  > ❌  > ✅  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-03
      last run: https://d.kernelci.org/test/maestro:6ac789d8a3f195e1aa52c666
      history:  > ❌  > ✅  > ✅  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-04
      last run: https://d.kernelci.org/test/maestro:6ac789d8a3f195e1aa52c665
      history:  > ❌  > ✅  > ❌  > ✅  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp9.VP9-TEST-VECTORS-GStreamer-VP9-V4L2.vp90-2-15-segkey-webm
      last run: https://d.kernelci.org/test/maestro:6ac78883a3f195e1aa52b5b2
      history:  > ❌  > ✅  > ❌  > ❌  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
