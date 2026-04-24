Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34D61C5F13
	for <linux-next@vger.kernel.org>; Fri, 24 Apr 2026 02:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776997863; cv=none; b=TJA/iEyORXDU+AOW+YCDW0Bp4YG3IawN9Gkx80rmDdTQIFd1BMxIl82XyKan+QSQx5WLT/EhQahDx15ODzxmAJYvUwn8+uK3z6dWKHxauTKcePRzHHUKL2vU5AcQcpMIpEkRGN7eUXMj2DHyizldgNpqBo10TWD/dYEwojYMAAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776997863; c=relaxed/simple;
	bh=Pn3wE6r0xPKlrj9nXPfGm4QK3Oo3RrnTSUIIMHDkwMY=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=qB/yp+eL4useqDFRV6p/Tl3ZlzgbCUHejZPHn2asuMpPv7raWhKGJ2kH+bWFX6O0Z1/lsAMZtFJ/hp6a/eXbYXYDFkQt8/GstLkNegAnrqiRbKSCAgCSnCsUc909xRBw7umzT7QrwAlREZrxCPGeboeHswMvNyp86tiLKCHk2Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=WfP5nN6K; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="WfP5nN6K"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12c637089ccso6915293c88.1
        for <linux-next@vger.kernel.org>; Thu, 23 Apr 2026 19:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1776997861; x=1777602661; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FeAz4XjYez6ul4tEq2ww5+JPSVjtcOrFFvUNDkIJRbI=;
        b=WfP5nN6KkjrnwGmAp3zidR0dTE24hqhXkPS6BjI3ACZgkRAahH8o1zpJ869JyAx5eV
         LLAij8QKU7ik6PMO7oBf/eN0ijF19u0cQxfflWAkYoZLTUmuMJwDKoMP7lvqQKQT89Yv
         oYTqpMxhOE20O46AChe2zGjqjM8zv2XToiMLyjNmfzNIK9RVevvG1JSXcV7EqJLR9pSV
         DXHpSNh8wGGENTQ/xPumMDFwGk6bsahjjUcDQlKu8fPer558AA9kzQWzGRq4s1Q0Ks51
         4OBtUAkzDXLaSdXoeStjwvAazrT/RNQ70XhFMBFk+RqoKz7VY42lbPE1amSj5Ueq2Hwh
         8rBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776997861; x=1777602661;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FeAz4XjYez6ul4tEq2ww5+JPSVjtcOrFFvUNDkIJRbI=;
        b=E2EIj7lNhZmsa1D3rHtfj67q2diuI/sBHL8kdwOF0jhZWUQXF50ZCfRKxu2IP7I6mj
         O70NE9OrncxAp0Iw9Li/p70gJqZxRqdPI+89wkyT/ntFvT992SpZJyW1rrhCD3wpjoHd
         O+q4n277JRaAAldV8fHun/+gPPg8TsBxf3t5Yu8eRGYI1uhS5TMTEcq7nHBtDytxCvTX
         PsADzfMS52dnaJMFuFVfXfk+Uu8E0pLegJwge9tHJWrpwv4yq39ZoCDjRjA67wBmh8Wz
         PI6euyEb7rZqC+FEVEkRgW6XNi2dnogLiq6CsS3FsMahqWhmRlOEzEI9tXyDGTbXNG9m
         A4ww==
X-Gm-Message-State: AOJu0YwBehvaLUxHp9P7WRA/cSDtxSnqUyI/kDcUImjQZPLNHym78FhQ
	GmyW+N18n58rHSWMJ5zd4j7Ltu/N7hb3TrxLLiX9O9rsBJjXFzTubMsdPbp7sDpmdgY=
