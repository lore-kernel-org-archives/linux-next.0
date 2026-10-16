Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DDC2931CB
	for <linux-next@vger.kernel.org>; Fri, 16 Oct 2026 02:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792117841; cv=none; b=pT8+prXl2PShn8LsDGf2jgxzmyJRJm2u6KfXj8xrBWLaNPRIjPuf+b06sW/+9wyYaHXMjJyvVdfhL2/75hjiA+ElE5OEaDLAaEONuTK1YIp2oq/l9qdR32KApIQlMzAMNukF6ptYB5xS1UaI71F6AE6/oYKIFHL3koep9ThsjMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792117841; c=relaxed/simple;
	bh=/OJznVTEj5FVzhz0s3xISa1pnVce/+G3u4ieB7PA2uc=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=aok2Ay7tBGU0K6NG+ZKoIfgBqIyn/+hbOBn1SYlyzSxd0o5adRTp2NScsgPgA5ECUXnxoJZMHiQP98wHCHlt9FNyNfi1x4jESbNWUy9IYSVTaKXr+vwIvxW3Ob0akXdUgXbQrQK4j8NN+KKRptoKufGKfB0oidP7vamGLEqczLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=CWoVkM1y; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="CWoVkM1y"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35943f55c06so717816eec.0
        for <linux-next@vger.kernel.org>; Thu, 15 Oct 2026 19:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1792117839; x=1792722639; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M2k1YkF+Lk5y5AB0U78iGs1lAINSyBQQZK/nkjTsLsE=;
        b=CWoVkM1yFTXiz0Hly/Of55R3XCIiRKwuoQQM/La64cLEAdu9wYx1k9XoH4yQsvgBFD
         rFqrANOSsND3bFz9YRpresuxTSSARi6l81DCZsdJjFZEITvjEq3oXeEty6zQZMsmTxox
         j/f5toxJaVOJjo90gP4TJ+FYnpDoiVWdjxJw+EQzplo7+OBfvvvCSSxO208dncnppOL1
         GiQmqPT33+UXtIi1vg1kSBLwFdhbNpgBDd00PX4//C/FoN2HwmUGY7od+/rj607oDNe/
         OSJ3SMYJMrNqRD6nKtMzWYgGqp5DGy+on7imSl7JL+fP9aYRDhgrfyQptELZU4zTyPq5
         +qRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792117839; x=1792722639;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M2k1YkF+Lk5y5AB0U78iGs1lAINSyBQQZK/nkjTsLsE=;
        b=rXxiFUOxPs+9APHdDzZmdrHEI0nr4VGallfJ+D8St/vo1jpsHLhNzEMQLqe7Ppg3qC
         h4B/27NLSsOJuVBTEemmv25Y/ksfXmEVbwG2L0nD4qa3I9a7yrHzrfcnQFgXGIsAAQkh
         i+X/7r22jPe9uK1cM18nBOX3ejfxDrq7UaXmvtJGqElegCs/U/PGNBmCJUBBjNakoiEI
         st6ZVvrxFIW6y3rC5K7uHz72cNM5BiB4xY2Q3/dc85Aag4dgJvp5TGbMZc+kokKrMV2a
         nGZyqnV3LE2KlO8wfPU+9bkKAiupo+uUiInNBwBTJV5ruTKXmD9I+Y74Qn+zY4KwiRCi
         rYSg==
X-Gm-Message-State: AFq9FYIakBJ6jCB+aOqmrCL5mC1HYjWkmiQmnlttPvvLRNWhtA8X/rL0
	vPlsbd+vaarnWJ0xpFaAECBK5xv3MQNQhYi8vNI8qzjjCi7EL+wB4SO8jjOvH1+Bbl9+XOlREV8
	jY3eM
X-Gm-Gg: AYBFou35GAa3Eau0QL5ztGt7nUlHfbBMpeDHUQGj+K7uPreJ5rSuVeNB2pbWKLitDXW
	7xtfta658iy1FEPXZQERMkmKsbsaRGTKTl05+oRjk2xPdohiCKpSDsDErCL07DZOE9iaRjhcgEN
	5C/4ihgNskKaQaVe6S3iB2Dci+9HxPTqrZa8BnxY+qfa3YdmP5TQMAqL8XTmiW97/dmvW7sHzFB
	4fODl/qy0nrTQKWzLrH+nkrvKM0V8OqZWyRlrecaI0NMcxEDndPu9Q1y1dni80uuhxsNKBkyVj7
	/tLHYtAU1s8sCroJgpskeC/ihPgkdA3050LhwpRVLHF8KL8g4GzvG/3dE70Xh61/B3XXhhyKZ0n
	aJMD4FYDnO4ouL9Sil58w57PEokGGCNttx+mUQ9wLCwcnbIG1cHnj17/7qgMKTyyNF6LBh0KnX2
	GSYEZquiFdbRXVJLt2KCJS4wxq19VmQjL9RrKQeOrUrXdncKYRrDq5seMZFmfrUIo=
