Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793068251;
	b=f0rAoQ/Yc5UbopeQHK6ybVDXzwsabj5w66+QOocFv3oPnd3r97Lolm0g0lvJkIGTOCz6
	 CXJLwz2CAELY3LmehR8z5HGliCMMUFYtmFQqI9hk3WuG3wtgUILRwOt7z+ONZlcjdfQ/O
	 61BhD+SwgcQ6/mLCJbj4qqcrwVw/TcNVqnnKAImbM0Devee82wJSdOYNqe3K5w34ufefD
	 OAVaktBOOScv+sznQ+/YfN9pNoMayIz61DB0qd4gql2mfCrDL67Og3xBMjS0rV/zlcDWA
	 9PaRTVo/zZoeMlV3f7HJyy+vdI0cpQgSy6sJ2gUwBIb5G5ulx2kbQ1cPoBY7O85AoKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793068251;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:To:Cc:Reply-To:
	 Date:Message-ID;
	bh=KEa4tX9TYr8qzRFIr5i0T02yV/8BNKt1p6v6QFZI8Kg=;
	b=ReUMQI8w7/IBueKE8pNlQiVqLUZCP5IwUpP5eqCM5Ipl0GRjEej2u3GpsWaITdWU9k37
	 Nt9DCieAFberZdR5DxFU8k02iygReQ8NEGzAmNlgazMmaFQBmVHtaubvt4gkNSMrQJO7q
	 DH0GzEU4uykfs6MiuN3dPnuqT2IHGRwKbVhBObQcI/ALoKOG+hgQZSwt6nBYx8FdYarI1
	 1txbqoDgytA0+nIQCFXX0UdbZCnr133EcK1FNtUi9rUQGrYfD5X3mAimFogTZvtIJvmWj
	 sxGhpqKX0LR+/gMSIsrvSHzghNDIqF44iucDb4DQlo3Mk+i9YmuDZLBCH4CCb0PpejA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=cyx5Gn7+;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBBF606A31D
	for <linux-next@vger.kernel.org>; Tue, 27 Oct 2026 02:30:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBBBF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=cyx5Gn7+
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-369f33df08eso4256670eec.0
        for <linux-next@vger.kernel.org>; Mon, 26 Oct 2026 19:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1793068250; x=1793673050; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KEa4tX9TYr8qzRFIr5i0T02yV/8BNKt1p6v6QFZI8Kg=;
        b=cyx5Gn7+Eb8kNiZ4k41GSiPiFMhy2G4pV+WXfYZdNmmVlTgRJwI9o4YN41o4TP2GVo
         V3kiyCPIO5pZ1EuQV214S7lLhvBSl6V1X3oZQ4PqsbxU0n1Z8VynAM5n0Eqfr7iEzYYY
         Ui8pby36lcJi2hpw4tyE6bnNbERrfYpGJhvKHsDCiNHXObjo8OipGv6SZPToDejc9zwM
         Wm2/qkbI7AScQZjUGOVISCy63lhVWYz8HrUKXMWFfzWIA2fuGnqyzskYDastNidI5XpZ
         nPiObVh7qjo6QXWZU0a4uQSJZpfE/EgAZLqQaGUdgXT68KFgccTdox/JE0t1PbNBTRhg
         o3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793068250; x=1793673050;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KEa4tX9TYr8qzRFIr5i0T02yV/8BNKt1p6v6QFZI8Kg=;
        b=fwBf99KkB6vIZx7z3vkA2g1Zj6Kq70rbMrSXKMqa53g2V3N8vI63tOuKWaiYiHuR8e
         MNi0h37RO3OjH4Lzjdo56WoYiz4MYFlSlx341PxlAu83d+N+lQaOqzIwO/e6EZIlaqhg
         uxZQIOmSycU9BHYzMN1EESexuu1vo263XOKxkb1o2BBl+FL/0zsu15S8G3JuxSijsdu3
         agEmOXvQfmq4oleFPQl3bk8VAbJEivOCb3BsF7QlQZ5nlpPmR8A1U7hRWghhZWBfj5Fm
         ocTSqBSDzXNWYP0FGL0BH0uvn8hVkRz+SBOc6ldtZKkpoS2vNKs1BHJCROBmS9r1xF+0
         91Ug==