X-Gm-Gg: AeBDieuFv6AcQg0HCs5JXtQvWVBkLmB5QoQZVwNtiWZxRClzYZI/FMqvpRkWR2a066O
	NsHigKZIJvRpUJDOAeIFX+1K2L+rMOMxuHg6oj2R/hUT4qAcmOUnW1KH+c2Cw+QvY0HE2jBgw4+
	OC5Q0bPPUKoFJnXRZN7PHeKqxFdF0doVABlg3of/BVmpMcZpKWVp9y8eGTbiBKqOeIYaOKOKwQP
	agfiPG1q9NjilbbDM/z7hGw452vmrvpegN4AnxIs09aFN79ucBj826/UmAjvwZRDHXzMb0o8AdG
	Lj4EM1D252nxC6ddfv9tIIqF44tsJmQi/t7oiM0BO0KmL7i0f5GD86YewKNrtezqtP/RCFYgGiu
	aUtPILiTejpsglqHnF21aX/eiMxW61ypVKFHXZKRn9eU7PxmRL0r5rR/aFVNQQpP87v33T4Ivmt
	9fIaCQ66AxDLJ9R72cA4vPy9cf03I=
X-Received: by 2002:a05:7022:ff45:b0:128:d2a5:709c with SMTP id a92af1059eb24-12c73fb3381mr17803458c88.33.1776997860592;
        Thu, 23 Apr 2026 19:31:00 -0700 (PDT)
Received: from ab39070dab57 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12dbaab165bsm11995041c88.6.2026.04.23.19.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 19:31:00 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 4c406406070d57dbefeaad149181785330c23f92
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 24 Apr 2026 02:30:59 -0000
Message-ID: <177699785956.368.8068176262971480841@ab39070dab57>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/4c406406070d57dbefeaad149181785330c23f92/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 4c406406070d57dbefeaad149181785330c23f92
origin: maestro
test start time: 2026-04-23 14:31:38.092000+00:00

Builds:	   57 ✅    0 ❌    0 ⚠️
Boots: 	  181 ✅    5 ❌    0 ⚠️
Tests: 	20973 ✅ 3972 ❌ 4204 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: qcs9100-ride
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.ring-buffer
      last run: https://d.kernelci.org/test/maestro:69ea4a539b5a968309f9ca39
      history:  > ✅  > ❌  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.uevent
      last run: https://d.kernelci.org/test/maestro:69ea44e29b5a968309f9bd83
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.uevent.uevent_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:69ea46039b5a968309f9c092
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.uevent.uevent_uevent_filtering_global_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:69ea46039b5a968309f9c093
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller0_14001000
      last run: https://d.kernelci.org/test/maestro:69ea3e499b5a968309f98d1d
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58_aux-bus_panel
      last run: https://d.kernelci.org/test/maestro:69ea3e499b5a968309f98d11
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14008000
      last run: https://d.kernelci.org/test/maestro:69ea3e499b5a968309f98cf5
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14009000
      last run: https://d.kernelci.org/test/maestro:69ea3e499b5a968309f98cf4
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_1400a000
      last run: https://d.kernelci.org/test/maestro:69ea3e499b5a968309f98cf3
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400b000
      last run: https://d.kernelci.org/test/maestro:69ea3e499b5a968309f98ce8
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400c000
      last run: https://d.kernelci.org/test/maestro:69ea3e499b5a968309f98ce7
      history:  > ✅  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: monaco-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.proc.proc_read
      last run: https://d.kernelci.org/test/maestro:69ea52a89b5a968309fa3b0d
      history:  > ❌  > ✅  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.tmpfs
      last run: https://d.kernelci.org/test/maestro:69ea4e449b5a968309fa1398
      history:  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: monaco-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:69ea53d99b5a968309fa3c39
      history:  > ✅  > ❌  > ✅  
            
Hardware: qcs8300-ride
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:69ea44ca9b5a968309f9bcef
      history:  > ❌  > ✅  > ❌  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:69ea4e669b5a968309fa1467
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
Hardware: lenovo-hr330a-7x33cto1ww-emag
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:69ea3c3e9b5a968309f9855d
      history:  > ✅  > ✅  > ❌  > ✅  
            
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_spi_11010000_can_0
      last run: https://d.kernelci.org/test/maestro:69ea4ee29b5a968309fa1cb9
      history:  > ✅  > ❌  > ✅  > ✅  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
