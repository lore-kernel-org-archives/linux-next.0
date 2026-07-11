Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CE413D51E
	for <linux-next@vger.kernel.org>; Sat, 11 Jul 2026 02:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783737017; cv=none; b=GkuueK8JTdAhmI1+wlwdIv9Jb1jAu9OcGSTcDFveNZJ/eC9TXkbRQ9CWKJ/GxHKG7IIDijn27riuk00XLPQ6XKE5ZOonoBq9aime4/95fkJVQJwnoo+E4zYH0bOYwJg9nrAiW62HYDdkxT9d2CURA4pRglrqAJmgT4SwMAxjMPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783737017; c=relaxed/simple;
	bh=VwCb1I6HxpZ48V4RmYN1DdF1pY1bnvE2aeOabmfg0e8=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=Oz6XUpCkODbGHmGMda7/456aLf1UGReMrQto/sP5yrm4scDlP2j+9VCXo/P3I8U9oiI8UkTqU5b4s84x1tH01r87bxSySF5TN+5K6a7/LhXxy8eLCHuD6NGQ1TrkVugVbk3zZSGQ5VuFpCFK5MHgbRUEZqMw7eaFWPvsriDW8Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=CYcaf0lg; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="CYcaf0lg"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so1293833a91.0
        for <linux-next@vger.kernel.org>; Fri, 10 Jul 2026 19:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1783737015; x=1784341815; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MxQijK9zNlRfll8HJbEZ5l5n0PLeoKjp8oAcTR75OEo=;
        b=CYcaf0lg1nrzgnIc2t00YBOW+0/C2/bYJeRVO9GcH20epB5OioTzd2pZjylWuwUhrA
         J2GePL84GjKVw+kUVHqmYKycXApynwhUauVmcNDrMSisKRC0zO+gmHeL83tVxH9OVPq+
         XZXmR74AiBjrROcMBh8fYsQogGaU94ITLQfH3KB6lZVBo/F/kBt77RtaPuUYyrkek1eB
         /Blqo09pghUW5dhAzgH1EMbecXN7GKFjCRZUrODGYYxnFpIZxyZhsio79AmylhH5wpCn
         5BdDOuwl7vK6k9QGVzwIynyPLZogF5js2aS+1AVWo8brkjOmHr9hOgKuYqRi0f4QQttG
         p8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783737015; x=1784341815;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MxQijK9zNlRfll8HJbEZ5l5n0PLeoKjp8oAcTR75OEo=;
        b=KPc9IUQvk33LiHOCYYS/GP6Rh73aGdDuUVqrEveTejGfFGhDFuyV2PAr063LfVXXvl
         YyQFBA9cvZPWULhYbVXSy2FT4Z9BRNP+x786xTlRg3E6MJ8b8Bqyks0/xt+E4moXSMQi
         Kwt0sO0yuLwDfdyg8/a/6O0yW5Y1KT8D0iq+NzMmnhE1HxEUIxC9xD7hun7gEHhJM7lH
         S3K6ZVtcagKj1Qi48l3+Ywm8405db4omH16eYgKb38zpKcmgjPnXV4bs4lARmgf4OdXU
         Ca+XgbEdI7YOoWWnyViFiIl8VX475X1AIYsH0fPtdUabOvSczoz99PU20BJYP9dDbCcE
         BNnw==
X-Gm-Message-State: AOJu0YxMbqEk1ZD7QwvNY+2x3Ezn/e6XAPHiXBYk2VloYGoG053cPv2j
	MfxowMt4QNjnsJIOcqUw29BZos0avBAycIsnqKNPMhowQFN8JgcSoc0ncbRFEPTHC7ppSw4bj4Y
	DCB4B
X-Gm-Gg: AfdE7ckotuIWSg//B00nJ/ZyNcNjIv3/LXP4JGb5XC4WZGiBbdJNEc0N0HJfpgWViov
	/MeZogqvKAWueNBPiWaCMUywsryVBVnq8wZUE4HjF5zXmH54erASHxvnUXIP598X8dFWSnFJ3z4
	k8LqEEZZG8qaaoR38NR25OXFpmEC+06F69SgLHhq07xZEYHVGGle13QfkDumxjbQEar7xxSYFvI
	ft0VPMqZRqtYUM4tse6D4S07HCJVfbQUfR5ERkCWkyMiBcPJ0NDKnspvzsSxJciHoJFm4kqiIKH
	h4DcKZspyTvHMmv+J+A+UUXvoHrhfFgWdbZ8JMKTW79XpH6RWlK6XodT9UA/SH4lzMX8lKYOKCJ
	t5KLN79tDTeEJsg6m8cXqSb9ZOQTBKuwMJizrGTo0w5jDrUPcBDKl8wF+rkuDfvw0ZRhd23qXoO
	RKWMaHqA==
