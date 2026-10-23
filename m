Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792722650;
	b=XppNVjKed6RLWTG/cow2Xcskhj0hIaMnqKJy8k9iH4RgvaCd/x8ItGXHT0CVkbmUCgo2
	 GTrv089EDZ3/wsvt7X8V3HIflibKx6bBLw+RG46aUHNPuIPUlgWxpBQSARWdpSVwJUjwr
	 z0H1OqiROgYSkS5Xp1PM+FmXSeXE58AWIL2KcG928YbWzv3VbHLV7b5sa0EzI8A9TYA4H
	 FEPCFdVfCjI48Y1aT13c/NEfJVQO2eToJLe7W0V/oVY2nJZhUbdEXRc+Jh/hl7OzjXVjA
	 yp3/5/MG0/2AvtK12Q7sMtr49LexWI9OYMSOgBo4xyYpYBcyPZ+vZLJze0t/RdKeg4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792722650;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:To:Cc:Reply-To:
	 Date:Message-ID;
	bh=u6+8SX0LGdiQAbmL9OPy4zRXST66y/YobUc6YWorOKs=;
	b=o1W2XRFUAAeWtLFbTiRWUumZNNUrb2DTEq5vXYMp+qoKY3gD/tdUCukNFyIjrWk7tcKO
	 bpvhoMADVGbXZhIzntKQOck6GgXm5QtGvNKalU7yIwTmMTBuoUsQ3HuddO6YxYQxb/fHm
	 ap/ZV+/bv/CzQv7CpIqSKSnpSKWuO0ZOlf9z3POde0FXfP8CFiXs0yE4IgiNTv2vJlnuJ
	 lvAYFz0D1wD3xWNLj2/YYaXU2xw7SgokWKk9OKgPnxqeG3recxFuVeYsmjLLyg29PiTkG
	 ooNzEyVGy1jzRJpsK/rjpVTY9qzYOxepfIgK+RqXTH7YwKliRYsRt//rractXgQsDSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=FAlDju60;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C26B606A319
	for <linux-next@vger.kernel.org>; Fri, 23 Oct 2026 02:30:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C26B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=FAlDju60
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-156cbe59622so435097c88.0
        for <linux-next@vger.kernel.org>; Thu, 22 Oct 2026 19:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1792722648; x=1793327448; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u6+8SX0LGdiQAbmL9OPy4zRXST66y/YobUc6YWorOKs=;
        b=FAlDju60dz+lI9j8i+suHl+cE8R8xIHO7L/p/S0Kr6K3nw4TDcGDGdEpFj8oDpLJe8
         agWgVV6S9BBfA3Xy8LydZlq3E/kFjBFy/0pzxN2YHRPheE/WuLp/zlt3nL1f7ptjUtDB
         ksw7E9g1ZLuehPSVkno66dk+eqi2g5ca08eDT/ILMTAr52jClxRIAZi/klwtDeD9Fuy7
         wrld0ExMkU99oS0wMOntFAfAReW/Q39D7ZSQ4+GD9FknxL2yt2XSnr9kYvaHtzujhzmD
         mj18VFvrl/BDwQxX9+/ztHZZ+p67fYHbJ7O9u5BQhYzL9LKLlUPnc5s89kQ4K7dWc0jF
         bZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792722648; x=1793327448;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u6+8SX0LGdiQAbmL9OPy4zRXST66y/YobUc6YWorOKs=;
        b=G18f8XNj4eN5NGR0Xxs+dmyIzvugGijvYIJNkyVHOI6w7SFMRYWTZnPvTnZuEt4K1f
         P7e9bfp87cGvovZXYoJKjairFufYFM81D+dYjAD6lmbbb6WmBKBdLifzMid8/FTi+kZy
         0WsUuItfilzcJjaOqENRK97TYWtkfsGmSPixOxBlDMNBoByH4mcKU3GcIgd0Rokry+lk
         0uuTizAPehn/DrxVpDZ4TvHPM0vU4YOB4NLjfpLRXgjQ9BhkWgtg5tZXWLoq/dmkOWBa
         XKkEnRv28mtGTcRZKmWgfr4IDj/h0KyY3C5yyev0OEaeHm+dvXRCMBXlCBFjIjdGaaDk
         80Gw==
X-Gm-Message-State: AFq9FYLyLPLm3olS0PQheN1q15vTXRPIAVO8n1wvGSQ/asF/Ymh+Wmo/
	z3sWmQyc/YXhYTaLmduQooLFA78l6ZxNSLc5E/HdweYHAL04HewVtG06ToWWKjSmlmqjWZxr5sw
	S4Nnf
