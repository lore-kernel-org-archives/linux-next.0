Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C8F547043
	for <linux-next@vger.kernel.org>; Sun, 11 Oct 2026 02:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791685832; cv=none; b=o32dM2CJM6anbkmQvy6+EfU1a6DV8zF83QN+bapAUNR7CKxRQ9wD7igC1S3pmqlg2fDa8VCYKNaOsw+JYAiFYOtsgPOzg/+/B4/Mc5mrOmI5L5BNuT7wWaVwZeqFSKhLVluUIhua6qvLVF+kCtTcBUSXmNBpjQgKvHrgbgV1YBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791685832; c=relaxed/simple;
	bh=unGdHKQ6E41h2cULle4LLf+xaI9bBPwUYBwGbhI8bfg=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=N1CGid8NwKlKqs66Fr5Sc2S5w6vbCUtQFSSEsQ0O3z4HxeORprob3ievl2xNRfK4BWJDavoQPl7XEvWvHPBxBBluFN15NoW2gEsbF6mfDPt+mpehNEi6QbYFYbH8bA8bCbLKiiuCT6jQaG9HU0nEK2IgkRTi7fkL9IyYFjBbqtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=My2Ys8Zq; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="My2Ys8Zq"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3514b90bb89so1553336eec.1
        for <linux-next@vger.kernel.org>; Sat, 10 Oct 2026 19:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1791685829; x=1792290629; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hvzYghN/FlzPdhnsKZosVPw/1+gCQ+nF4QJAkkH8hUY=;
        b=My2Ys8ZquAM8v+rjbVyOsXjBPzYFKQRPggqh/4YBf4OGiDKciywH8x4Ihs4OGIn7F+
         BXssMEQ8xpMFThNRqtfAMekXDQzBj1gyZfaCr8Ar+RW2RSYMHS8vVWhINXm/jqmA+rQY
         3jyruHPMdIdvQA0j0kEtb+vXIymcsWOdaqXfIVWg3fyT2ebt9a0Fk3Mnx94K0a9ApSJf
         YJN1shYD/EVrjT2V0oSmI5R4m39qhWl72u0OujvbrTyTUSiY0vNfYXRJDo7g+0U85bcc
         AtSXaAcwaVEK74VKt8J32OON9SNPvIwaY6GNFsraJwYhs4F/oS5fO1hINrXZARNUM20n
         pkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791685829; x=1792290629;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hvzYghN/FlzPdhnsKZosVPw/1+gCQ+nF4QJAkkH8hUY=;
        b=Zm7OwjlFlQOjIK5A9PZTx0Bit7l5Ni8YW8OZJSRakSZqcsJr6eNT3eAjtHAGRI0H7x
         bQGCXsP8hQP3TFUzhWP2bruDCQ61uxvVo14T02lQSgKJ55omJ22JXH1RzNSQ0j7WrbXX
         kenIheq5xBv5m2Q6dijE4xNgT2zG/rk9xnuF8xYl6Gq8+fAJXVcjgdUeLtrB2LMKqPvb
         3+ZWI1arDaCmsUo1zWCIYYs0fY/1BhzG5/Bl0JdKJxgvvnN6b74qJU//6OVbeu+dTNYu
         Rcq36xGtHnGqNNPyBLgQHMkpE2wsk+J4LDZkskYsM349g1E3pY8FR6yxxdwE2VR4lWWA
         ONQw==
X-Gm-Message-State: AFq9FYLcedV6F4/4o5VVlR62RIl8VpkauKYV8DyckqLu11XsQwEWiFV2
	aqKKtgkdK5KsGLjBnrXhg+YqkIO+edIt0xS1HdjvK0QNpTzNdqrDFt9eA/N3pUANWfAU9kCvLLP
	ZDUPv
X-Gm-Gg: AYBFou0R7/GkWKXruZ1xRpnm10ROoRS+zbw03CTVfyZ9HHQpc2cdvZD5ocG16QnWIUO
	g9YyxXlvW7ZTicNwcD2SkgPiD68nJUryUkWe7gokRP/0AnMeB1VDwdWZDY8pcQUJTDElhMbywbf
	dmbC1Bxfhe1ERL6KSLzo9VfeqcQ0pEd3cavfYxGhgm91IZqVDym8jkdOqiFWRXaoL7/wzqqoo31
	TGiv9NpNULdtvQ7+AXZnTw0tnXJlbTdO5Kxvp6u2sLztNSVPtqXBfykvJqmFFrZKxbVhFj/muWf
	3lv1mQNlKUNqp6YPsz74u+MmHX56CDvtVRgoETGlnCVW0Lt9LbL/ujh7f4DQU/uLAvBW0UeOE53
	yqbgjRa+bjYbaufQdgURB945UnkQB9LjN5UsRy8FRzQFDQuea40PuPAvkj3wDi/Kb+KKR8D4Eyd
	kZ7Ijre6kjiD8wb3W/w6YNbHYzP9zypyLZwIgXOVjxVUX2ZcvAjzrvw6BqF5/s3qI=
