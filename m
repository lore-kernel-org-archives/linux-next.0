Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7C43AC0ED
	for <linux-next@vger.kernel.org>; Wed,  1 Apr 2026 15:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775059146; cv=none; b=jYh0coZA1PvpEU4jJD/gyiukVO6/YVzdSX5RiDB7dt5TreODzP9OERrwJoSndJYwcWmtW1196UvGJrmRBuPfGOSKGceaffbyAe4MjSSJdi4TaW7cIqmr4FU1GB1ll8us58lUBRUAgyQYpjwSVKcKbWJpPqd+LoBbkxIRG+JxfdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775059146; c=relaxed/simple;
	bh=g0hj93VK+MnV0TZ8GYpJD9pLiE8OdenETybIQ9op6mU=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=oloZZS/PA0Nj7rKT4t1ZclRbMzkeBBKZWqKHttffiQ75zc+V2tAhiQAlG4iz912bKlMtS7XoXAAHngEQdtrib19RdNqqdRHCpqWe44aUNOlhFzd3G4iVslE1PdJaycnvVXCjtWUCp0Rir+gO7xCfguXXSI6Kv+vNKRLaB5fg5Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=yuTHGx77; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="yuTHGx77"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1271257ae53so7398401c88.1
        for <linux-next@vger.kernel.org>; Wed, 01 Apr 2026 08:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1775059144; x=1775663944; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajw3IKfOVWfBkJSl8Xs7tiCj2DKybYXRkWcMRc0BG20=;
        b=yuTHGx77shglgaqBaOZ2kybRZr8QFMlWmAGjJU9/tLaqeIQOGVBVQ5HRYBfOUC5L5R
         84LyZodvPHE5lqGcTI3B/vk2rFjpjCuXilpCq5VamWpyr4/2liAADbqd7PuScNRrnbAr
         otWkZmqYHTiqzegWvh9PYgmxZhwGXlsvcBou1XlM/28lQckesk2E/kF+dq8j0FACq71T
         gieAdtyMD6qg4XWgBv6YP06Fon42jBpxtOWyJc5qWavi93+dYtIhCc9yZ+OQ0Hv2GniO
         okFrkVosk88SHnxxbw9Mr/63Y8qm0PTPUv7ENBfnnN1ZBFfnSA3a656xmYcTLg5eAhnO
         V+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775059144; x=1775663944;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ajw3IKfOVWfBkJSl8Xs7tiCj2DKybYXRkWcMRc0BG20=;
        b=IhhPppWIYSUFxiQhrmV7gvzZ29bslhyOnI8/12hrf1XCmF20oP4O8nSC+a7ut0oIa0
         SJf/6kvF09VwYjcry3vzBq7W5RaMkFB8Yf+Cd5XI7ybA8yN0ZOlNKR5J4LWRWGcTzP3v
         wH111RHMSJWUWOgfoqiYgJ9M7BFJn3nzdu4u0wnwltALsfHl4XhPPf03sYPDNl494PoM
         c4BD0ZV0QK48X7eLW1mUftFO07DrcgByg9ndJiKtYqDdCNJQIh+EhYRdE8fz3ACVX0Ay
         VNSd0u/oYI5Lwmb5Dk0sNaJhUKX5F0OY0XzGMZLgjKbJ7UeILn7zLqiwWhXSYG6/OLso
         RS2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU5I/OzaUGq/30ENXw60DeUjjXHYxqHKXmRn/Mydo3L6khi9k4Ecnrmv98Vad9JTeVMVAcVRD+0fdTR@vger.kernel.org
X-Gm-Message-State: AOJu0YxKtbfsS2n1G3WVU/++aWHBgBjaa/HAWghBnqxdKyJxdLu9Jjlz
	CWBiM6y9r1pS1ctSzAc5o+Hjk3Lx40Qgis4W8riiOyMkhpbNBBp9fVGqkXCTmWpdI8Q=
X-Gm-Gg: ATEYQzwp3OsIsIZXVQi+SSscSLd4gMAY9rciOJho5ndY/gW6kyOLSOgSvswo1oCbaQb
	+1/SPLpixDk5xOTpisEWSfPloeXZU814coO6d90cu1+koZ1pu5oxxvKTdnlps4/Di8BaLzjYTZn
	PxWIZCA88JpFrtFdCszsH/rH9pAI4HUwVzZ8VSusDiOT1vuIoOd3NifUxE5MpnzvDTcWGVlV4B1
	kYHM+RqAtKizTRECZq61lWaznPmiGwBLs5cnqCCw8zZ8GOfKN98R2sefWH9bB5OdzTYsEEto3Px
	uAIecutm4XMSP7B3HdT1OIyojkXbNxFxYE/TnRMcy2VHeZeISW2p+LfMcAwpl6Z5a5GSu5v7aM9
	VfFhhESuv6XGPESw9FNkN8IRHMBibFR/sd9SFv/Kx18mgDUWIq0KbuhiXjcBjXYcuNB9HChX0Kz
	zRaUIoaWXzWscEFUDZ
X-Received: by 2002:a05:7022:2508:b0:12a:7181:2eff with SMTP id a92af1059eb24-12be645defbmr2220339c88.4.1775059144459;
        Wed, 01 Apr 2026 08:59:04 -0700 (PDT)
Received: from 984b78e0ad75 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bedd70f18sm192081c88.6.2026.04.01.08.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 08:59:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) in
 testcases/fake_sigreturn_bad_size
 (Makefile:31) [logspec:kbuild...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 01 Apr 2026 15:59:03 -0000
Message-ID: <177505914325.1061.1631140143829045883@984b78e0ad75>





Hello,

New build issue found on next/master:

---
 in testcases/fake_sigreturn_bad_size (Makefile:31) [logspec:kbuild,kbuild.other]
---

- dashboard: https://d.kernelci.org/i/maestro:bd2fe3ab76492e9353ac17daa50a9ba5a205b973
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  bd0f139e5fc11182777b81cefc3893ea508544ec
- tags: next-20260401

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================

=====================================================


# Builds where the incident occurred:

## defconfig+arm64-chromebook+CONFIG_CPU_BIG_ENDIAN=y on (arm64):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:69cd3860dcae953c056b53b7


#kernelci issue maestro:bd2fe3ab76492e9353ac17daa50a9ba5a205b973

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