X-Gm-Message-State: AFq9FYK3+p+TZ5JuIm+GRSKHTHTGegdZp/c3LGgDyv5m4/6On25ain3g
	6fV8gcxioiNtm1bGJyH1qJDy0HEyJoKOes9mBh7vGwwmijfqPbuhZX6GcL8NAp3Q1wYN8/qPzUF
	NSar2
X-Gm-Gg: AYBFou11qGYDktXQTjlzgXLYB7pXi+5hL5oTkl/lU/3De3x9cUf0nQrKkpRW4AJvQZp
	JKBzd/getmSLYRSpmwEJc8RiOlJgUiottf2MoVF2k05og8qLY7sOvs+fsz6X9RCeLYh0wLVVZmd
	QAieN3tXHcrfg7aVeAqkgM4zyrJ70DqhXmzFLpW0bqzmiBH0P4zIqBvAK8XgN7K1gOYqVoffomm
	8P2cPcbJNciss0JIcW3p3ioMBt+4o+bSjPIta185o173wPXrM7RZVrUfKQTsJlJxY+vzQ6guBsK
	ez9erO8k1Iq7ZJCQTuY50nhltFJfxczWniyM+oXJxmmvwDBlMbRZQmouu4xP0hMfWXQo+tITfaY
	UTYqKBiR3eUtXGjIGkxTRg5e56ahVU3WuuNwbe/y3/x/LSdYrN0/85D4GCt5mjm46TFtKqy2EF0
	kSpqItRB+DuCjRmfv7UZN7M8ORTQ+cNbJv8TMveLEQqDqFpBk83+gI/M+Ao/cNb1LmNvn/frFdB
	SuYhCv4hNFtYdrM7Ss9U46IC2D3KIcIJv283NunHowaiTg6
X-Received: by 2002:a05:693c:2d84:b0:358:8f02:e0ca with SMTP id 5a478bee46e88-369e84fc4admr17006020eec.9.1793068249466;
        Mon, 26 Oct 2026 19:30:49 -0700 (PDT)
Received: from 4cb1f8191411 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm48770281eec.25.2026.10.26.19.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 19:30:49 -0700 (PDT)
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
Subject: [STATUS] next/master - f1ac44c32cba88ad65dcecd4a279661d14e93651
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 27 Oct 2026 02:30:48 -0000
Message-ID: <179306824857.16219.5154275036721670511@4cb1f8191411>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/f1ac44c32cba88ad65dcecd4a279661d14e93651/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: f1ac44c32cba88ad65dcecd4a279661d14e93651
origin: maestro
test start time: 2026-10-26 14:06:04.526000+00:00

Builds:	   75 ✅    1 ❌    0 ⚠️
Boots: 	  227 ✅    5 ❌    0 ⚠️
Tests: 	36932 ✅ 3154 ❌ 3082 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.acct
      last run: https://d.kernelci.org/test/maestro:6adf69d555fda507608d72f4
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: jetson-orin-nx-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6adf809155fda507608ececb
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6adf809155fda507608ecec6
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: nvidia-e5020-vera
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_cpuset_prs_sh
      last run: https://d.kernelci.org/test/maestro:6adf781055fda507608e6208
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-01-intra-1417
      last run: https://d.kernelci.org/test/maestro:6adf6d9955fda507608dbc17
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: jetson-agx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp.clock_nanosleep02
      last run: https://d.kernelci.org/test/maestro:6adfc9b255fda5076091a84c
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: jetson-orin-nano-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_stress_sh
      last run: https://d.kernelci.org/test/maestro:6adfa08655fda507608fd170
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: jetson-tx1-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_stress_sh
      last run: https://d.kernelci.org/test/maestro:6adf78c455fda507608e6d82
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: nvidia-igx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_freezer
      last run: https://d.kernelci.org/test/maestro:6adf7a2c55fda507608e77d8
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cgroup.cgroup_test_freezer_test_cgfreezer_ptrace
      last run: https://d.kernelci.org/test/maestro:6adf7a2c55fda507608e77cd
      history:  > ❌  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.kvm
      last run: https://d.kernelci.org/test/maestro:6adf692755fda507608d51cd
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.kvm.kvm_set_memory_region_test
      last run: https://d.kernelci.org/test/maestro:6adf789655fda507608e6bcb
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6adf788d55fda507608e6573
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - ltp.shmget03
      last run: https://d.kernelci.org/test/maestro:6adf788f55fda507608e67a7
      history:  > ❌  > ✅  > ✅  > ❌  
            
