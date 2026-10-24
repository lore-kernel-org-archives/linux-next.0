Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792809016;
	b=T7imQtg3pR9YV0UvT6PAXgaMe6OmzreCv/10xbjBwon98BD/6w1F29Nd3UOsJK3b+eGQ
	 pGKHLpidS55RA+ZS+Ab2l1FTZqdrE8n5QAYhYJ0k4kbyJlKBKGJCAXkYL3PutCKe7v9rP
	 JijH3I0OgoxNvqheM+tW0HOxoUoXZylnC9y1DyS/idSpsZAFnH4pT0Qb0ibKwirseq4MM
	 XkXExXq7rohsaHOr4nPGhlet7p3y07G3b6+iXTp0oGiko8P0WCu9DLdjDJvnbdBNDkoBq
	 ders6530ix3GLGErhCgt/LslvxcwARLyOb8/pyX2MJSkXJSCzy+kFMMBqzf8f8JoL8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792809016;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:To:Cc:Reply-To:
	 Date:Message-ID;
	bh=LdC57fmrjkbzYbfGvAQ/WdS4DDgB7JUPo2MhHt4XrSU=;
	b=nz1QFwoCrRjsMO0lwMddVMN3XYs0qRp5gDYgHVrarRZkKlL2P1bGFCCkBfbhz3QQaQIY
	 QaHmkUGycT+10hfkWjbBEgpSepIP6E+S/xi/kP8zUsPjGh/k5lMuWhh2k6P4/Vxk/gYL3
	 QZaU1A8RPQz/rnf4tjnjswndE+u32+SBsRG4BecxTZdPvajiyOcLofp/0BlUrsS10qISk
	 j6HtuS1wPL1RkaEDCOTQ8eWlbmHw81haRByn6Q24LWTG1P7ILh1FEWvFRHXzHDCstF1Ml
	 RRB1e7CjteLsUNzMiJIOXZFXN7ozwdpLWNhklwr9Oew1QXNsIe6f9jYH5iOVYvRDJiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=L9E5n8Ba;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DD1606A329
	for <linux-next@vger.kernel.org>; Sat, 24 Oct 2026 02:30:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80DD1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=L9E5n8Ba
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-170135e43c7so1591397c88.0
        for <linux-next@vger.kernel.org>; Fri, 23 Oct 2026 19:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1792809014; x=1793413814; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LdC57fmrjkbzYbfGvAQ/WdS4DDgB7JUPo2MhHt4XrSU=;
        b=L9E5n8Babc1AvzsXIVFOZgfZfSDs+LNc87+JAlzaWwdunXiI2HH1nVYQv6fZ19hQ/D
         Ie+C9huA8LL8DW918G8KAgd5yfRxdl5bwkE0WPOVHziE1hgXnnJaCqx2dlLXSvqsEjUt
         XStVIoVAlo8KzZJArvK6ftGdqPLhLjWZlgpqxf6jGcNa6vGqEgp+jeJgR3ciK681n6Rp
         GIYgi8Qk91UunRNOx7HY2Qn5w8tk26RGL3iCD1nCqTjzO68ExqXNtjl2kEK3+z0A5fyJ
         F997D0loPw/8O/Ov54I0t5Fgi5RHSGC6WfxrD2vxBI35miPNUWCui6R06AkZhP04HB+k
         tLBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792809014; x=1793413814;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LdC57fmrjkbzYbfGvAQ/WdS4DDgB7JUPo2MhHt4XrSU=;
        b=WUzt3LRTFEClg8Dhfatmi4QVaEuOHMMiRq3fRc55BrcZAPQQt3I6NEETmZSwyv5MRv
         /d1IprmV3RI8S8OP+DQ1t4927nKbbGYUt1bu8BbCEc8FigrZzh6E4c/qia0Dsqos+grW
         SqRnqyO9/PEmXLWz2GCXJkrEKKGl6l68zoVvdhgSlGb597L5IA/C0QknfolVwv+X4AMw
         vgzJViwFvsxw5HVExfgXmo08i/k780uja4nXkk4aFGfq3zdIaS0gya5PgiXu+Qni/opI
         zix5JMxRgk/MxKBPRn50qahqP+RwG+NqCzPwryisNVTKdaewdpKg7UkuvAlPKEUKtqED
         V/oA==
X-Gm-Message-State: AFq9FYJVzfY69i/54D3JlOLnfNxl1K0jcmrlhmukuaDAwXp/CEjlT9WK
	j7B9bhfCaaOmwHeP90XZvvWcWgTafJ+uUQAQZdTUtI02vIWHDHAYKBnDzLP627FbGmAQ4s5sI9N
	5I3Z2
