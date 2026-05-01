Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0581240DFB6
	for <linux-next@vger.kernel.org>; Fri,  1 May 2026 02:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777602647; cv=none; b=ciWndLF36nqljbg6QzH0GMREYjRQ/RieGYDkk6uD/E5ERlmdKcsigGtzVqbFcErmjwFvAJB7/smByc/aDuBlOputz9m7GQv4eZPkrhernNCa8cdXhKlEMkosJOR3Wf8gM8bNrP5rdTNOX+1NnIerAqXi0vJyuStrSMCS952eGNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777602647; c=relaxed/simple;
	bh=akf79kdHg5qYgGJxeRJB9MG4JE+ewQ1Y1A7F3Shmcb0=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=APLnMd203lb1cqjyHZDRjFjZ7UI2l/7qdkRiEGJeqg2vHulDgnvVYhYijyQq0lxO3tTjmsxSVyjh91wdDBEVXI7z6+n+Q88A9SrXIN8CK9AqbBkToRqHcRgv0h9kYLdXtqwiEX3Q8vajfabyEAg2FTEWFLaU+qkALdQW2gvgVE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=LLP8PgdV; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="LLP8PgdV"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2eadb000b8cso3052709eec.0
        for <linux-next@vger.kernel.org>; Thu, 30 Apr 2026 19:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1777602645; x=1778207445; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RGnxLvZw4sJkZmV/vdZWRnpcUdEEHfs9udg8I8vPS0Y=;
        b=LLP8PgdVYPj/uhTzhiMFnwGgknBxIdTKmSZtzXSI1uyxZ2f2nW8aDfQxPWdKjzibz4
         dUhwha9Me5XyXik8slDJGrAzCPvshnL7XeOtSwyxOuMfYeYU9ydURFS54RY0gsZwP/PQ
         ZmnJwLNLiUOg16Vb5IYkaE0ntTDomF2QAznjgQjbpR1MtrNwLoHFMQquAxYfSlHgs8VK
         dm2DMIQo9cKKohvo55I2wlZlbxKFwuUFmhaAEYqLjVyJ8mfCs9hAwjoAkt2PnMd0Qsdd
         DXG48frPbf64H8U79UYHYIpxDCml/FxizrS2yC/oemnBfKiBBrqRdsJbhCU7fWRqX8cK
         2FRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777602645; x=1778207445;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RGnxLvZw4sJkZmV/vdZWRnpcUdEEHfs9udg8I8vPS0Y=;
        b=X7CBXsoDXfxhGIe7uOnsQRDhmcrh6Tk3MxArRvuj5e3U4JJ38Jpvs9OfIeCzj/7dNj
         pfU+4UOx9DB65qsNCAJVfLMbS2ZpGNWgM/uXiN+zrUI6PuXVazVwJya204MLAr1kcAVw
         DdnYaX35sG9mSrgz+y6qbdvaNGsQWDd1B/utlJOQPqJCJsKRA3+9wq4Ib67fm0QgdLX4
         eKxq5kEy0fpXf1H63m4eFTYioTs0PLfxG9mcov+5r7W5KJEeiMHDnFRZxckSjouUCR8U
         ElQYefGSrx+9nUuVoERnprv8hiy52fZmm5w9MuJcpmLR86ZUgGd9Rzcl9Hxp+mFW3HNZ
         RsLw==
X-Gm-Message-State: AOJu0YxIgw2xG6uQEva5z/89/md9+YxBMJaXGntiyxMuCENkSzQ+enjh
	PGtmRPphZieq3y+ixdbn6O8WHYF2Tdal8rJW+Yw8MeZhvD9TEtOqDi5UaMwDRhB4uNM=