Hardware: jetson-agx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_stress_sh
      last run: https://d.kernelci.org/test/maestro:6adfc9ae55fda5076091a733
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6adfc9b255fda5076091a778
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - ltp.epoll_pwait03
      last run: https://d.kernelci.org/test/maestro:6adfc9b455fda5076091a915
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - ltp.poll02
      last run: https://d.kernelci.org/test/maestro:6adfc9b555fda5076091a991
      history:  > ❌  > ✅  > ✅  > ❌  
            
      - ltp.prctl09
      last run: https://d.kernelci.org/test/maestro:6adfc9b555fda5076091a9a0
      history:  > ❌  > ✅  > ✅  > ❌  
            
      - ltp.pselect01
      last run: https://d.kernelci.org/test/maestro:6adfc9b555fda5076091a99f
      history:  > ✅  > ❌  > ❌  > ✅  
            
      - ltp.shmget03
      last run: https://d.kernelci.org/test/maestro:6adfc9b555fda5076091a99d
      history:  > ❌  > ❌  > ✅  > ❌  
            
Hardware: jetson-agx-orin-industrial-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6adfa4d855fda50760900ef8
      history:  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6adfa4d855fda50760900ef3
      history:  > ❌  > ❌  > ✅  > ❌  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6adfb11155fda5076090d16c
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
Hardware: jetson-nano-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_core
      last run: https://d.kernelci.org/test/maestro:6adf7c8455fda507608e89dc
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6adf7c8455fda507608e8a04
      history:  > ❌  > ✅  > ✅  > ❌  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6adf7c8455fda507608e89ff
      history:  > ❌  > ✅  > ✅  > ❌  
            
      - kselftest.cgroup.cgroup_test_stress_sh
      last run: https://d.kernelci.org/test/maestro:6adf7c8455fda507608e8a3c
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_stress_sh_test_cgcore_proc_migration
      last run: https://d.kernelci.org/test/maestro:6adf7c8455fda507608e8a1f
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6adf716055fda507608e0229
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_500000_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6adf7c8655fda507608e8a5f
      history:  > ✅  > ❌  > ✅  > ✅  
            
Hardware: jetson-orin-nano-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6adfa08655fda507608fd105
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6adfa08655fda507608fd100
      history:  > ❌  > ✅  > ❌  > ❌  
            
Hardware: jetson-orin-nx-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_cpuset_prs_sh
      last run: https://d.kernelci.org/test/maestro:6adf809155fda507608ecf13
      history:  > ❌  > ❌  > ⚠️  > ⚠️  > ❌  
            
Hardware: jetson-tx2-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_stress_sh
      last run: https://d.kernelci.org/test/maestro:6adf781055fda507608e61a3
      history:  > ✅  > ❌  > ✅  > ❌  > ✅  
            
Hardware: nvidia-e5020-vera
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6adf781055fda507608e61b3
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: nvidia-igx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6adf7a2c55fda507608e77e8
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6adf7a2c55fda507608e77e3
      history:  > ❌  > ✅  > ❌  > ✅  
            
Hardware: qemu-arm64
  > Config: defconfig+netdev+nfs-root-boot+ltp
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6adf692c55fda507608d525d
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
Hardware: sun50i-a64-pine64-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_pcm-test_default_time7_sun50ia64audio_0_0_PLAYBACK
      last run: https://d.kernelci.org/test/maestro:6adfd88355fda50760920ba3
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-01
      last run: https://d.kernelci.org/test/maestro:6adf6d9955fda507608dbc12
      history:  > ❌  > ✅  > ❌  > ❌  > ✅  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-03
      last run: https://d.kernelci.org/test/maestro:6adf6d9955fda507608dbc10
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp9.VP9-TEST-VECTORS-GStreamer-VP9-V4L2.vp90-2-15-segkey-webm
      last run: https://d.kernelci.org/test/maestro:6adf6dfd55fda507608dc21e
      history:  > ✅  > ❌  > ❌  > ✅  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