X-Gm-Gg: AYBFou2Kwdqf10Bv8fLSUfNaKqodZCHcFbGkqgLz69j+XHRd3WdzRAmd+Wjk+prq5Vb
	S5EvblsNMx3tZvskdLnGxGqoMnen7azYxDJtU2fZiWFNRcR2yAiAImLB/wx9XpoqdYvc4F5VOoK
	suygnP1USjodhU3c7Ds3U4+P9cSalqb/x1WGXk6tH7j0gV0aPRmbQE/bjlUSlthidyEYG8RxLSk
	SrtugCggq+IOOMvEfFNCFZed5oJbWZO1gomySDMslZXO6cJXg2nE38116zv/leskrPGvq87TAwG
	Amr36hGTXFGmruNHvO9vzPb6fXcjmsOXIoNXuEdYMKBdbTN4ZEuoLWyg8vqxm9ysIZIJekOn1P4
	hBaATCdmYvcekgKUn9YnsHEuEBPCIRkwtfAOOP1AT/FxxtJ2NL3xxemFoUFmWwa38Zspfyx13dC
	WXRqGt7HvlHmfS3ol8OGBSYbKxvTQSGNoYdfmDO2YDJ8QxegVtvziBlwX8+ySW0FUXYkw3MQMYo
	4GRl9KujOKeGg3eAQbMwp2IbTTWe7AC2EdzI15PU0e8eOw3aFtez1D+eCUIzSKl8bTlxQ==
X-Received: by 2002:a05:7022:b05b:b0:196:aa86:fcf3 with SMTP id a92af1059eb24-19937da1c5cmr961671c88.26.1792809014380;
        Fri, 23 Oct 2026 19:30:14 -0700 (PDT)
Received: from 6e52bff8000c ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a21bc6cbsm2454292c88.16.2026.10.23.19.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 19:30:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 20a33c6b6cbe7e4805dfb6cd68816937443aa148
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sat, 24 Oct 2026 02:30:13 -0000
Message-ID: <179280901276.381729.808337689211210601@6e52bff8000c>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/20a33c6b6cbe7e4805dfb6cd68816937443aa148/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 20a33c6b6cbe7e4805dfb6cd68816937443aa148
origin: maestro
test start time: 2026-10-23 16:12:55.096000+00:00

Builds:	   72 ✅    1 ❌    0 ⚠️
Boots: 	  213 ✅    6 ❌    0 ⚠️
Tests: 	37906 ✅ 2760 ❌ 4203 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: jetson-agx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp.pselect01
      last run: https://d.kernelci.org/test/maestro:6adbc97655fda50760778071
      history:  > ✅  > ❌  > ❌  
            
Hardware: jetson-nano-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_core
      last run: https://d.kernelci.org/test/maestro:6adbae6f55fda50760766547
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.cgroup.cgroup_test_stress_sh_test_cgcore_proc_migration
      last run: https://d.kernelci.org/test/maestro:6adbae6f55fda5076076658a
      history:  > ✅  > ❌  
            
Hardware: jetson-orin-nx-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6adbaf9b55fda5076076743c
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6adbaf9b55fda50760767437
      history:  > ✅  > ❌  > ❌  
            
Hardware: stm32mp157a-dhcor-avenger96
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp.shmget03
      last run: https://d.kernelci.org/test/maestro:6adba4ef55fda5076075b925
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-01
      last run: https://d.kernelci.org/test/maestro:6adb984d55fda507607519e1
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp9.VP9-TEST-VECTORS-GStreamer-VP9-V4L2.vp90-2-15-segkey-webm
      last run: https://d.kernelci.org/test/maestro:6adb989f55fda50760751d83
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-01-intra-1416
      last run: https://d.kernelci.org/test/maestro:6adb97ed55fda50760750794
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-01-intra-1417
      last run: https://d.kernelci.org/test/maestro:6adb97ed55fda50760750793
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.breakpoints
      last run: https://d.kernelci.org/test/maestro:6adb8f7855fda5076074488a
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6adb90a755fda507607454af
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - ltp.shmget03
      last run: https://d.kernelci.org/test/maestro:6adba01555fda50760757768
      history:  > ❌  > ✅  > ✅  
            
Hardware: jetson-agx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp.clock_nanosleep02
      last run: https://d.kernelci.org/test/maestro:6adbc97455fda50760777f21
      history:  > ❌  > ✅  > ✅  
            
      - ltp.poll02
      last run: https://d.kernelci.org/test/maestro:6adbc97655fda50760778065
      history:  > ❌  > ✅  > ✅  
            
      - ltp.prctl09
      last run: https://d.kernelci.org/test/maestro:6adbc97655fda50760778069
      history:  > ❌  > ✅  > ✅  
            
      - ltp.shmget03
      last run: https://d.kernelci.org/test/maestro:6adbc97655fda5076077806e
      history:  > ❌  > ❌  > ✅  
            
