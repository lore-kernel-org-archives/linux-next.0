Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308B335F164
	for <linux-next@vger.kernel.org>; Thu,  8 Oct 2026 02:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791426633; cv=none; b=MaAGAxunpKMCRr9p/UiO5j53SXNzxxcsExVA/4Vje4qBT2beDmNQBGZmYb5dOWupkMpEFeaZNnT4TZ3jerjs591jh9wG9dLaC8Glkpf4gf7kLZ0l+HmhvKjb/ql62dzc11x/ea7M/AP1gZN2iVIXyJVf6VgSIPHQgtpNjJA/W9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791426633; c=relaxed/simple;
	bh=86qkPhmWJTk9G4GrrdJ5M9VhKVnGj/GCXTZOGQF1RwY=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=Fk+KSuBaUq+FuZuKUjSzuutIsqTtJpQXV3jZEuwCaI/ZeBv/xRzlI99dUceR498xHJD16hBA+EvRtqtEnO+4H6n/RpULsR9vp7eyhrUgGimP9fvlQnl9IFK4CuA0QgFQW4gL6JK4AqPOb/TeC1frTrvNoVX1ycWHNM1Zotw0Mk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=fdt84N6f; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="fdt84N6f"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35115b52125so3215761eec.1
        for <linux-next@vger.kernel.org>; Wed, 07 Oct 2026 19:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1791426630; x=1792031430; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2UQtDl/FWHvExm71PcnIhxfHnXUFRfAiqWs53tywzxw=;
        b=fdt84N6fE1W58CjOLVeT3jFPYj+/cMFzf3G8k6F3HNUdJQCAjuzyFFL1BLChukk37O
         31+zy+wyhNte36mrfjPKeifL7yiESDlyQSl1qK7kcDSgPI3dES6gh9D0mTlx+r3LvUxg
         +J5OSnSASt1aG+QrJ6X1XTiP4x04cgvwBDM9LsFmERNQ4wTPecQSkoj8hpJtxYbLDNB6
         iLUjo57FsCn6lcp5yrvFS7HOzP80LdkNDOgCzFX5U2YajzjBgxVMwtHf35FTSXRx911b
         ORzZErJx4G0VD3Za20LG1AjWFcw5SmFD58KF1kcBQXh2DujgwqZNkLQZ7ci9J1oMZ/RQ
         0Zdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791426630; x=1792031430;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2UQtDl/FWHvExm71PcnIhxfHnXUFRfAiqWs53tywzxw=;
        b=ZuXyPkyxppxrx84d70ZwcI4eGJ04EnGLJ83Ckwbk6HszNHg+H7vFB3xKEg435+4zp6
         s+5IvLTPBAbX6pGIG/z7IVMxAUo//Mtg9cfaODz9XN79/L1O3fvVkWPXfT6dzSrYKIoq
         cZwp9OVE6X/llcVPTpU6XGywDKIyBx1s3FKzXaRhXeWh0meeq7zk5KX5CiFenm6F7kIU
         s197y1dsVhzawOuQhQk9KGRB0h8dGg4p+/G/RX/yaTCyA7byPVXakiVoqiPs1mB0CsDr
         hTpM4sJCD/DB8ff9LLHD2IGd9kdQa2ej0PCb/uDYkCw95+QjqdsnudJRc/87Gw67msWD
         K6aQ==
X-Gm-Message-State: AFq9FYJxFY+hYaCEaymFZQqxdiVFBEufC1vqQftNHNGXgCo0YLZs6Jds
	igpAqrIZhQ3DXeH4FVOhAzzXNsoKHfc+s2lek+CkH1ENYhK7CsrkV7ypcYL35ijZ+/cfjvp1VDI
	v13tK
X-Gm-Gg: AYBFou0lVK/lyP7XU+syl9+mBOh++lXYkh/11oQytkOf2pJYe9tjNtcvXKD3bpfWEdO
	Q0/IJc2ZalhpM5r1HrPcO4RmOMOEgq/qjvWnt/J5dGyStxtkaJ3MVxANx3HvD0jn63lweqqBVb5
	/TDcXCMf1toM2dTmrbNDn6Z23Mq8Vf8/MFVl0OTrbBBZdNPwC6P7gq3yeyHXOI3AGUSFgUfo3W+
	sArVhRP5IyvL3tkhjJXB0PUJx6wXtVzdIdHzFw126ZovYSLFpXQKX64ymYGFVU4Mfh1KKqFwyMO
	TmF4TKCkWi0j4PWt5tDl+LD+csrdddMuWc9H1dZc/vRCbyhwp5LFggKJMwPre+UzelaYo0GIxIU
	xTJD+qug0d7BSNBGo8TS+kfCYkKJ08Ssa7l/t51d7DgYYi3nshyxtuDfDb3mvN7G5ZxfL+dQh7O
	D0qdreVU0Fq8V96b4l1rxACZBHOWcEUXS5eqBoaXf5TdBBBFnVyER1mJxKN7zA4kBVLPAdz3Sd8
	A==
