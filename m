Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEE823A562
	for <linux-next@vger.kernel.org>; Fri, 31 Jul 2026 02:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785465035; cv=none; b=Jl1gJ00tpBx5XG2d3zWYqLSc8SLyP8gwhgLTvGeoClsEnn/o4WmRZ2knLLflIwQtllwMlOyf/cDml9CegiW89yViBnc0FEpWBwLox5l8Q20M/aEQMwLV9yJw531wd3VspQKuFV7gX5f9FbgoSH4zoTDglayVwq0Od3tnOG21sy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785465035; c=relaxed/simple;
	bh=/SkGquEEhDkI/pvEhKOGS5mRdjpGCHrXH+Bvyrazxz0=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=aTWuh3UMJonaZKStu5Tku1UJn4q6jbuKDuAssRER4vlZ2NQAMNZvsj2ktQEct74cqKnBN7alK3OqLYBC8EH5e+w/TM3F68Kjt1clI+AKSDpVaStOwre3h+jp/AhfSshwj6OfZ/3rjrcf6VwJ8/cBmiNrgnombqjQvmdyck0S2Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=O8t27fDU; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="O8t27fDU"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84e27035206so627794b3a.3
        for <linux-next@vger.kernel.org>; Thu, 30 Jul 2026 19:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1785465034; x=1786069834; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nfQ3umPsnvnmizYB/hCOvom443DQ+cNgzBRpftIDUOM=;
        b=O8t27fDUO/m8Q16mQ80eSwJTrGrbVC24tbW4AkqZ166TJIyQsuTuYx3wrqUgEtoqi4
         mD2iNFrQX58yqKv0pOfLGmlR/IHXxmB9E/G9bBAqmUU3jM/Z39+8c/5NcxrAfoJBjwC6
         DbTq+p3xGJv9b4GQMo0jXidmNa41yPa9pivHK9LptvWN5fUhvnQUr40lwCH4EzykQ83P
         pLX+CAyn1aZ5qdA15HzROrsPqBhfnqgHuoyfjy9A0iyO/hTlSiKXcPno78WF0CsGHtDs
         u3G/rcEBSWT9IlsfasFSB4WypKVVMGLceULQ59kC71kNiisLsoZs5WDbJH5Bw7NMwuSi
         fxjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785465034; x=1786069834;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nfQ3umPsnvnmizYB/hCOvom443DQ+cNgzBRpftIDUOM=;
        b=WRwJ7kEKbLVThTU/z/Z2LveyVSuvS9G7YrFy6v0wfRSlaL3rKxFvMZkOhuWTVnn/AN
         B+hHIpSp+Nn1oiFW6Qjp1SGDI30W5viM2qEPeusciWHb6O3mvogIU2oupISMvaOsyLfH
         2P2KE5x9BQpXgVf6FTtkOfTrXx72ZjNVd6eRJT/2RYbt7KcAe4zhA3uy/if7VZNiZL7R
         xwGqWElVOanGekDa/7W520uQnAG0DpxmhbJFFK2fH1F5yP6TOiaEGeT+o7t43hxfgBaM
         8kxRJiHV90XbdRBzPLC1m+7HE16jBGYU07re4TwcC8gLYezpfMxgKnETDBbVV+zLfbwL
         xMBw==
X-Gm-Message-State: AOJu0Yzy0mvPOXENpWQh3/V1cQ+DvfDno+BiYG040LQFbQFQZjnLDQ5q
	WESBbuobFDJ79VlPAQWS6+sVcxMpGMmAYXDzKW0Q3X1P9kB+BcMIVIe9hxtKaIuSyeSuYFC7ua7
	kbTdy
X-Gm-Gg: AR+sD11bdUNmWdSTtZzRipgc0VGwR2ye+QHJBI26xXtYZzMIsYtW4cyLzLt85Ftbwbo
	fr1wEWOClZuZzaFBJnYovQV3OkLKDdBvH6ivcsC8VjHaTiFi5mKG+QAPgnYb/pmArpD/2+FIUXz
	0ZGLFPU+56uFl+ln8qL9MnsZEHPDBLH38Thh6o66m1fYYrR4MXbM1dEisWiOUuGwHEytlwrmCKu
	vzkEY5VpoJBHtP8qGXkvKTaBxhLamBvXhd0p3hjDCHRh8Z/9hb0lYmipSmWe0u1paG7qIcg9md7
	FvqcPg5sPmYDsJo28DSwtD3zRKXGsJYvwIn+hFADXN5qEqnpAycvoJG4vD+JiSdiy+SnEeEmR7s
	210Uwto2zB5yMDFC2FvDO5eIytl9rztjjyyMBLk1a12GorwUa20bwD9y6ncw13E1v1VypPyoHGj
	wA5xF6pSi+9A3/QPkztF5et8g2VBkIXdWZedm0Kv+HwFsw1MmVgL8NMg==
