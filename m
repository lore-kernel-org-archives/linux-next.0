Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CFA14A8B
	for <linux-next@vger.kernel.org>; Sun,  4 Oct 2026 02:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791081037; cv=none; b=HcpHSr5tCWulH5sUQRhZ0v6lwKo9aKEnHaX0ImXAWBQpJHI9VcdkZ9aZ6ygAwMDxbxwdDGlgKlMqhtFSztoPMha+/1wurscDVZMd0KjrzUtqWWqMkPtuFivYePxSCAoQEb3GgEkUZnJ1HYI4TYu+cefzuwqJzd4crgsQVqRJ+Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791081037; c=relaxed/simple;
	bh=GvEi7SdPp0+PD+aqTDNf2MsQ5vUdRhz/1eJatmj3E9g=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=jbIQmyT+Os3LfHAkQwF+WhXUiZELqTXp7RIlQKbk7JpuIm5ngHiA/c/bUV+sT6ULtNSLTq74nSAU1X0w3wWOvbc47BV8zM+zgCCCH2Q4svUZurrOIsG/JZ+PmzKWnLBKBdPBafDVTi14J5HwBCPQI4UabumPjvF8BG/ESC4T5gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=VWQjq7oj; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="VWQjq7oj"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35125d5e9ccso61622eec.0
        for <linux-next@vger.kernel.org>; Sat, 03 Oct 2026 19:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1791081034; x=1791685834; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EsRPzwqjijKQXwLbnU5ccIfbka9/BkrHsvONoiqBDwA=;
        b=VWQjq7ojjTGvhzOb2rwUazhl6xPIne9VYM2nrUoc6oQ4DS0kr3tOGmIRTjxX1xITLk
         uzO1CeGyE1GKmK/tLA79P9EoPHZJWQcG8qBBnjhOc9oxT506sUdfLTaXhY1UACCAe0l4
         B641jLkyThQ/xX/f6hiOALpowGFpX10zAXXmCuYGrWKjrLIvAfVPmOrne2h0aaV+rTPE
         uFWTaA7eGYZRdVY5xPOOIdFtDabEG7YM3O5MtjgxASGAd1INa//XlDSo2yD7tBzaKzVb
         sxTg6YaGM0QWqHcrq1opxwUafOm3bhH1EU/ZcPpqXmfa01CrFp0w28MeBYMosU5aZKQe
         y8IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791081034; x=1791685834;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EsRPzwqjijKQXwLbnU5ccIfbka9/BkrHsvONoiqBDwA=;
        b=W4x/Y7Hv7HRK6LvT8+OTViovdkaAqAZ5cnuP8l799rOn8GZ1M6IcYlfHeC16PA2nl+
         vgvYp6Keb+T/W2jiOZHVH0DH1LxY3oBb7EQ8x/vDr3aUrzK708ICei3u8x5KCMPsWxFB
         wVjmL/wtN7YdYbNC0Ls/FnRmtQzPXYDHaTKMakVv/hMjSdr1VTjDaR+MbE8vIExtPmV0
         WoLPttypqvd9wG3OWtNVtF5LDTGg7x6O22FNOwCi5XPxVXOVtyUpOCksZ+DyVaTdby+k
         p/60UtgTUgCVLSwgWZyx22/DTJZRvT541ZvHLfpdpYPVFNELwtUXu4iCyGcNs864NjTx
         Ibhg==
X-Gm-Message-State: AFq9FYKOBMsBfcSGXEweopu4y0pH4dmr0jkcLRqbjw6GFHtIt8wxGJnE
	fIT1SEHNisjPknQk2Ne6tC6eg3fDLrpcMOmHEWnOx1tKFVZ4AUvvP7S7UiygtfKXKnQ=
