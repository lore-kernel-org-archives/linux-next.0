Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910D7296BBC
	for <linux-next@vger.kernel.org>; Thu, 30 Apr 2026 02:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777516222; cv=none; b=miuMKugV+FvqzN2w2xxcOP/l0Xt/Kq8rv2Xa3ScGNbqZOfGMAe88SYeoNVGJYXio802yUuRYM40OMmjA0krc2v0sGdVD12ECy7SyTTOKZ+SPD0QIlvyPwjNFxT0jCrs1RnWQo3aQAWjSLn4ZWmYBpJB81mmKf8MtSr4rivJ0Yf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777516222; c=relaxed/simple;
	bh=i3ThTOgBoC/gWkeiz6Ls8wsC2GmgKGsBUBoi54J4RZY=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=Wa2H1qkn6HqLAFbgBXmuYQ8+4cMT3Hx0zRRQCjRrrsBDUPZUlIDAdAIB8gW8d0GS4+HjuzXbW+U5zviHTW8/pbKrcnwJuqnzbB5CYZU0YWgNvBMOdCoe76w0md3MMZ2uXWFgG/8cGY0PKc29IDYBPqTkb6zLtUq/+YZih0BsmbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=XA3Xuhd9; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="XA3Xuhd9"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12c19d23b19so659720c88.0
        for <linux-next@vger.kernel.org>; Wed, 29 Apr 2026 19:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1777516219; x=1778121019; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7K/IISfVL/svwtYApkDa1cnWZcxUCToKFUAKM2aHltQ=;
        b=XA3Xuhd9ypX7Hi+0e0Rldnr/y/eEU8hW7AdPDF/63I8OZr4eaiT6OpNHfPG3QlVVO4
         +7CzX2jFOPpQS8Y9QGEVbRozDIZtHUBkqs4Y23bYcggbYlMtK6DFmyx7M7lI/JWSJ8Sd
         VTNeIiie8uT5teYgT8JkBUIKd9TZTf85EN9HAUlIpShJ+IFb1WI294twBmaSVBkxkT9Z
         L6nvEwMDVimjUGjjTxJLxkIbDGIo5A8HyuxxYMAAFw0iWUAK2m4O2+LdshLtA6/4TsRr
         vVVLUQtSST//5hcBECxqYoyOC5QQgutNSVAWajeh5efUt76z79LX1DTIgYBp9Yx5zf/4
         iKPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777516219; x=1778121019;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7K/IISfVL/svwtYApkDa1cnWZcxUCToKFUAKM2aHltQ=;
        b=M9Ih9Oqz181M61C/N6WpOqNJ+LnaHeDEtk+v1lolpb0d3uyBI9+jyFhToEa2tjyNcj
         7xUZGQpOePLxfvC3YJgmR2aOfTe/XGG6oa7q221uEYm6P+tiDuTAB7UMZdwWvWDx6aSw
         eey4ilQ0h2f6alYM7b6trpIoi1665npFUnCJ2lfHtMPCoWvET/0j7UxXW3MkM+z8xO+T
         Vd89sjFZuAcGcwY0PvA0NWvOzSGfjpQmD0Wp3TbQlpi9X5TUpipftRfHwtv1sNST7MtP
         Qf3fcAo1dsXjTqN+NCPFqylPjOF4F1PXA4MfQ8r1CJuRPStK9YIEUddLUSZCy50Yf3Cq
         c4Iw==
X-Gm-Message-State: AOJu0YzDPUizzZJ4T4TE0NtSAeb50BKntfzQcCS6nRjDPpdapBgNxNoM
	vvdOo3ric/CG/gsDiPxh4BrTE8McrK33z9bw0v9KjZQQWFsKQXeUkl8emlqzu4ZjCU4=
X-Gm-Gg: AeBDievXcQBcbG/h91jG5dUiEXqVuYJ+uD3HzfaGPusiEgYjbBVOqIdDykhIMrr+NrT
	V7iGSY29+B/OGzU77WqfioeZscYETk5fxR2R1+zUd9SPk5QO7L/svr6urUJS8qRHCvUoz6SrE0o
	2Q9tWdzuInEj0cLOE2+3HDSF3g5HwmA2teDm30SbJXdZRulYpx1LR9P5Fvg0cvaubo7s6eW3Hbs
	NiRT96OlmvL2diWjLv0MOQUf8uiYYEa9QzlLyFfqcIeZby8CZDz+31k23KbxnB6cEUefoBy2aWL
	Ewb9wrneOEQ5+xK+eYL9fSV65E3FvwKndAKlUQv0r/lmWE7YtLkyYYzlh9Ikv5w1ppatYG7XcQB
	s8nKoRnWrWpcCBkZqJi+N7eIPZ7tstJewWJSjyspYbDwL5LCfpxbCGPpbwmVyvRXUyAb8RO2ZxQ
	+GeZWfYpoIubmrnEMEXsCBdjkGgosafn18FFEe/A==