X-Received: by 2002:a05:693c:810d:b0:359:8337:c56a with SMTP id 5a478bee46e88-3598337cd4emr1135387eec.11.1791685828817;
        Sat, 10 Oct 2026 19:30:28 -0700 (PDT)
Received: from 244668f92ec4 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35977229a6esm2381857eec.8.2026.10.10.19.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 19:30:26 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - becb95e45ef0dda9ffb35156d909d3da7a2789c3
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sun, 11 Oct 2026 02:30:26 -0000
Message-ID: <179168582650.128336.9249075682501010758@244668f92ec4>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/becb95e45ef0dda9ffb35156d909d3da7a2789c3/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: becb95e45ef0dda9ffb35156d909d3da7a2789c3
origin: maestro
test start time: 2026-10-10 01:18:31.202000+00:00

Builds:	   74 ✅    1 ❌    0 ⚠️
Boots: 	  174 ✅    8 ❌    0 ⚠️
Tests: 	38325 ✅ 3343 ❌ 4478 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.cgroup
      last run: https://d.kernelci.org/test/maestro:6ac9a0b9a3f195e1aa5edf33
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_memcontrol
      last run: https://d.kernelci.org/test/maestro:6aca02bda3f195e1aa6106a1
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_memcontrol_test_memcg_sock
      last run: https://d.kernelci.org/test/maestro:6aca02bda3f195e1aa61069b
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: purwa-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_bc0000_i2c_b80000_keyboard_3a
      last run: https://d.kernelci.org/test/maestro:6ac9cd9ca3f195e1aa606c45
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp9.VP9-TEST-VECTORS-GStreamer-VP9-V4L2.vp90-2-15-segkey-webm
      last run: https://d.kernelci.org/test/maestro:6ac9a805a3f195e1aa5f3fa6
      history:  > ✅  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: dell-latitude-3445-7520c-skyrim
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:6ac9c6a9a3f195e1aa603d0f
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - ltp.fanotify10
      last run: https://d.kernelci.org/test/maestro:6aca02c8a3f195e1aa610bbd
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: rk3588-rock-5b
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ac9bd76a3f195e1aa5ffbc1
      history:  > ❌  > ✅  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ac9bdf2a3f195e1aa5ffdc5
      history:  > ❌  > ✅  > ✅  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-01-intra-1416
      last run: https://d.kernelci.org/test/maestro:6ac9a6aba3f195e1aa5f361e
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-01
      last run: https://d.kernelci.org/test/maestro:6ac9a6aba3f195e1aa5f3618
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-03
      last run: https://d.kernelci.org/test/maestro:6ac9a6aba3f195e1aa5f3616
      history:  > ❌  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: acer-cbv514-1h-34uz-brya
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ac9c6f1a3f195e1aa605184
      history:  > ✅  > ❌  > ❌  > ❌  > ✅  
            
Hardware: acer-cp514-2h-1130g7-volteer
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ac9c6c3a3f195e1aa604450
      history:  > ✅  > ❌  > ❌  > ❌  > ✅  
            
Hardware: acer-cp514-2h-1160g7-volteer
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ac9c76da3f195e1aa6058d0
      history:  > ✅  > ❌  > ❌  > ❌  > ✅  
            
Hardware: acer-cp514-3wh-r0qs-guybrush
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ac9c67da3f195e1aa603647
      history:  > ✅  > ❌  > ❌  > ❌  > ✅  
            
Hardware: acer-R721T-grunt
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ac9c6e5a3f195e1aa605050
      history:  > ✅  > ❌  > ❌  > ❌  > ✅  
            
Hardware: asus-CM1400CXA-dalboz
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ac9c6b9a3f195e1aa60405c
      history:  > ✅  > ❌  > ❌  > ❌  > ✅  
            
Hardware: asus-CX3402CVA-brya
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ac9c673a3f195e1aa603430
      history:  > ✅  > ❌  > ❌  > ❌  > ✅  
            
