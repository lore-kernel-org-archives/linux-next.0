Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1353CA4AD
	for <linux-next@vger.kernel.org>; Thu,  2 Jul 2026 19:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783022350; cv=none; b=k6y1N8ATUc2/qXeoq8gsFnpXtrgHkzLYRbdl0iniYwRvQ6cRU6rIo2+MGFzgR1zB304nOfDnbN8Xzm3lQx+u4WpybQT7pZaAHcJC15cArClb+zo8N/oE2BUes70FnJ9QQhkpwpf/oTes6nb1vQfjIpcXbGcg7niJLe/vngSP954=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783022350; c=relaxed/simple;
	bh=N7sMNYyCdCft2/HVgtIUsYBlO8H6aWGUMR71m1Io/8E=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=IC1CtXAe81PDVnA6yodPJ+HBuavwqiq9jEQVkHVq0qLCTIhvJE5aJLZeQY87o58qcvKCkb/Aoj/l+BaDYoLR9kykL45lj0dgqVIiFIZ6NKgapaDv2lrWLHHBE06ZcdQaqHrLyikds1rDxSdCAE879GMSqHp2EGgyBbnlZg+lrKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=DZdSFY/g; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="DZdSFY/g"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-37fcae0ecb3so2088931a91.3
        for <linux-next@vger.kernel.org>; Thu, 02 Jul 2026 12:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1783022345; x=1783627145; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//smDyZLyaODru6WgzI4bTaPmxdDqgn7r/y5mi+8QsA=;
        b=DZdSFY/gMEZA4KO3K1Y5XW+ssM8jkJGPCXgbZFn5Gy7UkprR1OsjpdFWQHzuUQxDUz
         FxeorFwTYTdvjsi/4KR7lwft+REBHQQ6ISZYqw5K5AcbVJwacsf+cOCcAwexUHKKFkGq
         UKbcpDHXUDu761wNESculVd5lOAn6Kzn/TCCImps+SM1cw9xbMFV8Kd5nqVYXNSo2ipr
         pnC3ApSE1Lzu/+5G0DqPjjANrAlSZq1nsS8R5JMs7Ww1M/QmvCdwCFYEUtzx/2wQvhbe
         aC2HgHBGmg8kvaYqEl+xhR/FeMuFKVBbu7h3aHBEwewEa1NxiugqDf/T60kk+20MPlE0
         RA7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783022345; x=1783627145;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=//smDyZLyaODru6WgzI4bTaPmxdDqgn7r/y5mi+8QsA=;
        b=k3VdAOHUmQfNA6IZhlehQDyy3qlq3mtLKkWJoUYFaL2VH4+o+nJuSpI4ZzLDSD4ppm
         lgOc6xqFER6NJsxBFR9QTrFTvaGIcqkY7kyVQfGaJHH/DAgdyDxrYS6plH/+wOiPsmuk
         AdpnvgLRKMpus/CtA+GiLlQrfro6wQGVEniyydfdRejX+X3yCqNkpGJTR6jRWhW2vrCJ
         k3v9LJQUWTJXwRi2T38gxjn2coMSfriNxF6PisAlc4r3PK4qihariL/d3Sy6TfR8PdFk
         +K7PccOnfAiTypbCp8D8p4hBRGt/ACoEuPORgPtuZai7t2uoogZJqe7hAdxjSZ+hzzIw
         0ikA==
X-Forwarded-Encrypted: i=1; AFNElJ+hMHbA0oC7RwdHeysxBs2MyKNTlMAKh0AfTySg6odPnd08rKHWBQm05OxpxhfFM5dlh9l3Shi/o7MX@vger.kernel.org
X-Gm-Message-State: AOJu0YxDQh4Ibc9Zub2HBRSP538VDK68N+oFWEAK5QOah4GC1ZfUB6Vm
	N6/asRBFXvTQiFbrZp5s2VbwgaLOeAQoMVDmnu2i3cB0Nz5ebLo4tbst7CuNIeqNlSc=
X-Gm-Gg: AfdE7cmZeqAfQVmMuI9BZWDjnJ4p2ycCzPqjDHis990nCuVO/fICzDKMsZjZh205P2C
	M1CQidbwfGIx8UXqU+gDE8QwV1ajoe/cObMNKOzDGieK2Y1y3/xopX6IaQhX7QA1S685tlgngv0
	d5pRVHh1w/Fsk0zTKdADWP9T3VgU+6vIFhbAP4l8wJJexFp0x+kokmcEeIwyxt/XP2HRKsgs487
	wGrNqAkA8q5cp8ga5Ex99efiLf+ih48rSI5jjN5EXt4f3QF9I+RcRUnASx9fkikAuIcCcHkjZyI
	bbUj3vpRsY//bvxkuk/zhhuz1iiHbI78g54rnc+ikwaaIYHU9NJczPL5zcPPT8873kpdfzkpUh8
	gqhYzmIyr0x4TV5lAebKbjcU3oJLS/G07ccfHQWADRgIhPyGCL3QI2anQxOFtcuijfrc89cB5/p
	sHe+IktQ==
X-Received: by 2002:a05:6a21:4d92:b0:3bf:96c6:78c3 with SMTP id adf61e73a8af0-3bfed1c58d8mr8829772637.8.1783022345300;
        Thu, 02 Jul 2026 12:59:05 -0700 (PDT)
Received: from 963b246bc1b3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bb84405sm17531963eec.17.2026.07.02.12.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 12:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) module random32_kunit uses symbol
 prandom_warmup from namespace EX...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 02 Jul 2026 19:59:04 -0000
Message-ID: <178302234435.4082.10623859604470804974@kernelci.org>

New build issue found on next/master:

---
 module random32_kunit uses symbol prandom_warmup from namespace EXPORTED_FOR_KUNIT_TESTING, but does not import it. in Module.symvers (/tmp/kci/linux/scripts/Makefile.modpost:147) [logspec:kbuild,kbuild.modpost]
---

Log excerpt:
=====================================================
ERROR: modpost: module random32_kunit uses symbol prandom_warmup from namespace EXPORTED_FOR_KUNIT_TESTING, but does not import it.

=====================================================

When fixing this issue, please attribute this report according to the
patch submission rules:

Reported-by: kernelci.org bot <bot@kernelci.org>
Link: https://lore.kernel.org/all/178302234435.4082.10623859604470804974@kernelci.org/

For complete logs and details about the environment used, see the issue
on the KernelCI dashboard:

- dashboard: https://d.kernelci.org/i/maestro:e1cd3f9474953bfa22c13e3e3b216ed721272880
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  6eb8711ece2ce27e52e327a5b7a628ed39b97f45
- tags: next-20260702

# Builds where the incident occurred:

## ppc64le_defconfig on (powerpc):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a46b0edbb83f6a3e87f2264

#regzbot introduced: 7de6ae9e12207ec146f2f3f1e58d1a99317e88bc..6eb8711ece2ce27e52e327a5b7a628ed39b97f45
#regzbot link: https://d.kernelci.org/i/maestro:e1cd3f9474953bfa22c13e3e3b216ed721272880

#kernelci issue maestro:e1cd3f9474953bfa22c13e3e3b216ed721272880

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