X-Gm-Gg: AYBFou0ptb7ASWADixt/GoYZBumESO4M415Kd7Uw41Ishe9GzJfNJsMtUgM2ZwkFEBy
	D38usMgsb9NAvEhGoFwVPtD5MdzJ4zLbE9OkMqQs73cmjkIV+GxnR4kai0MrOSHB9A2IaHoGqQq
	KywUdDDqltBEsYNaQigU7Mr3m37AgN7puPR4AhaD0Fx5t9fS/BZU4tY39gpn0NvlrWMAUpKWouq
	d9UBjEKGTCAbn9r29AAQmWqg3Vc4cwadZFIk89LcyxNWfrxdC+HJ+mwO1yXxJTI1TaHzP6ujMOg
	WlM3i2ArWtzj+xWX6lxE1qJ1hCR366c+4tx/iEz946fD03vr5Gbz6cKjh7Uf2Mv/s2z38Zvq8iV
	ejTo87S9uk/qz4IQ6rUMyn2zXzWDqJ0Jn65IaPNX0w+/K1e8WnKNPvmxBGpIUuwDBwgXT+1ABP7
	WllTw5xQ/y5mW5mzgdiF4gtex4cMxFCr5lRmugdaC+SQC7wu6jB7cSf54oJz57yXQ=
X-Received: by 2002:a05:7300:5b9e:b0:33b:ecf4:7f80 with SMTP id 5a478bee46e88-34db71eaab9mr15575442eec.22.1791081033840;
        Sat, 03 Oct 2026 19:30:33 -0700 (PDT)
Received: from 5a6d9a2c18a2 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35127136b8esm864160eec.6.2026.10.03.19.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 19:30:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - f0406245cb9855e6318335a8a223551354291a46
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sun, 04 Oct 2026 02:30:32 -0000
Message-ID: <179108103263.282967.17365690763672912273@5a6d9a2c18a2>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/f0406245cb9855e6318335a8a223551354291a46/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: f0406245cb9855e6318335a8a223551354291a46
origin: maestro
test start time: 2026-10-03 01:01:06.885000+00:00

Builds:	   74 ✅    1 ❌    0 ⚠️
Boots: 	  180 ✅   11 ❌    0 ⚠️
Tests: 	36362 ✅ 3357 ❌ 4525 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.kvm.kvm_nested_tsc_scaling_test
      last run: https://d.kernelci.org/test/maestro:6ac09e74a3f195e1aa277453
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.kvm.kvm_set_memory_region_test
      last run: https://d.kernelci.org/test/maestro:6ac09e74a3f195e1aa277423
      history:  > ✅  > ✅  > ❌  > ❌  
            
Hardware: nvidia-p3809-gb300
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.kvm.kvm_arch_timer_edge_cases
      last run: https://d.kernelci.org/test/maestro:6ac0ddaaa3f195e1aa29ca5d
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.kvm.kvm_set_id_regs
      last run: https://d.kernelci.org/test/maestro:6ac0ddaaa3f195e1aa29cae8
      history:  > ✅  > ✅  > ❌  
            
Hardware: purwa-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_bc0000_i2c_b80000_keyboard_3a
      last run: https://d.kernelci.org/test/maestro:6ac092c0a3f195e1aa271443
      history:  > ✅  > ✅  > ❌  
            
Hardware: stm32mp157a-dhcor-avenger96
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp.shmctl05
      last run: https://d.kernelci.org/test/maestro:6ac07ca1a3f195e1aa25677c
      history:  > ✅  > ✅  > ❌  
            
      - ltp.shmget03
      last run: https://d.kernelci.org/test/maestro:6ac07ca1a3f195e1aa256553
      history:  > ✅  > ❌  > ❌  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-04
      last run: https://d.kernelci.org/test/maestro:6ac06838a3f195e1aa249581
      history:  > ✅  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: acer-cbv514-1h-34uz-brya
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ac066f1a3f195e1aa248459
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ac0676da3f195e1aa248bd9
      history:  > ❌  > ❌  > ✅  > ✅  
            
