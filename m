Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B18B2459E1
	for <linux-next@vger.kernel.org>; Sat, 25 Apr 2026 02:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777084239; cv=none; b=UL5mGFUXRyY+VDlBZWEKZXTPsRkGhfV5EcHZnDddRNhZtQmiHkYEF4GniLYH7CgVXxuW30EKiwhMz75cWoF+6HpH2VwI10BRK5G5WVkx5KWEGb6iXcLUyZBMAzqyCx90/jRJIS7xOIMLpi0wkjUKlXw1Pr4+c/UCnixr94d8tiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777084239; c=relaxed/simple;
	bh=xmuU9h0YWfLu4r9mefx23BWjnnM/PohyvUPk3mUN5Yk=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=rTU4jsuVBuT7ifvbKB5ESGlrC3asf7on+Zfx2BP3i+BQHyv4dVdZ8W0cncdr7h7McrHuM3GigxSP93UZ8+KpBxJlypZuq6QnNAvWd480zJco/FST3PhUntrbFCk/lqpH3jqz7LVshKp2aT3enAEZOrVKNH7/YcvxJUzMf2yey9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=FnCmKO68; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="FnCmKO68"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2d96243c91fso13377651eec.1
        for <linux-next@vger.kernel.org>; Fri, 24 Apr 2026 19:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1777084236; x=1777689036; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sSs48/W8GYUSmfTi3kUCM43LMO3zAiI0P8hwjnBAFlk=;
        b=FnCmKO68DXaf+uyfLfziEox/93bd7wtLCQOBglZjlt88um1TrOSk7AnJyiDz5narwD
         svbyA1Df33tSkS3sO/PVP0csNqxDEhZaitTI2mFpeDk+G2mRaDlQAnkhlcTmJIA+Del+
         3tTjx2XXEi1KpEWh0mCGyWNDe8jtv39SxALivTNIY0USGU7mJVSIL6CcnZYdqa+XTL+y
         oazY14fGnl8eSQQQy8AC6D1W2GANsF40zFfuTIvs8HHX3J82qy6MRm3yIFiXgWPYw39b
         GoEbk+gDY9DLCzsZoO42M8SHl4VM868orq7e/A8NSv+meWBGpAgSA+80Qe8huCrWrWZ9
         Ia7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777084236; x=1777689036;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sSs48/W8GYUSmfTi3kUCM43LMO3zAiI0P8hwjnBAFlk=;
        b=TAvC5sSSWJfF/fHR3o2p10MmNFyJdYfDtabBvXHvXtRYVTc22nHDASzV8tmDQ5IZ3f
         HJj0T9j3MaT5yPSJIWRwBnA0z0LhmqMvYFmJED57/sPt/zvKsC1MyLCbSeXVGezDTxp3
         9EJRCjZIkw8UiIucrmBNuz+z8/vNYIgVqSw7/v46TqIH1TtzJ/RwY/WpQ0S5bYjrKctE
         fZfHXN6tMJZntBCzCUOFzd+9Pr04EoSuytbkvf+VA4mZaBGM3GBE0uh/DfEL4V4qHLwc
         4UQevU2DOHwDnXy4pLTQV979DzFekE2JH0hM/GKQwQaYzI2XR9nb6h5Wh3XKKZTZ3oQ0
         KK2A==
X-Gm-Message-State: AOJu0YwZLwz0A3lfzc46CPu80iKWF5pRhrOVUdT/SkftpzyJc/4qAelE
	Rr2Vp40mPCpAaEFUyuAv3dLFH1tQqdpQc6xbVp0FV2+FC4FA+L2vUhD19LYZDCBj0ts=
X-Gm-Gg: AeBDietaBNZFrqIAMiWUv73c3fYRoQCYfo7wuefG20fnvNFqBrvyjCIhCej4/pjNYpA
	L5Y7W6/6/r26TCqtJ6l+LDEKjejcPBoOxxf1O4tTVcPbeks+FXAsIFThkKLjd0GDPOBRz6oHl/G
	MxaYUNIS5ipKUfumTk+QLEP2wOCPwgldVAsZ+4JpnoUEUWXS0Ixs/xmL/3zi0vFnNxVj3GZDUu9
	dWPf6ENHKpp5hJJul3fTerKtK6vDDDG12GhEc4hXEp2QEGAcXqdfKbTtdeq5sLviijMAfEKKoy8
	NyPGWvC6Whe++sB5GIGm8RIPXFxnAF3JlI3syGYkG5VlZkB97jIPzp4/V0Ht9mK6YiiyteezZcU
	RhOyy4Y3twqPyFCHrQre5lOZBL7IJbHlJ1HRJMqvEAkafVPQe8MEsczg4TNG/qH9Mrq49bBul5f
	j2cAq5Krm3NrIHcWWPBEDqNUgbako=
