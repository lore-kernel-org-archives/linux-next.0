Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077E832A3C9
	for <linux-next@vger.kernel.org>; Wed,  7 Oct 2026 02:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791340230; cv=none; b=aRu+3IdRwsgZelDJcYw4TzBT4X9xVI2a8i43A4exAaL9fnWYBf9T/ZjRHG2hETpxkvSh6DJB4+oCyiKERRYno7vB6LTEXieyUZSQizbeLs8DSoUyXpprea0WPh7Lfsenoi/fxthU7zDmLp6czlBpYyjVgckhRBMrGN7iqdMoWkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791340230; c=relaxed/simple;
	bh=od1x8y3kZQCzs+0KKnea3gNYgyDNIwJ+zXK/3wY+VQ8=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=TQWlJy8+wwrzTklMA3GIfGs00eXB8Z7J9YC7jl2KtR20Y+ZkeNTDT/+/ZWYRj/DEl33vEqKscTeLkuf37CwvxJrrbwkNWhMlr+F1F4svr7C0LBgZ1a2u0TWLCXwmz2MIdSY8wKUwIpGZrjdfpZOvQRRdBCrk9h4VStMcKB/JLgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=BqpDKsFl; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="BqpDKsFl"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1419d3416ceso6260348c88.0
        for <linux-next@vger.kernel.org>; Tue, 06 Oct 2026 19:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1791340227; x=1791945027; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AvF3IbNy0UW+WwJhv57FHu4vBv1EMVvfNKC1rySBpww=;
        b=BqpDKsFlG77UmvZoBdGrmHjuLLdtBd+VSpQoC3c8ziYsd95rRFUHpFy4gMvXno2BAk
         z3uOZb5Nb6hdleSFG2WElP62m50qDD1VvgWRus6MxhNpcevJjnXlLMjHtMKAt3quoiA2
         KDaSrbndbozOVFbx2rdGBoEtkQU5TveyxCUHHXZBooMmoTnBpIx2xE9EdGMIaGMyx5dr
         QoOobCWrAj9hBOgW/NwSWFQdd9HQAG9bgyLJ7hZkjDiyqgFllNo0SKo3bz4uvHGOCCCC
         H/97bXHcwHB+DonwlztzLvRMGiujWGYf6cpfuk9iuEyPXu2msWL03E9n6w/XulBMY7ih
         vDBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791340227; x=1791945027;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AvF3IbNy0UW+WwJhv57FHu4vBv1EMVvfNKC1rySBpww=;
        b=hpRNY7iigd7/8SyNq6zwpCa3k2vRV37KGxie6UJlaNk6BJTXR5oPdx6RaCknE5Qchj
         LNZw1bqvt4TOc2UZEkM2MSa6JGIELO0qGgQFbnXlMARGRrS9SWs3bnMMMero+Ni3aNVB
         xcN3H0m0PAmLh0cnQXnS4Qtdv/p90fQACcWUbf0i9RwjnFcvmcEp6bEfqdc+qhUc8TNw
         DkbiZuG7lg5RZbJ4ZJTezR87WjCGBqbQXoL6QrwsD/J98Qgt8Vv4q+Y7dGxsfTMhdXqJ
         goTvA954qIR6qOANg1CiAizvyir1k7Qp+JuenAOxr+hjKJoVy1Ds2cxE/B//SlumLLqq
         5Qgg==
X-Gm-Message-State: AFuF++n4sJkVnux07W8lwCm5m9ENaMxNzM/uI/SWRQXatA1/HtUMBjVq
	cenvM0E5KXUK/NFncXPn5nMZ/bkruUb/1TeczijkwPPhpQQ/s4zftfQaFZGWvyJdDUoGjYELerq
	BDV7Y
