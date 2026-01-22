Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD6A353EFA
	for <linux-next@vger.kernel.org>; Thu, 22 Jan 2026 19:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769111947; cv=none; b=gjDF4V18ZdJAjaYXl5uQHvcyps5Qwgyf0bsCba9MD1bOHWho/8lh4HraWk2cR/BH8gSIrgOMJRL5UocywnJzw386dwrbAZnBWfO8op6ThuefkLhixXpILKWyc2qiI9Hg+VrQRS8FFFOoKw5NNxkP8YAxOs+wIdviKtN+1okTBGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769111947; c=relaxed/simple;
	bh=2t8E3MkhKABmyAjVd0Ef3V6oirxpLfRfIzmzGHTHGGQ=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=nple0Ifo5ubwVTCeM0Wri+TQBsi5COVh8/8kbmXOVMWQCf8nK67+Az4kPytY9ViP2pxSyEF8ge4tX4d44ubZ7pQbirgjdoLpbjZSLDXYpQMRXp/Ax6cfXe0BVJB6AhdIfuOYm8Ann1M8eQ13+2qzriyKb9qXPZRcmKYRTtbqhUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=PtN9IZcL; arc=none smtp.client-ip=74.125.82.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="PtN9IZcL"
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-12448c4d404so1530960c88.1
        for <linux-next@vger.kernel.org>; Thu, 22 Jan 2026 11:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1769111945; x=1769716745; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KU9C5wBf3Lxzx7WFsDTDEcyUVyGJTPYy46OajzXqiaE=;
        b=PtN9IZcLFOmKS/9QGPn40cRsWo7am6eIQI0RXl/47m6BN+Mi23D3wSXktcqgckseQj
         Rdj26t6ni4FRDaCSd7cdXF+M9C572puirY9DeFT8yE5b//qFKy10asD+Hj8Nc0d39wHK
         5/OPvvbzVksRTW6ek0rwdHouTd4b6LQe3E7CbhBHay5DUGmFK26rwKhjQw7UqGE58AdM
         KsTpz9Tzhm0kASWVSTy1b1CdMAvl0MCIDi4YMHqEp9DrE8agbY6Zw9N/i3jkIpM4fZYb
         NvTJojFcoxgu7iHGoFjHPpT2D9JsIkV/y7zxYO+FldeiYaLKBKMvKsxTkOLUVFr1WTgv
         jKqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769111945; x=1769716745;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KU9C5wBf3Lxzx7WFsDTDEcyUVyGJTPYy46OajzXqiaE=;
        b=Q1ieea/KJd/gY3r70JzPd5xDC2WCOMpOswRQnhHPpsMPw4HsmuZfqfYCgXomuy2IiN
         55uX+WrM5FnLGhXVRs2sIqLOQb513INppL6WcEW14nKhQbc81CNBU86/bEM44A+4Fr8V
         ofqMtHPoKtjunlCzlfXItPJvdNbufSPOiAh3FqxIP5LAnEospg0qZnbD6JUsd7lopY9O
         ZUa4MsNcvu/MYYIhBLL2DGb5S19bv3GlliXl8G5q4h7ESqAU8jHih2TRgfmcUY/A4cmt
         mvFmB1ULQFiNq+coOC9gwj0VyN2X6uTRxv9fsxMSc8qz1+SLXWfWoppTCYmlYEuFgr3U
         ua3g==
X-Forwarded-Encrypted: i=1; AJvYcCVrdkUDTC9rt5myGpyipiToBM4hUEMk8756/PmPpLu3BFWG+aMwONiz0N4EgoZ0LRi3EYoi9eG6f517@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe5yt4ar1yFY04jRIahOnqEUMsMRBpXfv61in+7A2qfiHwYB0F
	dAF0b8K/rTmbtxvaFKv6Dz7LtJFhK7+HP2e313XwOYA6qAW08D5Q8p4iCu84Cl3+9muVkulYc35
	MVED7/s5juQ==
