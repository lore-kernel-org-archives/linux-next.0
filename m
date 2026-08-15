Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7D410F2
	for <linux-next@vger.kernel.org>; Sat, 15 Aug 2026 02:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786761025; cv=none; b=Q/tmC3MjkyPyL+6XbUue43xcygbrz4jAII2QgOfrmkBrZ+2KUJ0vsRrrq9i05kx5fquAFHKfDZeJ9KhM1qv5qC2zE3PpJ6niYrtnB0o9U7NO41zYeLCwhPUiel811vTPxkB4zIA/59NXOYrTk2BQzdpo2Q6hychKrg83LmPDEhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786761025; c=relaxed/simple;
	bh=0oo8dfTJu3/oy8KZ9DFx+Zr9Kg7ZFiH1lb+mQM1nv4g=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=mJiNYT2PXuIeoCfZrlhrSsUaoH2XcNP2kbHiiKC7d2RkheAXT0GkD4sy5DFLi6Ltd22H5+dKYgdv+CCy8ZInhqb99lQQTJwXV6tQLg4ZXvz0QtIWo2F8AveWEL+9uG//nIyHJtuMfEiToLo6PiYZVcDmrT+61Bs+EdjAPqIIfcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=O0iR4Sv4; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="O0iR4Sv4"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cbee846deecso1842123a12.1
        for <linux-next@vger.kernel.org>; Fri, 14 Aug 2026 19:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1786761022; x=1787365822; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=89WCDtcfxLaPoVM9n7/LSXeHhcV180iZbVUcIKKygAc=;
        b=O0iR4Sv43EiHEVkh6Lk/oi3lbqMwlR8Y8ZWTLdB1TTFjdTghjsc6uZa8PjVWtJNNr3
         ov7sxunrSOGoiKQg/ovZKApOnkekWZVl9G1ssYS3DBMyxVEujECOY276Oc3w4yeFYr+C
         FxOXPqhqbOXykcmEFHmgNp9VXr+zgcdOTBjNlfzaNtjVaYjo3csTE9csYt2cwQe/huh1
         Q/COXm3YdMDGF1/HwCw24nIKfehaOL+oAnga9B36zx+DVuIGe8iX+fhmCPtC56mAi+nj
         xsNlVQOvVXtBsDRHsOxGbdRDm/CD6v/y++BSMXjWH7mPdQ5uAgvnnXzobdcfKA9UOkG3
         /tRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786761022; x=1787365822;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=89WCDtcfxLaPoVM9n7/LSXeHhcV180iZbVUcIKKygAc=;
        b=Uf6lwucRMRo+XNueWnlm9xEhYTi3X0hB7fu+g69FT8/s0uSjamK3yziyhJpfKTPqNP
         TT5CxqJn1xnZ++ICkcDGulvXDJ6nZnLYv+g4MrokbXbABuDkKigZlVPEhxTlcnHKRo0s
         uvWWEKtjqKl7hliNZ+CRAeLAD+blq6z6WBim+L7snHE7Kulyq+xhOw4FiCk1hOuq7MNq
         V2aBm+98lpLKDzpBv7Kzt9B1GLV68EZOIh+zUGtwQPcTUSESKC+uyCJxwzYEIXmb40gi
         hFyz3qS0/Q3D5plPIAb+xT1UCK88LoOLT3T4IvcOKw2szfThR9T7XqnPw/r0tNY4AbyM
         uXEA==
X-Gm-Message-State: AOJu0YxR/GfQbzCYzPynRx4MubFsN7lvhd+zHJ30q/QzeijYz0T0gEZ+
	QU/3T5rvduY2g0kab64z1t9bjzVNDh0v3JVacP3zPCK4j2Rn3igjYMr5qF9ZLl0hva2ubnAxKzT
	O6G5d