X-Gm-Gg: AYBFou1kjc62IQa9Xfv6KgEKV930IPthFwZ2Qq9N1nOUB3SKdzhg9JTp8qUJ99JCJFi
	grtWlOhwTfqg4WUH6hYJONF3F3rPQBUsf9/kaT7z9mEgaUKnZnYjhBPz5ALPNdwNQTPUUE5d+gy
	akvtjnp2h/sw/m+GtFKlYI6BXuyOBkRwyioFwv4rU9HfSYVhN6gh5o52VDkz2xtzYb2/mMANi9S
	aODEYOLqyv+qd1NGIHZP8U82yqGgRKu9vbboFPS5KkIXbwWcd2GAieGjr5BHzLBCbhh+E5jIbIJ
	DMHmEW84LPc9KTWyHDRfuiEiIXm7dPtqMqlX8wy7oIFB3NA8AtMg1G2peWLcPC3o3yEQ2PvHd8N
	5Ka7G3SEh/fQes020ZpkCd3PcJegfPe6off6oCeH7p60+0lMbvgKb9WwzuMG47LFW5PZhcNkEYF
	7EHDJlMOj2vcke8L/BrN94KFU+qNacQws1PhRb2oQc+xYkwE54K2D+lKPnlaQ8d+PUOBUy9MEmw
	jLdVXHsxlSxCnAoaDnDuLHdDhfmQkt/3L1eQfORTGObK/P0
X-Received: by 2002:a05:7022:2582:b0:143:3c9f:10a6 with SMTP id a92af1059eb24-19592c39602mr2358003c88.4.1792722648069;
        Thu, 22 Oct 2026 19:30:48 -0700 (PDT)
Received: from 6e52bff8000c ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195e5163e64sm2119088c88.1.2026.10.22.19.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 19:30:47 -0700 (PDT)
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
Subject: [STATUS] next/master - bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 23 Oct 2026 02:30:47 -0000
Message-ID: <179272264722.329188.4773475583351189022@6e52bff8000c>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
origin: maestro
test start time: 2026-10-22 13:22:31.022000+00:00

Builds:	   64 ✅    2 ❌    0 ⚠️
Boots: 	  195 ✅    2 ❌    0 ⚠️
Tests: 	41708 ✅ 3685 ❌ 5680 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: hamoa-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_bc0000_i2c_b80000_keyboard_3a
      last run: https://d.kernelci.org/test/maestro:6ada2d4855fda5076069e92a
      history:  > ✅  > ✅  > ❌  
            
Hardware: jetson-agx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_stress_sh
      last run: https://d.kernelci.org/test/maestro:6ada4bbc55fda507606b06cf
      history:  > ✅  > ❌  
            
      - ltp.pselect01
      last run: https://d.kernelci.org/test/maestro:6ada4bc855fda507606b095a
      history:  > ✅  > ❌  
            
Hardware: jetson-nano-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6ada1b6a55fda50760692aaa
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_args_t_500000_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6ada247c55fda50760699f76
      history:  > ✅  > ❌  
            
Hardware: jetson-tx2-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_stress_sh
      last run: https://d.kernelci.org/test/maestro:6ada229a55fda50760699497
      history:  > ✅  > ❌  
            
Hardware: purwa-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:6ada1bf655fda50760693790
      history:  > ✅  > ❌  > ❌  
            
Hardware: sun50i-a64-pine64-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_pcm-test_default_time7_sun50ia64audio_0_0_PLAYBACK
      last run: https://d.kernelci.org/test/maestro:6ada228955fda50760698c01
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: stm32mp157a-dhcor-avenger96
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp.nanosleep01
      last run: https://d.kernelci.org/test/maestro:6ada29f555fda5076069d599
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - ltp.shmget03
      last run: https://d.kernelci.org/test/maestro:6ada29f555fda5076069d50a
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.breakpoints
      last run: https://d.kernelci.org/test/maestro:6ada135455fda5076068ab17
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ada145855fda5076068b3fe
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.kvm
      last run: https://d.kernelci.org/test/maestro:6ada16b455fda5076068cf1c
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.kvm.kvm_nested_tsc_scaling_test
      last run: https://d.kernelci.org/test/maestro:6ada25f055fda5076069b51d
      history:  > ❌  > ✅  > ✅  
            
Hardware: jetson-agx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp.clock_nanosleep02
      last run: https://d.kernelci.org/test/maestro:6ada4bc555fda507606b0805
      history:  > ❌  > ✅  
            
      - ltp.epoll_pwait03
      last run: https://d.kernelci.org/test/maestro:6ada4bc855fda507606b08d0
      history:  > ❌  > ✅  
            
      - ltp.poll02
      last run: https://d.kernelci.org/test/maestro:6ada4bc855fda507606b0947
      history:  > ❌  > ✅  
            
      - ltp.prctl09
      last run: https://d.kernelci.org/test/maestro:6ada4bc855fda507606b094c
      history:  > ❌  > ✅  
            
Hardware: jetson-nano-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6ada247a55fda50760699ed9
      history:  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6ada247a55fda50760699ece
      history:  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_stress_sh
      last run: https://d.kernelci.org/test/maestro:6ada247a55fda50760699f3f
      history:  > ❌  > ✅  
            