Hardware: acer-cp514-3wh-r0qs-guybrush
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ac066f3a3f195e1aa24845f
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ac067a1a3f195e1aa248e21
      history:  > ❌  > ❌  > ✅  > ✅  
            
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ac06509a3f195e1aa245409
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ac0a5eda3f195e1aa27b3c7
      history:  > ❌  > ❌  > ✅  > ✅  
            
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ac0694ba3f195e1aa24a350
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: hamoa-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device-error-logs
      last run: https://d.kernelci.org/test/maestro:6ac06b25a3f195e1aa24c2a5
      history:  > ❌  > ❌  > ✅  
            
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.cgroup.cgroup_test_core
      last run: https://d.kernelci.org/test/maestro:6ac09e65a3f195e1aa276c27
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_destroy
      last run: https://d.kernelci.org/test/maestro:6ac09e65a3f195e1aa276c24
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.kvm.kvm_nested_x2apic_test
      last run: https://d.kernelci.org/test/maestro:6ac09e74a3f195e1aa277455
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: imx6q-sabrelite
  > Config: multi_v7_defconfig+preempt_rt
    - Architecture/compiler: arm/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ac05d73a3f195e1aa23f11c
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ac0736ea3f195e1aa254499
      history:  > ❌  > ❌  > ✅  > ✅  
            
Hardware: jetson-agx-orin-industrial-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_core
      last run: https://d.kernelci.org/test/maestro:6ac0997ba3f195e1aa274065
      history:  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_destroy
      last run: https://d.kernelci.org/test/maestro:6ac0997ba3f195e1aa274062
      history:  > ❌  > ✅  
            
Hardware: jetson-orin-nano-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_core
      last run: https://d.kernelci.org/test/maestro:6ac0afd6a3f195e1aa2812e0
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_destroy
      last run: https://d.kernelci.org/test/maestro:6ac0afd6a3f195e1aa2812dd
      history:  > ❌  > ❌  > ✅  
            
Hardware: jetson-orin-nx-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_core
      last run: https://d.kernelci.org/test/maestro:6ac097cfa3f195e1aa2729b3
      history:  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_destroy
      last run: https://d.kernelci.org/test/maestro:6ac097cfa3f195e1aa2729b0
      history:  > ❌  > ✅  
            
Hardware: nvidia-igx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_core
      last run: https://d.kernelci.org/test/maestro:6ac09847a3f195e1aa272df5
      history:  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_destroy
      last run: https://d.kernelci.org/test/maestro:6ac09847a3f195e1aa272df2
      history:  > ❌  > ✅  
            
Hardware: nvidia-p3809-gb300
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_core
      last run: https://d.kernelci.org/test/maestro:6ac0dd9ba3f195e1aa29c334
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_destroy
      last run: https://d.kernelci.org/test/maestro:6ac0dd9ba3f195e1aa29c331
      history:  > ❌  > ❌  > ✅  
            
Hardware: purwa-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6ac06b59a3f195e1aa24d16e
      history:  > ❌  > ✅  
            
      - kselftest.timers.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:6ac09a6ca3f195e1aa274fa0
      history:  > ❌  > ✅  
            
Hardware: r8a779m1-ulcb
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ac0650fa3f195e1aa245436
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ac06df6a3f195e1aa2510d4
      history:  > ❌  > ❌  > ✅  > ✅  
            
Hardware: rk3576-rock-4d
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ac06512a3f195e1aa24543c
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ac06588a3f195e1aa246748
      history:  > ❌  > ❌  > ✅  > ✅  
            
Hardware: rk3588-rock-5b
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ac06513a3f195e1aa24543f
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ac06598a3f195e1aa24681e
      history:  > ❌  > ❌  > ✅  > ✅  
            
Hardware: sun50i-a64-pine64-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:6ac06bd9a3f195e1aa24e463
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-01-intra-1417
      last run: https://d.kernelci.org/test/maestro:6ac066a3a3f195e1aa248203
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-03
      last run: https://d.kernelci.org/test/maestro:6ac066a3a3f195e1aa2481fc
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: exynos850-e850-96
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6ac07ef7a3f195e1aa25c8c8
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.breakpoints
      last run: https://d.kernelci.org/test/maestro:6ac07ef7a3f195e1aa25c8cb
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ac07ef7a3f195e1aa25c8c2
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: mt8390-genio-700-evk
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ac0650da3f195e1aa245430
      history:  > ❌  > ❌  > ✅  > ✅  
            
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ac0650ea3f195e1aa245433
      history:  > ❌  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ac06e71a3f195e1aa2518d8
      history:  > ❌  > ✅  
            
