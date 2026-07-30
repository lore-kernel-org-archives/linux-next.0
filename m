Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75DA39A801
	for <linux-next@vger.kernel.org>; Thu, 30 Jul 2026 16:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785430747; cv=none; b=gye/c3gl+cNYBjEvJUKhmNEotCh54jdjQFwalDPG4ar+5vnFQqNzPDOn+G9RtLuyPuBJic5hqnm/jo0p2syPml1aupwqNWb8sM4iIQ5KodbFgescO62ovAkeTh4/9ZotzyaZbakDB1a5yt4/MyC/cFIPx76hy+Mp2m2XJM4cfE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785430747; c=relaxed/simple;
	bh=ooF4eUiBpz+BIHrJMRbD+9PANmm/8TOJQiTizeHh2rg=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=CyLUIGEu8sJhzlID0mSCtQxbgYxYy1wYSlNQt2BqHQgM3EYM6q54R6pazFACpAOBjMSMc3r2JCrgVO7mDtf+3S82+FYh/vSPorFPJcX2ysIO7xSDtgDCMj1XpCEgdBPHBjVny6TrJx5pyfIxaOjFL4xaJTHX7gcS8GfKPWK5Cgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=Bp4KQGvq; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="Bp4KQGvq"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso26746585ad.2
        for <linux-next@vger.kernel.org>; Thu, 30 Jul 2026 09:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1785430745; x=1786035545; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7iLJuFUNcjxlK3KijjNsWXvDWo9pbqyC8PngAuIGUPQ=;
        b=Bp4KQGvqn6sq8hOkqnRlJNiUku6oS98GgrLrg18zHBfjvmIMq58Ryjx2yLESBBaC5D
         6FqTH07zygyByj8jQd1iqUIEWlixmr2lpkjNJ45XLBRJhBGHyrZx6ir6AlE4R09nsfOF
         xvNC/fJXYCMXcnLqcMsdHFe5KNMUB6QevnAbOsQFvhUK+tVa2Mi2bG1uDllxBhxzpqSr
         C/bvydadw5HEYZw6aog9QzQo7OuD5GsQSNXTUxhYLoYV7tEXFPzcf5NuAW7m6NFNcbpe
         N7nmIodHy1aI79i5SZvoHBJMSfMUPKCVVBQ9wZ3Vj9/Y3Xt5KST96r440nN4bDzPgTFd
         CTjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785430745; x=1786035545;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7iLJuFUNcjxlK3KijjNsWXvDWo9pbqyC8PngAuIGUPQ=;
        b=HjbL00HLobwXdbkvRlNqk0gBceBaupkARHEpI9cDXCFSF7y5Cm7xBOq9a0JQAar2E2
         F2yyeU34XL2LqWIlI4DWsXiFuwCTTp5sfdsqA5WjW79jAoMg2stfkMqiHvA6Jg1oY/Xa
         FdaIDa3rPRG9P6Na5CaPfmbJsptJjcBXVNtdAcVxZsdJYZJBVAR7IHfFOUN+L2BwBbCF
         O6AKdZew1uuTVZ14dNrSsRR/MbYd+XmDGiHsG3ZVXhtsfJw7zJKRbjp3Vx711DO4XxNM
         +ENKwkI05QsKZm6TgyF2yv+LHoeT+/Qo9B0EIeGknNrth4PZJsGU0llFusM0iXLYf2wW
         9WvA==
X-Forwarded-Encrypted: i=1; AHgh+Ro99NUIyebUMQZDqw7hsINQrPRMC9AuA8o2XieWGNkNyEhtJTy67dYCMVLGv2j7pUDZmug6vK6Orv/s@vger.kernel.org
X-Gm-Message-State: AOJu0YyfucM9QfbDNpBC31nqT6ECUZvU7cJo8YF7GJ2whIF9vKaCx8xc
	5+LgOmGY0ZGpIe7ODxKGHANTjPpxzl6arslGh17eFrb734iRdMvq22r/ouIFcI/LXIEjmGUNtis
	AMoKj
