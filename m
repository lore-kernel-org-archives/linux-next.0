Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795746642;
	b=yr2/0Ti0hVAvpELdkUhp9i92fdMeEHL4PUL7XNxZ4By+bUvvo3scm3e6sL7RifWyJq2t
	 k2jTTJcc+HhixbFDmyzQDs+/1R9vE4QmArQc6Byc+7v98yLOvuBgC7TqzTXp/FwoOQhur
	 lk9MozGBeUPIhxfuD2cpK58kzFi1A3+sARDCkabArDM9AkgqDNPqPCGKW0smf86+/byGx
	 TmS602I6NRlun24NfeV/cl2KeFNFQvPcbNyYJ8SEjX3mfl5d3dYR8GQhfkIEhIyrxQCfm
	 wpQ2OfjYGgAySbfWSLfVk0ArJ/M4SKSxyiP3V1E2BHlXb4cw4KGOE7FZMQURJXG2DuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795746642;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:To:Cc:Reply-To:
	 Date:Message-ID;
	bh=Kl4So0eLnvakvT4EzLoJq5pzJAsB4uSt+9iJLkcz8GY=;
	b=dL7XZYqruqjBVf/M8q4U3gkvOCr5skBObB+Rhs6V+BBbgLCVxVqpJRPedFS9LfBdI2We
	 TXuUbd8R0x5d8m4Ndj1dEbbXuFRDNIevKzpyuR4xRHOmMNeUKWnH0RNq7tGYx8fp/fBzb
	 sOyQ8sI/toy/kyJbxhax+UUuDEFFcjJUckYLfuzu/FDPcoxSV9MHBHUuPJ6SihEf0lxrO
	 +AwTv4yMhWh3GMjuHy8onNQhUAhTpTcl58ZnQoPTdEGPgVrjLxLU50qY3dp5CwCOjyqvo
	 Mkvd5VBEMrm2AEZ9TfRBkFxE++aqBeXbxm91aG+Lg0BIyVeJsWNv4D1FpXPQg0EzyGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b="g5/A099B";
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC97606A31C
	for <linux-next@vger.kernel.org>; Fri, 27 Nov 2026 02:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DC97606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=g5/A099B
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33fb4680717so3802748eec.1
        for <linux-next@vger.kernel.org>; Thu, 26 Nov 2026 18:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1795746641; x=1796351441; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Kl4So0eLnvakvT4EzLoJq5pzJAsB4uSt+9iJLkcz8GY=;
        b=g5/A099BhECugE3FMs1rxfEQjH1Z9kQwlMeImhPNXFZIGh1Rail95WOWJnGKr654tT
         e/tS7TtowTTj7jw1ib9elIQEG2+AI1BtduV35n1+NSkkM70y+7kVyDBvIc0eGDyz/XHm
         uGuMFDenEa1gvsu8qNOtvilajj+V6zuN7VmPDlqfTNcak743Os7QeaOqs8PMKXumAEab
         s3jnPhaymofWqALwRzgDrsty5CoVeEEQsprGL1sXZdXyxqDqRilgWKDuu92Uxj6/cOYe
         0zFHbgPh89Y3h02H9D+KBZnZRy8x3u0YoRcXZYw/NAIkAZkFYTqypxSBIvoolHa88OEv
         2VgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795746641; x=1796351441;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kl4So0eLnvakvT4EzLoJq5pzJAsB4uSt+9iJLkcz8GY=;
        b=dCWo5R63jk6yyfFzma45Rg8tpbNvyws2sJSgVEChVqC8kk9XO2y/C6gUaZxPNG/iRn
         mwLr1/QBJ9uVsdo3KAH8fJB9I6uRPWdx78K7zRpRdgZRoS9Yk+W7Ln+Rfo/KYMr+DqJL
         8yY9evABS6h9njqlbEnAx5knSCYaJ++MIi3tIEfQUtyC2dFqgifjGxejR7x2xpjb1yHG
         32skvKPW1LUyXEgsnMlTdrrsQlTi2FwJTxqqgiq3iBfub9sZEsx9OYiYfJShfhV8SbbY
         36eVzZ8yazN62gjiKmPqfEH9xXsv/98F6eM36/0rtvOpqgYoHt2HWoXTAp+/T6qPPJuO
         T35g==
X-Gm-Message-State: APuU4Z/lRZAwed0LUii6HWQxOzTJ5JeSKDF11HDg8v3mav3fVHrtkgZI
	mqiaHYkyyT8URPqGYiGSvRJeXw62omerCmUBm3xdYaGzdhaTqEli6tAAWzP+jq136TVIMrS7o4V
	WM7RD
X-Gm-Gg: AZFdTZdatYrRv+jJqidvbdBpl2f2cjPUvN7smjA122Xo0cnwAoAEgpNmeW+5ptncUu9
	HM0ww6ecYwLsrG4tGIfQi8/2XKjYm2XavTE9x5cKiKp3K7tyUizM2+UER53EzrQnU5IWaZkG/+3
	xORQ+0Sle1f/AP+KxJQzIxU6peR0zCPvIdrQ1eX7qVpOj87VaFe64j9BgqDKNtdsjtR1AnL9vKq
	jlogDKflWIWaREG18MQ7uZ0uUcATMXEyxwspiUW2k86KySaoeBwhoIpgO10sDIalJ3slURHrcBd
	tnk51Q018x138WcgaS8Hv9GBBnkzrl2/2ih5djmYYqwjNMJ+oyHgRDE9ZQe19wY3jHVYJ8t/KNo
	P2RiCQn9Dd+u3lzBfY43dDi6UfgcMjUN2wTZqjK5UyS8EvnPYX3ZYSO4GJW0ysbWH3lImPEz4dx
	lHpOoETDg33BfbTltwsC4Us+xB94iqg6Qh03jb/yWNiWPvu7Z90pdKbkO3r1mJh5oJrAUk7NmOK
	FJZ+tKVvOpyuTwuvAJu263G5upMX2UVobsVUVhREE2cX8snDIWI2/IHO7LhGvJ0chTsskP9feI+
	wl3/4sCaG4lmXBK5P82TWA==