Hardware: jetson-orin-nano-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6ada5e0555fda507606b7329
      history:  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6ada5e0555fda507606b7324
      history:  > ❌  > ✅  
            
Hardware: jetson-tx1-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_stress_sh
      last run: https://d.kernelci.org/test/maestro:6ada247a55fda50760699f2e
      history:  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.acct
      last run: https://d.kernelci.org/test/maestro:6ada133c55fda5076068aa65
      history:  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.breakpoints.breakpoints_step_after_suspend_test
      last run: https://d.kernelci.org/test/maestro:6ada144855fda5076068b3f0
      history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.kvm.kvm_set_memory_region_test
      last run: https://d.kernelci.org/test/maestro:6ada25f055fda5076069b4ed
      history:  > ✅  > ❌  > ✅  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ada25e655fda5076069ae94
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - ltp.shmget03
      last run: https://d.kernelci.org/test/maestro:6ada25e955fda5076069b117
      history:  > ✅  > ❌  > ✅  
            
Hardware: jetson-agx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ada4bc555fda507606b0727
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
Hardware: jetson-agx-orin-industrial-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ada2d6c55fda5076069e9e5
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
Hardware: jetson-orin-nx-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_cpuset_prs_sh
      last run: https://d.kernelci.org/test/maestro:6ada25a655fda5076069aaa2
      history:  > ⚠️  > ❌  > ❌  
            
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6ada25a655fda5076069aa4e
      history:  > ❌  > ✅  > ❌  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6ada25a655fda5076069aa49
      history:  > ❌  > ✅  > ❌  
            
Hardware: nvidia-e5020-vera
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6ada229a55fda5076069943e
      history:  > ✅  > ❌  > ✅  
            
Hardware: nvidia-igx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_freezer
      last run: https://d.kernelci.org/test/maestro:6ada25e255fda5076069ac66
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_freezer_test_cgfreezer_ptrace
      last run: https://d.kernelci.org/test/maestro:6ada25e255fda5076069ac5b
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6ada25e255fda5076069ac76
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem_test_kmem_memcg_deletion
      last run: https://d.kernelci.org/test/maestro:6ada25e255fda5076069ac71
      history:  > ✅  > ❌  > ✅  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-01
      last run: https://d.kernelci.org/test/maestro:6ada24cd55fda5076069a023
      history:  > ❌  > ✅  > ❌  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-02
      last run: https://d.kernelci.org/test/maestro:6ada24cd55fda5076069a022
      history:  > ❌  > ❌  > ✅  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp9.VP9-TEST-VECTORS-GStreamer-VP9-V4L2.vp90-2-15-segkey-webm
      last run: https://d.kernelci.org/test/maestro:6ada24fe55fda5076069a528
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-01-intra-1416
      last run: https://d.kernelci.org/test/maestro:6ada1fed55fda50760695b4f
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-01-intra-1417
      last run: https://d.kernelci.org/test/maestro:6ada1fed55fda50760695b4e
      history:  > ❌  > ✅  > ✅  > ❌  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-01
      last run: https://d.kernelci.org/test/maestro:6ada1fed55fda50760695b49
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-03
      last run: https://d.kernelci.org/test/maestro:6ada1fed55fda50760695b47
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp9.VP9-TEST-VECTORS-GStreamer-VP9-V4L2.vp90-2-15-segkey-webm
      last run: https://d.kernelci.org/test/maestro:6ada206d55fda50760697ce3
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
Hardware: stm32mp157a-dhcor-avenger96
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp.dirtyc0w_shmem
      last run: https://d.kernelci.org/test/maestro:6ada29f455fda5076069d2b1
      history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
      - ltp.shmctl05
      last run: https://d.kernelci.org/test/maestro:6ada29f555fda5076069d4d2
      history:  > ❌  > ✅  > ✅  > ❌  > ✅  
            

### NEW BUILD ISSUES
- Issue: maestro:9c12526508454935ec55c5be5b9699f5296ee63b | version: 1
  Build: maestro:6ada0faa55fda507606868e9
  Comment: arch/riscv/kvm/kvm.ko: symbol 'kvm_arch_pre_fault_allowed' undefined! in Module.symvers (/tmp/kci/linux/scripts/Makefile.modpost:147) [logspec:kbuild,kbuild.modpost]
  First seen: 2026-10-22 13:42:27.867356+00:00
  Culprit: code
- Issue: maestro:9c12526508454935ec55c5be5b9699f5296ee63b | version: 1
  Build: maestro:6ada0fad55fda507606868ec
  Comment: arch/riscv/kvm/kvm.ko: symbol 'kvm_arch_pre_fault_allowed' undefined! in Module.symvers (/tmp/kci/linux/scripts/Makefile.modpost:147) [logspec:kbuild,kbuild.modpost]
  First seen: 2026-10-22 13:42:27.867356+00:00
  Culprit: code

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
