Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E0A2F8E9C
	for <linux-next@vger.kernel.org>; Sat,  9 May 2026 02:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778293835; cv=none; b=KrbOUI63SPFr+EdtdFJiE39PGwUvE+njf+iL7d1z+AR5yUSNqHFkpzORk3dcyTTFJp8ifG3z2LP3Vu3FIoXLMz3ivC5qcnMGPdONSWMERns+GtpdTIAE5t9/bagSCWYhJnrM0KH2nSbCsko0UMMp6Uxzq0gUHPdDZ5qQUY2Rm4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778293835; c=relaxed/simple;
	bh=H0aT8+8+p/9iJpwOVUWKNmPA+HV4XIgATYV0i8fw8N8=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=eRxLMmASCuMxf7F1pFbepxxEjh/GpQLKAYWwTh7LRHsYb7C66L9aHFkaTLQY+Aq2xQ3936na4gN6mRV/TA0rXEh1Nw+M1PzKdeCcRjs11Y0j+8wJKkGEu+N76NNvpRwNy3DK2GyV9r909xw+blHx/lAzBayxXLJehe21jCBm0zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=KeHRr8qE; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="KeHRr8qE"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12713e56abdso1776465c88.1
        for <linux-next@vger.kernel.org>; Fri, 08 May 2026 19:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1778293834; x=1778898634; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Yhn60J8PXjG/m1VxbhWK2G55QwUcYe3YRywlY4h4pA=;
        b=KeHRr8qEN7Hf+l47Y8IeUqYLB3kaZYyZ65R9FgX+bBswLeEA/kuDAcNMNCXILen5tW
         qmlsF4XhjRUK/QKiZzirM5bAKOWRe64gID5ZVBoKOQt0gAGAsccV/fZj1MvAtoySnxBN
         JR47iSuks617lVb1BpswzaVnMVqNj9N6sw/BZbzsfqrKFWFZ5rlLtGMOhKsWOH41LI8W
         4GsjJwXyo13QhBnojTwfCCFYp4/djxssE343VBH0xQpj1Rw8mKouGM/8NTgaZq8zwRlC
         wQ42kObxbEcc7g94KZLgB6KrhK9HHE6XzEhdDmusLj8MwulkR/o5JeNt7iJkjS7YKtDs
         EZ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778293834; x=1778898634;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Yhn60J8PXjG/m1VxbhWK2G55QwUcYe3YRywlY4h4pA=;
        b=LP1AWJFD6MJsHD7humv7OszylZTDVide9iJPjIKkzWmFhD/bvne+MDTp37b6asq3Jv
         un1T8f6kWI920u41XZkoxSX0SuiPuD00RZO8MweDIFwAHb/XhkUuM9X4/Aaztq/J24JG
         kWs1dCOThrvJco8QJ6/cupQfTJzYAnS8LD6VpU5IK6W3xpTecbYqnKVlWgPDLjVgBnrN
         VyiOIRa+DZLTtewaUJYzouHTTUADyiB17XuKQ+aIIuXFc+6MvJ2qHt5SOelaeQjDRngK
         4pKXFjXl+Ye/pYjIOUociqxSGTkNXzck69pC3IfIlvt7NRnj6tLVMTGMjkkvshhB/m5w
         hcQw==
X-Gm-Message-State: AOJu0Yx3dDmxah2Od0MkrScuS+31VQRed2R8OxBwLGsqnLeN1s3HZrlS
	82/Q8zQmJZuA51I027X2A8L6Dy7RKaQEfylaK99IT3IKSo0U+3TMdhhq6BLKtszAlOZM017sdz0
	K7qyH
X-Gm-Gg: AeBDietq1NEaPh2pJb1dt40e+GUkLbIezMLrLXz0gCqM1/dePi52KdM5qh3xX7HUDvb
	LohmmUAC6wRTNLUgLj6ScoiLIUXsPVVcTnRxSzPov3s6L9C5fNFnnjkYXraHzf65Y0UEt9XkMbW
	4sUlhYetGJXKsfVTUjAUV/ZJqGmmdZrCobmglw4nyUd+x7iTFbOTt0s4WsRszNheohqwStbYcI3
	8IclyJbrtaUx4vIoNNcS/bBfgacCt5cVDO20BsgfETPEA8hqthAerYehQdhWu3+YLz6dbXNKQPc
	swWbfQEIblcFGxrWR2eUr8CbEi9WuOP8RVEJKOKEUtYbEh9vxJ7+SJ4Zn6aBE/UVfFmrh09/OA5
	tdAwo3rDg/97n4LjlFnFPMSiy6eZ8aUEwu+z1N4OCl/bVvsDLVSChsHUrT/RGytXScGFq6Zxd3g
	zG9hqrA2zIBfxRo7HR
X-Received: by 2002:a05:7022:250b:b0:123:3c24:b15 with SMTP id a92af1059eb24-1323b0aebefmr4166873c88.19.1778293833341;
        Fri, 08 May 2026 19:30:33 -0700 (PDT)
Received: from 997d03828cfd ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8860c7accsm4801555eec.8.2026.05.08.19.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 19:30:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - e98d21c170b01ddef366f023bbfcf6b31509fa83
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sat, 09 May 2026 02:30:32 -0000
Message-ID: <177829383231.4454.17589395895259115750@997d03828cfd>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/e98d21c170b01ddef366f023bbfcf6b31509fa83/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: e98d21c170b01ddef366f023bbfcf6b31509fa83
origin: maestro
test start time: 2026-05-08 13:45:44.448000+00:00

Builds:	   58 ✅    1 ❌    0 ⚠️
Boots: 	   85 ✅   26 ❌    0 ⚠️
Tests: 	20275 ✅ 3916 ❌ 3720 ⚠️

### POSSIBLE REGRESSIONS

  No possible regressions observed.


### FIXED REGRESSIONS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.kvm.kvm_steal_time
      last run: https://d.kernelci.org/test/maestro:69fe7a6c0e4ee292cbf54bde
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: dell-latitude-3445-7520c-skyrim
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:69fe0a940e4ee292cbf10449
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:69fe0be10e4ee292cbf12051
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.kvm.kvm_steal_time
      last run: https://d.kernelci.org/test/maestro:69fe24220e4ee292cbf1acdc
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.kvm.kvm_steal_time
      last run: https://d.kernelci.org/test/maestro:69fdfb560e4ee292cbf07b28
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.kvm.kvm_steal_time
      last run: https://d.kernelci.org/test/maestro:69fdfeff0e4ee292cbf0c43a
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: sun50i-a64-pine64-plus
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.kvm.kvm_steal_time
      last run: https://d.kernelci.org/test/maestro:69fe17c60e4ee292cbf17f6a
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:69fdf0680e4ee292cbefb4ff
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
Hardware: mt8390-genio-700-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:69fdf0940e4ee292cbefb5e3
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:69fdf0950e4ee292cbefb5e6
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