X-Gm-Gg: AeBDiethZ6RYYmJTuAZHdzEQ35XjRF/YxEhugyfE3TtMwmfOl+sP0IEMCwqbbNO/dKb
	ePKMTUmCYO5LuiHj/N14jvdD2CovLp0BRmhDXNDED+NyHKOPCLMur9UF3V6dCvVBO+EYayEOGOZ
	aPGpd/quBJlVY2Pk3r2bQjC/H7Cy5dzPGZpuf49nabItanIgM/uDjdJIpJP9nWjFfk7RjT//8cY
	bm9h+nJtLFf3VRrpbGr4WyIHX5+tUQrIPRkCRMRI7VLM6oiVe7PsS/WbmGtY2V3Oc+9LxLuXJjL
	IiMyNx7dTd0QgHJjaT8T0E7A3aGEFhUpffZnxFuGnkz0lu05Nd4mvs3uVOo9L/qEddqMZ/Zj4GE
	XPWyWOsC3l/kGJoCTV8O4DQDLqp3DXUnwitHI0XcGpxwL/k+SGORQJyQua9LOR/XpNmucrjJuf9
	oR2sQPv0eAc3KERDEg6ixLEv47P/ctaIlaXlpJTg==
X-Received: by 2002:a05:7300:7316:b0:2ed:e12:3770 with SMTP id 5a478bee46e88-2ed3e87d303mr3250969eec.32.1777602644934;
        Thu, 30 Apr 2026 19:30:44 -0700 (PDT)
Received: from 997d03828cfd ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3bc6a79esm3133210eec.26.2026.04.30.19.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 19:30:44 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - b9303e6bff706758c167af686b5315ad00233bf8
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 01 May 2026 02:30:44 -0000
Message-ID: <177760264382.770.13409830947130516894@997d03828cfd>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/b9303e6bff706758c167af686b5315ad00233bf8/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: b9303e6bff706758c167af686b5315ad00233bf8
origin: maestro
test start time: 2026-04-30 12:11:09.608000+00:00

Builds:	   59 ✅    0 ❌    0 ⚠️
Boots: 	  177 ✅   11 ❌    0 ⚠️
Tests: 	23836 ✅ 4336 ❌ 6617 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.proc.proc_read
      last run: https://d.kernelci.org/test/maestro:69f35a84800b539063eb88bd
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.rseq.rseq_param_test_compare_twice
      last run: https://d.kernelci.org/test/maestro:69f382228bc8b7207a78b78f
      history:  > ✅  > ❌  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:69f3527c800b539063eab298
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: monaco-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.proc.proc_read
      last run: https://d.kernelci.org/test/maestro:69f3553a800b539063eafc64
      history:  > ❌  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: monaco-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:69f3526f800b539063ea9a4e
      history:  > ❌  > ✅  > ❌  > ✅  > ❌  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:69f3526a800b539063ea9a05
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
Hardware: qcs9100-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.capabilities
      last run: https://d.kernelci.org/test/maestro:69f35255800b539063ea994b
      history:  > ❌  > ❌  > ✅  > ❌  
            
Hardware: bcm2837-rpi-3-b-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:69f3529d800b539063eacac7
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:69f3d08b8bc8b7207a7a07e3
      history:  > ✅  > ❌  > ✅  > ✅  
            
Hardware: lenovo-hr330a-7x33cto1ww-emag
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:69f3503a800b539063ea8d52
      history:  > ✅  > ✅  > ❌  > ❌  > ✅  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_mt8195-sound
      last run: https://d.kernelci.org/test/maestro:69f356cd800b539063eb2f94
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c104000
      last run: https://d.kernelci.org/test/maestro:69f356cd800b539063eb2f00
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c105000
      last run: https://d.kernelci.org/test/maestro:69f356cd800b539063eb2eff
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c106000
      last run: https://d.kernelci.org/test/maestro:69f356cd800b539063eb2efe
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c107000
      last run: https://d.kernelci.org/test/maestro:69f356cd800b539063eb2efd
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c108000
      last run: https://d.kernelci.org/test/maestro:69f356cd800b539063eb2efc
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c109000
      last run: https://d.kernelci.org/test/maestro:69f356cd800b539063eb2efb
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c10a000
      last run: https://d.kernelci.org/test/maestro:69f356cd800b539063eb2efa
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c10b000
      last run: https://d.kernelci.org/test/maestro:69f356cd800b539063eb2ef9
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dp-intf_1c015000
      last run: https://d.kernelci.org/test/maestro:69f356cd800b539063eb2ec6
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dp-intf_1c113000
      last run: https://d.kernelci.org/test/maestro:69f356cd800b539063eb2ec5
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_hdr-engine_1c114000
      last run: https://d.kernelci.org/test/maestro:69f356cd800b539063eb2ebc
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
