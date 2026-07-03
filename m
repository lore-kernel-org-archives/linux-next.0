Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642EE26B2CE
	for <linux-next@vger.kernel.org>; Fri,  3 Jul 2026 02:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783045811; cv=none; b=pAxtTbJiHARvYSWDzyPuzgr3BUJG4FYjo5gH6ttT577Va6ImB1dYCaOfoZxzfuVnTqUOmcdHCvl7L9upo56UzoGi13ajmkkjpMQo8LVl6nf6QX+X9ACy5Q+XgJqzMkGcHIyLkSM1LLgSgbkxuNnOvcaZccTod/xA/JfLIQbmoKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783045811; c=relaxed/simple;
	bh=vRnRPJ3j9xzdmNWN7Gdcxyp1z0hNhCToQx64ySQNB9s=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=X+Gol2v3hTH7znDO7HJL2Tf1I3P2JazrakAOMdYf+SYll9Kyeme/UkfCUBz5/aih6mfyBx7pRP7dimkyQnuxpAG1cSL8xsN/u0N/Tdr5860ygfvYRQZXwOOE94SILGzbiLV5KgD21+/OlZlegqzK4UEXc5dOTxwW1GaGl5vv+T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=bvFd5IU/; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="bvFd5IU/"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c821a50615so452015ad.0
        for <linux-next@vger.kernel.org>; Thu, 02 Jul 2026 19:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1783045808; x=1783650608; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6yjgN09NzBB9h0F7FzMU+tpgh29yqt/HWXGQt5/VJEY=;
        b=bvFd5IU/prdMTywg5UqxgwA/PK/P5GYBBYOjY85V/xGudX8hzW2epkplM0kxTgfoPv
         iZZXKNoHrG2SoKJ4CvftTX2HYNNXXWqS5HNPzRyFp9JmbT91RhkngJz5HxgwjZ/0k8lp
         3E5XWLuNzHrLdpDD5xbME4qAWUIQ9khJupKF8miRzBAeFGbNHrYjkCRkZIIV7MEI+lU1
         1EAR78F9Bo4T7w0mEnOFEY0b4Pg3FjPhyEita0otrBtAPJimi7+STsnCqVg9oAYczJ4S
         kj71cjox9+4GCMfP4zfM/tKO8ugISWVNwZk7Xc2nS19yJEMbqpvlSuiZ2nefCB8tFAPP
         uOAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783045808; x=1783650608;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6yjgN09NzBB9h0F7FzMU+tpgh29yqt/HWXGQt5/VJEY=;
        b=YOT3hwpOO5AY8aJZgt9ZKAP7FXjNv43a122mOyG0pyIOO7NuGnvTeDq4Zby6BVkw3R
         tduYF4A6sKbp9e+3D17JW5gPn85UKbEo/k6Kf/NL9/UQK5btK/U3sgDIGpxiC8rccHVJ
         rdnZkC0L7JIPBozsGdYXblm8cfph9En1X0AgdT41UJ/0TfkgSY4r76SSv52IQw0pZknx
         ELrCAAgyKByhDidFQUDALE1EhLdmBCZdP1aNzUecETbYSXv+D3LBqH5RZ5q17h2S1gfr
         1bYDVwmwJgJGk+TI0+4/4IeWTo/z+uH/jAg7WIbRxGtT4iWgdY9htICy0MyFhDLGW81X
         n6eQ==
X-Gm-Message-State: AOJu0YxgL7n5FwV8SlqV444j7QuCfVoUhEtD+Nob8Xrn7van08EDWzkZ
	D+mk98VW+NJQw1bKVPVTnGg6cbTRRe3SVE6MSIxAghawo8qu48rbEoUzKB7nTqSlVN0=