Hardware: rk3399-rock-pi-4b
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ac06511a3f195e1aa245439
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ac06928a3f195e1aa24a0d0
      history:  > ❌  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: hamoa-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.devices-probe
      last run: https://d.kernelci.org/test/maestro:6ac06b86a3f195e1aa24df1a
      history:  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_bc0000_i2c_b80000_touchpad_15
      last run: https://d.kernelci.org/test/maestro:6ac07448a3f195e1aa254823
      history:  > ✅  > ❌  > ✅  
            
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.cgroup.cgroup_test_core_test_cgcore_internal_process_constraint
      last run: https://d.kernelci.org/test/maestro:6ac09e65a3f195e1aa276c1b
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_invalid_domain
      last run: https://d.kernelci.org/test/maestro:6ac09e65a3f195e1aa276c20
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_lesser_ns_open
      last run: https://d.kernelci.org/test/maestro:6ac09e65a3f195e1aa276c26
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_no_internal_process_constraint_on_threads
      last run: https://d.kernelci.org/test/maestro:6ac09e65a3f195e1aa276c1e
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_parent_becomes_threaded
      last run: https://d.kernelci.org/test/maestro:6ac09e65a3f195e1aa276c1f
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_populated
      last run: https://d.kernelci.org/test/maestro:6ac09e65a3f195e1aa276c21
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_top_down_constraint_disable
      last run: https://d.kernelci.org/test/maestro:6ac09e65a3f195e1aa276c1d
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_top_down_constraint_enable
      last run: https://d.kernelci.org/test/maestro:6ac09e65a3f195e1aa276c1c
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_cpu
      last run: https://d.kernelci.org/test/maestro:6ac09e65a3f195e1aa276c31
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_cpuset
      last run: https://d.kernelci.org/test/maestro:6ac09e65a3f195e1aa276c36
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_cpuset_prs_sh
      last run: https://d.kernelci.org/test/maestro:6ac09e66a3f195e1aa276d81
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_freezer
      last run: https://d.kernelci.org/test/maestro:6ac09e65a3f195e1aa276c48
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_kill
      last run: https://d.kernelci.org/test/maestro:6ac09e65a3f195e1aa276c4f
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6ac09e65a3f195e1aa276c56
      history:  > ⚠️  > ⚠️  > ⚠️  > ❌  
            
      - kselftest.cgroup.cgroup_test_memcontrol
      last run: https://d.kernelci.org/test/maestro:6ac09e65a3f195e1aa276c67
      history:  > ⚠️  > ⚠️  > ⚠️  > ❌  
            
      - kselftest.cgroup.cgroup_test_pids
      last run: https://d.kernelci.org/test/maestro:6ac09e65a3f195e1aa276c6a
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_stress_sh
      last run: https://d.kernelci.org/test/maestro:6ac09e66a3f195e1aa276d80
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ac05f3aa3f195e1aa23fb6e
      history:  > ❌  > ✅  > ❌  > ✅  > ❌  
            
