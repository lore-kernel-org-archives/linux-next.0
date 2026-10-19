Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792443547;
	b=Ew8lIEPsxEe16RJhQ/Ia9+o8YpvWi4vE+SI9YxEgHHXrZlDtGufKq/64CmW1tZo1X9+j
	 LfkDbNO72Qz/g47n7iaYZ6SCTSuDYFnS/fzwj8tbUuzo1AmMjLylzko5Y08s5zWaXhaqr
	 +4gwbkEyB+7wsUlOXyQXNvYB+uYkpY+Zt/06+K4rjXZ03rxcrzO70lvKJ7gNkWTA/BLdI
	 wb/A5QCvZL6uEDMFfQZSiId63cOqOT/YAbm1XeWMByEEsF3W0jjy86vfIYRDFu4hj8C07
	 rQoUMg3im8jf5rqC4fwOqyJD/DcaQBda8yh1FjYZOE5R9KmKtzvupSuhWsvR7dLMjew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792443547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:From:To:
	 Cc:Reply-To:Date:Message-ID;
	bh=4XC9SOZ+ZQ1HP8QJQGfsvFDUvx8dUngKoOyiNghiC8g=;
	b=o5l+1kHIPe7J49aAjkRELZb6ka82nD6urVLduTkqVvEfc7jeUDX8XigA1N2CE8ejqs/C
	 obNgqy73fWe1myJgymoEIHkiWa1UrpL2s38W+o18uTZp6AL2AU7pkVgwtd++0i4Y0v9ui
	 PVo0BE4E6NTPz9bTk1RbSseyRoMtANgeXkywrTkunIEIKmMhDMFjOdXFX2TyWp2RM2DKx
	 pRYvtpvg81RXZD5CcysI+dIvx+hCv3APffBaNzTqv8+bxllqpoiSIePcvagoVG8k9V4l2
	 5txeKjhla7GbhHN0Lh2LELbJ5c2pqWgUWWuMZE5bS8ZMq/KKw+Ru5FXI/jMblAkIKgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=jPsglT1U;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3E5606A319
	for <linux-next@vger.kernel.org>; Mon, 19 Oct 2026 20:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF3E5606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=jPsglT1U
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1517bda04a0so2063616c88.0
        for <linux-next@vger.kernel.org>; Mon, 19 Oct 2026 13:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1792443546; x=1793048346; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4XC9SOZ+ZQ1HP8QJQGfsvFDUvx8dUngKoOyiNghiC8g=;
        b=jPsglT1UoLGT9HUCm0HVCoRNHOAoF4MMOe+JE4iTewY9+cEQpjzdoxGh6CWevW8OoY
         zABbdfDu24sZHgEW/ipW3lf6FEvmipP9KPSNF+lDERHY7k7JL9/KSdmTLTW0h1P1uhsN
         wYqj0s2b5c2tF1Wi2BpIKeNs7kP0mWWPqXYDakwEbQKFnVHwfnn53QK6ahi1iIC0w2n3
         8kDSscf24AZ+lpePHXsi8e7YP/xbENZu8Vxi8vXM7bI4rKYpjBckZwoFxQVjnNRaCWJZ
         oRtSf/3/747EJBEVBcozu5m4WCbimnNO08vZMnfFvzLZRVMBrKKG/bk0jEu67IzrsZnp
         /lsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792443546; x=1793048346;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4XC9SOZ+ZQ1HP8QJQGfsvFDUvx8dUngKoOyiNghiC8g=;
        b=0g7eLPbHUcLOCo5raJqqushMMg4fHCbtfazptgFre/GAqM9C5I4pFcybaOfwi7iEEi
         JMqLikflDH1nL43hyUBD8Ys2czsLN+dFg0AsVSUfZhhvRqiACNGJ3yJDZRoixOWFVefp
         dlt0r8jqbUU0okxTIS5jnhVL5OoZdAWlAgPHz2pYI55/W9XvsJKn+BGsMKRf/4UAjf6l
         2KjcR1yt6ONe8FhLwA6JGWqR2/0HPJzOVzMsFYeqnizdEOwKuqhduaoHIFkYFf9rSu/H
         1oZAZnaX9Ma6zj6z+/du82TmtBBS5ZzhC26HRFPtqq6UJPHVBxqCFj1rr7bTOr1780Iw
         T0/A==
X-Forwarded-Encrypted: i=1; AKwUvBy1JYhH4+Aa3j1Gsu1wNDHP5S3NM3DyWlJIi9x9vT4td7oFSm4WzrFOt55NfnplhzBPIxIQQKY+3Nl0@vger.kernel.org
X-Gm-Message-State: AFq9FYLeQC6pYO1JeioI6KIeP3ZnbmzsNL9CCADx9fCL2m0X0CQ0OvWl
	CG59w87gEyWzjpPzQFs46lbSLPxIv0VwYe3eQkOgk7xoWQ2BlzZfIeKD6d31ivOt914=