X-Gm-Gg: AYBFou3dlTF5L6sI+QGXSylLrMGYBXihvpqco6VcxOy77SMj4bC2MObCz5bOQYqVMqB
	nV8B/I5xkMRfAFMZz2LZN3n+UbEHBjeTh9qjwhLSFrQLlN/Aq691Cj6Bhp43gPTmpVjIsE7ksQX
	5GEVq6KWJ6yuTq+lesXvEHeqbDCvyL/bFHZkpQ00xCjrqiyAS32A0k7Rl8MAdnhAkPvYNV88WcC
	2juSkEcLUGGMKmS2Do6VFttjw5speCNjUzRwFRwb43kxh6S7hNtv77AmUaVSssEXtC8BiW1vPUk
	mnBIE4ThYYr5afLdeBihMiqeEXxbBIJMDhO/Yvc7sAgEjO2B9FwUkYdAV5TWZTgDdjTDTpLx6YG
	sj+KsYUsXU7sP1qddsmVRcEiatg/uNhhSUmvuC/I6ltiNTiqkLbFnrKESokd6T2bZJbwvA173ch
	dh60+rGG88KWPE46Ezgb+jLplO9TjZE40UxbVgUBhD3gC14GYgqlBbkFnc39JbGbg=
X-Received: by 2002:a05:701b:2806:b0:14d:baf5:c40e with SMTP id a92af1059eb24-1620374daf4mr666527c88.8.1791340226576;
        Tue, 06 Oct 2026 19:30:26 -0700 (PDT)
Received: from 5a6d9a2c18a2 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-161680e191esm2382375c88.11.2026.10.06.19.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 19:30:25 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - eea3fef32a9cf36abcb5975a5a594e4135a6b026
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 07 Oct 2026 02:30:25 -0000
Message-ID: <179134022499.14184.1305194862236724770@5a6d9a2c18a2>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/eea3fef32a9cf36abcb5975a5a594e4135a6b026/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: eea3fef32a9cf36abcb5975a5a594e4135a6b026
origin: maestro
test start time: 2026-10-06 13:02:29.115000+00:00

Builds:	   63 ✅    1 ❌    0 ⚠️
Boots: 	  148 ✅    9 ❌    0 ⚠️
Tests: 	32115 ✅ 1441 ❌ 3415 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: jetson-agx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_memcontrol
      last run: https://d.kernelci.org/test/maestro:6ac56014a3f195e1aa444fda
      history:  > ✅  > ❌  
            
      - kselftest.cgroup.cgroup_test_memcontrol_test_memcg_low
      last run: https://d.kernelci.org/test/maestro:6ac56014a3f195e1aa444fcd
      history:  > ✅  > ❌  
            
Hardware: jetson-orin-nano-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_freezer_test_cgfreezer_ptrace
      last run: https://d.kernelci.org/test/maestro:6ac55020a3f195e1aa441170
      history:  > ✅  > ✅  > ❌  
            
Hardware: asus-CX3402CVA-brya
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ac4fdd2a3f195e1aa41488a
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: acer-cbv514-1h-34uz-brya
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ac4fe33a3f195e1aa41791f
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: acer-chromebox-cxi5-brask
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ac4fe6ca3f195e1aa41b4bb
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: acer-cp514-2h-1130g7-volteer
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ac4fe0fa3f195e1aa417039
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: acer-cp514-2h-1160g7-volteer
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ac4fe56a3f195e1aa41a7c8
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: acer-cp514-3wh-r0qs-guybrush
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ac4fe5da3f195e1aa41aaa2
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: acer-R721T-grunt
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ac4fe91a3f195e1aa41b9ba
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: asus-CM1400CXA-dalboz
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ac4fe6ba3f195e1aa41b096
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: dell-latitude-3445-7520c-skyrim
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ac4fe6aa3f195e1aa41af4b
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: hp-x360-14a-cb0001xx-zork
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ac4fe8da3f195e1aa41b6ee
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: lenovo-TPad-C13-Yoga-zork
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ac4ff0ea3f195e1aa41bd4d
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ac4fac7a3f195e1aa40d59d
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ac4fdf0a3f195e1aa416b4c
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.cgroup.cgroup_test_core
      last run: https://d.kernelci.org/test/maestro:6ac54de5a3f195e1aa4405ae
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_destroy
      last run: https://d.kernelci.org/test/maestro:6ac54de5a3f195e1aa4405ab
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6ac54de5a3f195e1aa4405d8
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.kvm.kvm_nested_x2apic_test
      last run: https://d.kernelci.org/test/maestro:6ac54df5a3f195e1aa440dac
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:6ac5064aa3f195e1aa4244e7
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: jetson-agx-orin-industrial-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_core
      last run: https://d.kernelci.org/test/maestro:6ac52392a3f195e1aa435ab5
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_destroy
      last run: https://d.kernelci.org/test/maestro:6ac52392a3f195e1aa435ab2
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: jetson-orin-nano-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_core
      last run: https://d.kernelci.org/test/maestro:6ac55020a3f195e1aa441163
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6ac55020a3f195e1aa441184
      history:  > ❌  > ❌  > ✅  
            
