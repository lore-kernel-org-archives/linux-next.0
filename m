Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6ABD1E7660
	for <linux-next@vger.kernel.org>; Sat, 26 Sep 2026 02:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790389838; cv=none; b=sWwsuMGTQcOn45uqp0OYM5v7cutCZiSuAHG41F9keoIU3/dWjIHrnnHBJYYAfp7IXkoJykpZRzFATgh21mIt4vWXHT5lH3snqXMma+kPwX1opx2hFeCaWmZhLUqqNvX0fwx3OTYqfWes4ubWsoP9QMyXohKNcRoLAR4aNXJ7Pp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790389838; c=relaxed/simple;
	bh=iEuxUaF3XTHsT0i+Gvl29Jf1t/yJ84vsWEkWEFkB+64=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=jN94PtLaC28/WQiDzpoAaQUDQ7ycPpnA8AuoR0fM+uLJvmQupGuCHmhCsmVT9YdOdYOWABlrUW6Ajbr8qnpR9jNPXBr3ci6H0TfTWAorcXEgwEi09pqlPaidRNUvzwZcZk8kfzQT2d5YiU6QqDgMJULIEDZsdCU9+NdOIf8wqdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=GOcTWvRf; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="GOcTWvRf"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-33c0d931083so510545eec.1
        for <linux-next@vger.kernel.org>; Fri, 25 Sep 2026 19:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1790389835; x=1790994635; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nhcO8smS1HznpEzkOQQyuutzdEmz0wJ7BKmz2RUbHtU=;
        b=GOcTWvRfcDE3K/ohhBRrIlA+s9C8sm15CCOLRN8S4TNB6AOyA1+oLxUcyPlwuRLfQB
         ADSVgjvN7Y9h0EvrHawpa4FkKJtB7A8Nd70bUKyL4mYCOXbJ28rDCXHlPN3BFwlmJ5Bv
         QhbB1ebgW0X1ZZ2eVYpPKUlhKqR2PlTuI4OfBbYQ9VUSpNa8JISKeRyvS3X6sAN1Ee9c
         jjwO9PqVJnS5HWeZjVPesDUGTXeKZH6/w9Zu+LPQozRFLNn/YQmq9vEq9WsNa5d6P3FS
         j2R3slYQyosNf/wMNwWmpPQMOLXMvPfw1eBWb4yWlAuxhCrR7hzCaGyzLIgcnb95Z0IZ
         1d7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790389835; x=1790994635;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nhcO8smS1HznpEzkOQQyuutzdEmz0wJ7BKmz2RUbHtU=;
        b=GCPlEWoS1p+bLBZQBCiEEy2axHCU69/x/xZQcYXAv0ustEuaQF8/flZZhy53g+BIkJ
         AK9Z3p5ic3EL/3D+4YgwI3kNyj1CvzArrucECHbujVzSFUMOCWgbMw7GZNBGSuNBZKV+
         Z6bhCCgZbLJo7toMXuEAAs2DB+ICy3SUh+J1gBWbqTt3hz2hhn5NrgGsod0ukmhy8bjX
         P1zV5jtKYVuvW9/LN+u6aHJWI5WlmMRidqORk4omly9jiXB2S/uCNe4FOdhmHi/yzDrX
         oRYGcxxf9HZyd0psLmCopH69gzitz5otBur8I9kmXLAvvFMBiGTuLsGUEUlqwWPO8JA8
         Yxaw==
X-Gm-Message-State: AFuF++lwUsQHG7Jv5q/Pb9z4bRlOAePmChb6R7AlP3wZc8GJIeP0wykA
	yzuIBZlXJKWeJn/LwTOwg8W+duD1VRPF1bVN+5zWmkuPG+vtk/FQYyFRrMhGRQuiGffZbvF62bX
	rKsDl
X-Gm-Gg: AYBFou0IDgxWDKp1tavOLBZXpTDUNmEQ2/Do8XF1sZB+zQ3YMdfGDzZylyhcUoN/4nC
	zIwY+rKNahi3ktiGwhhWvtsrRSHsTysmETM3VcjH2JRYzlZ4GuYnw/3/KSxvtMyFbUIEQHUGEF+
	V+A3qcE6Bcif4zYdgZ9zTIoUaH274VIqY+uiIE3Swbmz0kpdFkkAIUmf/6oLSA8NTKSK2YHxxv7
	XDOYZRNtpkr6SWwO+fcTAC4dgrMkFV9TNIj6aws9DmIzGr9k2PKGX8k9j0guCXqySjNttAxy3LV
	mvFfrwZwLxkroqxSR+b0EE9ddtyKnN1qF1UonVjCtvetsy2dZdFRm9gT6SvmfnyoVSpSXtGymRJ
	8gtDYXXHVdp23xIZ2r5aGtQ1QwvWQjbDa1pJIzBayXsKkI8jgVzYu1CQXRlb1rSvYDCUNSNuaRJ
	THRWxSIp3R7TJn1soK6jXEuI5iqw7yNl7oaHkOqcmjivRysTao2MfOEE5RIrsCsqk=
X-Received: by 2002:a05:701b:2512:b0:144:e523:284c with SMTP id a92af1059eb24-146d03a104emr1574582c88.18.1790389834586;
        Fri, 25 Sep 2026 19:30:34 -0700 (PDT)