X-Received: by 2002:a05:7300:ca4:b0:2d9:6373:ad10 with SMTP id 5a478bee46e88-2e473cb4f9bmr16588444eec.7.1777084235911;
        Fri, 24 Apr 2026 19:30:35 -0700 (PDT)
Received: from 7f5f57871823 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e539fa6134sm35937197eec.3.2026.04.24.19.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 19:30:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 7080e32d3f09d8688c4a87d81bdcc71f7f606b16
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sat, 25 Apr 2026 02:30:35 -0000
Message-ID: <177708423483.194.5129245249506067805@7f5f57871823>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/7080e32d3f09d8688c4a87d81bdcc71f7f606b16/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 7080e32d3f09d8688c4a87d81bdcc71f7f606b16
origin: maestro
test start time: 2026-04-24 14:17:38.922000+00:00

Builds:	   57 ✅    0 ❌    0 ⚠️
Boots: 	  173 ✅    9 ❌    0 ⚠️
Tests: 	10944 ✅ 4223 ❌ 4070 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: qcs615-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.proc.proc_read
      last run: https://d.kernelci.org/test/maestro:69eb8eaf9b5a968309001cb1
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64.arm64_hwcap_sigbus_LSE2
      last run: https://d.kernelci.org/test/maestro:69eb8ff59b5a9683090048a6
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:69eb86899b5a968309ffa64c
      history:  > ✅  > ❌  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:69eb89fa9b5a968309fff1c4
      history:  > ✅  > ❌  > ❌  
            
Hardware: qcs9100-ride
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.ring-buffer
      last run: https://d.kernelci.org/test/maestro:69eb9a819b5a96830900d614
      history:  > ✅  > ❌  > ❌  
            
Hardware: cd8180-orion-o6
  > Config: defconfig+netdev+nfs-root-boot+kselftest
    - Architecture/compiler: arm64/gcc-14
      - ltp
      last run: https://d.kernelci.org/test/maestro:69eb8f489b5a9683090020c0
      history:  > ✅  > ❌  
            


### FIXED REGRESSIONS

  No fixed regressions observed.


### UNSTABLE TESTS
    
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:69eb87119b5a968309ffaada
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
Hardware: monaco-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.proc.proc_read
      last run: https://d.kernelci.org/test/maestro:69eba3649b5a96830900f52e
      history:  > ❌  > ✅  > ❌  
            
      - kselftest.timers.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:69eba5749b5a96830900fb0e
      history:  > ✅  > ❌  > ✅  > ❌  
            
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_spi_11010000_can_0
      last run: https://d.kernelci.org/test/maestro:69eb87a19b5a968309ffbc62
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.uevent
      last run: https://d.kernelci.org/test/maestro:69eb8a499b5a968309fff658
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.uevent.uevent_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:69eb8fe79b5a9683090047d0
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.uevent.uevent_uevent_filtering_global_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:69eb8fe79b5a9683090047d1
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: lenovo-hr330a-7x33cto1ww-emag
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:69eba4f29b5a96830900f8c1
      history:  > ✅  > ❌  > ✅  > ✅  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller0_14001000
      last run: https://d.kernelci.org/test/maestro:69eb93c69b5a968309009565
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58_aux-bus_panel
      last run: https://d.kernelci.org/test/maestro:69eb93c69b5a968309009559
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14008000
      last run: https://d.kernelci.org/test/maestro:69eb93c69b5a96830900953d
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14009000
      last run: https://d.kernelci.org/test/maestro:69eb93c69b5a96830900953c
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_1400a000
      last run: https://d.kernelci.org/test/maestro:69eb93c69b5a96830900953b
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400b000
      last run: https://d.kernelci.org/test/maestro:69eb93c69b5a968309009530
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400c000
      last run: https://d.kernelci.org/test/maestro:69eb93c69b5a96830900952f
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
