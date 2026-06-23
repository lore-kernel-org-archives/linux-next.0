Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF8D3FBA7
	for <linux-next@vger.kernel.org>; Tue, 23 Jun 2026 02:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782181842; cv=none; b=BHnk02O87B8kuIM9iey0MGI9BbFJl9zdASCUEbgl72+k5XT1bTbYlGIkeGSjvzLFlUJuhH/R9hxiHoBHrl+a8sWzuCu8RxbpV03CVyw3S4fAHM1sH+ntBxXk5ATxH/Wk9hkxGcAboRjLCYdbzdY045COaMK0qnWndSqlmYZBK/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782181842; c=relaxed/simple;
	bh=tyykbUevt1LKVvRDla/brJU5FTVjeJfYyBi+d3/CS1k=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=mtGeR99DOzOZH/8dXl4446xK5fbWIRQVC+RaAVGyCMwYkfB7+WGTi5PduKQuspwv/pr+FWZStE2tMZiDldKexM+J3fkUYuHI2C59XMuuZoL6PZKhhU03rWM+l3yNs8T/ijNoWaXI6zc+2m4xeQkoj78REVMCciPBaypRAFePcTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=UI0VkUTR; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="UI0VkUTR"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-13981833e13so5599840c88.1
        for <linux-next@vger.kernel.org>; Mon, 22 Jun 2026 19:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1782181839; x=1782786639; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oroZH6dje1krTBNYzajZy5EAG1V8mBh9N6rz1We7ZuI=;
        b=UI0VkUTRTV8hY7ztVuFUHgtQfDezbvuhcBLjQW4Ab8ZElz1QzyvuMM7K2KbHmmWgAc
         3ul4uT/6SpS5K8ls/vF0i3SuMDRnQSnkWIbgp2KZjtL/8UiKib4U4ATsw37Rf6NLzwhf
         n63eqPBjWGvGWT4lK/6TGf0+aCPz5Jv22piPTlwXsti4u0/wdoe1VyL5wHNqi01EUOI3
         VjeTOtRLUMtVKLpav6KazuhTdL1ltFbxMaXleXrMca4VXLhxhFEkd9gF+t45oK7P0GDM
         +XmEJnA4H3eydsNcQIQC95jTcnYYch88PhBEg51U/31Taws1IQ8eiZVYz0OFkncgajfh
         811A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782181839; x=1782786639;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oroZH6dje1krTBNYzajZy5EAG1V8mBh9N6rz1We7ZuI=;
        b=iuIx6vtMudBnZ2RmmM0nMS0bu0WvjFYG7BPd3x21Y0JmSLRIonT36Ala/OcbAVCIqi
         VHLpx6hvSQsaJ2fW83NoREhF/6cWS6IzvuiscPonoS0KSct2TW8G8/6Qlh0+cb59kXGw
         kArXvgFAd6yYrDIJ6XPwnwY18DSrwBOjktCWRi1UmKn3E8PbYLJGHqk8ORQeaOoOzVyG
         2ltMCup4DRBcXEK5nyM+avjXwwHaY7sMmJYqZ6962pg9KwLBx3eg8CskztSUn9OZ8aXn
         MN9CWel4BWmo3myLiRSz4cA2dM5o0SL03K1mUTMxZ9jn9KZFyqegU6BGji3pdZlUnUa9
         utiA==
X-Gm-Message-State: AOJu0YxJBF3fN/tKXAVjLf41fKYKJYRRuVgp/HPYN1eQsQBVViNDd1hh
	kByRaJOhw86xMVLP2MB7SWWjL2Ek5j1Hl1jxVl7JelGtgQlJRGRcgrv105UFU+D79lP2by2wGIs
	Gm4nT
X-Gm-Gg: AfdE7clBTgSxsTUKBkWRa/YxGcQtTzZwDPpjpARvELze6S3Vkx2iFCoeH36XOn3SRiO
	tBdi2Jy2NdV9VHVC8lx2/mnFUhWMOSAeiZMU/h/SYtY4+29BlYqb/D+3Eehw5MQjoKeB7dseWnz
	tuv611iOwMxtpPv66g2EKqjkMctvWGhZJjMIhrGvEsnGpGBlep5pbsH/BfXS1T70ld0w0mkdL6j
	6sLUBMuXrL/PrO8nKxSc+MqV2uFfHd2iEh547cMemeHILqHOe8eKXv5G45396rHXvFzYuIYcaq7
	rqiBJlJtp6ZCQ8BAQMyH0FoCA4xoHqvUF5OAEHMGjHwZV6+sIQ6i4D5fmy63u3tuvQXc2JX94e6
	tLHqp34dnZmVV/V1PhhxDheyOP3Gd0dm7dJ4rxzc3PETfCAoUzmwxvC78kZO6axIrNWf2s42xEr
	v0WnaSHw==