X-Received: by 2002:a05:6a20:4394:b0:3bf:aab1:cc8b with SMTP id adf61e73a8af0-3c91b319385mr43357637.46.1785465033544;
        Thu, 30 Jul 2026 19:30:33 -0700 (PDT)
Received: from 92650adf53de ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153ae6819csm748187eec.15.2026.07.30.19.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 19:30:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 95d6a9ccef99117115e41e9adb271243bd5e985b
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 31 Jul 2026 02:30:32 -0000
Message-ID: <178546503236.4267.8325046159571681253@92650adf53de>



Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/95d6a9ccef99117115e41e9adb271243bd5e985b/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 95d6a9ccef99117115e41e9adb271243bd5e985b
origin: maestro
test start time: 2026-07-30 15:41:47.212000+00:00

Builds:	   71 ✅    3 ❌    0 ⚠️
Boots: 	  153 ✅    3 ❌    0 ⚠️
Tests: 	22262 ✅ 2064 ❌ 1995 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.coredump
      last run: https://d.kernelci.org/test/maestro:6a6b9bde798ea6c1ef94c03a
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:6a6b9c0a798ea6c1ef94c1d3
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.futex.futex_run_sh_global_requeue_multiple
      last run: https://d.kernelci.org/test/maestro:6a6bd07a3634a4eeb46ae067
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: sm8750-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.breakpoints
      last run: https://d.kernelci.org/test/maestro:6a6b9bb1798ea6c1ef94bf1f
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.breakpoints.breakpoints_step_after_suspend_test
      last run: https://d.kernelci.org/test/maestro:6a6bb1b8798ea6c1ef954a77
      history:  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: qcs8300-ride
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.gpio
      last run: https://d.kernelci.org/test/maestro:6a6b7acc798ea6c1ef9335c1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: gs101-oriole
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-15
      - ltp
      last run: https://d.kernelci.org/test/maestro:6a6b802e798ea6c1ef93867a
      history:  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: kaanapali-mtp
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.arm64
      last run: https://d.kernelci.org/test/maestro:6a6b9ba3798ea6c1ef94be69
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_9800000
      last run: https://d.kernelci.org/test/maestro:6a6ba174798ea6c1ef94ecc2
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_9800000_display-controller_9801000
      last run: https://d.kernelci.org/test/maestro:6a6ba174798ea6c1ef94ecc1
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_9800000_dsi_9ac0000
      last run: https://d.kernelci.org/test/maestro:6a6ba174798ea6c1ef94ecbf
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_9800000_dsi_9ac0000_panel_0
      last run: https://d.kernelci.org/test/maestro:6a6ba174798ea6c1ef94ecbd
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_display-subsystem_9800000_phy_9ac1000
      last run: https://d.kernelci.org/test/maestro:6a6ba174798ea6c1ef94ecbc
      history:  > ✅  > ❌  > ✅  > ✅  
            
Hardware: qcs8300-ride
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device-error-logs
      last run: https://d.kernelci.org/test/maestro:6a6b9bf1798ea6c1ef94c139
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.devices-probe
      last run: https://d.kernelci.org/test/maestro:6a6b9c67798ea6c1ef94c395
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
Hardware: qcs615-ride
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.efivars
      last run: https://d.kernelci.org/test/maestro:6a6b7aa7798ea6c1ef933528
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            

### NEW BUILD ISSUES
- Issue: maestro:93d4e1ca2f17ba7ce0541f3202fa21a0043a7f2c | version: 1
  Build: maestro:6a6b7183798ea6c1ef929eaa
  Comment:  use of undeclared identifier 'check_vector_unaligned_access'; did you mean 'check_unaligned_access'? in arch/riscv/kernel/unaligned_access_speed.o (arch/riscv/kernel/unaligned_access_speed.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2026-07-30 16:44:01.874994+00:00
  Culprit: code


This branch has 1 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
