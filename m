Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974D5368941
	for <linux-next@vger.kernel.org>; Fri, 25 Sep 2026 02:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790303415; cv=none; b=RD64CAWZ3OJaMTHm1+QsNcQpM3bfTDUdSQazp/10CeAeC3WjxmJ4ZqbMEz9k+f8elyvF2n/VRagqG9pahY8tIzsFscyPAhNgbd8HqLh6qO6gfLajrUhn+1N5jE/wLseP1m8V+W0HzoSo5MU+5QeIsUgkVVW81SRGTl7/su951IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790303415; c=relaxed/simple;
	bh=sP6ebCI5jmjmJKbDfBqPPzongUIf04wB4yPPZbpFZf4=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=IeAjgq1Bp9uEKBbpDBEdyTMr+l/wKu1BPBxb0gpBV7FL3sJEqKtmUe9zcd8S2h+EjR4UvrJEDNJ1xVbs9gABE8SFZM/nVe5PLasGKt/8QMXuqcjFuZf11goAl9+27qK+Sg7VhqfxBjfGFnzZVmReASoj1uVLynTOGDzLn+o5Nn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=HpYh+R1X; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="HpYh+R1X"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-328664ef791so170801eec.3
        for <linux-next@vger.kernel.org>; Thu, 24 Sep 2026 19:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1790303412; x=1790908212; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KkvAKJQj2a62vIffkCdJ6TuyZXFvVjAkzL4ckxj/bi4=;
        b=HpYh+R1XUP/v6rkQSa1aeofpFopIotsHhhR2bPY2stQD3wKX0jsjtYU6jQKUIJ4299
         lpTAkwJh6J/YCSB+KqF6rzK/VuXxpc796Zc+9Fwq4tmV0l3Gqqgvax7LtX8jmp20RxPA
         B/LZxYKwjICx1mI1Kp2TVSzpuQahpeTymURuaQkaLgw6QrZluJTe7Og9Qd5ZL0nv5ftK
         9EqSl0u+RooKq75DIZUUJBERorG+OfK4DiuAeR0aNuBZec3cLRwlsgpVkxBow39XfoBR
         1IyZu7t7rn8Nz/T1nyOI7DaiXIGKMNKzlpSo91R6rZvnhhiEWn02CRcaupIkG27vIiTh
         WlAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790303412; x=1790908212;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KkvAKJQj2a62vIffkCdJ6TuyZXFvVjAkzL4ckxj/bi4=;
        b=q8YSpwd8c61TA/0gi7caLH03OSEB2OxKBeDk9RAXM9+V+AfZ4H8PA+8nbFcT+YEwTy
         AGXBJE/J9uGHVFGr5vhIiPrQ5C9tt6y2geq0bhksaOKTnWTalDF+T7myVF23UIxEC9XZ
         XRw3qKw5Zsdpo0utXnXA8zytLhvI1fLpMfagw1Mnju6ynx4hunsgidQoOcMhV6OnNACx
         h7I8wxlzz5MqRfJ9UfHfrZQ019yXHeSQCwv6qpI9iKCrYDXZ2GXEUJZLNcqp3LGf/oOi
         KAbdDauDeSQbvxLle2Vf4Oorm0O4gWGNPk95VtlBEHf3sWHNkKDMZG6qnM4sV2sdHSy1
         peVw==
X-Gm-Message-State: AFuF++lGvgaziCk8phC/wXaBiK5ScbzGCOOPfLvDSVcOHhgdgDH3Iyjv
	glaNHJIKpiCHkgsbGM6vPGRb4BvLZjiu+PzPanj+35zGwnr7cGRA1SDyfmKSwxHWgB0=
X-Gm-Gg: AYBFou09Ey24TeeC0aovsN1uXwP+/lVKyw69a3XW22jJS9kNNap1YJm2So0jTsfa8xM
	f/eDnr4V/yh6jE5oP6/DQd2+LG9Yi2dmxBOtPX5YRehfdAEEdARqbqMTQZD6Sa3Q2KmwNdBSt2A
	3OW1n+IPLsGXKJWVH5sRR6wuWReejFQRrhdYntteIps2j4UTPTqLoSwf5t4sx+IZJ7cKYPZ0OF+
	reHQ4hqtmy88SiSSLDrScqm5sywrkRYTPEz08I3Ia2WP7N3mlKbHGOE8fHFDRUqtflJC8riFLH5
	/g1FJaDJ0D0TWg1sSqdOEXMaUIxu8lAtnfZwqU71OcP1Q7H8EjWryglzTrTZmO02SZlDN4AFsJx
	du7K4am3Niz6kf9XOeDF7IxCK8QENtHo2G+FbhYXqGtZ3Rni0O/Zkm8ayf6VFstaJipxIPrK1TA
	80BiajGTWUPAmtGv3PeMwNVmmcv2DKMa2YX0uIHR7aX0mc2xQHXDo39jRgvVgN0jiu+X8Ubrzss
	w==