X-Gm-Gg: AfdE7cktd97PZeuiYRhWWdA1ZYXJ2qqnFvAsoEnGz2xAg/6YgHyYVpFkNv8hEMjEUar
	Z25EBbGDW7vo2WypgUJ0f260jgnMCBQ5j6ikUqxHjTUHo3gu+UmuGKk5I0ZPnViRGLavlsfxiyP
	tg/9+peoWjUPEJnZ8+dOk1RC2cs7aSvNmgU9/LaYJYjRqGNDK+W4Nkjl+bNufpvgCPzecxqyfGz
	tMBG7FIZeYCkycGnPxN5zysiM6+2+N1ss0spUX4CojTtpElGnh6a1OvY1cgAKmFGt8CkqinY6FV
	hU37g5MDTHMqKdwoJUFFxCJLsUqVSJPZT/Q/5iA5WEgv4fGCJxVT9BI3cj2m5g/Mh83zDLGZg1W
	bz3UtmQyUWxpJOpbzvMmmT2ZtCgEXmaM8WNrqV75K8Q/alKx8ExYXnrRStLXa0Fh/t0fE4YszSA
	IBCgBdpQ==
X-Received: by 2002:a17:903:1845:b0:2c9:f0e3:e20a with SMTP id d9443c01a7336-2ca911f2ffbmr78069355ad.33.1783045808322;
        Thu, 02 Jul 2026 19:30:08 -0700 (PDT)
Received: from 963b246bc1b3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85b345sm21792880c88.10.2026.07.02.19.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 19:30:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 6eb8711ece2ce27e52e327a5b7a628ed39b97f45
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 03 Jul 2026 02:30:07 -0000
Message-ID: <178304580725.4299.12160883718610117800@963b246bc1b3>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/6eb8711ece2ce27e52e327a5b7a628ed39b97f45/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 6eb8711ece2ce27e52e327a5b7a628ed39b97f45
origin: maestro
test start time: 2026-07-02 18:27:38.901000+00:00

Builds:	   64 ✅    4 ❌    0 ⚠️
Boots: 	  164 ✅    2 ❌    0 ⚠️
Tests: 	29798 ✅ 5386 ❌ 5155 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.kvm.kvm_memslot_perf_test
      last run: https://d.kernelci.org/test/maestro:6a470673bb83f6a3e882b29a
      history:  > ✅  > ✅  > ❌  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.kvm.kvm_memslot_perf_test
      last run: https://d.kernelci.org/test/maestro:6a470d59bb83f6a3e882d786
      history:  > ✅  > ✅  > ❌  
            
Hardware: sun50i-a64-pine64-plus
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.kvm.kvm_memslot_perf_test
      last run: https://d.kernelci.org/test/maestro:6a471a81bb83f6a3e883038e
      history:  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: qcs9100-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest-device-error-logs-ramdisk
      last run: https://d.kernelci.org/test/maestro:6a46bd7cbb83f6a3e87fee76
      history:  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:6a46bd65bb83f6a3e87fedae
      history:  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_ethernet_23040000_mdio_phy_8
      last run: https://d.kernelci.org/test/maestro:6a46d736bb83f6a3e8814860
      history:  > ✅  > ⚠️  > ✅  
            

### NEW BUILD ISSUES
- Issue: maestro:e1cd3f9474953bfa22c13e3e3b216ed721272880 | version: 1
  Build: maestro:6a46b0e2bb83f6a3e87f21f5
  Comment:  module random32_kunit uses symbol prandom_warmup from namespace EXPORTED_FOR_KUNIT_TESTING, but does not import it. in Module.symvers (/tmp/kci/linux/scripts/Makefile.modpost:147) [logspec:kbuild,kbuild.modpost]
  First seen: 2026-07-02 19:00:37.889060+00:00
  Culprit: code
- Issue: maestro:e1cd3f9474953bfa22c13e3e3b216ed721272880 | version: 1
  Build: maestro:6a46b0edbb83f6a3e87f2264
  Comment:  module random32_kunit uses symbol prandom_warmup from namespace EXPORTED_FOR_KUNIT_TESTING, but does not import it. in Module.symvers (/tmp/kci/linux/scripts/Makefile.modpost:147) [logspec:kbuild,kbuild.modpost]
  First seen: 2026-07-02 19:00:37.889060+00:00
  Culprit: code


This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
