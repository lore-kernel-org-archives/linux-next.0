Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43E3407564
	for <linux-next@vger.kernel.org>; Mon, 15 Jun 2026 15:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781539148; cv=none; b=H16BM+C2tQF9CfLrTqEzOhsyeiEKmVYiXfkxpj/7eXtFVmA1CFdLWQ2x29WtvVUFnnyviNV0Pn7lbG9Nbb2tAItJsEUv+iTh1KVYQpghguJiA6tGqYgo4tmuREp+gD+XiAmi+XrjQ14o2T/rSuqujRyKmS4dAbyaITyWQRyg2o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781539148; c=relaxed/simple;
	bh=02456t33kCanPwRPAPtTVAeMZgD9cqQ/ckBYvAOaCUs=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=fEqz4JFMEHRZdFuuI3duc5rVp9HR3zDxC/y5e5ItJ2DQMY22GRo3ErnpEZTLG0udawYI6VCrZctp7Glf2XZsw7nb7XsPgf3rgBq3vWPNE6rT4+zKez0O6dw6o0xlgI30dxwprzLQoYnLCRFaWuDxqL2/BbV+4Ofzlzy5ggHciKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=C00iUJmV; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="C00iUJmV"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-137ec563a95so3692788c88.0
        for <linux-next@vger.kernel.org>; Mon, 15 Jun 2026 08:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1781539146; x=1782143946; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NCT8etNXvK/IxtxeQpIRLNLGiEVJ24UbzqSH8HPG4oA=;
        b=C00iUJmVf8LnI7VJ2N0r+AiWBD2X1JSN6FaMvJdDRSAIWSg32IORvW5pVF7N/3lYKc
         FMSZ9GvHw0G9QpjbQRPzJWGQJSMesvF4yuD4rZFlhbRQ36tnRLU6mtfOOtD+8jrpFNWb
         4O+SoapHwX/PgERaLIPHYyUwQz9GqCuplAP/dzJ5o3m+YgT7StvERt6P2gIspEilsdDA
         7zJzTcvuFWtXIVwIs07ncjGC2HEHV4d3JFVRAcV0jAHqdNwodT5KWDRViLJBkAG4REmP
         XnZlw917zZQAkWr5C9OlsZA8w2VQK8EtVgs1kdl1r7PUqylIVhhwCJ+9GwrMlJ0LiB/D
         /h7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781539146; x=1782143946;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NCT8etNXvK/IxtxeQpIRLNLGiEVJ24UbzqSH8HPG4oA=;
        b=CGCxwFQE8SmLOHcpCsQ/dLHfaRG6+mM0OlOJyPBQ/utJ6D/OV2kKcaMzMjsBTI7Hqj
         R4GXyqreWBsijd3zX6etBDtqKpG6FZrufE4s30AuzwoFsVb/UI59MF0lZEJP6WfYv7Tu
         4trKQctjB2y57XLGqGE8MrU6CvCBmVD/woDFyi+EaRZbCe3m1OUNH1IvU2gpGxlfx0N2
         TTFvH6YmqpjCFQvK1r4to8hUinjTi/ypOSHwIKQqXp392XjHNHdDQZOKTPbQwECwd5I2
         ZdTVG6pFxNQVIiy4WBOO5vz0HltnZOqGj9ilN0xz/dqSsC8DIPHzpo8yotmqA6f0OyWa
         dtsA==
X-Forwarded-Encrypted: i=1; AFNElJ+r4HZJghj76u/TX2UcyjIA1Nrjdk1JhMxAM9oR29SAPi/YbRPVFp4MF8NHn9O9LghxWm1B4ztYJVLX@vger.kernel.org
X-Gm-Message-State: AOJu0YwI2gTC45h9gMsuNNPxDXlNc3EBTEy8VuY1U2AXvHB91DJZ3xa/
	ADG6/QYsn8s8DwXvFFxWjJ/9p4yCZiYk+rAaxXuZgrRRm4MP8cLlibGygsba7wrf3YM=
X-Gm-Gg: Acq92OHFcyNwc3r4O9hv+q95lJgUZd6KsiStTiT3XFxh2KLoR7n227NaH5z7Dx2pkCY
	Se6KPckmVDzqWQWefSGoKDFh9k1GfZJNtEWJleczLYqzxUY+GN27F0vry4Xvh5RASLOKkWSFBQq
	oL8tK28JQ4lDgMbhbPpRAAUaMdiThAcaSD5s1qCHwFMXlCBMV6VEQwxw+HHWUCSikMReekAvgEE
	PxB0U51Rk1kGyn1V36N5eUhZuLRHy3CvFeXDhAQyZEY+F/r0Pduv7Sube+DVOYLcmHYq5znZHYa
	uvUJ9u4FK7Jhbz5rXoJ7mO+nEJOceaKnyEwFe93c2USTthzK/DvszKjF/B5v73k7UO359A9KYrT
	z/tg3twEIE0t1FQHXuth2v+Reqmzyn5MG6mAU4mOLTrnJeDrQLULR7inpFpVhIimlVdntKqGvz4
	n3sDsQPxUtPkluK11o
X-Received: by 2002:a05:7022:2396:b0:137:ea7d:a5e1 with SMTP id a92af1059eb24-13878e2d130mr5218409c88.30.1781539146009;
        Mon, 15 Jun 2026 08:59:06 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b91a4c7sm10606835c88.8.2026.06.15.08.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:59:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) too many arguments to function
 call,
 expected 5, have 6 in mm/slub...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Mon, 15 Jun 2026 15:59:05 -0000
Message-ID: <178153914528.15282.16770125845520023465@330cfa3079ca>





Hello,

New build issue found on next/master:

---
 too many arguments to function call, expected 5, have 6 in mm/slub.o (mm/slub.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:0c4655a413ae8e279f9ba1fcb2fc80a3953d4dd4
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  700f8f17ac2c84f94b7cf4420f306a23a5ddfd24


Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
/tmp/kci/linux/mm/slub.c:5553:30: error: too many arguments to function call, expected 5, have 6
 5552 |                 return __do_kmalloc_node(size, NULL, flags, node,
      |                        ~~~~~~~~~~~~~~~~~
 5553 |                                 PASS_TOKEN_PARAM(token), &ac);
      |                                                          ^~~
/tmp/kci/linux/mm/slub.c:5340:7: note: '__do_kmalloc_node' declared here
 5340 | void *__do_kmalloc_node(kmem_buckets *b, gfp_t flags, int node,
      |       ^                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 5341 |                         kmalloc_token_t token, struct slab_alloc_context *ac)
      |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
1 error generated.

=====================================================


# Builds where the incident occurred:

## aspeed_g5_defconfig on (arm):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a301b0ea1ade4ad5d108dc5

## defconfig+allnoconfig on (riscv):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a301b13a1ade4ad5d108dd5

## i386_defconfig+allnoconfig on (i386):
- compiler: clang-21
- config: https://files.kernelci.org/kbuild-clang-21-i386-allnoconfig-6a301b13a1ade4ad5d108dd2/.config
- dashboard: https://d.kernelci.org/build/maestro:6a301b13a1ade4ad5d108dd2

## multi_v7_defconfig+allnoconfig on (arm):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a301b0ba1ade4ad5d108dc2

## x86_64_defconfig on (x86_64):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a301b17a1ade4ad5d108de4

## x86_64_defconfig+allnoconfig on (x86_64):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a301b1ba1ade4ad5d108df3


#kernelci issue maestro:0c4655a413ae8e279f9ba1fcb2fc80a3953d4dd4

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
