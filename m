Received: from mail-dl1-f66.google.com (mail-dl1-f66.google.com [74.125.82.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83403318EC1
	for <linux-next@vger.kernel.org>; Fri, 23 Jan 2026 02:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769135446; cv=none; b=mUZHsGMcXI+WlGwchzOnvAwraIUE3jI4KVzDOmb00PnOzN0hWtvRS9kOmcLWeADhs1hPO7CYSCChXFdlD9e8L3EdaknyzbWOXFDsA95ZZ2DEz3fNMr1d8//Sf07VO97HeG6kLfRyQDPOpUREXsRLFKDKUUwguHDE2MtXkw2sS0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769135446; c=relaxed/simple;
	bh=TOUzEwxe1MErRuaDErAUYjcwc9a2xSCNyOldheS1AHA=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=soAdnpWYc6zA5YBf7ox4XtzKjTz1p7YGbXht3u9lpobY7GFLU2YO8pIys24wfimAdUpqCM5W0C6GqpwsNHGvZDjfPnmS/4mxr0cB9MPc/tTBB9KGCj3l+vVnbF0VCJAFf3/8f+9NPAchLb/WTWwwK9w8ihZycgVj5GQgd/dVGDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=0Yp6V9BN; arc=none smtp.client-ip=74.125.82.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="0Yp6V9BN"
Received: by mail-dl1-f66.google.com with SMTP id a92af1059eb24-11f1fb91996so2542435c88.1
        for <linux-next@vger.kernel.org>; Thu, 22 Jan 2026 18:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1769135426; x=1769740226; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7PLxfEx8nshClXqYTPXIT51xm/PZMDoKhOob5WnG8nc=;
        b=0Yp6V9BNDbexjXzNAoDEuQvHhvAiBlRAe14iD/kw5Ok/PTPLaHt+wgNobUG6xUVSoM
         7xV7o6TnSlBup50FWdBnvaQqtAKbH8ROeAHE5UBdD6ejAjwNTrYKl7IOZ/aSNo7VpeZ8
         oWv++gCg007KCgUVLGxINSOG/B7zKIAuM51j/FlLPAnjM15mK9IhRvNrFZXHcfa6UmQV
         YshY5Wi72PwmrjF6PMfdzDMy3DHsOrx0Nm2x0kP6RiBTGRpT9PTEephABVp6Hx7tp1WQ
         uSHcEILrzF2+07yzdE3inzv+yD2neRqHoDXIahLbWtSH7HLdvqrDeax9PQDbnon/4XUy
         /NDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769135426; x=1769740226;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7PLxfEx8nshClXqYTPXIT51xm/PZMDoKhOob5WnG8nc=;
        b=hgnB7EiCVtvgOpHqH08ZcZQOXatt6Xgfe3YnDGOpJv57XQPV3NWWqEH8xM1WhEhUlN
         f7skDmyFq/cPqfZwni+ZEyZXsy7iHAcF+3Dxn3ZkD/AibPoW4KBQ9hc21VQQplPymTkZ
         bxVFvd5eFnC+UU4aRbBfiEfA5Ty1gO6juYRhLTmU6CsaUPRw13lUqyszQqR7cYt/YnZc
         Y62wDHvgljFTBYdgbFziYo5CYOMue5H7ejpEz/c754ZurN0/0fYq+j9RhHLxHDX0pb9C
         VzYl+XrsGt1dhGT/KLFDi/NBnIGm8VxJTi8lsgjLOgxNBEC4uCwEgYlc4whem6LR6o0Y
         Ufdg==
X-Gm-Message-State: AOJu0YznsEj3D5pKaO7rbaIZ4gMaxZL/94MeZExmBSRJIerUjPR952TZ
	nGoALAkHTZ8TJwkRq/OcOXhDDyv7/Jw0SB9LM0sGMafW2CidMgOIm38pq4JcE8nKWnlKr9nv2PZ
	zQFRGXOeyag==
X-Gm-Gg: AZuq6aKuPjMGodO+op01M4J/OycDQelktkc0Z9iE+CJL93T9D4ppQhDZMDV++BlQpVb
	cwrqjh5XgX/egJdUE1J4zlbOWpIJet+tE5W7CJc/MXVx+WyWpsa12g86KCvhtZjbPp3CY7TE8HE
	1Ib4MVdPv5e7UXf8kMtJOQe6vSGxgfSp3zngzuUnOTeHxu0vhUD+tygvAA3rFLbfkptHuyM6RCv
	Umz6b8XV560+Iu2EtvyNFT7RMgy7uszZ0d/HiEMkZDNMrU0cKvmwNw/mYmk9lFo/6iMYOkoWYzN
	ZX6D1o3Qu+PQC3fu7QQDRUkgStd3RZZfuP0EE9nE/o7f/yNji8glHjG+2uhFja3MNv164WFXUTz
	6x7Y+Q3h1utAYXmsljEtKMfUZLhv5oZZP5mFSgCNxzVBUitgYjbDte+LxXvt+4ZICS+Fi8DOArk
	NSAHpv
X-Received: by 2002:a05:7022:30a:b0:11b:b882:3ed5 with SMTP id a92af1059eb24-1247dc0fa9fmr698804c88.37.1769135424903;
        Thu, 22 Jan 2026 18:30:24 -0800 (PST)
Received: from 22d5995788c3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1247d91c541sm1942961c88.7.2026.01.22.18.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 18:30:24 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 23 Jan 2026 02:30:24 -0000
Message-ID: <176913542391.1152.6948012014031756855@22d5995788c3>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
origin: maestro
test start time: 2026-01-22 17:59:11.120000+00:00

Builds:	   38 ✅   17 ❌    0 ⚠️
Boots: 	   41 ✅    4 ❌    0 ⚠️
Tests: 	 6388 ✅  529 ❌  397 ⚠️

### POSSIBLE REGRESSIONS

  No possible regressions observed.


### FIXED REGRESSIONS

  No fixed regressions observed.


### UNSTABLE TESTS
    
Hardware: acer-R721T-grunt
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:69728d201908a6300d91130f
      history:  > ✅  > ⚠️  > ✅  > ⚠️  > ✅  
            
Hardware: hp-11A-G6-EE-grunt
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:69728d221908a6300d911315
      history:  > ✅  > ⚠️  > ✅  > ⚠️  > ✅  
            
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:697279931908a6300d90f03b
      history:  > ✅  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:69727adf1908a6300d90f4dd
      history:  > ❌  > ✅  > ❌  > ❌  > ✅  
            
Hardware: acer-cb317-1h-c3z6-dedede
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:69728d1d1908a6300d911309
      history:  > ✅  > ⚠️  > ✅  > ⚠️  > ✅  
            

### NEW BUILD ISSUES
- Issue: maestro:3b4c709e81fe466ab9d16c4b959dd04ed77493da | version: 1
  Build: maestro:697269331908a6300d90db56
  Comment:  ./include/trace/define_trace.h:118:42: fatal error: ./panthor_trace.h: No such file or directory in drivers/gpu/drm/panthor/panthor_gpu.o (drivers/gpu/drm/panthor/panthor_gpu.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2026-01-22 18:44:15.106394+00:00
  Culprit: code
- Issue: maestro:3b4c709e81fe466ab9d16c4b959dd04ed77493da | version: 1
  Build: maestro:697269371908a6300d90db59
  Comment:  ./include/trace/define_trace.h:118:42: fatal error: ./panthor_trace.h: No such file or directory in drivers/gpu/drm/panthor/panthor_gpu.o (drivers/gpu/drm/panthor/panthor_gpu.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2026-01-22 18:44:15.106394+00:00
  Culprit: code
- Issue: maestro:3b4c709e81fe466ab9d16c4b959dd04ed77493da | version: 1
  Build: maestro:6972693f1908a6300d90db5f
  Comment:  ./include/trace/define_trace.h:118:42: fatal error: ./panthor_trace.h: No such file or directory in drivers/gpu/drm/panthor/panthor_gpu.o (drivers/gpu/drm/panthor/panthor_gpu.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2026-01-22 18:44:15.106394+00:00
  Culprit: code
- Issue: maestro:3b4c709e81fe466ab9d16c4b959dd04ed77493da | version: 1
  Build: maestro:697269431908a6300d90db62
  Comment:  ./include/trace/define_trace.h:118:42: fatal error: ./panthor_trace.h: No such file or directory in drivers/gpu/drm/panthor/panthor_gpu.o (drivers/gpu/drm/panthor/panthor_gpu.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2026-01-22 18:44:15.106394+00:00
  Culprit: code
- Issue: maestro:3b4c709e81fe466ab9d16c4b959dd04ed77493da | version: 1
  Build: maestro:697269471908a6300d90db65
  Comment:  ./include/trace/define_trace.h:118:42: fatal error: ./panthor_trace.h: No such file or directory in drivers/gpu/drm/panthor/panthor_gpu.o (drivers/gpu/drm/panthor/panthor_gpu.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2026-01-22 18:44:15.106394+00:00
  Culprit: code
- Issue: maestro:3b4c709e81fe466ab9d16c4b959dd04ed77493da | version: 1
  Build: maestro:6972694c1908a6300d90db68
  Comment:  ./include/trace/define_trace.h:118:42: fatal error: ./panthor_trace.h: No such file or directory in drivers/gpu/drm/panthor/panthor_gpu.o (drivers/gpu/drm/panthor/panthor_gpu.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2026-01-22 18:44:15.106394+00:00
  Culprit: code
- Issue: maestro:3b4c709e81fe466ab9d16c4b959dd04ed77493da | version: 1
  Build: maestro:697269501908a6300d90db6b
  Comment:  ./include/trace/define_trace.h:118:42: fatal error: ./panthor_trace.h: No such file or directory in drivers/gpu/drm/panthor/panthor_gpu.o (drivers/gpu/drm/panthor/panthor_gpu.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2026-01-22 18:44:15.106394+00:00
  Culprit: code
- Issue: maestro:3b4c709e81fe466ab9d16c4b959dd04ed77493da | version: 1
  Build: maestro:697269541908a6300d90db70
  Comment:  ./include/trace/define_trace.h:118:42: fatal error: ./panthor_trace.h: No such file or directory in drivers/gpu/drm/panthor/panthor_gpu.o (drivers/gpu/drm/panthor/panthor_gpu.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2026-01-22 18:44:15.106394+00:00
  Culprit: code
- Issue: maestro:3b4c709e81fe466ab9d16c4b959dd04ed77493da | version: 1
  Build: maestro:697269581908a6300d90db73
  Comment:  ./include/trace/define_trace.h:118:42: fatal error: ./panthor_trace.h: No such file or directory in drivers/gpu/drm/panthor/panthor_gpu.o (drivers/gpu/drm/panthor/panthor_gpu.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2026-01-22 18:44:15.106394+00:00
  Culprit: code
- Issue: maestro:3b4c709e81fe466ab9d16c4b959dd04ed77493da | version: 1
  Build: maestro:697269601908a6300d90db79
  Comment:  ./include/trace/define_trace.h:118:42: fatal error: ./panthor_trace.h: No such file or directory in drivers/gpu/drm/panthor/panthor_gpu.o (drivers/gpu/drm/panthor/panthor_gpu.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2026-01-22 18:44:15.106394+00:00
  Culprit: code
- Issue: maestro:3b4c709e81fe466ab9d16c4b959dd04ed77493da | version: 1
  Build: maestro:697269641908a6300d90db7f
  Comment:  ./include/trace/define_trace.h:118:42: fatal error: ./panthor_trace.h: No such file or directory in drivers/gpu/drm/panthor/panthor_gpu.o (drivers/gpu/drm/panthor/panthor_gpu.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2026-01-22 18:44:15.106394+00:00
  Culprit: code
- Issue: maestro:3b4c709e81fe466ab9d16c4b959dd04ed77493da | version: 1
  Build: maestro:697269691908a6300d90db82
  Comment:  ./include/trace/define_trace.h:118:42: fatal error: ./panthor_trace.h: No such file or directory in drivers/gpu/drm/panthor/panthor_gpu.o (drivers/gpu/drm/panthor/panthor_gpu.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2026-01-22 18:44:15.106394+00:00
  Culprit: code
- Issue: maestro:3b4c709e81fe466ab9d16c4b959dd04ed77493da | version: 1
  Build: maestro:697269ad1908a6300d90dbba
  Comment:  ./include/trace/define_trace.h:118:42: fatal error: ./panthor_trace.h: No such file or directory in drivers/gpu/drm/panthor/panthor_gpu.o (drivers/gpu/drm/panthor/panthor_gpu.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2026-01-22 18:44:15.106394+00:00
  Culprit: code
- Issue: maestro:cd7b672e9f4a4e1686f0e661f2aedae6b9039e06 | version: 1
  Build: maestro:697268df1908a6300d90db15
  Comment:  ./include/trace/define_trace.h:118:10: fatal error: './panthor_trace.h' file not found in drivers/gpu/drm/panthor/panthor_gpu.o (drivers/gpu/drm/panthor/panthor_gpu.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2026-01-22 19:18:01.336138+00:00
  Culprit: code
- Issue: maestro:cd7b672e9f4a4e1686f0e661f2aedae6b9039e06 | version: 1
  Build: maestro:697268e31908a6300d90db18
  Comment:  ./include/trace/define_trace.h:118:10: fatal error: './panthor_trace.h' file not found in drivers/gpu/drm/panthor/panthor_gpu.o (drivers/gpu/drm/panthor/panthor_gpu.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2026-01-22 19:18:01.336138+00:00
  Culprit: code


This branch has 2 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
