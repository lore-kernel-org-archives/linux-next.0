Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2212D1F44
	for <linux-next@vger.kernel.org>; Fri, 10 Jul 2026 02:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783650645; cv=none; b=bauGkyw6RsAe8EVawfh4uQBtFIQUiYVA6BFE1/jZQTzyK8iWb1iAWoEVwZzv5EGTjjV5ZKMClNo4Uqx22Sxtm2oBB3mB4VCB+QqhxCwIQPdQSRRCbBbHAo55nxLRHD9xTxJ9nb6LzLInNTKFIMT2P8+eIQbydlKAQmBDcA6bskg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783650645; c=relaxed/simple;
	bh=VuqzzpefeMfUY53eeqnVgk6mkPHTQwQDpL/9kLPAj+s=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=uJp2uSPK46XUabSwLEmpq7zN+F94OSjbWp2tr1X6AL4RW3HebhJD39d5hQh14WgEehAXfSZxr4UqzRnZU6/K2xLFS2UtOIVLAH5+sxHTVnoU6nY2URWhQOj+quBBFWpK7ytpRNKleg/TqcywoGTcw6MXmzB0bHzj/+pgA5ErIog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=Bxzl/BvU; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="Bxzl/BvU"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c9e7391839cso395454a12.0
        for <linux-next@vger.kernel.org>; Thu, 09 Jul 2026 19:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1783650643; x=1784255443; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BvSWXKu1k585IeHZnxABb/WezrAUaUbuqluIwbr+ceY=;
        b=Bxzl/BvUeyulM7WqzjarJrC7yz7XptoNAviXXqrB+kWkKcRJnqBwqwdFVpus/6tSez
         Rc/7u19zoZf80V4inANVRtUdm/vO7V3naij/AvQ/dnJFo8XwlTydP87/wY+m1mDlQRPm
         nlLaAXZxQYvHfwAgA8ram+7XZ9gJz7BUB+nv8mRRoQlrNtacfvsxmi0XlBvWUaasQh0I
         s8owUNeIsXE1yTJx/TLj6A1/FX4U2SPxNpbf87fGdnXC2mvIagvW2td4DcBRjND89YtJ
         ijq00V066bF4z7PrRlljC93f/YiXiTGYiho9iiIy4rnQs8TQp6nZ9eCKe5CMJfcUtBNx
         zSrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783650643; x=1784255443;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BvSWXKu1k585IeHZnxABb/WezrAUaUbuqluIwbr+ceY=;
        b=J7CplsytIxeL2t9f/8SfSAZbK4R/wWspVP35myXEYBnLA8BxDlnpSBhHlFoLXv8tXb
         6eIl6vfjkbtOx2l052rP7LO13wbUlVM4PF58mha8iZDUFbZrcDg34Kl+VIYVZLlX6us6
         WU8la6NcK2awg/5q4+cUZ3d6EXfIiKb3g3Bpyn76bnaUOgiKQEzPfi5+51DLS3B3wYDZ
         RzWOhrdDi0Y8bkna33o9Jxh9mAc6je6gQGy3SMhNj+88DzODBiGrcrIAoCypcf1nNPwr
         0NCMRJJK+Y3KlwPasuhbPGP262RI8SZ5EZAcllM2k/T2gyxVovB9nIvf/VTBXAYhXji/
         ydpg==
X-Gm-Message-State: AOJu0Yx4fmgvD7y6SsQma9TbJipLGGPM5m6w64uIk7j7+bmvPq/VaOE2
	2U9hiw8GGLvRtKEmmzMuy9tPnT1o6hR3CFaUoieAozJ3jVDQr8wAU2xB3+r/IYl26s4=
X-Gm-Gg: AfdE7clQZAFmtBv94QtE/mhI1/o1k3p5nPIHjd1CEMJGLYDzHkcSF7cWkYDwB4s31La
	Z+gfJNc5ZKyVDH8CpPUmSaQ6piEuaki7NGaBTQRg78Hfz7nx3/D0YiLMPrLS/wOOMD+3wgmqWDv
	FarII4dVseQawP3xQFiFy5TK9AjqcHxyaDOtUY3/DPQbb8zaDT8FT/j0RcBBAQa35v4ZE8j1RyL
	9GsIkBQ5rxfkBsn4zLomhQhMr/i4t6WQ/DftNK6mHhfEYGYYHrtmGGVLg8qtEi9gTyt3GrUczsb
	eL3/yAX0ds9kBuwjmXc4Bd+bqdyqAdtI4QpzTzYL856OwNqf6JkqKz8C7indNAsc2HGtnFHpXTK
	Ed/TMyA05InXgv4ND23DbzaAsyUop5t00AyNjdkgVuXpZPueh2r3Xo/yC6wr3M1/BVAPRpRjwHw
	i8imojeg==
