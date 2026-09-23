Received: from mail-dy2-f36.google.com (mail-dy2-f36.google.com [74.125.229.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EBE37FF53
	for <linux-next@vger.kernel.org>; Wed, 23 Sep 2026 02:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790130615; cv=none; b=TwOePlqmNUTrMFFx3QsdusFc4BiY77xNHlRIt5uyZQPD8+xn0nzInKEUjo6BC/NTYnz8xCgNQWhv1Rrpcka2e0dUpY77Cjx9O/4/j11Fv+zjLFj8BVlcpISIzSkKj+d52F23cNl1tggeL9LdNEL1fH//IZizsLC9/nZOmiUQ/LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790130615; c=relaxed/simple;
	bh=oWT7n0M19GFnkfEsU82DxALeOeAelCqPl22XsCoaEPQ=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=SlFmQ30M4mekGkXWyVJ9+D0l71eDVlxhLE2GNpov69mPhISykXuq4xmIbCF9sOTaXoEtnRHSBb0kVxt8OHjxj02VZek2Su4AnO529MTWL/ztt5qDfF+vEdPl4BNarxIVdXT3RqV2xturjGkVL9GPQHyWhZGXY7Jr4ldOIcEejGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=Z1o9H4QM; arc=none smtp.client-ip=74.125.229.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="Z1o9H4QM"
Received: by mail-dy2-f36.google.com with SMTP id 5a478bee46e88-328664c2da6so240899eec.1
        for <linux-next@vger.kernel.org>; Tue, 22 Sep 2026 19:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1790130612; x=1790735412; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zEPT5DTYYkS01mB7Vq/2RCA92ygN/lHHQEO6Z0cVSMc=;
        b=Z1o9H4QMyQz+tyN1HVyBgHuhHbwUBnfdqpyGTnmnkJeObE+7SaFLvVvgExdIzxB4fF
         mfHFS4UMm13JzvMsdzqvQB7VIWSLp3V08MmftvYdkbCVbf8ONzZSuVp4NkQTHCohP3RY
         Tu1L8EFh6YY0q25VnCuyyyg0s4wI1BU5tGW27BOcSvaRbGPm46ftMCsJckdRInw3cf4X
         ZeKAf26kVLeV47xmuIaWd9v2JkrawRrnZ5rn0uEC9yKIfcBzj2L1noE7WYkx+n/q3NTX
         z3AK6kjtxhxv1buBkSYIQ0mcZ+0JLbdCtkAE1VuoIGqD6ZN2RRR6YnFt2txgNXLFnArs
         UGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790130612; x=1790735412;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zEPT5DTYYkS01mB7Vq/2RCA92ygN/lHHQEO6Z0cVSMc=;
        b=R66/Go9Pi8wuKPjK/6YtQ+YrCMqN5C27UeUg7B5NRJLYblMnrIOCDN4y0J8zY7Pq4A
         N8wxYG4+jUu2pjoPt5k25fF98GihuFVxMuSUKnj4fCRLZQdw8yfsA4pppninSneDKz71
         cT1lQQmGmH1stIn18kMyUQ8ORp2S51yQ64/WEFkqWFrNanOcdcw2RG6NU4TRmGU84BMz
         v90X2M0m6fEO/z0qL3d2kC+9FSnx13j5NsrNvT7wtouSga5Jkn7DPjLHwAykndDmYbB6
         rGMOayAlt8feKESAPJGfJtVB8rjOkC+C9RqsHGUUrlm+Ayor7puIiwez4p6yuLl8T4mv
         fPIQ==
X-Gm-Message-State: AFuF++m+TNOPDBSxvMLDc0dkoigPaaF7Qa/2SneTwhr9514ig4UDX2vE
	QejaGNdYOJc97jxgi2nMdt+bcdzh9jsiofKeR2E6ZKTvopxfLAmDqADU5NItEu93qhM=
X-Gm-Gg: AYBFou20E55AQeSiy8miFHUDtLzyVEBG7LPaP5Lbez602W+azUJRtI5RTI3qWS/AS5H
	Qu8PFnmiB4GJgLb1mGUaazqs01uh2HDbHMqW+AryTHjK7zuQLa4/DO6wFmTkWFbM7lvDsDxnZWx
	IkBRa282J3pDnLqCCyXaFT6SNbFc8/qTKsRKrdcXsliNk/T3X0Jw/KRP6bPQBCkZUblJXSOlG4s
	tC24RWVxzjddkDdQoQwaBGQQ+vOgbbusvklUIn64L7VHzFwXKjjsn0f5+oiOLhghh3LvksY884w
	1xzCbn7ddHQxcwBXfNw7DFxdGMePsgsZqkHDawlKMVje1Al9F6EjNWpiwVsmpDLvUd2dLenvO2D
	ato0w4qBh+BpKN3PQe+SYBgmZWcHPF56h000IMv6UyRoutXUP/Nz5OuzJvKPGpJ0KtwINm4kr7Q
	0BKjzczl5gjXMk5tR42cYywgPKYuLiNo2TYC60C3tGPlasqqz88BGPBrbGqBWgqzzaSHBbPIK+u
	E4=
X-Received: by 2002:a05:693c:88d4:20b0:33c:1510:4eb7 with SMTP id 5a478bee46e88-33e8b595545mr1280687eec.5.1790130612026;
        Tue, 22 Sep 2026 19:30:12 -0700 (PDT)
Received: from ec7b70f3a45c ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96258351sm2042913eec.12.2026.09.22.19.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 19:30:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - a8c591ed6b672915e0be57843f943a2a723aff40
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 23 Sep 2026 02:30:10 -0000
Message-ID: <179013061043.436060.13479797346497233292@ec7b70f3a45c>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/a8c591ed6b672915e0be57843f943a2a723aff40/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: a8c591ed6b672915e0be57843f943a2a723aff40
origin: maestro
test start time: 2026-09-22 13:34:12.356000+00:00

Builds:	   66 ✅    3 ❌    0 ⚠️
Boots: 	   78 ✅    5 ❌    0 ⚠️
Tests: 	33006 ✅ 1613 ❌ 4627 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.kvm
      last run: https://d.kernelci.org/test/maestro:6ab29329d96a8203de7ffeca
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.kvm.kvm_set_memory_region_test
      last run: https://d.kernelci.org/test/maestro:6ab2b118d96a8203de8100a9
      history:  > ✅  > ❌  > ❌  
            
Hardware: qcs615-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6ab2b943d96a8203de811ea0
      history:  > ✅  > ❌  
            
      - kselftest.timers.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:6ab2d479d96a8203de822cd5
      history:  > ✅  > ❌  
            
Hardware: sm8750-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.breakpoints
      last run: https://d.kernelci.org/test/maestro:6ab2b8cad96a8203de811b64
      history:  > ✅  > ❌  
            
      - kselftest.breakpoints.breakpoints_step_after_suspend_test
      last run: https://d.kernelci.org/test/maestro:6ab2bb28d96a8203de813696
      history:  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: lemans-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.capabilities
      last run: https://d.kernelci.org/test/maestro:6ab2b8dbd96a8203de811bc1
      history:  > ❌  > ✅  > ✅  
            
Hardware: qcs615-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.breakpoints
      last run: https://d.kernelci.org/test/maestro:6ab2b8c5d96a8203de811abd
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.breakpoints.breakpoints_step_after_suspend_test
      last run: https://d.kernelci.org/test/maestro:6ab2bde9d96a8203de8151ea
      history:  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: hpe-proliant-dl345-gen11
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-15
      - kselftest.mm.mm_ksft_gup_test_sh
      last run: https://d.kernelci.org/test/maestro:6ab2b116d96a8203de810043
      history:  > ✅  > ✅  > ⚠️  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6ab29328d96a8203de7ffec4
      history:  > ❌  > ✅  > ❌  > ✅  > ❌  
            
Hardware: sm8750-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_clock-controller_3d64000
      last run: https://d.kernelci.org/test/maestro:6ab2bee0d96a8203de8153a1
      history:  > ✅  > ❌  > ✅  
            



This branch has 2 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
