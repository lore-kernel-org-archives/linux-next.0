Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB664B04BE
	for <linux-next@vger.kernel.org>; Fri,  7 Aug 2026 02:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786069840; cv=none; b=m6hBNi/sDogeVIthaXZ0ebgXUS2ME/lBkR/FXlWExK4+Q2zy7iVec60DosrwB+qc3NP5pDeMGLCgULPhcZHs3lEwEKQJgpqr3kLYMhTnxmwDZzYGKw0JtZjD3rlYnIB6WSGbypDWv+z74bKaRKk0pmtvI+/HlqolNft11NQNoUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786069840; c=relaxed/simple;
	bh=O9Acuu42O8dNMISzmMINjElZP0YoY66z9zWRFQVx0b0=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=dOk6wiaktpiwYDuUO7iVOwcu7WKFikAp9PMcFrBx41TnCloVcXhuyZWeROgn5zLxto/a8GCNSW9W1S0pTMSx/XGv4O75P7goUjwnFGT5msMnOV/+ncIdQhr6ocWsFfRbDVizBJCYUtiNBHHjgrAXRuvYBgI4zdaJrZGSZ3vYu/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=iokMwoMj; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="iokMwoMj"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cbb8b54fcf8so2655902a12.0
        for <linux-next@vger.kernel.org>; Thu, 06 Aug 2026 19:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1786069839; x=1786674639; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D49yifipaeV4xl7hInF7oc8Kzwn52IAlb9ENn+JJiSQ=;
        b=iokMwoMjC86dBXfHlO2zquJpTU+HtyD3vcmFVD0QKOzZkFXl2AIv5uFBabx97TaOBt
         9hQSyYjFa2wnuh7SchXkglU+vDb8UWt4cY7trjEaAeMWOyObvSz+8bdTyNJDXo8oW1jU
         7CZmIAbDXA5Vo2KGt5kg5xNV0jdf3EuSqSxmTaoRcBwbUO8OpWNTxTyJj7ylZKm5lc/m
         ChPjXuT/ChI9kEjLGEXyxaDtGcG/YiDwyX5IyCHg4UxRKJrJxFxAx36PqHGMdvurhhIm
         HAcrM1TA3SPm3dl4gALB/TENmJHiM0GahpTT3vxKg0ApoheyI8oxeKmnPE3ST/WeGTua
         GxlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786069839; x=1786674639;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D49yifipaeV4xl7hInF7oc8Kzwn52IAlb9ENn+JJiSQ=;
        b=U4UwSGzzNe3HOvfqZxhW0iT3HStf9dSSfv2SQYeYy7XX9c9mmPhCiRu/LyAGt6UaAk
         kex/tvUqM03u9pyGMKdbLV4+tc07GbFZk+O70e0Fk7umvTEyQ/FTWM46qyJAm7S+B5if
         uQfp+Ina260E1FTYt7WKFtjgPK9NGrJkFkjkwbmDQlftH5kI68Iru591ggg4vfSVrsxA
         dKcInah5M+SxnmcEm1xBzhGloN3ORh4HKj0N3w+CvFzIZHp9/TD1pQePBBlBworxPD+9
         0NJPtviHz36jonYbIQOjxzYxFCxcCGMps03UTG+r4+oLgme/JFuuEtF26B5aD9I+gMJ/
         NxfQ==
X-Gm-Message-State: AOJu0Yy7nzxtCSWhsEgy6l/Bbyc1MKbChHNRoMSBg5zHjPiSn0P0FPda
	OmxyqMw3JSPJUnUL/k2KhhDQ+aTXgTAfCpJI7tLfnrswB/aSm8ZkzmN5/puIhsf+W74=