X-Received: by 2002:a05:6a20:144f:b0:3bf:97e8:a044 with SMTP id adf61e73a8af0-3c0bcf162c4mr12336694637.13.1783650643098;
        Thu, 09 Jul 2026 19:30:43 -0700 (PDT)
Received: from 963b246bc1b3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b6593c9a1sm41992642c88.2.2026.07.09.19.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 19:30:42 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 34cf6dafc47441dfb6b356a095b89c3585a93714
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 10 Jul 2026 02:30:42 -0000
Message-ID: <178365064225.8286.10257080886093719041@963b246bc1b3>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/34cf6dafc47441dfb6b356a095b89c3585a93714/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 34cf6dafc47441dfb6b356a095b89c3585a93714
origin: maestro
test start time: 2026-07-09 16:34:16.974000+00:00

Builds:	   72 ✅    2 ❌    0 ⚠️
Boots: 	  163 ✅    2 ❌    0 ⚠️
Tests: 	30687 ✅ 5343 ❌ 5401 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: kaanapali-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a4fe7aec17cca020551bd90
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6a4fec1bc17cca020552065f
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_global_requeue_single
      last run: https://d.kernelci.org/test/maestro:6a4fec1bc17cca0205520660
      history:  > ✅  > ❌  > ❌  
            
Hardware: sm8750-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a4fe7acc17cca020551bd89
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6a4fec3ec17cca020552077d
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_global_requeue_single
      last run: https://d.kernelci.org/test/maestro:6a4fec3ec17cca020552077e
      history:  > ✅  > ❌  > ❌  
            
Hardware: x1e80100
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a4fe7b2c17cca020551bda5
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6a4ff5e9c17cca0205523c17
      history:  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_global_requeue_single
      last run: https://d.kernelci.org/test/maestro:6a4ff5e9c17cca0205523c18
      history:  > ✅  > ❌  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6a4ff515c17cca0205523907
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_global_requeue_single
      last run: https://d.kernelci.org/test/maestro:6a4ff515c17cca0205523908
      history:  > ✅  > ❌  > ❌  
            
Hardware: qcs9100-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a4fe7abc17cca020551bd84
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_global_requeue_single
      last run: https://d.kernelci.org/test/maestro:6a4ffa86c17cca0205524b70
      history:  > ✅  > ❌  > ❌  
            
Hardware: glymur-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pci_1bf0000
      last run: https://d.kernelci.org/test/maestro:6a4ff6dec17cca0205523f41
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pci_1bf0000_pcie_0_wifi_0
      last run: https://d.kernelci.org/test/maestro:6a4ff6dec17cca0205523f3f
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pci_1c00000
      last run: https://d.kernelci.org/test/maestro:6a4ff6dec17cca0205523f3e
      history:  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.breakpoints
      last run: https://d.kernelci.org/test/maestro:6a4fe750c17cca020551ba07
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_iommu_3da0000
      last run: https://d.kernelci.org/test/maestro:6a4feed9c17cca0205520eba
      history:  > ❌  > ❌  > ✅  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest-devices-probe-ramdisk
      last run: https://d.kernelci.org/test/maestro:6a4fe803c17cca020551c5af
      history:  > ❌  > ✅  
            
      - kselftest.futex.futex_run_sh_args_t_5000_broadcast_owner_futex_requeue_pi
      last run: https://d.kernelci.org/test/maestro:6a4ff515c17cca0205523920
      history:  > ❌  > ✅  > ✅  
            
Hardware: qcs9100-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest-devices-probe-ramdisk
      last run: https://d.kernelci.org/test/maestro:6a4fe804c17cca020551c5b8
      history:  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: qcs6490-rb3gen2
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a4fdbe9c17cca020550e575
      history:  > ❌  > ✅  > ❌  > ❌  
            
Hardware: x1e80100
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6a4fe7cfc17cca020551bed1
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.timers.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:6a4ff916c17cca02055242d3
      history:  > ✅  > ❌  > ✅  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