Hardware: jetson-orin-nx-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_core
      last run: https://d.kernelci.org/test/maestro:6ac52176a3f195e1aa434e24
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_destroy
      last run: https://d.kernelci.org/test/maestro:6ac52176a3f195e1aa434e21
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: nvidia-igx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_core
      last run: https://d.kernelci.org/test/maestro:6ac520fea3f195e1aa432151
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_destroy
      last run: https://d.kernelci.org/test/maestro:6ac520fea3f195e1aa43214e
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: nvidia-p3809-gb300
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.kvm.kvm_arch_timer_edge_cases
      last run: https://d.kernelci.org/test/maestro:6ac55171a3f195e1aa443892
      history:  > ❌  > ✅  
            
Hardware: r8a779m1-ulcb
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ac4facfa3f195e1aa40d5ad
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ac4fdc0a3f195e1aa413ddd
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: rk3576-rock-4d
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ac4fad2a3f195e1aa40d5b3
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ac4fb65a3f195e1aa40d944
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: acer-cbv514-1h-34uz-brya
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ac4ff8da3f195e1aa41e8e1
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ac5003aa3f195e1aa41ebab
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: acer-cp514-3wh-r0qs-guybrush
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ac5007ea3f195e1aa41ee50
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: mt8390-genio-700-evk
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ac4facca3f195e1aa40d5a6
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ac4fda3a3f195e1aa413aa5
      history:  > ❌  > ✅  > ✅  
            
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ac4facda3f195e1aa40d5aa
      history:  > ❌  > ✅  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ac4fdb3a3f195e1aa413b78
      history:  > ❌  > ✅  > ✅  
            
Hardware: rk3399-rock-pi-4b
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ac4fad0a3f195e1aa40d5b0
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ac4fdc6a3f195e1aa413e0e
      history:  > ❌  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ac506b6a3f195e1aa424a0c
      history:  > ❌  > ✅  > ✅  > ❌  > ✅  
            