X-Gm-Gg: AR+sD13He+rJlCY37/4uQbWBjsO2b/Fv4Una4NfLpTBrac5TxZoNNnDsERZ/4N+yX0D
	mtIP8MMcsMdvxVR9229hnBwOz9PL3zQPaRlOGOBJrUpvWRC9oMCenq18OkSvZDy13pEWGzGwHJu
	0Nm40FdcTtmDGx1LBVaydho0ek9zNjDMn+k20pQ+YF7FX4YCio+skoPGSWBZA5V8o1l4H51w4p6
	CSD0GwgX9Q4Cx3Bb9DVgmpPWmQoZLzu2GuCAWXymnyaeOCv7OEZu+pVaymqQUG8F41REYWX9jxg
	ODkUEo/NCEv7Slgw9LUenlmHdbHSXrHZ3WXsDHnXeMqDcNNs4kkmHsSyeVYPEp9nrt5PPMJO1Xd
	X+/IrQmSwepQpZKEITjpVdMwrr5cog6BuDz9WCVYZgGbdEghBO8dsp/5K0GQUSWcQsEBZR1ygTc
	BLPoJbTVgmBGsw6/eU2TFrOJWLku8PJCFY2zgZf88dmFNFAiBSdy8C7w==
X-Received: by 2002:a05:6a21:a48:b0:3c3:83e8:c209 with SMTP id adf61e73a8af0-3c900786987mr3222269637.71.1785430745072;
        Thu, 30 Jul 2026 09:59:05 -0700 (PDT)
Received: from 92650adf53de ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b15f77sm24848611eec.4.2026.07.30.09.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) use of undeclared identifier
 'check_vector_unaligned_access'; did ...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 30 Jul 2026 16:59:04 -0000
Message-ID: <178543074351.4076.15027730787524065993@kernelci.org>

New build issue found on next/master:

---
 use of undeclared identifier 'check_vector_unaligned_access'; did you mean 'check_unaligned_access'? in arch/riscv/kernel/unaligned_access_speed.o (arch/riscv/kernel/unaligned_access_speed.c) [logspec:kbuild,kbuild.compiler.error]
---

Log excerpt:
=====================================================
/tmp/kci/linux/arch/riscv/kernel/unaligned_access_speed.c:380:24: error: use of undeclared identifier 'check_vector_unaligned_access'; did you mean 'check_unaligned_access'?
  380 |                 schedule_on_each_cpu(check_vector_unaligned_access);
      |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                      check_unaligned_access
/tmp/kci/linux/arch/riscv/kernel/unaligned_access_speed.c:112:12: note: 'check_unaligned_access' declared here
  112 | static int check_unaligned_access(struct page *page)
      |            ^
/tmp/kci/linux/arch/riscv/kernel/unaligned_access_speed.c:380:24: error: incompatible function pointer types passing 'int (struct page *)' to parameter of type 'work_func_t' (aka 'void (*)(struct work_struct *)') [-Wincompatible-function-pointer-types]
  380 |                 schedule_on_each_cpu(check_vector_unaligned_access);
      |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/tmp/kci/linux/include/linux/workqueue.h:636:45: note: passing argument to parameter 'func' here
  636 | extern int schedule_on_each_cpu(work_func_t func);
      |                                             ^
2 errors generated.

=====================================================

When fixing this issue, please attribute this report according to the
patch submission rules:

Reported-by: kernelci.org bot <bot@kernelci.org>
Link: https://lore.kernel.org/all/178543074351.4076.15027730787524065993@kernelci.org/

For complete logs and details about the environment used, see the issue
on the KernelCI dashboard:

- dashboard: https://d.kernelci.org/i/maestro:93d4e1ca2f17ba7ce0541f3202fa21a0043a7f2c
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  95d6a9ccef99117115e41e9adb271243bd5e985b
- tags: next-20260730

# Builds where the incident occurred:

## defconfig+allnoconfig on (riscv):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a6b7183798ea6c1ef929eaa

#regzbot introduced: 78bc8af4affb9a732504eb22eeac7d1e50883853..95d6a9ccef99117115e41e9adb271243bd5e985b
#regzbot link: https://d.kernelci.org/i/maestro:93d4e1ca2f17ba7ce0541f3202fa21a0043a7f2c

#kernelci issue maestro:93d4e1ca2f17ba7ce0541f3202fa21a0043a7f2c

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