Hardware: jetson-agx-orin-industrial-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_core_test_cgcore_internal_process_constraint
      last run: https://d.kernelci.org/test/maestro:6ac0997ba3f195e1aa274059
      history:  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_invalid_domain
      last run: https://d.kernelci.org/test/maestro:6ac0997ba3f195e1aa27405e
      history:  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_lesser_ns_open
      last run: https://d.kernelci.org/test/maestro:6ac0997ba3f195e1aa274064
      history:  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_no_internal_process_constraint_on_threads
      last run: https://d.kernelci.org/test/maestro:6ac0997ba3f195e1aa27405c
      history:  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_parent_becomes_threaded
      last run: https://d.kernelci.org/test/maestro:6ac0997ba3f195e1aa27405d
      history:  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_populated
      last run: https://d.kernelci.org/test/maestro:6ac0997ba3f195e1aa27405f
      history:  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_top_down_constraint_disable
      last run: https://d.kernelci.org/test/maestro:6ac0997ba3f195e1aa27405b
      history:  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_top_down_constraint_enable
      last run: https://d.kernelci.org/test/maestro:6ac0997ba3f195e1aa27405a
      history:  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_cpu
      last run: https://d.kernelci.org/test/maestro:6ac0997ba3f195e1aa27406f
      history:  > ⚠️  > ❌  
            
      - kselftest.cgroup.cgroup_test_cpuset
      last run: https://d.kernelci.org/test/maestro:6ac0997ba3f195e1aa274074
      history:  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_cpuset_prs_sh
      last run: https://d.kernelci.org/test/maestro:6ac0997ba3f195e1aa2740db
      history:  > ⚠️  > ❌  
            
      - kselftest.cgroup.cgroup_test_freezer
      last run: https://d.kernelci.org/test/maestro:6ac0997ba3f195e1aa274086
      history:  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_kill
      last run: https://d.kernelci.org/test/maestro:6ac0997ba3f195e1aa27408d
      history:  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6ac0997ba3f195e1aa274094
      history:  > ⚠️  > ❌  
            
      - kselftest.cgroup.cgroup_test_memcontrol
      last run: https://d.kernelci.org/test/maestro:6ac0997ba3f195e1aa2740a5
      history:  > ⚠️  > ❌  
            
      - kselftest.cgroup.cgroup_test_pids
      last run: https://d.kernelci.org/test/maestro:6ac0997ba3f195e1aa2740a8
      history:  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_stress_sh
      last run: https://d.kernelci.org/test/maestro:6ac0997ba3f195e1aa2740da
      history:  > ⚠️  > ✅  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ac07efca3f195e1aa25c919
      history:  > ✅  > ❌  > ✅  > ❌  
            
Hardware: jetson-orin-nano-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_core_test_cgcore_internal_process_constraint
      last run: https://d.kernelci.org/test/maestro:6ac0afd6a3f195e1aa2812d4
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_invalid_domain
      last run: https://d.kernelci.org/test/maestro:6ac0afd6a3f195e1aa2812d9
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_lesser_ns_open
      last run: https://d.kernelci.org/test/maestro:6ac0afd6a3f195e1aa2812df
      history:  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_parent_becomes_threaded
      last run: https://d.kernelci.org/test/maestro:6ac0afd6a3f195e1aa2812d8
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_populated
      last run: https://d.kernelci.org/test/maestro:6ac0afd6a3f195e1aa2812da
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_top_down_constraint_disable
      last run: https://d.kernelci.org/test/maestro:6ac0afd6a3f195e1aa2812d6
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_top_down_constraint_enable
      last run: https://d.kernelci.org/test/maestro:6ac0afd6a3f195e1aa2812d5
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_cpuset
      last run: https://d.kernelci.org/test/maestro:6ac0afd6a3f195e1aa2812e6
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_freezer
      last run: https://d.kernelci.org/test/maestro:6ac0afd6a3f195e1aa2812f8
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_kill
      last run: https://d.kernelci.org/test/maestro:6ac0afd6a3f195e1aa2812ff
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6ac0afd6a3f195e1aa281306
      history:  > ⚠️  > ⚠️  > ⚠️  > ❌  
            
      - kselftest.cgroup.cgroup_test_memcontrol
      last run: https://d.kernelci.org/test/maestro:6ac0afd6a3f195e1aa281317
      history:  > ⚠️  > ⚠️  > ⚠️  > ❌  
            
      - kselftest.cgroup.cgroup_test_pids
      last run: https://d.kernelci.org/test/maestro:6ac0afd6a3f195e1aa28131a
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_stress_sh
      last run: https://d.kernelci.org/test/maestro:6ac0afd6a3f195e1aa281370
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
Hardware: jetson-orin-nx-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_core_test_cgcore_internal_process_constraint
      last run: https://d.kernelci.org/test/maestro:6ac097cfa3f195e1aa2729a7
      history:  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_invalid_domain
      last run: https://d.kernelci.org/test/maestro:6ac097cfa3f195e1aa2729ac
      history:  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_lesser_ns_open
      last run: https://d.kernelci.org/test/maestro:6ac097cfa3f195e1aa2729b2
      history:  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_no_internal_process_constraint_on_threads
      last run: https://d.kernelci.org/test/maestro:6ac097cfa3f195e1aa2729aa
      history:  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_parent_becomes_threaded
      last run: https://d.kernelci.org/test/maestro:6ac097cfa3f195e1aa2729ab
      history:  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_populated
      last run: https://d.kernelci.org/test/maestro:6ac097cfa3f195e1aa2729ad
      history:  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_top_down_constraint_disable
      last run: https://d.kernelci.org/test/maestro:6ac097cfa3f195e1aa2729a9
      history:  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_top_down_constraint_enable
      last run: https://d.kernelci.org/test/maestro:6ac097cfa3f195e1aa2729a8
      history:  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_cpu
      last run: https://d.kernelci.org/test/maestro:6ac097cfa3f195e1aa2729bd
      history:  > ⚠️  > ❌  
            
      - kselftest.cgroup.cgroup_test_cpuset
      last run: https://d.kernelci.org/test/maestro:6ac097cfa3f195e1aa2729c2
      history:  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_freezer
      last run: https://d.kernelci.org/test/maestro:6ac097cfa3f195e1aa2729d4
      history:  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_kill
      last run: https://d.kernelci.org/test/maestro:6ac097cfa3f195e1aa2729db
      history:  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6ac097cfa3f195e1aa2729e2
      history:  > ⚠️  > ❌  
            
      - kselftest.cgroup.cgroup_test_memcontrol
      last run: https://d.kernelci.org/test/maestro:6ac097cfa3f195e1aa2729f3
      history:  > ⚠️  > ❌  
            
      - kselftest.cgroup.cgroup_test_pids
      last run: https://d.kernelci.org/test/maestro:6ac097cfa3f195e1aa2729f6
      history:  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_stress_sh
      last run: https://d.kernelci.org/test/maestro:6ac097d0a3f195e1aa272a34
      history:  > ⚠️  > ✅  
            