X-Received: by 2002:a05:693c:6205:b0:386:a498:3ab1 with SMTP id 5a478bee46e88-386a4983cc5mr19479196eec.25.1795746641068;
        Thu, 26 Nov 2026 18:30:41 -0800 (PST)
Received: from 52d83ede7c60 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm59822720eec.8.2026.11.26.18.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:30:40 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - a9c48428cbd8d96b26f92631d0db6f8519c5fcc5
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 27 Nov 2026 02:30:40 -0000
Message-ID: <179574664012.181784.14026930300675253889@52d83ede7c60>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/a9c48428cbd8d96b26f92631d0db6f8519c5fcc5/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: a9c48428cbd8d96b26f92631d0db6f8519c5fcc5
origin: maestro
test start time: 2026-11-26 17:03:58.586000+00:00

Builds:	   66 ✅    4 ❌    0 ⚠️
Boots: 	  187 ✅   20 ❌    0 ⚠️
Tests: 	37508 ✅ 2297 ❌ 4222 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: hamoa-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.devices-probe
      last run: https://d.kernelci.org/test/maestro:6b087d16286e1965ecc47910
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: purwa-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:6b087c98286e1965ecc47020
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1bd0000
      last run: https://d.kernelci.org/test/maestro:6b0882ad286e1965ecc4d492
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1bd0000_pcie_0
      last run: https://d.kernelci.org/test/maestro:6b0882ad286e1965ecc4d490
      history:  > ✅  > ❌  
            
      - kselftest.timers.timers_set-timer-lat
      last run: https://d.kernelci.org/test/maestro:6b088786286e1965ecc4e9ff
      history:  > ✅  > ❌  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.efivars
      last run: https://d.kernelci.org/test/maestro:6b0873ea286e1965ecc3ca27
      history:  > ✅  > ❌  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_iommu_3da0000
      last run: https://d.kernelci.org/test/maestro:6b089b19286e1965ecc61f05
      history:  > ✅  > ❌  
            
Hardware: qcs615-ride
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.ring-buffer
      last run: https://d.kernelci.org/test/maestro:6b087421286e1965ecc3cdfa
      history:  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: purwa-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.devices-probe
      last run: https://d.kernelci.org/test/maestro:6b087d1c286e1965ecc479dd
      history:  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: glymur-crd
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1bf0000
      last run: https://d.kernelci.org/test/maestro:6b088115286e1965ecc4a0f0
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1bf0000_pcie_0
      last run: https://d.kernelci.org/test/maestro:6b088115286e1965ecc4a0ee
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_1bf0000_pcie_0_wifi_0
      last run: https://d.kernelci.org/test/maestro:6b088115286e1965ecc4a0ed
      history:  > ✅  > ❌  > ✅  > ✅  
            
Hardware: hamoa-crd
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.ftrace.ftrace_ftracetest-ktap_event_trigger___test_poll_wait_on_histogram
      last run: https://d.kernelci.org/test/maestro:6b08b85d286e1965ecc7803a
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: qemu-arm64
  > Config: defconfig+netdev+nfs-root-boot+ltp+crypto+ima
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6b088a81286e1965ecc4fabd
      history:  > ❌  > ✅  > ❌  > ✅  > ❌  
            

### NEW BUILD ISSUES
- Issue: maestro:519b71c76284c9e0a0e9ed341a6f47f0acfcf144 | version: 1
  Build: maestro:6b08680d286e1965ecc2f29e
  Comment: variable 'data' is uninitialized when used here [-Werror,-Wuninitialized] in drivers/gpu/drm/amd/amdgpu/imu_v13_0.o (drivers/gpu/drm/amd/amdgpu/imu_v13_0.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2026-11-26 17:49:40.615832+00:00
  Culprit: code
- Issue: maestro:519b71c76284c9e0a0e9ed341a6f47f0acfcf144 | version: 1
  Build: maestro:6b086811286e1965ecc2f2a1
  Comment: variable 'data' is uninitialized when used here [-Werror,-Wuninitialized] in drivers/gpu/drm/amd/amdgpu/imu_v13_0.o (drivers/gpu/drm/amd/amdgpu/imu_v13_0.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2026-11-26 17:49:40.615832+00:00
  Culprit: code
- Issue: maestro:519b71c76284c9e0a0e9ed341a6f47f0acfcf144 | version: 1
  Build: maestro:6b086842286e1965ecc2f2e6
  Comment: variable 'data' is uninitialized when used here [-Werror,-Wuninitialized] in drivers/gpu/drm/amd/amdgpu/imu_v13_0.o (drivers/gpu/drm/amd/amdgpu/imu_v13_0.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2026-11-26 17:49:40.615832+00:00
  Culprit: code

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