X-Received: by 2002:a17:90b:1d4e:b0:381:f7a:2e0d with SMTP id 98e67ed59e1d1-38dc781c59cmr1257975a91.33.1783737014451;
        Fri, 10 Jul 2026 19:30:14 -0700 (PDT)
Received: from 963b246bc1b3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311a6115e61sm24863405eec.22.2026.07.10.19.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 19:30:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - bee763d5f341b99cf472afeb508d4988f62a6ca1
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sat, 11 Jul 2026 02:30:13 -0000
Message-ID: <178373701300.8811.9182771892015871755@963b246bc1b3>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/bee763d5f341b99cf472afeb508d4988f62a6ca1/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: bee763d5f341b99cf472afeb508d4988f62a6ca1
origin: maestro
test start time: 2026-07-10 14:19:37.672000+00:00

Builds:	   70 ✅    2 ❌    0 ⚠️
Boots: 	  133 ✅    0 ❌    0 ⚠️
Tests: 	30916 ✅ 4499 ❌ 7662 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: hamoa-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a517a9fc17cca02055b9dd7
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6a518a2cc17cca02055c31c7
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_global_requeue_single
      last run: https://d.kernelci.org/test/maestro:6a518a2cc17cca02055c31c8
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.timers.timers_posix_timers
      last run: https://d.kernelci.org/test/maestro:6a51906bc17cca02055c34d5
      history:  > ✅  > ✅  > ❌  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_pcm-test
      last run: https://d.kernelci.org/test/maestro:6a517e12c17cca02055be1e4
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:6a518087c17cca02055c1822
      history:  > ✅  > ❌  
            
Hardware: kaanapali-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a517aa7c17cca02055b9e11
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6a518067c17cca02055c16ac
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_global_requeue_single
      last run: https://d.kernelci.org/test/maestro:6a518067c17cca02055c16ad
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: qcs615-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.breakpoints
      last run: https://d.kernelci.org/test/maestro:6a517a21c17cca02055b91d7
      history:  > ✅  > ❌  
            
      - kselftest.breakpoints.breakpoints_step_after_suspend_test
      last run: https://d.kernelci.org/test/maestro:6a517c69c17cca02055bc310
      history:  > ✅  > ❌  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a517aa2c17cca02055b9def
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6a518559c17cca02055c298f
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_global_requeue_single
      last run: https://d.kernelci.org/test/maestro:6a518559c17cca02055c2990
      history:  > ✅  > ❌  > ❌  
            
Hardware: qcs9100-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a517aa5c17cca02055b9dff
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_global_requeue_single
      last run: https://d.kernelci.org/test/maestro:6a5187c7c17cca02055c2eee
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: sm8750-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a517aa6c17cca02055b9e08
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6a517e94c17cca02055bffe5
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_global_requeue_single
      last run: https://d.kernelci.org/test/maestro:6a517e94c17cca02055bffe6
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: x1e80100
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a517aabc17cca02055b9e2c
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6a5183a0c17cca02055c2634
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_global_requeue_single
      last run: https://d.kernelci.org/test/maestro:6a5183a0c17cca02055c2635
      history:  > ✅  > ❌  > ❌  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6a518687c17cca02055c2cf9
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_global_requeue_single
      last run: https://d.kernelci.org/test/maestro:6a518687c17cca02055c2cfa
      history:  > ✅  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: bcm2837-rpi-3-b-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:6a517cfcc17cca02055bcb11
      history:  > ❌  > ✅  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:6a517f40c17cca02055c0b44
      history:  > ❌  > ✅  
            
