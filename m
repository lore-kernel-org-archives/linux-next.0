Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6AF3B3BEB
	for <linux-next@vger.kernel.org>; Wed,  8 Jul 2026 02:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783477829; cv=none; b=RTYEbGyYpLQmAvzSHfignaVTqX9zxRmBRoXiS0vymii9HzlINTQCe9wrRmiztcNI5xsKdhhGROENpVejJsy7mAObbtdjJ9m9y9jYcxkYsYzgMSLBwW5H9N7fp1mBXpwxsEGzWBr8BIdFFsJhGTDpGsWt6vD0u/P9l+SmQPVnyO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783477829; c=relaxed/simple;
	bh=j8WqNtA7yo9EAWSnByA3sAsqi+O0qrNqNRDSMecJ4d8=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=RLXmnm4AgKJYz9pXJDy/YdiMOc1BcjNmku7csqSz+xBAFxa3k+WPzpn7GAktVPCIQQnC/SXN6ApjA41QF7w7OKWLkfux6ywYj0f2ZmMH8wcPiRHs1KUw6KxTkUNZDkgVWfJSByL+VNlSOj1CVM/N93QpN8lIc2uOv/tpY1jxZQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=hzRihUwZ; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="hzRihUwZ"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c96c92c0980so74502a12.3
        for <linux-next@vger.kernel.org>; Tue, 07 Jul 2026 19:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1783477827; x=1784082627; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g2IsUlWb18moAP9STT/h/dmdDwsd/TFToKXp2f3ehJA=;
        b=hzRihUwZf8acofIMt2MdUKdRcmjCA5UW2MRnfTHC3Z3rgcTlUBwLf3Qa7zC+Gi0Vr0
         z2BoLp0M9jtGNFAQgYtzsbV/4uK+a//dvHx0ey356dx7jWYYojePMB18Gb2GoqJjK6AO
         pS6gMMRMKUxjV56ZqqHTaG8h9bvC5lQvcciQfo5CHnP8R7wNC1CZmRmdnx20k1wvXyTM
         tsfMZ062nCVH6J4ovVB7UU+mjNwSLxAjCW0OKm+hiR3oqnFcT8OAEljlkNBBYKM6vpD8
         Um5YJaBuSTXRmMnX6lcVL3mNAtrjVmyAKKuIVUnN6owNAiR6jlVLJ6qoIGkUWt7VgqQR
         6JCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783477827; x=1784082627;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g2IsUlWb18moAP9STT/h/dmdDwsd/TFToKXp2f3ehJA=;
        b=QwlA6cgNo5688cLwelKLcZdRFit1PEaGr6Lht16M1Rc8C689v4d8olBefnwO01SP1D
         TnQDocKtjeY661dYEd3jlQ27oW1jjJPDFzhD+Tiarjic+WX9/byrd4puZtv1vcsP70Ay
         TMyTMe142T5dyEUAhpxTcPFvza0rMOoz/l0Dfd99I/WurCGsN/HIjKptaPxtgDmRb70U
         KMwSzElyki86fNHHWH3EYlCjfKq/Nq4AUdFYR3REQS504pbhEUpX7ZezOguwLdCk3jRu
         P579qexiop62qrJl1si6o2vhASn0i+KlsOoSf6yD5/4drjtL5ijBF5IYARH4kDjeN1eE
         Wkbg==
X-Gm-Message-State: AOJu0YxOYZvBuYa38Ffcl0RaSe3I9504XcjHHkiazu8Z2KBWZvM/5vG7
	ryuHv2rBVNDJCpE2HPXEEUIoEWmZo7tSU2ubWjQxczYkfrfO+XiR8WhnduDzGZZvkr1wh+Gpfv/
	GjwCB
X-Gm-Gg: AfdE7cmuNzdkGUXTx/qdf9z4gkZqHJd06GNxMiVJ89Du0Olgt8TuHjEyLKg7kGPVjyq
	I1D4D2Az24NhgQuUzjpncHh3RMcp7X8sb6Kq2P+kcvxbUIQN9i+gBqgAE0nCKpVZmpb8Iwva37/
	3bL3gF8vsefFd/gDWkMU75msxGLwkoLlcFQ5pjch8KPi8qEfFWhh/IkSYmcknafE0Q/Lf9YubRD
	//dOoXV8vpT81yNjDrW5GVly7EHb6S/C+otUB7KvZ24kzzRsnY+NFH/+kzxfZKUNvwIHFDtrdmk
	BFSw145udwhduIuYRQzcE8YkbBtVufYaKKjC4GPM9YhWi048baA4adu+x00lZqPrZbKTdZDQsbA
	f2ZI8ubjVX5mjMxPwa5VpIepEG4Q+qa/pAS0jwlVKUT6EpYn2/h84h1gEQX7FCsmNkwcOIWckV5
	HEqBfDWQ==