X-Gm-Gg: AR+sD11A08oe9PbkAxyRqO5LoZmgnGMVL3wcb0rTVddqhJ+L8YltfCTww0B+GHiULKq
	sN//qAtR7CXV4Wi+f8tuZZZieS0R4co1uQ2ERNFTZtdigkVfwPWNOZgR70dmIAzjP3suCCDsT0S
	hr1lbVEP1AVt6cwW8Upr4bhumvBwuAiZR38oQn9VXjlM6VkijPqhyyjlkXn6Ma8qgLFWtBLH24F
	vFW5rdhDMmBqr+gRC4iRBUg1CYMxvysi47WhVcdPYoVPkBl0fn5EMqRm2khNiv5VyTsm8q+ynND
	Fw2//mhq6GLEdBRqXTzGw621IZltyHTCjnd8iTo2FFvXTbjaxOtEg1jYPSLDyT1fEqUqflw9rkL
	CVDt7UjvyPwLzsj5KVNLkiXORyhgMjCrwNIsQSV+5W+ooLcmeGrzh98s/NJUFKwXE7heDYlxZOB
	Q3DK4uHHvXKysJWqO0Bq322+oncSHe/L7OuMxXuFEP66jV/KOzpF/2/Q==
X-Received: by 2002:a05:6a20:d80c:b0:3c4:2eb6:c3a0 with SMTP id adf61e73a8af0-3cc71d13a66mr12664406637.30.1786761021938;
        Fri, 14 Aug 2026 19:30:21 -0700 (PDT)
Received: from 9a65d8f5b626 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3218d3f398dsm9709841eec.22.2026.08.14.19.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 19:30:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 4477a78374a57c3809b172ad30cceabda48c47c6
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sat, 15 Aug 2026 02:30:20 -0000
Message-ID: <178676101951.3719.10356970836799138577@9a65d8f5b626>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/4477a78374a57c3809b172ad30cceabda48c47c6/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 4477a78374a57c3809b172ad30cceabda48c47c6
origin: maestro
test start time: 2026-08-14 16:21:46.590000+00:00