X-Gm-Gg: AR+sD11ArlupiCbytF4ZtFCENOAu2Cqn61h5B8Hsmk0disO2WBD3R+Greyjdg0HRvTf
	ZgHwhprM4W6z+XXuO2Q2Ik9Seh66F/5xcSHkvJGf4l6SWj5mIYnlTm8xDRFRltDDQz1hWUoV/yH
	lwxsHpM6P6A9J6zbupVebPi74VFbvWivnNqtdrxEkFq1cW20e71uW+HQ7e0AmwMygbVe23kOgQg
	n+psaDzW+OWyI2jGg915hmog3iB1tI1QShkXljG39XDBwX1sAV6bcXLk4n0BULwf8TTivxfaeMD
	ogBYT6P70QalO8xV5lzqWPA9dBPliy/OODnHMKwaClVtvhKEPNMW0h2EAjtU8/GU87M8AqoPKV2
	4lUZXriDTgaRzuODL9b8+0IJHCOnlUNNZftXSlIT2zS1ZrYRYj7IRqm/NhO+7CtR8MajRDEy0Oq
	wnbqrayKRCfRUbyaLoe61m+h8V7gcB7pE0USaCZejevz1qXwiJDQ1KyGmyeSF8zh8dyQ==
X-Received: by 2002:a05:6a20:b598:b0:3c3:a024:1360 with SMTP id adf61e73a8af0-3cb85eaad12mr23739100637.28.1786069838669;
        Thu, 06 Aug 2026 19:30:38 -0700 (PDT)
Received: from 92650adf53de ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141019b4eabsm2011805c88.6.2026.08.06.19.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 19:30:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - ea2bff00da89d7767d677bb68470130ba96f4928
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 07 Aug 2026 02:30:37 -0000
Message-ID: <178606983702.7416.12460827335013145934@92650adf53de>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/ea2bff00da89d7767d677bb68470130ba96f4928/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: ea2bff00da89d7767d677bb68470130ba96f4928
origin: maestro
test start time: 2026-08-06 15:07:53.148000+00:00

Builds:	   72 ✅    2 ❌    0 ⚠️
Boots: 	  170 ✅    3 ❌    0 ⚠️
Tests: 	25587 ✅ 5137 ❌ 2275 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: bcm2837-rpi-3-b-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a74b13962f33761c0834920
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:6a74b95662f33761c084159b
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:6a74b95662f33761c0841578
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:6a74b95662f33761c0841501
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:6a74b95662f33761c0841500
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:6a74b14f62f33761c0834c79
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:6a74ba5762f33761c0844220
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a74b13c62f33761c0834931
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:6a74b76b62f33761c08402e2
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:6a74b76b62f33761c08402e1
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:6a74b76b62f33761c08402e0
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:6a74b76b62f33761c08402df
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a74b13e62f33761c083493c
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:6a74b70762f33761c083d158
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:6a74b70762f33761c083d157
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:6a74b70762f33761c083d156
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:6a74b70762f33761c083d155
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: sun50i-a64-pine64-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a74b14162f33761c08349ca
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:6a74b3cd62f33761c0838c27
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:6a74b3cd62f33761c0838bee
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:6a74b3cd62f33761c0838b99
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:6a74b3cd62f33761c0838b98
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a74b14362f33761c08349d1
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.arm64.arm64_hwcap
      last run: https://d.kernelci.org/test/maestro:6a74b75962f33761c083ff83
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.arm64.arm64_ptrace
      last run: https://d.kernelci.org/test/maestro:6a74b75962f33761c083ff82
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.arm64.arm64_syscall-abi
      last run: https://d.kernelci.org/test/maestro:6a74b75962f33761c083ff81
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.arm64.arm64_tpidr2
      last run: https://d.kernelci.org/test/maestro:6a74b75962f33761c083ff80
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: dell-latitude-3445-7520c-skyrim
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:6a74ab6b62f33761c082b7d5
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:6a74acb162f33761c082d42f
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.kvm.shardfile-kvm
      last run: https://d.kernelci.org/test/maestro:6a74cfbd62f33761c085d251
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
Hardware: sun50i-a64-pine64-plus
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.kvm.shardfile-kvm
      last run: https://d.kernelci.org/test/maestro:6a74cdc662f33761c085ca76
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_i2c_30a50000_eeprom_50
      last run: https://d.kernelci.org/test/maestro:6a74bc0862f33761c084960b
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
Hardware: qemu-arm64
  > Config: defconfig+netdev+nfs-root-boot+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6a74b52a62f33761c083c17e
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