X-Received: by 2002:a05:7022:6614:b0:138:407c:1d0f with SMTP id a92af1059eb24-139c5cd8826mr639651c88.1.1782181839435;
        Mon, 22 Jun 2026 19:30:39 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1ba1c32csm14105308eec.6.2026.06.22.19.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 19:30:38 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 948efecf22e49aa4bf55bb73ec79a0ddcfd38571
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 23 Jun 2026 02:30:38 -0000
Message-ID: <178218183851.18703.6433712299160269455@330cfa3079ca>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/948efecf22e49aa4bf55bb73ec79a0ddcfd38571/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 948efecf22e49aa4bf55bb73ec79a0ddcfd38571
origin: maestro
test start time: 2026-06-22 12:19:43.770000+00:00

Builds:	   66 ✅    2 ❌    0 ⚠️
Boots: 	  170 ✅    4 ❌    5 ⚠️
Tests: 	30591 ✅ 5153 ❌ 6594 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6a3936ec9ab0e7cb7598d65a
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.timers.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:6a3941e39ab0e7cb75993be2
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.kvm
      last run: https://d.kernelci.org/test/maestro:6a3930df9ab0e7cb75986967
      history:  > ✅  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.capabilities
      last run: https://d.kernelci.org/test/maestro:6a3936b79ab0e7cb7598d3e7
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:6a3936eb9ab0e7cb7598d653
      history:  > ❌  > ✅  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_i2c_30a50000_eeprom_50
      last run: https://d.kernelci.org/test/maestro:6a393a949ab0e7cb75990fe5
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller0_14001000
      last run: https://d.kernelci.org/test/maestro:6a39325d9ab0e7cb75989f12
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dsi_14014000
      last run: https://d.kernelci.org/test/maestro:6a39325d9ab0e7cb75989f0f
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58
      last run: https://d.kernelci.org/test/maestro:6a39325d9ab0e7cb75989f07
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58_aux-bus_panel
      last run: https://d.kernelci.org/test/maestro:6a39325d9ab0e7cb75989f06
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14008000
      last run: https://d.kernelci.org/test/maestro:6a39325d9ab0e7cb75989eea
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14009000
      last run: https://d.kernelci.org/test/maestro:6a39325d9ab0e7cb75989ee9
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_1400a000
      last run: https://d.kernelci.org/test/maestro:6a39325d9ab0e7cb75989ee8
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400b000
      last run: https://d.kernelci.org/test/maestro:6a39325d9ab0e7cb75989edd
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400c000
      last run: https://d.kernelci.org/test/maestro:6a39325d9ab0e7cb75989edc
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: kaanapali-mtp
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.efivars
      last run: https://d.kernelci.org/test/maestro:6a3930709ab0e7cb75986520
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.clone3
      last run: https://d.kernelci.org/test/maestro:6a3936c29ab0e7cb7598d471
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a3936c39ab0e7cb7598d474
      history:  > ✅  > ⚠️  > ⚠️  > ✅  > ✅  
            
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a392f409ab0e7cb75985cbe
      history:  > ⚠️  > ✅  > ⚠️  > ✅  > ⚠️  
            
Hardware: cd8180-orion-o6
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a3936969ab0e7cb7598d21c
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
  > Config: defconfig+netdev+nfs-root-boot+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a39336d9ab0e7cb7598b785
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6a39336d9ab0e7cb7598b77c
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: exynos850-e850-96
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a3936979ab0e7cb7598d21f
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a3936989ab0e7cb7598d274
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.breakpoints
      last run: https://d.kernelci.org/test/maestro:6a3936989ab0e7cb7598d278
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6a3936989ab0e7cb7598d271
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
Hardware: imx6dl-riotboard
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a392f5a9ab0e7cb75985e5a
      history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a392f4a9ab0e7cb75985d13
      history:  > ✅  > ⚠️  > ✅  > ⚠️  > ✅  
            
Hardware: qemu-x86_64
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a3930769ab0e7cb7598654a
      history:  > ⚠️  > ✅  > ✅  > ⚠️  > ✅  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