X-Received: by 2002:a05:7300:1c94:b0:33b:fae9:fc37 with SMTP id 5a478bee46e88-340043a2f7fmr3593135eec.5.1790303411818;
        Thu, 24 Sep 2026 19:30:11 -0700 (PDT)
Received: from ec7b70f3a45c ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144757f31sm3441461eec.14.2026.09.24.19.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 19:30:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 4c253ac4b29b8c6cc6fdef8f92d4facde62e63b9
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 25 Sep 2026 02:30:11 -0000
Message-ID: <179030341059.540925.2040686730288502547@ec7b70f3a45c>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/4c253ac4b29b8c6cc6fdef8f92d4facde62e63b9/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 4c253ac4b29b8c6cc6fdef8f92d4facde62e63b9
origin: maestro
test start time: 2026-09-24 18:58:48.089000+00:00

Builds:	   66 ✅    1 ❌    0 ⚠️
Boots: 	   66 ✅   25 ❌    0 ⚠️
Tests: 	33889 ✅ 1693 ❌ 4729 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ab57c17d96a8203de93c26b
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ab57f61d96a8203de94168c
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.kvm
      last run: https://d.kernelci.org/test/maestro:6ab592f6d96a8203de94df79
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.kvm.kvm_set_memory_region_test
      last run: https://d.kernelci.org/test/maestro:6ab5aec5d96a8203de971d12
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: rk3576-rock-4d
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ab57c21d96a8203de93c28a
      history:  > ✅  > ✅  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ab57cc4d96a8203de93d7c0
      history:  > ✅  > ✅  > ❌  
            
Hardware: r8a779m1-ulcb
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ab57c1ed96a8203de93c27e
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ab57f22d96a8203de941529
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: rk3588-rock-5b
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ab57c22d96a8203de93c28d
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ab57cd7d96a8203de93dc67
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: asus-CX3402CVA-brya
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ab579dbd96a8203de939c22
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ab57b7fd96a8203de93b5a3
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
Hardware: acer-cbv514-1h-34uz-brya
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ab579d7d96a8203de939c16
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ab57ebbd96a8203de940f26
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
Hardware: acer-cp514-3wh-r0qs-guybrush
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ab579dad96a8203de939c1e
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ab57bd0d96a8203de93be57
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
Hardware: mt8390-genio-700-evk
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ab57c1bd96a8203de93c278
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ab57fcfd96a8203de9418c8
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ab57c1cd96a8203de93c27b
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ab580b8d96a8203de941a0e
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: rk3399-rock-pi-4b
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ab57c1fd96a8203de93c281
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ab57f1bd96a8203de9414d4
      history:  > ✅  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.mm.mm_ksft_thp_sh_khugepaged
      last run: https://d.kernelci.org/test/maestro:6ab5aec4d96a8203de971c93
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.mm.mm_ksft_thp_sh_khugepaged_-s_2
      last run: https://d.kernelci.org/test/maestro:6ab5aec4d96a8203de971c95
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: nvidia-p3809-gb300
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.mm.mm_ksft_thp_sh_khugepaged
      last run: https://d.kernelci.org/test/maestro:6ab59e4bd96a8203de95a253
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.mm.mm_ksft_thp_sh_khugepaged_-s_2
      last run: https://d.kernelci.org/test/maestro:6ab59e4bd96a8203de95a254
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.ftrace.ftrace_ftracetest-ktap_Test_wakeup_RT_tracer
      last run: https://d.kernelci.org/test/maestro:6ab5c068d96a8203de97afd2
      history:  > ❌  > ✅  
            
Hardware: sm8750-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_clock-controller_3d64000
      last run: https://d.kernelci.org/test/maestro:6ab59058d96a8203de9497c8
      history:  > ❌  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.mm.mm_ksft_gup_test_sh
      last run: https://d.kernelci.org/test/maestro:6ab5aec4d96a8203de971c0f
      history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ab592f6d96a8203de94df73
      history:  > ❌  > ✅  > ❌  > ✅  > ❌  
            
Hardware: nvidia-p3809-gb300
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.mm.mm_ksft_gup_test_sh
      last run: https://d.kernelci.org/test/maestro:6ab59e4bd96a8203de95a210
      history:  > ✅  > ✅  > ⚠️  > ⚠️  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ab587dbd96a8203de943adc
      history:  > ❌  > ✅  > ❌  > ✅  > ❌  
            
Hardware: sun50i-a64-pine64-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_pcm-test_default_time7_sun50ia64audio_0_0_PLAYBACK
      last run: https://d.kernelci.org/test/maestro:6ab58cc9d96a8203de94591b
      history:  > ✅  > ✅  > ❌  > ✅  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