Hardware: jetson-agx-orin-industrial-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6adbb66855fda50760769b07
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6adbb66855fda50760769b02
      history:  > ❌  > ❌  > ✅  
            
Hardware: jetson-nano-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6adbae6f55fda5076076656f
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6adbae6f55fda5076076656a
      history:  > ❌  > ✅  > ✅  
            
Hardware: jetson-tx1-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_stress_sh
      last run: https://d.kernelci.org/test/maestro:6adbaee755fda5076076701d
      history:  > ❌  > ✅  > ✅  
            
Hardware: nvidia-igx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_freezer
      last run: https://d.kernelci.org/test/maestro:6adbb04f55fda507607676b4
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_freezer_test_cgfreezer_ptrace
      last run: https://d.kernelci.org/test/maestro:6adbb04f55fda507607676a9
      history:  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.acct
      last run: https://d.kernelci.org/test/maestro:6adb8f5b55fda50760744712
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.breakpoints.breakpoints_step_after_suspend_test
      last run: https://d.kernelci.org/test/maestro:6adb916555fda50760745a31
      history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.kvm
      last run: https://d.kernelci.org/test/maestro:6adb91d055fda507607463d3
      history:  > ❌  > ✅  > ❌  
            
      - kselftest.kvm.kvm_set_memory_region_test
      last run: https://d.kernelci.org/test/maestro:6adba01c55fda50760757bf2
      history:  > ❌  > ✅  > ❌  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6adba01255fda50760757594
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
Hardware: jetson-agx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_stress_sh
      last run: https://d.kernelci.org/test/maestro:6adbc97155fda50760777e01
      history:  > ✅  > ❌  > ✅  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6adbc97455fda50760777e46
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - ltp.epoll_pwait03
      last run: https://d.kernelci.org/test/maestro:6adbc97655fda50760777fe4
      history:  > ❌  > ✅  > ❌  
            
Hardware: jetson-agx-orin-industrial-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6adbbc1255fda5076076efed
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
Hardware: jetson-nano-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_stress_sh
      last run: https://d.kernelci.org/test/maestro:6adbae6f55fda5076076658f
      history:  > ❌  > ✅  > ❌  
            
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6adba6fb55fda5076075d164
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_500000_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6adbae7155fda507607665b8
      history:  > ✅  > ❌  > ✅  
            
Hardware: jetson-orin-nano-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6adbb87855fda5076076a7a7
      history:  > ❌  > ✅  > ❌  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6adbb87855fda5076076a7a2
      history:  > ❌  > ✅  > ❌  
            
Hardware: jetson-orin-nx-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_cpuset_prs_sh
      last run: https://d.kernelci.org/test/maestro:6adbaf9b55fda50760767490
      history:  > ❌  > ❌  > ⚠️  
            
Hardware: jetson-tx2-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_stress_sh
      last run: https://d.kernelci.org/test/maestro:6adbb16855fda50760768110
      history:  > ✅  > ❌  > ✅  > ❌  
            
Hardware: nvidia-e5020-vera
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6adbb53c55fda507607695b0
      history:  > ✅  > ❌  > ✅  > ✅  
            
Hardware: nvidia-igx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6adbb04f55fda507607676c4
      history:  > ❌  > ✅  > ❌  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6adbb04f55fda507607676bf
      history:  > ❌  > ✅  > ❌  
            
Hardware: qemu-arm64
  > Config: defconfig+netdev+nfs-root-boot+ltp
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6adb971e55fda50760750188
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
Hardware: stm32mp157a-dhcor-avenger96
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp.dirtyc0w_shmem
      last run: https://d.kernelci.org/test/maestro:6adba4ee55fda5076075b6b2
      history:  > ✅  > ✅  > ⚠️  > ⚠️  > ✅  
            
      - ltp.nanosleep01
      last run: https://d.kernelci.org/test/maestro:6adba4ef55fda5076075b9be
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - ltp.shmctl05
      last run: https://d.kernelci.org/test/maestro:6adba4ef55fda5076075b926
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
Hardware: sun50i-a64-pine64-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_pcm-test_default_time7_sun50ia64audio_0_0_PLAYBACK
      last run: https://d.kernelci.org/test/maestro:6adba7c055fda5076075ddb7
      history:  > ✅  > ✅  > ❌  > ✅  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-02
      last run: https://d.kernelci.org/test/maestro:6adb984d55fda507607519e0
      history:  > ❌  > ✅  > ❌  > ❌  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-01
      last run: https://d.kernelci.org/test/maestro:6adb97ed55fda5076075078e
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-03
      last run: https://d.kernelci.org/test/maestro:6adb97ed55fda5076075078c
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