X-Received: by 2002:a05:7301:fd05:b0:34c:79d4:ba0d with SMTP id 5a478bee46e88-3515de5c4f8mr4570013eec.14.1791426629980;
        Wed, 07 Oct 2026 19:30:29 -0700 (PDT)
Received: from 5a6d9a2c18a2 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515aff5dd6sm11832960eec.26.2026.10.07.19.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 19:30:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - b018686719706a781c45a874ed51374a2dc4b767
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 08 Oct 2026 02:30:28 -0000
Message-ID: <179142662845.66837.5550792230972414413@5a6d9a2c18a2>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/b018686719706a781c45a874ed51374a2dc4b767/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: b018686719706a781c45a874ed51374a2dc4b767
origin: maestro
test start time: 2026-10-07 14:01:16.678000+00:00

Builds:	   67 ✅    1 ❌    0 ⚠️
Boots: 	  124 ✅   14 ❌    0 ⚠️
Tests: 	32234 ✅ 3181 ❌ 3025 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: acer-cbv514-1h-34uz-brya
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ac66069a3f195e1aa4b5866
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
Hardware: acer-cp514-2h-1130g7-volteer
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ac66097a3f195e1aa4b5f18
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
Hardware: acer-cp514-2h-1160g7-volteer
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ac66058a3f195e1aa4b5388
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
Hardware: acer-cp514-3wh-r0qs-guybrush
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ac66082a3f195e1aa4b5aed
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
Hardware: acer-R721T-grunt
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ac660c6a3f195e1aa4b6e90
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
Hardware: asus-CM1400CXA-dalboz
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ac660b5a3f195e1aa4b6563
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
Hardware: asus-CX3402CVA-brya
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ac66013a3f195e1aa4b4989
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
Hardware: dell-latitude-3445-7520c-skyrim
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ac660bda3f195e1aa4b6b5b
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
Hardware: hp-x360-14a-cb0001xx-zork
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ac660bca3f195e1aa4b69f1
      history:  > ✅  > ✅  > ❌  > ❌  
            
Hardware: lenovo-TPad-C13-Yoga-zork
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ac6612ca3f195e1aa4b7764
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp9.VP9-TEST-VECTORS-GStreamer-VP9-V4L2.vp90-2-15-segkey-webm
      last run: https://d.kernelci.org/test/maestro:6ac65c1fa3f195e1aa4afc0a
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-01-intra-1416
      last run: https://d.kernelci.org/test/maestro:6ac65b57a3f195e1aa4aa5b4
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-01-intra-1417
      last run: https://d.kernelci.org/test/maestro:6ac65b57a3f195e1aa4aa5b3
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-02
      last run: https://d.kernelci.org/test/maestro:6ac65b57a3f195e1aa4aa5ad
      history:  > ✅  > ✅  > ❌  > ❌  
            
