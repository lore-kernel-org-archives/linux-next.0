Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C61F191F91
	for <linux-next@vger.kernel.org>; Thu, 11 Jun 2026 02:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781145035; cv=none; b=thYiu3Q2rh2lju8ksgAT9Yot15B8hxtTRs1O+C/n7q7/37MSAak8dmVHd4JXgL5Vc++sczjPdCen94uC0zr1T+5Z2N0dEEogdzIxbt6phrM/Y1iywZfMRS7BV+puCRHdbxhtKRYugwKAhigeoXIYFnPZF4oQ8vFzgOhuQQbTQqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781145035; c=relaxed/simple;
	bh=Nd7h1cGVs3wFvoJFj8fHu3erwIUuQ27mEFZ9U3iCuOA=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=NcO4jb7g09E4x7N0eQDIEhOKTbca3O0gDxVWiBKCNOjJqepZd281vYo8lkrSLLd5hFcL9CmdIUiqJ2IEH9JjSo4zqjj+ykmjDHoP71NOtZuvIOj+HThVE9SJlht4uUomlaNoI5sPpLva0XfmIlV3ZIHgvvLL4ODZHiFkB9SHPhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=HlGd4eC8; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="HlGd4eC8"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1382c509485so3275502c88.1
        for <linux-next@vger.kernel.org>; Wed, 10 Jun 2026 19:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1781145031; x=1781749831; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNofggOC+TvGFu6o5AdSZ9vEkPPtPEYG1vNdLPF4pms=;
        b=HlGd4eC817F9VSo5yUl5F7fVCJqOTzFhQh0vvfu4yKF/xos4eHPIiYDgkLhDr9KHlb
         Ker2UEVZ2r1MhN+/i+etu6KvW/pgAudnHW1Vk395FYtrRLu0Gk6QQz1BH1USxmGByAnR
         nvYdyIDiiKGYN15Gx3jUQw0T/PWYPaa0ScUoEqrIR5e0/tk/NKrgvdf8o2UZ+pIg864F
         M5uRpf4d5IG5PbmianSt6prAnrKRQlmA2w5V//URy3reXg9SlgtFnPvKmnLCriQ+u67D
         VyIwjbonnS5f67PlKrUzZJSYmPSn725YLkWcvS7WakvtMjC7diC1073LFSxeM1eyCQMk
         DdSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781145031; x=1781749831;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UNofggOC+TvGFu6o5AdSZ9vEkPPtPEYG1vNdLPF4pms=;
        b=BJFcPX17y+fazzmTDuMOj6jXxa09Pl1f5RZyu9L1h2B1gceVqx7IFqVI6PaSyP1ojF
         6RTUN+Mv+UZMluzLsJb9cS9kuahAdvH335eSUClJlFCDce6yHJcrnUKd81JkApgZO/CA
         h9Z1bHnneoQrtori20cSQ775IXVllXEgKfRxhjTH4iXF5Yf57Y29FSo381+M5la3AebO
         RvMqn6yPjd4C3RpmIfpTQN5MfohOnrG6bMxBKdAG83bZi163iJdEb57qAS9ldXVTWaBw
         bKjOMsrkY/DffYNdjnIUyZRybWUSlz8lqDnH5Oab4lDeL9LOkd7esza8Em0bFhNt4cMe
         0v1Q==
X-Gm-Message-State: AOJu0YyNdlwjG1ZnS7EhLw5nC++bAVLr4uJqyVIZt7HGGGw1YZyWLRyd
	nyyW2x817pPJ98zSWr7f+H5nYksyHb6vQ5vZLkQliv4/laKmJ2QZ5anHud9/3LnE6DkAJ8epG3T
	KNAQD
X-Gm-Gg: Acq92OFsTnB4zOUgG6s0Apvkcxwh46iM+msMsR16Jtav1oUQXZcVuPfzUCeM5WyRyyF
	p3EXZqGhHU2Xu57jVgPUBrGp2zNG4tHwOplVyg63i7LLP2Sg6iN/+luX6/LnGdRPnoqgN1B1lXX
	Caq/Q1IqHN32edfciCfmZttGQp8m3uembfsCv8QIB39XlZLHeNYxkHfnLJXDYpFDkffPV870mVq
	zvKCAvKaXmEn9aWzkHIuVUL2QatJv2iREvk97yxicD1ANiCWO1lX9XuO3JaWYkQKQ2YJ2fycMFF
	tlTy4PYoc+uP0wT9k01PZXJQbDYlGmdDiM2Rw6WWTZvtB84NBBVOCSoG50ULvUgzu0HbLvFs2k8
	LH00xDppaq1Q29g30af1i1yMEZW/KknAIaoLuPikEPKVQFdLGdqV+StKUi4+wOdYrmstLhvB+RW
	BPZ424q3YtO8KBkSDkwOvvpu3ZqL8=
X-Received: by 2002:a05:7022:ff49:b0:138:104:439b with SMTP id a92af1059eb24-138422e437emr517329c88.19.1781145031012;
        Wed, 10 Jun 2026 19:30:31 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13842fa5f9asm446358c88.8.2026.06.10.19.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 19:30:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - abe651837cb394f76d738a7a747322fca3bf17ba
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 11 Jun 2026 02:30:30 -0000
Message-ID: <178114503032.13182.13179112581580839874@330cfa3079ca>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/abe651837cb394f76d738a7a747322fca3bf17ba/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: abe651837cb394f76d738a7a747322fca3bf17ba
origin: maestro
test start time: 2026-06-10 16:28:53.305000+00:00

Builds:	   58 ✅    1 ❌    0 ⚠️
Boots: 	   78 ✅   74 ❌    5 ⚠️
Tests: 	12558 ✅ 2822 ❌  548 ⚠️

### POSSIBLE REGRESSIONS

  No possible regressions observed.


### FIXED REGRESSIONS
    
Hardware: cd8180-orion-o6
  > Config: defconfig+netdev+nfs-root-boot+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a29a374dabb8c619d45376e
      history:  > ❌  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a299f5ddabb8c619d451f46
      history:  > ⚠️  > ✅  > ✅  > ⚠️  > ⚠️  
            
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a299e95dabb8c619d45136c
      history:  > ⚠️  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: exynos850-e850-96
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a299f5edabb8c619d451f4c
      history:  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a299e97dabb8c619d45136f
      history:  > ⚠️  > ⚠️  > ✅  > ⚠️  > ✅  
            
Hardware: qemu-x86_64
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a299929dabb8c619d44db06
      history:  > ⚠️  > ✅  > ✅  > ⚠️  > ✅  
            



This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
