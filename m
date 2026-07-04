Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3A337268D
	for <linux-next@vger.kernel.org>; Sat,  4 Jul 2026 02:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783132211; cv=none; b=Jrd2FL1lKVZAwWuOEmJREJEIvCMOLdM0UpcufXK8FZvlg4w1iuJgPuWvaeNEXgQ/pgWiZAK5NbVhOIiFJ+hEjJOJ/cwugPc+m6lfqWB8Gcvsi01a1LemHZqjlJxlSGJ8DlL5BIVpHv9w8jEm2sFr+OIV2d5tCMyIMW8o25HlDaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783132211; c=relaxed/simple;
	bh=vTJb6My3/kjBfxvD4yjCzfmujZAV3YCwgpB1S0Oxbj4=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=KmDwPG07ks5/qMmg1yww+UOVQ5gxs5c+kB7YoDGOo8dw85djjKxJORCkEgYo4HyTOaKmInGZBWdjlQjDtMOa5wgQ82sddk7o8Pdw7yio0aJpb/b90GivuqxABGR1F62mavTpBr+4l60e+qgQpg14g5qNPrVeTp6KoTrIG810rSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=JxBUtTAk; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="JxBUtTAk"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-845537740ddso671200b3a.0
        for <linux-next@vger.kernel.org>; Fri, 03 Jul 2026 19:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1783132208; x=1783737008; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LLRLdp5IuMG2XKDEP8rcr7twCW0rTuaOB3/t+zeTGHc=;
        b=JxBUtTAkFKYcUbGMb5ozn+h+XFhfvvLK8nMz6/uODAzp0zkuRbtszsWCaTtzvDrk3y
         /7pBIS4Zg5dzuN7uqn+SFl6AmBJbPy6VOXc5ovlPBoB0KVWEHPKYdG7O9vjdUrSd9L4j
         r70MpcfirhIp4QKEY/m0elU2zElB3F61ct0+VyOk6hWvP74GHmxEMPpGH/HJIgXWX+2F
         OWOuNwVZpyvUuONfxFjJHhQu9GoWY9ZaKDknQClEiisXVDv+lZPYrLKUEb+nK5E58eaM
         EqvbudL//lB1eqqUcxy0pZtWCjhkuFVYuLqEQUHLgI/kzNsOSk5kDc8jRbkInwO/an2m
         hqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783132208; x=1783737008;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LLRLdp5IuMG2XKDEP8rcr7twCW0rTuaOB3/t+zeTGHc=;
        b=a5TjtzHkRvv+eQjn4wqlaKeDGZMMmmFpuNAr2S938FA3Bonop7vcwiCdXTppgng9i7
         7JarBEHnBeBiPODw/SxmWalcsXCqThn/OzIMAg+o1jTXSD4CTcVkTAOHeRqFH0GmFMXy
         yoAWYIC2iwLJ9d5/JsHBwsJy4lW6O4TF+UzCbCtm1sUqY0CBrhDcyArluJN6DaibXaot
         vWBy5Lg00k6Dz91zWLhaleUc8UGSvrrQeUxPATSA4lXLq/+DXqdd9BKWkYDIUvZHJEJL
         1Wq/7QHgx3zLKEqMpxdcyYRrJzGwQE2Oskbzoh4Pi1csYxhU2iZZqS/hKLP3fnqqA551
         zTZg==
X-Gm-Message-State: AOJu0Yw8lJogyXLfJVQTpDKiC5GN8+EbdpzNcctmMBMcAShBtPJLptSF
	dehTNRucX2Sk3TaPUSe/GVM27gLRMKAmovBhYyvN2G0V/OU8QhgMsV0nUZn+YchajoLVzcHdqDx
	rhtXV
X-Gm-Gg: AfdE7cmkBhEUv5VmD3KDGv++mccQCNh+Keg8DuFQvS/A3lyaG7WPoUvjy3iis2K+03u
	yEDr/HrnTGYp1HHdal4d56GecuFDvMDA/bQKRxNoEZWxtI9sx0mKpZ7fQJZJkW2yY02/Iv2507W
	SPMbg5YmNVQcGCfyH/5XuYLmf334Xg0C+hW1yaSHxbc8c9bEJ6iwWT359lC1x+RERX9xFjQrCTA
	/xXqQE0E8KtK5ZvVJw9l+E68fi/y8ZqONkYeRwecqolQoswrKPhWoNZ4H5kd84pdyPWcudAldkH
	RyohCYYbQNGqqIc2EUDDinMyM/mwlHNk0rQomuDmQK5F9gVbo9feUqDddv8RvgiCcK7VYLrQH2K
	A/+N7d/kLxtCXOWEE6OpFTORMF4pDYi7yhQPUG8iLybiQwONXy8ig81BruJBGNyyYjM+b3FSe79
	gKujyCfWr9yZH/Yi8C
X-Received: by 2002:a05:6a20:d70f:b0:3bf:9a30:3a20 with SMTP id adf61e73a8af0-3c03e270986mr1882400637.16.1783132208376;
        Fri, 03 Jul 2026 19:30:08 -0700 (PDT)
Received: from 963b246bc1b3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bc27ae7sm24376490eec.26.2026.07.03.19.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 19:30:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 2b763db0c2763d6bf73d7d3e69665222d1f377cf
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sat, 04 Jul 2026 02:30:07 -0000
Message-ID: <178313220705.4773.17982428008746375252@963b246bc1b3>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/2b763db0c2763d6bf73d7d3e69665222d1f377cf/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 2b763db0c2763d6bf73d7d3e69665222d1f377cf
origin: maestro
test start time: 2026-07-03 16:48:48.516000+00:00

Builds:	   64 ✅    4 ❌    0 ⚠️
Boots: 	   87 ✅    2 ❌    0 ⚠️
Tests: 	21422 ✅ 4801 ❌  550 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: cd8180-orion-o6
  > Config: defconfig+netdev+nfs-root-boot+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a47f5cebb83f6a3e889f046
      history:  > ✅  > ✅  > ❌  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:6a47f5b7bb83f6a3e889f039
      history:  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS

  No fixed regressions observed.


### UNSTABLE TESTS

  No unstable tests observed.



This branch has 3 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