X-Gm-Gg: AZuq6aJ+tfG3Ka5KR//6NA5UfF8gZvGZ6CGjNUEfd1pOvuswlM6jvxc8MiOcB2x00ux
	WqA07zxXNbi8LNrOliCI9aq3nwoj23y4N0KDcfHW1K/MaB7/VfuYtr4L4QN+w3e0YpU3j1dFLa2
	bkeR4suvSmpnYsw5CS5JWhscZ/cTnAk6oqgoSUOETwzEOjjL9aUkYqw12IzaqpMS9+VgbnYikc5
	0CiTKWlKnNOamNp1hVE/qZD1iOXUgYwxRebnlZHhPfSRsUiHrIa/g+V+zOZf/P7rXLkAY+t7A2Y
	afiFQy8dZ7en3MyPD+ZrTMIcbwKEDHCKn1USxiNpEPUY5LfgONmkc5eKWG7Q027JCZq+/YlPlqd
	hVMZpR0OQPsRV/TW7IT+yrJyReHMyhABojAwfQJFEgDr4PdbJdaOFwUnf22Rbi2t/UB6+A6lxK8
	kTGqbb
X-Received: by 2002:a05:7022:e10:b0:119:e55a:9beb with SMTP id a92af1059eb24-1247dbae7e6mr245500c88.7.1769111944983;
        Thu, 22 Jan 2026 11:59:04 -0800 (PST)
Received: from 22d5995788c3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1247d9a4275sm760985c88.15.2026.01.22.11.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 11:59:04 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build)
 ./include/trace/define_trace.h:118:10: fatal
 error: './panthor_tra...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 22 Jan 2026 19:59:04 -0000
Message-ID: <176911194369.1024.8592198532505888506@22d5995788c3>





Hello,

New build issue found on next/master:

---
 ./include/trace/define_trace.h:118:10: fatal error: './panthor_trace.h' file not found in drivers/gpu/drm/panthor/panthor_gpu.o (drivers/gpu/drm/panthor/panthor_gpu.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:cd7b672e9f4a4e1686f0e661f2aedae6b9039e06
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
- tags: next-20260122

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
In file included from drivers/gpu/drm/panthor/panthor_gpu.c:26:
In file included from drivers/gpu/drm/panthor/panthor_trace.h:86:
./include/trace/define_trace.h:118:10: fatal error: './panthor_trace.h' file not found
  118 | #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/trace/define_trace.h:113:32: note: expanded from macro 'TRACE_INCLUDE'
  113 | # define TRACE_INCLUDE(system) __TRACE_INCLUDE(system)
      |                                ^~~~~~~~~~~~~~~~~~~~~~~
./include/trace/define_trace.h:110:34: note: expanded from macro '__TRACE_INCLUDE'
  110 | # define __TRACE_INCLUDE(system) __stringify(TRACE_INCLUDE_PATH/system.h)
      |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/stringify.h:10:27: note: expanded from macro '__stringify'
   10 | #define __stringify(x...)       __stringify_1(x)
      |                                 ^~~~~~~~~~~~~~~~
./include/linux/stringify.h:9:29: note: expanded from macro '__stringify_1'
    9 | #define __stringify_1(x...)     #x
      |                                 ^~
<scratch space>:63:1: note: expanded from here
   63 | "./panthor_trace.h"
      | ^~~~~~~~~~~~~~~~~~~
1 error generated.

=====================================================


# Builds where the incident occurred:

## defconfig on (arm64):
- compiler: clang-21
- config: https://files.kernelci.org/kbuild-clang-21-arm64-mainline-697268df1908a6300d90db15/.config
- dashboard: https://d.kernelci.org/build/maestro:697268df1908a6300d90db15


#kernelci issue maestro:cd7b672e9f4a4e1686f0e661f2aedae6b9039e06

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