Hardware: hamoa-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device-error-logs
      last run: https://d.kernelci.org/test/maestro:6ac5030fa3f195e1aa422344
      history:  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.devices-probe
      last run: https://d.kernelci.org/test/maestro:6ac5036ca3f195e1aa4225d8
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_bc0000_i2c_b80000_touchpad_15
      last run: https://d.kernelci.org/test/maestro:6ac52282a3f195e1aa4357e7
      history:  > ✅  > ❌  > ✅  > ✅  
            
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.cgroup
      last run: https://d.kernelci.org/test/maestro:6ac52581a3f195e1aa43619a
      history:  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_internal_process_constraint
      last run: https://d.kernelci.org/test/maestro:6ac54de5a3f195e1aa4405a2
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_invalid_domain
      last run: https://d.kernelci.org/test/maestro:6ac54de5a3f195e1aa4405a7
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_lesser_ns_open
      last run: https://d.kernelci.org/test/maestro:6ac54de5a3f195e1aa4405ad
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_no_internal_process_constraint_on_threads
      last run: https://d.kernelci.org/test/maestro:6ac54de5a3f195e1aa4405a5
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_parent_becomes_threaded
      last run: https://d.kernelci.org/test/maestro:6ac54de5a3f195e1aa4405a6
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_populated
      last run: https://d.kernelci.org/test/maestro:6ac54de5a3f195e1aa4405a8
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_top_down_constraint_disable
      last run: https://d.kernelci.org/test/maestro:6ac54de5a3f195e1aa4405a4
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_top_down_constraint_enable
      last run: https://d.kernelci.org/test/maestro:6ac54de5a3f195e1aa4405a3
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_cpu
      last run: https://d.kernelci.org/test/maestro:6ac54de5a3f195e1aa4405b8
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_cpuset
      last run: https://d.kernelci.org/test/maestro:6ac54de5a3f195e1aa4405bd
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_cpuset_prs_sh
      last run: https://d.kernelci.org/test/maestro:6ac54de5a3f195e1aa4406e4
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_freezer
      last run: https://d.kernelci.org/test/maestro:6ac54de5a3f195e1aa4405cf
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_kill
      last run: https://d.kernelci.org/test/maestro:6ac54de5a3f195e1aa4405d6
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6ac54de5a3f195e1aa4405dd
      history:  > ⚠️  > ❌  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_memcontrol
      last run: https://d.kernelci.org/test/maestro:6ac54de5a3f195e1aa4405ee
      history:  > ⚠️  > ❌  > ✅  > ❌  
            
      - kselftest.cgroup.cgroup_test_memcontrol_test_memcg_sock
      last run: https://d.kernelci.org/test/maestro:6ac54de5a3f195e1aa4405e8
      history:  > ❌  > ✅  > ❌  
            
      - kselftest.cgroup.cgroup_test_pids
      last run: https://d.kernelci.org/test/maestro:6ac54de5a3f195e1aa4405f1
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_stress_sh
      last run: https://d.kernelci.org/test/maestro:6ac54de5a3f195e1aa4406e3
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.kvm.kvm_nested_tsc_scaling_test
      last run: https://d.kernelci.org/test/maestro:6ac54df5a3f195e1aa440daa
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ac52581a3f195e1aa4361a3
      history:  > ❌  > ✅  > ❌  > ✅  > ❌  
            
Hardware: jetson-agx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ac50565a3f195e1aa4234bd
      history:  > ✅  > ❌  > ✅  > ❌  
            
Hardware: jetson-agx-orin-industrial-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_core_test_cgcore_internal_process_constraint
      last run: https://d.kernelci.org/test/maestro:6ac52392a3f195e1aa435aa9
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_invalid_domain
      last run: https://d.kernelci.org/test/maestro:6ac52392a3f195e1aa435aae
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_lesser_ns_open
      last run: https://d.kernelci.org/test/maestro:6ac52392a3f195e1aa435ab4
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_no_internal_process_constraint_on_threads
      last run: https://d.kernelci.org/test/maestro:6ac52392a3f195e1aa435aac
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_parent_becomes_threaded
      last run: https://d.kernelci.org/test/maestro:6ac52392a3f195e1aa435aad
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_populated
      last run: https://d.kernelci.org/test/maestro:6ac52392a3f195e1aa435aaf
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_top_down_constraint_disable
      last run: https://d.kernelci.org/test/maestro:6ac52392a3f195e1aa435aab
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_top_down_constraint_enable
      last run: https://d.kernelci.org/test/maestro:6ac52392a3f195e1aa435aaa
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_cpu
      last run: https://d.kernelci.org/test/maestro:6ac52392a3f195e1aa435abf
      history:  > ⚠️  > ❌  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_cpuset
      last run: https://d.kernelci.org/test/maestro:6ac52392a3f195e1aa435ac4
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_cpuset_prs_sh
      last run: https://d.kernelci.org/test/maestro:6ac52392a3f195e1aa435b2b
      history:  > ⚠️  > ❌  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_freezer
      last run: https://d.kernelci.org/test/maestro:6ac52392a3f195e1aa435ad6
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_kill
      last run: https://d.kernelci.org/test/maestro:6ac52392a3f195e1aa435add
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6ac52392a3f195e1aa435ae4
      history:  > ⚠️  > ❌  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_memcontrol
      last run: https://d.kernelci.org/test/maestro:6ac52392a3f195e1aa435af5
      history:  > ⚠️  > ❌  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_pids
      last run: https://d.kernelci.org/test/maestro:6ac52392a3f195e1aa435af8
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_stress_sh
      last run: https://d.kernelci.org/test/maestro:6ac52392a3f195e1aa435b2a
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ac50565a3f195e1aa423537
      history:  > ❌  > ✅  > ❌  > ✅  > ❌  
            
      - ltp.madvise09
      last run: https://d.kernelci.org/test/maestro:6ac52edca3f195e1aa43a115
      history:  > ❌  > ⚠️  > ⚠️  
            
      - ltp.sched_getscheduler01
      last run: https://d.kernelci.org/test/maestro:6ac52edca3f195e1aa43a1c3
      history:  > ✅  > ⚠️  > ⚠️  
            