Hardware: hamoa-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers.timers_set-timer-lat
      last run: https://d.kernelci.org/test/maestro:6a51906bc17cca02055c34bd
      history:  > ❌  > ✅  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_mixer-test_write_default_wm8960audio_69
      last run: https://d.kernelci.org/test/maestro:6a517e13c17cca02055be457
      history:  > ❌  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_write_default_wm8960audio_71
      last run: https://d.kernelci.org/test/maestro:6a517e13c17cca02055be465
      history:  > ❌  > ✅  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_iommu_3da0000
      last run: https://d.kernelci.org/test/maestro:6a5183fac17cca02055c27bc
      history:  > ❌  > ❌  > ✅  > ✅  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest-devices-probe-ramdisk
      last run: https://d.kernelci.org/test/maestro:6a517b05c17cca02055ba048
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_5000_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6a518687c17cca02055c2d14
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6a517ac1c17cca02055b9e90
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.timers.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:6a5189bdc17cca02055c3177
      history:  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: hamoa-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers.timers_nsleep-lat
      last run: https://d.kernelci.org/test/maestro:6a51906bc17cca02055c34be
      history:  > ✅  > ❌  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_pcm-test_default_time1_wm8960audio_0_0_CAPTURE
      last run: https://d.kernelci.org/test/maestro:6a517e12c17cca02055be1f0
      history:  > ⚠️  > ❌  
            
      - kselftest.alsa.alsa_pcm-test_default_time1_wm8960audio_0_0_PLAYBACK
      last run: https://d.kernelci.org/test/maestro:6a517e12c17cca02055be1e9
      history:  > ⚠️  > ❌  
            
      - kselftest.alsa.alsa_pcm-test_default_time2_wm8960audio_0_0_CAPTURE
      last run: https://d.kernelci.org/test/maestro:6a517e12c17cca02055be1ef
      history:  > ⚠️  > ❌  
            
      - kselftest.alsa.alsa_pcm-test_default_time2_wm8960audio_0_0_PLAYBACK
      last run: https://d.kernelci.org/test/maestro:6a517e12c17cca02055be1e8
      history:  > ⚠️  > ❌  
            
      - kselftest.alsa.alsa_pcm-test_default_time3_wm8960audio_0_0_CAPTURE
      last run: https://d.kernelci.org/test/maestro:6a517e12c17cca02055be1ee
      history:  > ⚠️  > ❌  
            
      - kselftest.alsa.alsa_pcm-test_default_time3_wm8960audio_0_0_PLAYBACK
      last run: https://d.kernelci.org/test/maestro:6a517e12c17cca02055be1e7
      history:  > ⚠️  > ❌  
            
      - kselftest.alsa.alsa_pcm-test_default_time4_wm8960audio_0_0_CAPTURE
      last run: https://d.kernelci.org/test/maestro:6a517e12c17cca02055be1ed
      history:  > ⚠️  > ❌  
            
      - kselftest.alsa.alsa_pcm-test_default_time4_wm8960audio_0_0_PLAYBACK
      last run: https://d.kernelci.org/test/maestro:6a517e12c17cca02055be1e6
      history:  > ⚠️  > ❌  
            
      - kselftest.alsa.alsa_pcm-test_default_time5_wm8960audio_0_0_CAPTURE
      last run: https://d.kernelci.org/test/maestro:6a517e12c17cca02055be1ec
      history:  > ⚠️  > ❌  
            
      - kselftest.alsa.alsa_pcm-test_default_time5_wm8960audio_0_0_PLAYBACK
      last run: https://d.kernelci.org/test/maestro:6a517e12c17cca02055be1e5
      history:  > ⚠️  > ❌  
            
      - kselftest.alsa.alsa_pcm-test_default_time6_wm8960audio_0_0_CAPTURE
      last run: https://d.kernelci.org/test/maestro:6a517e12c17cca02055be1eb
      history:  > ⚠️  > ❌  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.breakpoints
      last run: https://d.kernelci.org/test/maestro:6a517a24c17cca02055b91dd
      history:  > ❌  > ❌  > ✅  > ❌  
            
Hardware: qcs9100-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest-devices-probe-ramdisk
      last run: https://d.kernelci.org/test/maestro:6a517b06c17cca02055ba050
      history:  > ❌  > ❌  > ✅  > ❌  
            
Hardware: x1e80100
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6a517ac9c17cca02055b9ea5
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.timers.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:6a5186dfc17cca02055c2e81
      history:  > ✅  > ❌  > ✅  > ❌  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