Received: from ec7b70f3a45c ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-146bb6551d9sm3180494c88.9.2026.09.25.19.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 19:30:34 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - f5f84daefcd92d7a630066635ecea1433ed5eac7
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sat, 26 Sep 2026 02:30:33 -0000
Message-ID: <179038983337.594168.573709144911248204@ec7b70f3a45c>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/f5f84daefcd92d7a630066635ecea1433ed5eac7/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: f5f84daefcd92d7a630066635ecea1433ed5eac7
origin: maestro
test start time: 2026-09-25 16:39:25.062000+00:00

Builds:	   69 ✅    1 ❌    0 ⚠️
Boots: 	  124 ✅   28 ❌    0 ⚠️
Tests: 	37455 ✅ 3494 ❌ 5069 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: acer-cbv514-1h-34uz-brya
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ab6b6bd5ec73975aad91018
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ab6b7775ec73975aad91cfc
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
Hardware: acer-cp514-3wh-r0qs-guybrush
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ab6b6c05ec73975aad9101e
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ab6b76d5ec73975aad91850
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
Hardware: asus-CX3402CVA-brya
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ab6b6c15ec73975aad91021
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ab6b7945ec73975aad91d96
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ab6af885ec73975aad87db6
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ab6b2895ec73975aad8b1c3
      history:  > ✅  > ✅  > ❌  > ❌  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000
      last run: https://d.kernelci.org/test/maestro:6ab6ed485ec73975aadd0d03
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_display-controller_ae01000
      last run: https://d.kernelci.org/test/maestro:6ab6ed485ec73975aadd0d02
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_dsi_ae94000
      last run: https://d.kernelci.org/test/maestro:6ab6ed485ec73975aadd0cfe
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_edp_aea0000
      last run: https://d.kernelci.org/test/maestro:6ab6ed485ec73975aadd0cfc
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_ae94400
      last run: https://d.kernelci.org/test/maestro:6ab6ed485ec73975aadd0cfa
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_phy_aec2a00
      last run: https://d.kernelci.org/test/maestro:6ab6ed485ec73975aadd0cf9
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: r8a779m1-ulcb
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ab6af8d5ec73975aad87e4b
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ab6b26b5ec73975aad8aff6
      history:  > ✅  > ✅  > ❌  > ❌  
            
Hardware: rk3576-rock-4d
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ab6af8f5ec73975aad87e51
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ab6aff65ec73975aad8836a
      history:  > ✅  > ✅  > ❌  > ❌  
            
Hardware: rk3588-rock-5b
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ab6af915ec73975aad87e54
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ab6b0185ec73975aad887b3
      history:  > ✅  > ✅  > ❌  > ❌  
            
Hardware: stm32mp157a-dhcor-avenger96
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ab6be145ec73975aad9ea81
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: mt8390-genio-700-evk
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ab6af8a5ec73975aad87dbc
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ab6b3d85ec73975aad8c2d2
      history:  > ✅  > ✅  > ❌  > ❌  
            
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ab6af8c5ec73975aad87e48
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ab6b2795ec73975aad8b0ba
      history:  > ✅  > ✅  > ❌  > ❌  
            
Hardware: rk3399-rock-pi-4b
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ab6af8e5ec73975aad87e4e
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6ab6b25d5ec73975aad8af77
      history:  > ✅  > ✅  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.mm.mm_ksft_thp_sh_khugepaged
      last run: https://d.kernelci.org/test/maestro:6ab6c9685ec73975aadad011
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_thp_sh_khugepaged_-s_2
      last run: https://d.kernelci.org/test/maestro:6ab6c9685ec73975aadad012
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: nvidia-p3809-gb300
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.mm.mm_ksft_thp_sh_khugepaged
      last run: https://d.kernelci.org/test/maestro:6ab6daaa5ec73975aadbf45e
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.mm.mm_ksft_thp_sh_khugepaged_-s_2
      last run: https://d.kernelci.org/test/maestro:6ab6daaa5ec73975aadbf45f
      history:  > ❌  > ❌  > ✅  > ✅  
            
Hardware: sm8750-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.breakpoints
      last run: https://d.kernelci.org/test/maestro:6ab6c6d45ec73975aadaa03b
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.breakpoints.breakpoints_step_after_suspend_test
      last run: https://d.kernelci.org/test/maestro:6ab6d3ae5ec73975aadb65ff
      history:  > ❌  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.mm.mm_ksft_gup_test_sh
      last run: https://d.kernelci.org/test/maestro:6ab6c9685ec73975aadacfcd
      history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ab6b7035ec73975aad91346
      history:  > ❌  > ✅  > ❌  > ✅  > ❌  
            
Hardware: nvidia-p3809-gb300
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - kselftest.mm.mm_ksft_gup_test_sh
      last run: https://d.kernelci.org/test/maestro:6ab6daaa5ec73975aadbf416
      history:  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ab6b7ad5ec73975aad91ee9
      history:  > ❌  > ✅  > ❌  > ✅  > ❌  
            
Hardware: qemu-arm64
  > Config: defconfig+netdev+nfs-root-boot+ltp
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ab6cd875ec73975aadb3161
      history:  > ❌  > ✅  > ✅  > ❌  > ✅  
            
Hardware: sun50i-a64-pine64-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_pcm-test_default_time7_sun50ia64audio_0_0_PLAYBACK
      last run: https://d.kernelci.org/test/maestro:6ab6d3d45ec73975aadb6719
      history:  > ✅  > ❌  > ✅  > ✅  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