Hardware: nvidia-igx-orin-devkit
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_core_test_cgcore_internal_process_constraint
      last run: https://d.kernelci.org/test/maestro:6ac09847a3f195e1aa272de9
      history:  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_invalid_domain
      last run: https://d.kernelci.org/test/maestro:6ac09847a3f195e1aa272dee
      history:  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_lesser_ns_open
      last run: https://d.kernelci.org/test/maestro:6ac09847a3f195e1aa272df4
      history:  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_no_internal_process_constraint_on_threads
      last run: https://d.kernelci.org/test/maestro:6ac09847a3f195e1aa272dec
      history:  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_parent_becomes_threaded
      last run: https://d.kernelci.org/test/maestro:6ac09847a3f195e1aa272ded
      history:  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_populated
      last run: https://d.kernelci.org/test/maestro:6ac09847a3f195e1aa272def
      history:  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_top_down_constraint_disable
      last run: https://d.kernelci.org/test/maestro:6ac09847a3f195e1aa272deb
      history:  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_top_down_constraint_enable
      last run: https://d.kernelci.org/test/maestro:6ac09847a3f195e1aa272dea
      history:  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_cpu
      last run: https://d.kernelci.org/test/maestro:6ac09847a3f195e1aa272dff
      history:  > ⚠️  > ❌  
            
      - kselftest.cgroup.cgroup_test_cpuset
      last run: https://d.kernelci.org/test/maestro:6ac09847a3f195e1aa272e04
      history:  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_cpuset_prs_sh
      last run: https://d.kernelci.org/test/maestro:6ac09847a3f195e1aa272e6b
      history:  > ⚠️  > ❌  
            
      - kselftest.cgroup.cgroup_test_freezer
      last run: https://d.kernelci.org/test/maestro:6ac09847a3f195e1aa272e16
      history:  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_kill
      last run: https://d.kernelci.org/test/maestro:6ac09847a3f195e1aa272e1d
      history:  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6ac09847a3f195e1aa272e24
      history:  > ⚠️  > ❌  
            
      - kselftest.cgroup.cgroup_test_memcontrol
      last run: https://d.kernelci.org/test/maestro:6ac09847a3f195e1aa272e35
      history:  > ⚠️  > ❌  
            
      - kselftest.cgroup.cgroup_test_pids
      last run: https://d.kernelci.org/test/maestro:6ac09847a3f195e1aa272e38
      history:  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_stress_sh
      last run: https://d.kernelci.org/test/maestro:6ac09847a3f195e1aa272e6a
      history:  > ⚠️  > ✅  
            
