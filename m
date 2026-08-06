Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBD64A35
	for <linux-next@vger.kernel.org>; Thu,  6 Aug 2026 02:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785983437; cv=none; b=ED/tNfWfmh9YLJiZrLLEGWQt1Sc1tS/jr/MlXFoHPWEbqra8jS5EB8dZl8btBEDBhS5JD9elsWjYosnG1ZwY2zLymGjgrcwljByI12oG/IiCR5AKD6KMOLOKJMI2WvXEmdamjUo+DxtRMJRhY2vSOF18sgh/gKKKhqmSt6ROKT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785983437; c=relaxed/simple;
	bh=nuIXre2vC69YHX5iYBtzclRrCybGFAZ+fVdp6G2eBD8=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=a70zKuEYdNLIfT5rOCbZtzKdWTDbVQgfqQXPpV116v47XWnJFc0hgf7S3DtvRImEGpgoHy82n8/bO8aDAVFieypGgFmnvJtHI3TKZ9GYSrS7TklSlBzqfgkCf2JHxrVzoFEMKKmdN8C8vLKOnpqC4bxIwuRh01q1cyTyr3KL2OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=fwx1IVp3; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="fwx1IVp3"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ca7c1176317so1491294a12.1
        for <linux-next@vger.kernel.org>; Wed, 05 Aug 2026 19:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1785983434; x=1786588234; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v1nYO6ZWP6IYQS9t4AAJ2TTDuNRORuvt7Y3X+iTUW6o=;
        b=fwx1IVp3nCKg+4xMVLx99lFl4VW8bQP6qDLgWEWpMqwnAly8hrviNoMXNDVnWAGoTL
         bDrtvye9AABbmX8tQv+FFQrJKr4xs/geLCO+pBn0PNF8JicaiI5GoFeQR/Rdr+q0Kadq
         heS24sQIBI3632mrwqr2cdivx5yNHe0AgYGzNVIINpweSr85oqyXfTeKKReIk5e2vQgu
         yC5ZN1lJTK/R+v+g/LUBHOakSLem+KylPXL/0AupU3NHHUPq4VW3MYRwlNOGL8dGTvwn
         t60449y40ZtL5wpeWEhauogC4+dok0BYuOLHPSGAKlGc3+E9cjvtrZ2ibFgTswDF2DDg
         Iz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785983434; x=1786588234;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v1nYO6ZWP6IYQS9t4AAJ2TTDuNRORuvt7Y3X+iTUW6o=;
        b=huKP0W0x67HrniemXnqcSbotk34vMbuY6sdAJ5gv/IibBetz39XyRhrI8kczOa+RyC
         +ofY8V+JmX0hTJW0UVLH4xAw/ziOo7GFf3gJO8E9mnO+NzYzZLtIcsySBTu3rzFYBEBd
         /AdDbEAMY+sdEG7gK9RXN4hsnKF1l+MWslcKrtryvU5J+b7A3IYLOEFeaEShURwuAXwb
         9IBKwyjNvrOZ8HzkuFCq3shrdagzArYKdCvuoJTaacQ8mmqQ9KHimSP6WaAnkyqOiaA6
         swYGVqg48UjTfVWbeprYvThSLRT3VwldB7bXZcYUKc/Sc7UwKl28JDSFmWZx0WLlMhB8
         8C5w==
X-Gm-Message-State: AOJu0YxnHeJvNdEEtmMm6U+wUe1uRcucAqyKVrrLHbxsfVVBcia5jSz6
	nQRbPFqa52w+ZvLA16l2LwW0ek65fU69NPABR0XDL2uWMS3HNwrCRkpKdWUCkzLf+sE=
X-Gm-Gg: AR+sD10uipkOUbrQRMulk9/w4vNHYkdqTAJMRVYWEQL3+MTOxAS/hUupujUb8oOIntO
	ROGLpQe9h7pZszk6KxQ8QayNFJ3BFGsie6nZaCvYyy4cOs9BKe8xz25P77k3xXkUIJ1klb+KOCy
	DHcdTFz9PQCBzk8mmO1WvQWMYrzCzswT/mMFc40clwtD9ova/rNvZDy9hzy/OZVHCEtXU1u4vkD
	jiv4DO4oAMT1RImP03RcwrY9j92AWVx+isr9eG2SIwPtBxx+dbYnXf86GP2O142nPl6AGp3j+Nw
	hIj1oT4HT+I1I9t7E8yJr7crzBlHBr0vdlV1LjELd+poWfp8E/KGjbM0xhFayttRtznE6lz+LH1
	FOvyCecAoTLtJpoXKoNagJd9ayrjK3xO4OuwMHPIho8jSc2O30TLA1jL0kDQZRirNizc8XG46rx
	TJHIGeBAPpmq2AyhUG5JJikUkQFBoe0+YTeBf7GtzCXb6jlRSLlZgrBA==