X-Gm-Gg: AYBFou2cFz6vfGR8klNAApL7HV/wrmbxmsCkhvV/0ytW4Y1SpYg1x7eWf78pFYYasH4
	7ncYBIvUPJLn6V5Jn/EOpJqJGmuXWpL07ierH+9DqX3SZr/RmDwf2ymdSFcxNZmwNLy/Y/L4Ge9
	3ZXaTvPfxxxU1TCcgJuvKEFnOofsiAUnnVyr0ECYxMl1txu2ZjesZaGFMRwGpsIR9WLz8gRofEI
	/v+YLJ92CwGm4B7U3wfR2wYIKxX0TweQHuk5F9lKFN3zNUEUIZrAwsF5TQrD2APoVHoYIImGAdI
	hkRjDE6wkoNROsY1SevGwGuwKpQnfThIa7R71AvQIT1Vo2jwUYqAqkRMrXTSmBoeVPSKGKFZar2
	EoARe/JdNn2NiZ2lvloMBNhmLQdsIhjRvy1E2rDmlTkycNEEdPR0fDmm+Tzyzo47J/q4T8J4G+O
	RPnEGoirlxT6jYeAPkW/jBSihfFda1DUlpwg79LHAAeKSoswZeixWGKvQDh9eibAs=
X-Received: by 2002:a05:701b:465f:10b0:15d:f053:18b6 with SMTP id a92af1059eb24-1851160d00amr11661868c88.9.1792443545620;
        Mon, 19 Oct 2026 13:59:05 -0700 (PDT)
Received: from 6e52bff8000c ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b859142sm30721418c88.18.2026.10.19.13.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 13:59:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master:
 (build)/tmp/kci/linux/kernel/sched/ext/ext.c:5178:3:
 error: call to undecl...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Mon, 19 Oct 2026 20:59:05 -0000
Message-ID: <179244354354.160074.15935947483852417783@kernelci.org>

New build issue found on next/master:

---
/tmp/kci/linux/kernel/sched/ext/ext.c:5178:3: error: call to undeclared function 'scx_reenq_wait_dispatching'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration] in kernel/sched/build_policy.o (kernel/sched/build_policy.c) [logspec:kbuild,kbuild.compiler.error]
---

Log excerpt:
=====================================================
In file included from /tmp/kci/linux/kernel/sched/build_policy.c:71:
/tmp/kci/linux/kernel/sched/ext/ext.c:5178:3: error: call to undeclared function 'scx_reenq_wait_dispatching'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
 5178 |                 scx_reenq_wait_dispatching(p);
      |                 ^
/tmp/kci/linux/kernel/sched/ext/ext.c:5178:3: note: did you mean 'scx_wait_dispatching'?
/tmp/kci/linux/kernel/sched/ext/ext.c:4896:6: note: 'scx_wait_dispatching' declared here
 4896 | void scx_wait_dispatching(struct task_struct *p)
      |      ^
/tmp/kci/linux/kernel/sched/ext/ext.c:5690:49: error: no member named 'pcpu' in 'struct scx_dispatch_q'
 5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
      |                                                                 ~~~  ^
/tmp/kci/linux/kernel/sched/ext/ext.c:5690:49: error: no member named 'pcpu' in 'struct scx_dispatch_q'
 5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
      |                                                                 ~~~  ^
/tmp/kci/linux/kernel/sched/ext/ext.c:5690:49: error: no member named 'pcpu' in 'struct scx_dispatch_q'
 5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
      |                                                                 ~~~  ^
4 errors generated.

=====================================================

When fixing this issue, please attribute this report according to the
patch submission rules:

Reported-by: kernelci.org bot <bot@kernelci.org>
Link: https://lore.kernel.org/all/179244354354.160074.15935947483852417783@kernelci.org/

For complete logs and details about the environment used, see the issue
on the KernelCI dashboard:

- dashboard: https://d.kernelci.org/i/maestro:071b2289158603096de587bfcd71b040198dd84e
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  3d229ce89862b8e82d71a9e11d6f840ca272a6d6
- tags: next-20261019

# Builds where the incident occurred:

## defconfig+arm64-chromebook+kselftest on (arm64):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6ad6681855fda5076042c9b5

## x86_64_defconfig+kselftest+x86-board on (x86_64):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6ad6682355fda5076042ca4a

#regzbot introduced: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64..3d229ce89862b8e82d71a9e11d6f840ca272a6d6
#regzbot link: https://d.kernelci.org/i/maestro:071b2289158603096de587bfcd71b040198dd84e

#kernelci issue maestro:071b2289158603096de587bfcd71b040198dd84e

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