X-Received: by 2002:a05:6a21:670b:b0:3c0:9c19:b279 with SMTP id adf61e73a8af0-3c0bccacfa4mr418101637.71.1783477826933;
        Tue, 07 Jul 2026 19:30:26 -0700 (PDT)
Received: from 963b246bc1b3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f5975sm13037744eec.4.2026.07.07.19.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 19:30:26 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 5c73cd9f0819c1c44e373e3dabb68318b1de1a12
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 08 Jul 2026 02:30:26 -0000
Message-ID: <178347782612.6931.18199072918824921548@963b246bc1b3>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/5c73cd9f0819c1c44e373e3dabb68318b1de1a12/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 5c73cd9f0819c1c44e373e3dabb68318b1de1a12
origin: maestro
test start time: 2026-07-07 13:29:20.780000+00:00

Builds:	   66 ✅    2 ❌    0 ⚠️
Boots: 	  107 ✅    2 ❌    0 ⚠️
Tests: 	22321 ✅ 1396 ❌ 3272 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: hamoa-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a4d094b06fecb7f47490dc4
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6a4d34e906fecb7f4749e7f9
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_global_requeue_single
      last run: https://d.kernelci.org/test/maestro:6a4d34e906fecb7f4749e7fa
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.timers.timers_set-timer-lat
      last run: https://d.kernelci.org/test/maestro:6a4d39cb06fecb7f4749eb45
      history:  > ✅  > ❌  
            
Hardware: kaanapali-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a4d096306fecb7f47490e34
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6a4d13fe06fecb7f47496736
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_global_requeue_single
      last run: https://d.kernelci.org/test/maestro:6a4d13fe06fecb7f4749670e
      history:  > ✅  > ✅  > ❌  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_iommu_3da0000
      last run: https://d.kernelci.org/test/maestro:6a4d14de06fecb7f47496af5
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a4d095406fecb7f47490dd3
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6a4d14fc06fecb7f47496b97
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_global_requeue_single
      last run: https://d.kernelci.org/test/maestro:6a4d14fc06fecb7f47496b98
      history:  > ✅  > ✅  > ❌  
            
Hardware: qcs9100-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest-device-error-logs-ramdisk
      last run: https://d.kernelci.org/test/maestro:6a4d091f06fecb7f47490d01
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a4d095b06fecb7f47490dd9
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6a4d2f7f06fecb7f4749ddbe
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_global_requeue_single
      last run: https://d.kernelci.org/test/maestro:6a4d2f7f06fecb7f4749dde4
      history:  > ✅  > ✅  > ❌  
            
Hardware: sm8750-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a4d095f06fecb7f47490e31
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6a4d157706fecb7f474973ae
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_global_requeue_single
      last run: https://d.kernelci.org/test/maestro:6a4d157706fecb7f474973af
      history:  > ✅  > ❌  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a4d095806fecb7f47490dd6
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6a4d1de806fecb7f4749b426
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_global_requeue_single
      last run: https://d.kernelci.org/test/maestro:6a4d1de806fecb7f4749b427
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6a4d09b206fecb7f47490f56
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.timers.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:6a4d225806fecb7f4749c371
      history:  > ✅  > ❌  > ❌  
            
Hardware: glymur-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_ac0000_i2c_a80000_touchscreen_38
      last run: https://d.kernelci.org/test/maestro:6a4d214d06fecb7f4749c085
      history:  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: qcs6490-rb3gen2
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a4d0f0406fecb7f474955f2
      history:  > ❌  > ❌  > ✅  
            
Hardware: qcs9100-ride
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.ring-buffer
      last run: https://d.kernelci.org/test/maestro:6a4d0f2206fecb7f474956cf
      history:  > ❌  > ❌  > ✅  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a4d08c806fecb7f4748e392
      history:  > ❌  > ✅  
            
      - kselftest.arm64.arm64_hwcap_sigbus_LSE2
      last run: https://d.kernelci.org/test/maestro:6a4d156006fecb7f47497166
      history:  > ❌  > ✅  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a4d0f0506fecb7f474955f5
      history:  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: x1e80100
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6a4d09ca06fecb7f47490fba
      history:  > ❌  > ✅  > ❌  
            
      - kselftest.timers.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:6a4d29a406fecb7f4749d2e5
      history:  > ❌  > ✅  > ❌  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.futex.futex_run_sh_args_t_5000_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6a4d1de806fecb7f4749b443
      history:  > ✅  > ❌  > ✅  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