X-Received: by 2002:a05:7301:e2f:b0:359:3991:ce1a with SMTP id 5a478bee46e88-3602e698e80mr2224554eec.16.1792117838424;
        Thu, 15 Oct 2026 19:30:38 -0700 (PDT)
Received: from 244668f92ec4 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082a7b33bsm3025044eec.24.2026.10.15.19.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 19:30:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - b810335a0699d1810683796b0e3ffe8827ddfe6c
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 16 Oct 2026 02:30:37 -0000
Message-ID: <179211783632.391248.1521784759150717407@244668f92ec4>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/b810335a0699d1810683796b0e3ffe8827ddfe6c/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: b810335a0699d1810683796b0e3ffe8827ddfe6c
origin: maestro
test start time: 2026-10-15 16:20:29.990000+00:00

Builds:	   61 ✅    2 ❌    0 ⚠️
Boots: 	   75 ✅    0 ❌    0 ⚠️
Tests: 	15083 ✅  894 ❌ 2237 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - ltp.ioctl_loop02
      last run: https://d.kernelci.org/test/maestro:6ad13ba2a3f195e1aa8e079c
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - ltp.ioctl_loop03
      last run: https://d.kernelci.org/test/maestro:6ad13ba2a3f195e1aa8e079d
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - ltp.shmget03
      last run: https://d.kernelci.org/test/maestro:6ad13ba0a3f195e1aa8e0663
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: jetson-agx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp.ioctl_loop02
      last run: https://d.kernelci.org/test/maestro:6ad18057a3f195e1aa905dc5
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - ltp.ioctl_loop03
      last run: https://d.kernelci.org/test/maestro:6ad18057a3f195e1aa905dc6
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - ltp.pselect01
      last run: https://d.kernelci.org/test/maestro:6ad18055a3f195e1aa905c43
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: jetson-agx-orin-industrial-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp.ioctl_loop02
      last run: https://d.kernelci.org/test/maestro:6ad12fcca3f195e1aa8da954
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - ltp.ioctl_loop03
      last run: https://d.kernelci.org/test/maestro:6ad12fcfa3f195e1aa8dabec
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.cgroup
      last run: https://d.kernelci.org/test/maestro:6ad12568a3f195e1aa8d6533
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_memcontrol
      last run: https://d.kernelci.org/test/maestro:6ad13b99a3f195e1aa8e0297
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_memcontrol_test_memcg_sock
      last run: https://d.kernelci.org/test/maestro:6ad13b99a3f195e1aa8e0291
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.kvm
      last run: https://d.kernelci.org/test/maestro:6ad12569a3f195e1aa8d6542
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: jetson-agx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp.poll02
      last run: https://d.kernelci.org/test/maestro:6ad18055a3f195e1aa905c33
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - ltp.select02
      last run: https://d.kernelci.org/test/maestro:6ad18056a3f195e1aa905ccd
      history:  > ❌  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ad12c09a3f195e1aa8d8457
      history:  > ❌  > ✅  > ❌  > ❌  > ✅  
            
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.kvm.kvm_nested_tsc_scaling_test
      last run: https://d.kernelci.org/test/maestro:6ad13ba6a3f195e1aa8e0a6e
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.kvm.kvm_set_memory_region_test
      last run: https://d.kernelci.org/test/maestro:6ad13ba6a3f195e1aa8e0a3e
      history:  > ❌  > ❌  > ✅  > ❌  > ✅  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ad13b9da3f195e1aa8e03e9
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - ltp.futex_wait05
      last run: https://d.kernelci.org/test/maestro:6ad13ba0a3f195e1aa8e06a3
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
Hardware: jetson-agx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ad18053a3f195e1aa90599e
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - ltp.copy_file_range01
      last run: https://d.kernelci.org/test/maestro:6ad18059a3f195e1aa905fdd
      history:  > ✅  > ⚠️  > ✅  > ✅  
            
      - ltp.copy_file_range02
      last run: https://d.kernelci.org/test/maestro:6ad18059a3f195e1aa905fde
      history:  > ✅  > ⚠️  > ✅  > ✅  
            
      - ltp.io_uring01
      last run: https://d.kernelci.org/test/maestro:6ad18059a3f195e1aa905fe9
      history:  > ✅  > ⚠️  > ✅  > ✅  
            
      - ltp.io_uring02
      last run: https://d.kernelci.org/test/maestro:6ad18059a3f195e1aa905fea
      history:  > ✅  > ⚠️  > ✅  > ✅  
            
      - ltp.io_uring03
      last run: https://d.kernelci.org/test/maestro:6ad18059a3f195e1aa905feb
      history:  > ✅  > ⚠️  > ✅  > ✅  
            
      - ltp.memfd_create03
      last run: https://d.kernelci.org/test/maestro:6ad18059a3f195e1aa905fdc
      history:  > ✅  > ⚠️  > ✅  > ✅  
            
      - ltp.nanosleep01
      last run: https://d.kernelci.org/test/maestro:6ad18055a3f195e1aa905bfd
      history:  > ❌  > ✅  > ✅  > ❌  
            
      - ltp.perf_event_open01
      last run: https://d.kernelci.org/test/maestro:6ad18059a3f195e1aa905fdb
      history:  > ✅  > ⚠️  > ✅  > ✅  
            
      - ltp.prctl09
      last run: https://d.kernelci.org/test/maestro:6ad18055a3f195e1aa905c3a
      history:  > ✅  > ❌  > ❌  > ✅  
            
      - ltp.statx01
      last run: https://d.kernelci.org/test/maestro:6ad18059a3f195e1aa905fdf
      history:  > ❌  > ⚠️  > ❌  > ❌  
            
      - ltp.statx04
      last run: https://d.kernelci.org/test/maestro:6ad18059a3f195e1aa905fe0
      history:  > ❌  > ⚠️  > ❌  > ❌  
            
      - ltp.statx06
      last run: https://d.kernelci.org/test/maestro:6ad18059a3f195e1aa905fe2
      history:  > ✅  > ⚠️  > ✅  > ✅  
            
      - ltp.statx08
      last run: https://d.kernelci.org/test/maestro:6ad18059a3f195e1aa905fe4
      history:  > ✅  > ⚠️  > ✅  > ✅  
            
      - ltp.statx09
      last run: https://d.kernelci.org/test/maestro:6ad18059a3f195e1aa905fe5
      history:  > ✅  > ⚠️  > ✅  > ✅  
            
      - ltp.statx10
      last run: https://d.kernelci.org/test/maestro:6ad18059a3f195e1aa905fe6
      history:  > ✅  > ⚠️  > ✅  > ✅  
            
      - ltp.statx11
      last run: https://d.kernelci.org/test/maestro:6ad18059a3f195e1aa905fe7
      history:  > ✅  > ⚠️  > ✅  > ✅  
            
      - ltp.statx12
      last run: https://d.kernelci.org/test/maestro:6ad18059a3f195e1aa905fe8
      history:  > ✅  > ⚠️  > ✅  > ✅  
            
      - ltp.utime02
      last run: https://d.kernelci.org/test/maestro:6ad18059a3f195e1aa905fce
      history:  > ✅  > ⚠️  > ✅  > ✅  
            
      - ltp.utime03
      last run: https://d.kernelci.org/test/maestro:6ad18059a3f195e1aa905fcf
      history:  > ✅  > ⚠️  > ✅  > ✅  
            
      - ltp.utime04
      last run: https://d.kernelci.org/test/maestro:6ad18059a3f195e1aa905fd0
      history:  > ✅  > ⚠️  > ✅  > ✅  
            
      - ltp.utime05
      last run: https://d.kernelci.org/test/maestro:6ad18059a3f195e1aa905fd1
      history:  > ✅  > ⚠️  > ✅  > ✅  
            
      - ltp.utime06
      last run: https://d.kernelci.org/test/maestro:6ad18059a3f195e1aa905fd2
      history:  > ✅  > ⚠️  > ✅  > ✅  
            
      - ltp.utimensat01
      last run: https://d.kernelci.org/test/maestro:6ad18059a3f195e1aa905fd4
      history:  > ✅  > ⚠️  > ✅  > ✅  
            
      - ltp.utimes01
      last run: https://d.kernelci.org/test/maestro:6ad18059a3f195e1aa905fd3
      history:  > ✅  > ⚠️  > ✅  > ✅  
            
      - ltp.vhangup01
      last run: https://d.kernelci.org/test/maestro:6ad18059a3f195e1aa905fd5
      history:  > ✅  > ⚠️  > ✅  > ✅  
            
      - ltp.vhangup02
      last run: https://d.kernelci.org/test/maestro:6ad18059a3f195e1aa905fd6
      history:  > ✅  > ⚠️  > ✅  > ✅  
            
      - ltp.writev02
      last run: https://d.kernelci.org/test/maestro:6ad18059a3f195e1aa905fd7
      history:  > ✅  > ⚠️  > ✅  > ✅  
            
      - ltp.writev03
      last run: https://d.kernelci.org/test/maestro:6ad18059a3f195e1aa905fd8
      history:  > ✅  > ⚠️  > ✅  > ✅  
            
      - ltp.writev05
      last run: https://d.kernelci.org/test/maestro:6ad18059a3f195e1aa905fd9
      history:  > ✅  > ⚠️  > ✅  > ✅  
            
      - ltp.writev06
      last run: https://d.kernelci.org/test/maestro:6ad18059a3f195e1aa905fda
      history:  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: jetson-agx-orin-industrial-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6ad12a24a3f195e1aa8d774b
      history:  > ❌  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6ad12a24a3f195e1aa8d773f
      history:  > ❌  > ✅  > ❌  > ✅  > ❌  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ad12fc9a3f195e1aa8da79f
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
Hardware: jetson-orin-nx-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_cpuset_prs_sh
      last run: https://d.kernelci.org/test/maestro:6ad12a24a3f195e1aa8d782a
      history:  > ⚠️  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6ad12a24a3f195e1aa8d775b
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6ad12a24a3f195e1aa8d774c
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
Hardware: nvidia-igx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6ad12a9ca3f195e1aa8d7a75
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6ad12a9ca3f195e1aa8d7a70
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