X-Received: by 2002:a05:7022:258f:b0:12a:6b3c:de54 with SMTP id a92af1059eb24-12dead0b04dmr583586c88.29.1777516217202;
        Wed, 29 Apr 2026 19:30:17 -0700 (PDT)
Received: from 997d03828cfd ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed1c06ebcdsm4723910eec.16.2026.04.29.19.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 19:30:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 0787c45ea08a13b5482e701fabc741877cf681f6
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 30 Apr 2026 02:30:16 -0000
Message-ID: <177751621608.311.1376020912258363248@997d03828cfd>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/0787c45ea08a13b5482e701fabc741877cf681f6/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 0787c45ea08a13b5482e701fabc741877cf681f6
origin: maestro
test start time: 2026-04-29 12:19:17.398000+00:00

Builds:	   58 ✅    1 ❌    0 ⚠️
Boots: 	  177 ✅   10 ❌    0 ⚠️
Tests: 	24270 ✅ 4340 ❌ 6637 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: monaco-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:69f20937800b539063e36b4e
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: lenovo-hr330a-7x33cto1ww-emag
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:69f21a50800b539063e467a0
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64.kselftes_.arm64_hwcap_sigbus_LSE2
      last run: https://d.kernelci.org/test/maestro:69f22276800b539063e4b5ec
      history:  > ✅  > ❌  
            
Hardware: qcs9100-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.proc.proc_proc-net-dev-lseek
      last run: https://d.kernelci.org/test/maestro:69f274bf800b539063e638ac
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.proc.proc_read
      last run: https://d.kernelci.org/test/maestro:69f274bf800b539063e638a0
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.proc.proc_setns-dcache
      last run: https://d.kernelci.org/test/maestro:69f274bf800b539063e6389e
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.uevent
      last run: https://d.kernelci.org/test/maestro:69f205c007f3fa55982e706f
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.uevent.uevent_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:69f20989800b539063e36ccc
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.uevent.uevent_uevent_filtering_global_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:69f20989800b539063e36ccd
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: qcs9100-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.capabilities
      last run: https://d.kernelci.org/test/maestro:69f2011507f3fa55982df7b8
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller0_14001000
      last run: https://d.kernelci.org/test/maestro:69f21220800b539063e3f151
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58_aux-bus_panel
      last run: https://d.kernelci.org/test/maestro:69f21220800b539063e3f145
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14008000
      last run: https://d.kernelci.org/test/maestro:69f21220800b539063e3f129
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14009000
      last run: https://d.kernelci.org/test/maestro:69f21220800b539063e3f128
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_1400a000
      last run: https://d.kernelci.org/test/maestro:69f21220800b539063e3f127
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400b000
      last run: https://d.kernelci.org/test/maestro:69f21220800b539063e3f11c
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400c000
      last run: https://d.kernelci.org/test/maestro:69f21220800b539063e3f11b
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: monaco-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:69f2013007f3fa55982df879
      history:  > ❌  > ❌  > ✅  > ❌  > ✅  
            
Hardware: qcs615-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.proc.proc_read
      last run: https://d.kernelci.org/test/maestro:69f209f6800b539063e37193
      history:  > ✅  > ❌  > ✅  > ✅  > ❌  
            
Hardware: bcm2837-rpi-3-b-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:69f201e807f3fa55982dfe0e
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:69f2049c07f3fa55982e6699
      history:  > ✅  > ❌  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:69f201b907f3fa55982dfb37
      history:  > ❌  > ✅  > ✅  > ❌  > ❌  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:69f2012b07f3fa55982df85d
      history:  > ❌  > ❌  > ✅  > ❌  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_mt8195-sound
      last run: https://d.kernelci.org/test/maestro:69f21225800b539063e3f328
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c104000
      last run: https://d.kernelci.org/test/maestro:69f21224800b539063e3f2c6
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c105000
      last run: https://d.kernelci.org/test/maestro:69f21224800b539063e3f2c5
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c106000
      last run: https://d.kernelci.org/test/maestro:69f21224800b539063e3f2c4
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c107000
      last run: https://d.kernelci.org/test/maestro:69f21224800b539063e3f2c3
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c108000
      last run: https://d.kernelci.org/test/maestro:69f21224800b539063e3f2c2
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c109000
      last run: https://d.kernelci.org/test/maestro:69f21224800b539063e3f2c1
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c10a000
      last run: https://d.kernelci.org/test/maestro:69f21224800b539063e3f2c0
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c10b000
      last run: https://d.kernelci.org/test/maestro:69f21224800b539063e3f2bf
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dp-intf_1c015000
      last run: https://d.kernelci.org/test/maestro:69f21224800b539063e3f2be
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dp-intf_1c113000
      last run: https://d.kernelci.org/test/maestro:69f21224800b539063e3f2bd
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_hdr-engine_1c114000
      last run: https://d.kernelci.org/test/maestro:69f21224800b539063e3f2b4
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