Hardware: hamoa-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.devices-probe
      last run: https://d.kernelci.org/test/maestro:6ac673a4a3f195e1aa4c72ce
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: acer-chromebox-cxi5-brask
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ac660bba3f195e1aa4b6887
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: dell-latitude-3445-7520c-skyrim
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:6ac660c6a3f195e1aa4b7004
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6ac668c2a3f195e1aa4ba401
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6ac668c2a3f195e1aa4ba3fc
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.kvm
      last run: https://d.kernelci.org/test/maestro:6ac658cca3f195e1aa49f0f2
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.kvm.kvm_nested_tsc_scaling_test
      last run: https://d.kernelci.org/test/maestro:6ac668d1a3f195e1aa4bac01
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.kvm.kvm_set_memory_region_test
      last run: https://d.kernelci.org/test/maestro:6ac668d1a3f195e1aa4babd1
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.fanotify10
      last run: https://d.kernelci.org/test/maestro:6ac668cca3f195e1aa4ba94a
      history:  > ❌  > ❌  > ✅  > ✅  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-02
      last run: https://d.kernelci.org/test/maestro:6ac65b4ca3f195e1aa4aa48c
      history:  > ❌  > ❌  > ✅  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-03
      last run: https://d.kernelci.org/test/maestro:6ac65b4ca3f195e1aa4aa48b
      history:  > ❌  > ✅  > ✅  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-04
      last run: https://d.kernelci.org/test/maestro:6ac65b57a3f195e1aa4aa5ab
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: hamoa-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_bc0000_i2c_b80000_touchpad_15
      last run: https://d.kernelci.org/test/maestro:6ac6683aa3f195e1aa4ba034
      history:  > ❌  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: dell-latitude-3445-7520c-skyrim
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:6ac660c6a3f195e1aa4b7007
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.cgroup
      last run: https://d.kernelci.org/test/maestro:6ac658cba3f195e1aa49eef4
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_memcontrol
      last run: https://d.kernelci.org/test/maestro:6ac668c2a3f195e1aa4ba412
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_memcontrol_test_memcg_sock
      last run: https://d.kernelci.org/test/maestro:6ac668c2a3f195e1aa4ba40c
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ac668c7a3f195e1aa4ba57f
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - ltp.fanotify01
      last run: https://d.kernelci.org/test/maestro:6ac668cca3f195e1aa4ba944
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - ltp.fanotify02
      last run: https://d.kernelci.org/test/maestro:6ac668cca3f195e1aa4ba945
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - ltp.fanotify04
      last run: https://d.kernelci.org/test/maestro:6ac668cca3f195e1aa4ba947
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - ltp.fanotify05
      last run: https://d.kernelci.org/test/maestro:6ac668cca3f195e1aa4ba948
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - ltp.fanotify06
      last run: https://d.kernelci.org/test/maestro:6ac668cca3f195e1aa4ba949
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - ltp.fanotify11
      last run: https://d.kernelci.org/test/maestro:6ac668cca3f195e1aa4ba94b
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - ltp.fanotify12
      last run: https://d.kernelci.org/test/maestro:6ac668cca3f195e1aa4ba94c
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - ltp.fanotify13
      last run: https://d.kernelci.org/test/maestro:6ac668cca3f195e1aa4ba94d
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - ltp.fanotify14
      last run: https://d.kernelci.org/test/maestro:6ac668cca3f195e1aa4ba94e
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - ltp.fanotify15
      last run: https://d.kernelci.org/test/maestro:6ac668cca3f195e1aa4ba94f
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - ltp.fanotify16
      last run: https://d.kernelci.org/test/maestro:6ac668cca3f195e1aa4ba950
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - ltp.fanotify17
      last run: https://d.kernelci.org/test/maestro:6ac668cca3f195e1aa4ba951
      history:  > ⚠️  > ⚠️  > ❌  > ❌  
            
      - ltp.fanotify18
      last run: https://d.kernelci.org/test/maestro:6ac668cca3f195e1aa4ba952
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - ltp.fanotify19
      last run: https://d.kernelci.org/test/maestro:6ac668cca3f195e1aa4ba953
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - ltp.fanotify20
      last run: https://d.kernelci.org/test/maestro:6ac668cca3f195e1aa4ba954
      history:  > ⚠️  > ⚠️  > ❌  > ❌  
            
      - ltp.fanotify21
      last run: https://d.kernelci.org/test/maestro:6ac668cca3f195e1aa4ba955
      history:  > ⚠️  > ⚠️  > ❌  > ❌  
            
      - ltp.fanotify22
      last run: https://d.kernelci.org/test/maestro:6ac668cca3f195e1aa4ba956
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - ltp.fanotify23
      last run: https://d.kernelci.org/test/maestro:6ac668cca3f195e1aa4ba957
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - ltp.fanotify25
      last run: https://d.kernelci.org/test/maestro:6ac668cca3f195e1aa4ba959
      history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
      - ltp.shmget03
      last run: https://d.kernelci.org/test/maestro:6ac668c9a3f195e1aa4ba7bd
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - ltp.statx07
      last run: https://d.kernelci.org/test/maestro:6ac668cea3f195e1aa4bab50
      history:  > ⚠️  > ❌  > ❌  > ❌  
            
Hardware: purwa-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_bc0000_i2c_b80000_keyboard_3a
      last run: https://d.kernelci.org/test/maestro:6ac66a09a3f195e1aa4bc3ec
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6ac65e30a3f195e1aa4b37d1
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.timers.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:6ac67159a3f195e1aa4c3c84
      history:  > ❌  > ✅  > ❌  > ❌  
            
Hardware: qemu-arm64
  > Config: defconfig+netdev+nfs-root-boot+ltp
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ac65f5ca3f195e1aa4b3eb5
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
Hardware: rk3588-rock-5b
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ac670b4a3f195e1aa4c351d
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ac67146a3f195e1aa4c3bf4
      history:  > ✅  > ✅  > ❌  > ✅  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-04
      last run: https://d.kernelci.org/test/maestro:6ac65b4ca3f195e1aa4aa48a
      history:  > ❌  > ✅  > ❌  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-03
      last run: https://d.kernelci.org/test/maestro:6ac65b57a3f195e1aa4aa5ac
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp9.VP9-TEST-VECTORS-GStreamer-VP9-V4L2.vp90-2-15-segkey-webm
      last run: https://d.kernelci.org/test/maestro:6ac65bdca3f195e1aa4ad07e
      history:  > ✅  > ❌  > ✅  > ❌  
            
Hardware: hamoa-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device-error-logs
      last run: https://d.kernelci.org/test/maestro:6ac65e01a3f195e1aa4b3521
      history:  > ❌  > ✅  > ❌  > ❌  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