Hardware: jetson-orin-nano-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_core_test_cgcore_internal_process_constraint
      last run: https://d.kernelci.org/test/maestro:6ac55020a3f195e1aa441157
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_invalid_domain
      last run: https://d.kernelci.org/test/maestro:6ac55020a3f195e1aa44115c
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_parent_becomes_threaded
      last run: https://d.kernelci.org/test/maestro:6ac55020a3f195e1aa44115b
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_populated
      last run: https://d.kernelci.org/test/maestro:6ac55020a3f195e1aa44115d
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_top_down_constraint_disable
      last run: https://d.kernelci.org/test/maestro:6ac55020a3f195e1aa441159
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_top_down_constraint_enable
      last run: https://d.kernelci.org/test/maestro:6ac55020a3f195e1aa441158
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_cpuset
      last run: https://d.kernelci.org/test/maestro:6ac55020a3f195e1aa441169
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_freezer
      last run: https://d.kernelci.org/test/maestro:6ac55020a3f195e1aa44117b
      history:  > ⚠️  > ✅  > ✅  > ❌  
            
      - kselftest.cgroup.cgroup_test_kill
      last run: https://d.kernelci.org/test/maestro:6ac55020a3f195e1aa441182
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6ac55020a3f195e1aa441189
      history:  > ⚠️  > ❌  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_memcontrol
      last run: https://d.kernelci.org/test/maestro:6ac55020a3f195e1aa44119a
      history:  > ⚠️  > ❌  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_pids
      last run: https://d.kernelci.org/test/maestro:6ac55020a3f195e1aa44119d
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_stress_sh
      last run: https://d.kernelci.org/test/maestro:6ac55020a3f195e1aa4411f3
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
Hardware: jetson-orin-nx-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_core_test_cgcore_internal_process_constraint
      last run: https://d.kernelci.org/test/maestro:6ac52176a3f195e1aa434e18
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_invalid_domain
      last run: https://d.kernelci.org/test/maestro:6ac52176a3f195e1aa434e1d
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_lesser_ns_open
      last run: https://d.kernelci.org/test/maestro:6ac52176a3f195e1aa434e23
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_no_internal_process_constraint_on_threads
      last run: https://d.kernelci.org/test/maestro:6ac52176a3f195e1aa434e1b
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_parent_becomes_threaded
      last run: https://d.kernelci.org/test/maestro:6ac52176a3f195e1aa434e1c
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_populated
      last run: https://d.kernelci.org/test/maestro:6ac52176a3f195e1aa434e1e
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_top_down_constraint_disable
      last run: https://d.kernelci.org/test/maestro:6ac52176a3f195e1aa434e1a
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_top_down_constraint_enable
      last run: https://d.kernelci.org/test/maestro:6ac52176a3f195e1aa434e19
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_cpu
      last run: https://d.kernelci.org/test/maestro:6ac52176a3f195e1aa434e2e
      history:  > ⚠️  > ❌  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_cpuset
      last run: https://d.kernelci.org/test/maestro:6ac52176a3f195e1aa434e33
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_cpuset_prs_sh
      last run: https://d.kernelci.org/test/maestro:6ac52176a3f195e1aa434e9a
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_freezer
      last run: https://d.kernelci.org/test/maestro:6ac52176a3f195e1aa434e45
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_kill
      last run: https://d.kernelci.org/test/maestro:6ac52176a3f195e1aa434e4c
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6ac52176a3f195e1aa434e53
      history:  > ⚠️  > ❌  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_memcontrol
      last run: https://d.kernelci.org/test/maestro:6ac52176a3f195e1aa434e64
      history:  > ⚠️  > ❌  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_pids
      last run: https://d.kernelci.org/test/maestro:6ac52176a3f195e1aa434e67
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_stress_sh
      last run: https://d.kernelci.org/test/maestro:6ac52176a3f195e1aa434e99
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
Hardware: nvidia-igx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_core_test_cgcore_internal_process_constraint
      last run: https://d.kernelci.org/test/maestro:6ac520fda3f195e1aa432145
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_invalid_domain
      last run: https://d.kernelci.org/test/maestro:6ac520fda3f195e1aa43214a
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_lesser_ns_open
      last run: https://d.kernelci.org/test/maestro:6ac520fea3f195e1aa432150
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_no_internal_process_constraint_on_threads
      last run: https://d.kernelci.org/test/maestro:6ac520fda3f195e1aa432148
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_parent_becomes_threaded
      last run: https://d.kernelci.org/test/maestro:6ac520fda3f195e1aa432149
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_populated
      last run: https://d.kernelci.org/test/maestro:6ac520fda3f195e1aa43214b
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_top_down_constraint_disable
      last run: https://d.kernelci.org/test/maestro:6ac520fda3f195e1aa432147
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_top_down_constraint_enable
      last run: https://d.kernelci.org/test/maestro:6ac520fda3f195e1aa432146
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_cpu
      last run: https://d.kernelci.org/test/maestro:6ac520fea3f195e1aa43215b
      history:  > ⚠️  > ❌  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_cpuset
      last run: https://d.kernelci.org/test/maestro:6ac520fea3f195e1aa432160
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_cpuset_prs_sh
      last run: https://d.kernelci.org/test/maestro:6ac520fea3f195e1aa4321c7
      history:  > ⚠️  > ❌  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_freezer
      last run: https://d.kernelci.org/test/maestro:6ac520fea3f195e1aa432172
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_kill
      last run: https://d.kernelci.org/test/maestro:6ac520fea3f195e1aa432179
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6ac520fea3f195e1aa432180
      history:  > ⚠️  > ❌  > ✅  > ❌  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6ac520fea3f195e1aa43217b
      history:  > ❌  > ✅  > ❌  
            
      - kselftest.cgroup.cgroup_test_memcontrol
      last run: https://d.kernelci.org/test/maestro:6ac520fea3f195e1aa432191
      history:  > ⚠️  > ❌  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_pids
      last run: https://d.kernelci.org/test/maestro:6ac520fea3f195e1aa432194
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_stress_sh
      last run: https://d.kernelci.org/test/maestro:6ac520fea3f195e1aa4321c6
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
Hardware: nvidia-p3809-gb300
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ac50565a3f195e1aa42356c
      history:  > ✅  > ❌  > ✅  > ❌  
            
Hardware: purwa-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_bc0000_i2c_b80000_keyboard_3a
      last run: https://d.kernelci.org/test/maestro:6ac52f32a3f195e1aa43ac90
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6ac5033fa3f195e1aa4224dd
      history:  > ❌  > ✅  > ❌  
            
      - kselftest.timers.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:6ac5339fa3f195e1aa43bf3a
      history:  > ❌  > ✅  > ❌  
            
Hardware: qemu-arm64
  > Config: defconfig+netdev+nfs-root-boot+ltp
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ac50b6da3f195e1aa425a0b
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
Hardware: rk3588-rock-5b
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ac4fad3a3f195e1aa40d5b6
      history:  > ❌  > ✅  > ✅  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ac4fb71a3f195e1aa40d98b
      history:  > ❌  > ✅  > ✅  > ❌  
            
Hardware: dell-latitude-3445-7520c-skyrim
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:6ac4fe67a3f195e1aa41aebb
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:6ac4fe67a3f195e1aa41aebc
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