Hardware: nvidia-p3809-gb300
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.cgroup.cgroup_test_core_test_cgcore_internal_process_constraint
      last run: https://d.kernelci.org/test/maestro:6ac0dd9ba3f195e1aa29c328
      history:  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_invalid_domain
      last run: https://d.kernelci.org/test/maestro:6ac0dd9ba3f195e1aa29c32d
      history:  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_lesser_ns_open
      last run: https://d.kernelci.org/test/maestro:6ac0dd9ba3f195e1aa29c333
      history:  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_no_internal_process_constraint_on_threads
      last run: https://d.kernelci.org/test/maestro:6ac0dd9ba3f195e1aa29c32b
      history:  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_parent_becomes_threaded
      last run: https://d.kernelci.org/test/maestro:6ac0dd9ba3f195e1aa29c32c
      history:  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_populated
      last run: https://d.kernelci.org/test/maestro:6ac0dd9ba3f195e1aa29c32e
      history:  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_top_down_constraint_disable
      last run: https://d.kernelci.org/test/maestro:6ac0dd9ba3f195e1aa29c32a
      history:  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_core_test_cgcore_top_down_constraint_enable
      last run: https://d.kernelci.org/test/maestro:6ac0dd9ba3f195e1aa29c329
      history:  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_cpu
      last run: https://d.kernelci.org/test/maestro:6ac0dd9ba3f195e1aa29c33e
      history:  > ⚠️  > ⚠️  > ❌  
            
      - kselftest.cgroup.cgroup_test_cpuset
      last run: https://d.kernelci.org/test/maestro:6ac0dd9ba3f195e1aa29c343
      history:  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_cpuset_prs_sh
      last run: https://d.kernelci.org/test/maestro:6ac0dd9ca3f195e1aa29c3b6
      history:  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_freezer
      last run: https://d.kernelci.org/test/maestro:6ac0dd9ba3f195e1aa29c355
      history:  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_kill
      last run: https://d.kernelci.org/test/maestro:6ac0dd9ba3f195e1aa29c35c
      history:  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_kmem
      last run: https://d.kernelci.org/test/maestro:6ac0dd9ba3f195e1aa29c363
      history:  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_memcontrol
      last run: https://d.kernelci.org/test/maestro:6ac0dd9ba3f195e1aa29c374
      history:  > ⚠️  > ⚠️  > ❌  
            
      - kselftest.cgroup.cgroup_test_pids
      last run: https://d.kernelci.org/test/maestro:6ac0dd9ba3f195e1aa29c377
      history:  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.cgroup.cgroup_test_stress_sh
      last run: https://d.kernelci.org/test/maestro:6ac0dd9ca3f195e1aa29c3b5
      history:  > ⚠️  > ⚠️  > ✅  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ac07efca3f195e1aa25c91c
      history:  > ❌  > ✅  > ❌  > ✅  > ❌  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp9.VP9-TEST-VECTORS-GStreamer-VP9-V4L2.vp90-2-15-segkey-webm
      last run: https://d.kernelci.org/test/maestro:6ac0686ba3f195e1aa24975a
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
Hardware: sc7180-trogdor-wormdingler-rev1-boe
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-01-intra-1416
      last run: https://d.kernelci.org/test/maestro:6ac066a3a3f195e1aa248204
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-01
      last run: https://d.kernelci.org/test/maestro:6ac066a3a3f195e1aa2481fe
      history:  > ✅  > ❌  > ✅  > ❌  > ❌  
            
      - fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2.vp80-03-segmentation-02
      last run: https://d.kernelci.org/test/maestro:6ac066a3a3f195e1aa2481fd
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - fluster.debian.v4l2.gstreamer_vp9.VP9-TEST-VECTORS-GStreamer-VP9-V4L2.vp90-2-15-segkey-webm
      last run: https://d.kernelci.org/test/maestro:6ac06822a3f195e1aa2492df
      history:  > ❌  > ❌  > ✅  > ✅  > ❌  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