X-Received: by 2002:a05:6a20:cfa2:b0:3c3:875d:c52f with SMTP id adf61e73a8af0-3cb85dc28femr14912687637.10.1785983434402;
        Wed, 05 Aug 2026 19:30:34 -0700 (PDT)
Received: from 92650adf53de ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586401627sm25143323eec.10.2026.08.05.19.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 19:30:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 1701fda2f58e345c050f4309971bdc07cd6146ba
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 06 Aug 2026 02:30:33 -0000
Message-ID: <178598343303.6970.13984855572272389219@92650adf53de>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/1701fda2f58e345c050f4309971bdc07cd6146ba/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 1701fda2f58e345c050f4309971bdc07cd6146ba
origin: maestro
test start time: 2026-08-05 16:27:19.588000+00:00

Builds:	   72 ✅    2 ❌    0 ⚠️
Boots: 	  172 ✅    3 ❌    0 ⚠️
Tests: 	26861 ✅ 4956 ❌ 3625 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a73796f54179f15daa540ef
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:6a73a33654179f15daa6b277
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:6a73a33654179f15daa6b276
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:6a73a33654179f15daa6b275
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:6a73a33654179f15daa6b274
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a73797054179f15daa540f6
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:6a739e3954179f15daa6a49f
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:6a739e3954179f15daa6a49e
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:6a739e3954179f15daa6a49d
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:6a739e3954179f15daa6a49c
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: meson-gxl-s905x-libretech-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a73797354179f15daa540fa
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:6a73a9cd54179f15daa6c08d
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:6a73a9cd54179f15daa6c08c
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:6a73a9cd54179f15daa6c08b
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:6a73a9cd54179f15daa6c08a
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
Hardware: sun50i-a64-pine64-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a73797554179f15daa540fd
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:6a738b2a54179f15daa60219
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:6a738b2a54179f15daa60218
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:6a738b2a54179f15daa60217
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:6a738b2a54179f15daa60216
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a73797654179f15daa54100
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:6a739bd754179f15daa6a0fb
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:6a739bd754179f15daa6a0fa
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:6a739bd754179f15daa6a0f9
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:6a739bd754179f15daa6a0f8
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a73796d54179f15daa540ec
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:6a73ac9d54179f15daa6c47f
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:6a73ac9d54179f15daa6c47e
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:6a73ac9d54179f15daa6c47d
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:6a73ac9d54179f15daa6c47c
      history:  > ✅  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.kvm.shardfile-kvm
      last run: https://d.kernelci.org/test/maestro:6a73c27b54179f15daa6e7ed
      history:  > ❌  > ✅  > ✅  
            
Hardware: dell-latitude-3445-7520c-skyrim
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:6a737a6e54179f15daa54b46
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:6a737b5454179f15daa5620a
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_i2c_30a50000_eeprom_50
      last run: https://d.kernelci.org/test/maestro:6a73a4d154179f15daa6b546
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.kvm.shardfile-kvm
      last run: https://d.kernelci.org/test/maestro:6a739acc54179f15daa69eb8
      history:  > ❌  > ❌  > ✅  > ✅  
            
Hardware: sun50i-a64-pine64-plus
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.kvm.shardfile-kvm
      last run: https://d.kernelci.org/test/maestro:6a73879e54179f15daa5f5b4
      history:  > ❌  > ❌  > ✅  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:6a73ae3c54179f15daa6c80f
      history:  > ❌  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:6a73794654179f15daa53efe
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.alsa.alsa_pcm-test
      last run: https://d.kernelci.org/test/maestro:6a73a91954179f15daa6bf5f
      history:  > ❌  > ✅  > ❌  > ✅  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