Hardware: dell-latitude-3445-7520c-skyrim
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ac9c694a3f195e1aa603874
      history:  > ✅  > ❌  > ❌  > ❌  > ✅  
            
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.kvm
      last run: https://d.kernelci.org/test/maestro:6ac9a0baa3f195e1aa5edf42
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.kvm.kvm_set_memory_region_test
      last run: https://d.kernelci.org/test/maestro:6aca02cfa3f195e1aa610e46
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6aca02c2a3f195e1aa6107f3
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - ltp.fanotify01
      last run: https://d.kernelci.org/test/maestro:6aca02c8a3f195e1aa610bb7
      history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
      - ltp.fanotify02
      last run: https://d.kernelci.org/test/maestro:6aca02c8a3f195e1aa610bb8
      history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
      - ltp.fanotify04
      last run: https://d.kernelci.org/test/maestro:6aca02c8a3f195e1aa610bba
      history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
      - ltp.fanotify05
      last run: https://d.kernelci.org/test/maestro:6aca02c8a3f195e1aa610bbb
      history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
      - ltp.fanotify06
      last run: https://d.kernelci.org/test/maestro:6aca02c8a3f195e1aa610bbc
      history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
      - ltp.fanotify11
      last run: https://d.kernelci.org/test/maestro:6aca02c8a3f195e1aa610bbe
      history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
      - ltp.fanotify12
      last run: https://d.kernelci.org/test/maestro:6aca02c8a3f195e1aa610bbf
      history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
      - ltp.fanotify13
      last run: https://d.kernelci.org/test/maestro:6aca02c8a3f195e1aa610bc0
      history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
      - ltp.fanotify14
      last run: https://d.kernelci.org/test/maestro:6aca02c8a3f195e1aa610bc1
      history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
      - ltp.fanotify15
      last run: https://d.kernelci.org/test/maestro:6aca02c8a3f195e1aa610bc2
      history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
      - ltp.fanotify16
      last run: https://d.kernelci.org/test/maestro:6aca02c8a3f195e1aa610bc3
      history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
      - ltp.fanotify17
      last run: https://d.kernelci.org/test/maestro:6aca02c8a3f195e1aa610bc4
      history:  > ⚠️  > ❌  > ❌  > ❌  > ❌  
            
      - ltp.fanotify18
      last run: https://d.kernelci.org/test/maestro:6aca02c8a3f195e1aa610bc5
      history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
      - ltp.fanotify19
      last run: https://d.kernelci.org/test/maestro:6aca02c8a3f195e1aa610bc6
      history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
      - ltp.fanotify20
      last run: https://d.kernelci.org/test/maestro:6aca02c8a3f195e1aa610bc7
      history:  > ⚠️  > ❌  > ❌  > ❌  > ❌  
            
      - ltp.fanotify21
      last run: https://d.kernelci.org/test/maestro:6aca02c8a3f195e1aa610bc8
      history:  > ⚠️  > ❌  > ❌  > ❌  > ❌  
            
      - ltp.fanotify22
      last run: https://d.kernelci.org/test/maestro:6aca02c8a3f195e1aa610bc9
      history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
      - ltp.fanotify23
      last run: https://d.kernelci.org/test/maestro:6aca02c8a3f195e1aa610bca
      history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
      - ltp.fanotify25
      last run: https://d.kernelci.org/test/maestro:6aca02c8a3f195e1aa610bcc
      history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
      - ltp.shmget03
      last run: https://d.kernelci.org/test/maestro:6aca02c5a3f195e1aa610a27
      history:  > ❌  > ✅  > ❌  > ✅  > ✅  
            
Hardware: hp-x360-14a-cb0001xx-zork
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ac9c6d2a3f195e1aa604b53
      history:  > ✅  > ❌  > ❌  > ❌  > ✅  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:6ac9a116a3f195e1aa5ee314
      history:  > ❌  > ✅  > ❌  > ❌  
            
Hardware: jetson-agx-orin-industrial-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ac9b1f4a3f195e1aa5f927e
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
Hardware: jetson-orin-nx-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_cpuset_prs_sh
      last run: https://d.kernelci.org/test/maestro:6ac9b083a3f195e1aa5f7f22
      history:  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6ac9b083a3f195e1aa5f7edb
      history:  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6ac9b083a3f195e1aa5f7ed6
      history:  > ❌  > ❌  > ✅  > ❌  
            
Hardware: lenovo-TPad-C13-Yoga-zork
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ac9c74aa3f195e1aa60564d
      history:  > ✅  > ❌  > ❌  > ❌  > ✅  
            
Hardware: nvidia-igx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6ac9b136a3f195e1aa5f8349
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6ac9b136a3f195e1aa5f8344
      history:  > ✅  > ❌  > ✅  > ❌  
            
Hardware: qemu-arm64
  > Config: defconfig+netdev+nfs-root-boot+ltp
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ac9bce9a3f195e1aa5ff8f3
      history:  > ✅  > ❌  > ❌  > ✅  > ❌  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp9.VP9-TEST-VECTORS-GStreamer-VP9-V4L2.vp90-2-15-segkey-webm
      last run: https://d.kernelci.org/test/maestro:6ac9a73ca3f195e1aa5f37d7
      history:  > ❌  > ❌  > ✅  > ❌  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-04
      last run: https://d.kernelci.org/test/maestro:6ac9a6aba3f195e1aa5f3615
      history:  > ❌  > ✅  > ✅  > ❌  
            
Hardware: acer-chromebox-cxi5-brask
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.iommu.iommu_iommufd_iommufd_viommu_mock_viommu_viommu_alloc_with_data
      last run: https://d.kernelci.org/test/maestro:6ac9c6d4a3f195e1aa604d4c
      history:  > ✅  > ❌  > ❌  > ❌  > ✅  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