Builds:	   72 ✅    2 ❌    0 ⚠️
Boots: 	  141 ✅    1 ❌    0 ⚠️
Tests: 	34439 ✅ 4979 ❌ 8350 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: bcm2837-rpi-3-b-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:6a7f53a562f33761c0c5c01c
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:6a7f5d4062f33761c0c6a00f
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_mixer-test_event_spurious_wm8960audio_76
      last run: https://d.kernelci.org/test/maestro:6a7f548b62f33761c0c5cb6a
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_event_spurious_wm8960audio_79
      last run: https://d.kernelci.org/test/maestro:6a7f548b62f33761c0c5cb7f
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_iommu_3da0000
      last run: https://d.kernelci.org/test/maestro:6a7fa85c62f33761c0ca6231
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6a7fa93f62f33761c0ca6400
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: mt8390-genio-700-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_usb_11201000_usb_0
      last run: https://d.kernelci.org/test/maestro:6a7f54d562f33761c0c5e052
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_usb_112a1000_usb_0
      last run: https://d.kernelci.org/test/maestro:6a7f54d562f33761c0c5e04d
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_usb_112b1000_usb_0
      last run: https://d.kernelci.org/test/maestro:6a7f54d562f33761c0c5e04a
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: sm8750-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.breakpoints
      last run: https://d.kernelci.org/test/maestro:6a7f539062f33761c0c5bf82
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.timers.timers_set-timer-lat
      last run: https://d.kernelci.org/test/maestro:6a7f5bdd62f33761c0c69405
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: sun50i-a64-pine64-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:6a7f53af62f33761c0c5c041
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_usb_11201000_usb_0
      last run: https://d.kernelci.org/test/maestro:6a7f574662f33761c0c619e7
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_usb_11290000
      last run: https://d.kernelci.org/test/maestro:6a7f574662f33761c0c619e6
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_usb_112a1000_usb_0
      last run: https://d.kernelci.org/test/maestro:6a7f574662f33761c0c619e4
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_usb_112b1000_usb_0
      last run: https://d.kernelci.org/test/maestro:6a7f574662f33761c0c619e2
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.mm.mm_ksft_hugetlb_sh_thuge-gen
      last run: https://d.kernelci.org/test/maestro:6a7f94ee62f33761c0c9c9ce
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_mixer-test_event_spurious_wm8960audio_75
      last run: https://d.kernelci.org/test/maestro:6a7f548b62f33761c0c5cb63
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_event_spurious_wm8960audio_78
      last run: https://d.kernelci.org/test/maestro:6a7f548b62f33761c0c5cb78
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_write_default_wm8960audio_70
      last run: https://d.kernelci.org/test/maestro:6a7f548b62f33761c0c5cb44
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.devices-probe
      last run: https://d.kernelci.org/test/maestro:6a7f545b62f33761c0c5c592
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.clone3
      last run: https://d.kernelci.org/test/maestro:6a7f53b262f33761c0c5c04d
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.devices-exist
      last run: https://d.kernelci.org/test/maestro:6a7f545162f33761c0c5c571
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.devices-probe
      last run: https://d.kernelci.org/test/maestro:6a7f546062f33761c0c5c5aa
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a7f578e62f33761c0c61f3f
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.devices-exist
      last run: https://d.kernelci.org/test/maestro:6a7f545262f33761c0c5c574
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.proc
      last run: https://d.kernelci.org/test/maestro:6a7f541162f33761c0c5c305
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.proc.proc_read
      last run: https://d.kernelci.org/test/maestro:6a7f5ab562f33761c0c68de4
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: qcs9100-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_22000000_displayport-controller_2215c000
      last run: https://d.kernelci.org/test/maestro:6a7f5a9b62f33761c0c68b82
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_iommu_3da0000
      last run: https://d.kernelci.org/test/maestro:6a7f5a9a62f33761c0c68b37
      history:  > ❌  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.mm.mm_ksft_hugetlb_sh
      last run: https://d.kernelci.org/test/maestro:6a7f94ee62f33761c0c9c9cc
      history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_mixer-test_write_default_wm8960audio_73
      last run: https://d.kernelci.org/test/maestro:6a7f548b62f33761c0c5cb59
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - kselftest.alsa.alsa_mixer-test_write_invalid_wm8960audio_73
      last run: https://d.kernelci.org/test/maestro:6a7f548b62f33761c0c5cb57
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - kselftest.alsa.alsa_mixer-test_write_valid_wm8960audio_73
      last run: https://d.kernelci.org/test/maestro:6a7f548b62f33761c0c5cb58
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: kaanapali-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.clone3
      last run: https://d.kernelci.org/test/maestro:6a7f53c562f33761c0c5c0cb
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_clock-controller_3d64000
      last run: https://d.kernelci.org/test/maestro:6a7f5c0b62f33761c0c69597
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6a7f542462f33761c0c5c434
      history:  > ✅  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.timers.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:6a7f60ce62f33761c0c701f6
      history:  > ✅  > ❌  > ✅  > ❌  
            
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device-error-logs
      last run: https://d.kernelci.org/test/maestro:6a7f53e062f33761c0c5c192
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.devices-exist
      last run: https://d.kernelci.org/test/maestro:6a7f544c62f33761c0c5c55d
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_af54000
      last run: https://d.kernelci.org/test/maestro:6a7fa85c62f33761c0ca627a
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_ae00000_displayport-controller_af5c000
      last run: https://d.kernelci.org/test/maestro:6a7fa85c62f33761c0ca6278
      history:  > ✅  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a7f540662f33761c0c5c245
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6a7f542562f33761c0c5c492
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.timers.timers_posix_timers
      last run: https://d.kernelci.org/test/maestro:6a7fac8762f33761c0ca8a8e
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: mt8390-genio-700-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_usb_11201000_usb_0_hub_1
      last run: https://d.kernelci.org/test/maestro:6a7f54d562f33761c0c5e051
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_usb_11201000_usb_0_hub_2
      last run: https://d.kernelci.org/test/maestro:6a7f54d562f33761c0c5e050
      history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a7f540062f33761c0c5c238
      history:  > ❌  > ✅  > ❌  > ❌  > ✅  
            
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6a7f59b562f33761c0c654b1
      history:  > ❌  > ✅  > ❌  > ❌  > ✅  
            
Hardware: qcs9100-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_i2c_890000_i2c-mux_70_i2c_1_bridge_58
      last run: https://d.kernelci.org/test/maestro:6a7f5a9a62f33761c0c68b56
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a7f540162f33761c0c5c23b
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6a7f5ac062f33761c0c68ec3
      history:  > ✅  > ❌  > ✅  > ❌  
            
Hardware: qemu-arm64
  > Config: defconfig+netdev+nfs-root-boot+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6a7f4d5b62f33761c0c586cd
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: sm8750-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.clone3
      last run: https://d.kernelci.org/test/maestro:6a7f53c062f33761c0c5c0b5
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a7f540462f33761c0c5c23f
      history:  > ✅  > ❌  > ✅  > ✅  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
