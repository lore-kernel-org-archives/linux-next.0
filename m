Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055D74071D9
	for <linux-next@vger.kernel.org>; Mon, 15 Jun 2026 15:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781539147; cv=none; b=bNJgBBi4Q3RlgLAORBDM2a+WZrDIVR42gQp0nJMuB7nTHCDS/wTEvdz6JXROMnwsgjwo5kQV7EehIyCDh6NQFpdZlGMY13Bv9IDpwQGe3dMqX2Uqfzj3uHxx8rAOOBEdVq2Ip3U0GWUTLTK7MwpH7pQNvJzL9wIM8Ivk61UTZW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781539147; c=relaxed/simple;
	bh=h9WtLBt7aXoEerx3JYYDClbxGXJc5p9lpfgPJl3St0s=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=U/6dF2GeDgJE4puIIjFs4rLAfLiptvIcmX+bK60lVMUSur8oFX5VNdbzFtuJFlndWbjt4Lb267WC14C1oBp+N0Tzp5tzD2M+ANb8QE0F9u+TyRLHpJ0igAAiUmeHB2xph30JEyaHlEQ4PJdoOjnORHw0ks7ZWUToQMzLXA8FX9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=FmBFf9fB; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="FmBFf9fB"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1384ebe7a10so5110595c88.1
        for <linux-next@vger.kernel.org>; Mon, 15 Jun 2026 08:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1781539145; x=1782143945; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MhvhhvBBu9uGx40m6SrfaOHHRfJTVRO4+8KVZRHE9cs=;
        b=FmBFf9fB9Cv5Sun9d7i7v4I64taemp8aHq5OHkLsVPnouQFUj2WjXPH6QKu6N+NTMx
         FVGIdE8+vQQCe/TygH+HtKrv2WB0IFzyqLMvqNHEPsz7L1B2dMIkXxAHQvaHVeS2E2YL
         xlKuxwzHdNHQE2d691QliiNFcJ/3MO5D6tnsa9Q/JGTOew1lgkDhlXUA5AjzEDwjhW1b
         2TExCF+f+0AGKV0fhdU1VnNBR5RJZdW/tq20r8Lq1BzRfNqIgEcq1jv91zLyOTRj5BYT
         8jwNYJeqKJnULYkkephKBKWqEKpcqvdfcdikGBiQOChaD44pPR8BqvBrbIqhwpVqFV6m
         avOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781539145; x=1782143945;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MhvhhvBBu9uGx40m6SrfaOHHRfJTVRO4+8KVZRHE9cs=;
        b=G/ElEjCAy5B1w30BoutpTtUAvdMChXLJ4KqIbCZ8ftJ7r3R1ZFX38QUqCi4X85JCP/
         33ozCNOZS7kn7NniBj41MYFmIRj8fJeU/v0GNdRq1unLAILZrPzjoix+bTUjoTOvbHcr
         GxiFMdgz1aHMNMxZHucxHMBIBPBb50e8ad0du8RiOjq/PjqMO/44zk+uCSaHPELxk6eH
         nSqceFGCUOSNiGPMNRG8HG8l2/9OJsxh7uQRD+j0zoC7hmmSfMKOn5zQtcE7bQKgFHUM
         lk26wKEcgmGKGalvY3oRHtXx9vfDRXJLLFTsALWvlpHres88qxN/8w4152F2d5G4RJfJ
         Oc6A==
X-Forwarded-Encrypted: i=1; AFNElJ/Rj7sXg0q6Yzfxo/tQYDfHo0NtTGnXyHgsTtulM/eQ9aLBySE1W0ULteUrfNHYIDpH9EpWLoq2rCkN@vger.kernel.org
X-Gm-Message-State: AOJu0YyViDIHdmD7/fc7M+aHD9+TnZ3jBf3gn4x7pj4se67pubnmvhWf
	kKKY05vftEniElnoUhYMm2/J8aTwaFbAOgxxkrm0zeVY5Ps4WCU0Fx5oAI8lnLwwDQ4=
X-Gm-Gg: Acq92OHFHVk7sjJjl0sSd9oi2doQvGi/N0v1U78u0Oi2qXm1n5QHwEFq0ls4McLT7rz
	SIE6OB/JU+AnekzIhkCw656TufsnRcthOR/+aWNyJYSMknGa+h+jGpn+358aDN8Fm6ZqgXrfMAD
	X6ySDq6PqZo7AXuyRCzQxuicIUndpzBB57JP7ymgvAD0bnYdzFy719IWKuQRMAJj46QQj9n7iPd
	ozXYDa1apql7JVihbxzGtiZn/Y5FGKB1wFKkgORqk0q8t0/0mzDO7q2g2mn2NX9cTdU3fOPFN1P
	CLVRnWBob2kyJCZpulCdqr9mn4aYjl3TiNtMGu29MAHL7uehYCKKx39zAmaYGjp/ytMNMMzdb3y
	1QY5r5w05hoDwD1HyLkeeHj1Eqlz4/EB45mK/GS0zl8XQHQbP+u2bIEZSCMYnyZvG1pCGQjtm6d
	gPbYQECDYy349jzbql
X-Received: by 2002:a05:7022:6087:b0:12d:b7e5:a67b with SMTP id a92af1059eb24-1384bb361b9mr7540341c88.14.1781539144964;
        Mon, 15 Jun 2026 08:59:04 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b964862sm10902662c88.10.2026.06.15.08.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) passing argument 1 of
 '__do_kmalloc_node'
 makes pointer from integ...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Mon, 15 Jun 2026 15:59:04 -0000
Message-ID: <178153914414.15282.5994241043459847090@330cfa3079ca>





Hello,

New build issue found on next/master:

---
 passing argument 1 of '__do_kmalloc_node' makes pointer from integer without a cast [-Wint-conversion] in mm/slub.o (mm/slub.c) [logspec:kbuild,kbuild.compiler.warning]
---

- dashboard: https://d.kernelci.org/i/maestro:88b7de4573d3ff7942d5e1c391739d0d3854fe51
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  700f8f17ac2c84f94b7cf4420f306a23a5ddfd24


Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
mm/slub.c:5552:42: warning: passing argument 1 of '__do_kmalloc_node' makes pointer from integer without a cast [-Wint-conversion]
 5552 |                 return __do_kmalloc_node(size, NULL, flags, node,
      |                                          ^~~~
      |                                          |
      |                                          size_t {aka unsigned int}
mm/slub.c:5340:39: note: expected 'struct kmem_cache * (*)[15]' but argument is of type 'size_t' {aka 'unsigned int'}
 5340 | void *__do_kmalloc_node(kmem_buckets *b, gfp_t flags, int node,
      |                         ~~~~~~~~~~~~~~^
In file included from ./include/uapi/linux/posix_types.h:5,
                 from ./include/uapi/linux/types.h:14,
                 from ./include/linux/types.h:5,
                 from ./include/linux/kasan-checks.h:5,
                 from ./include/asm-generic/rwonce.h:26,
                 from ./arch/arc/include/generated/asm/rwonce.h:1,
                 from ./include/linux/compiler.h:369,
                 from ./arch/arc/include/asm/ptrace.h:11,
                 from ./arch/arc/include/asm/bug.h:11,
                 from ./include/linux/bug.h:5,
                 from ./include/linux/mmdebug.h:5,
                 from ./include/linux/mm.h:7,
                 from mm/slub.c:15:
./include/linux/stddef.h:8:14: warning: passing argument 2 of '__do_kmalloc_node' makes integer from pointer without a cast [-Wint-conversion]
    8 | #define NULL ((void *)0)
      |              ^~~~~~~~~~~
      |              |
      |              void *
mm/slub.c:5552:48: note: in expansion of macro 'NULL'
 5552 |                 return __do_kmalloc_node(size, NULL, flags, node,
      |                                                ^~~~
mm/slub.c:5340:48: note: expected 'gfp_t' {aka 'unsigned int'} but argument is of type 'void *'
 5340 | void *__do_kmalloc_node(kmem_buckets *b, gfp_t flags, int node,
      |                                          ~~~~~~^~~~~
mm/slub.c:5552:61: error: incompatible type for argument 4 of '__do_kmalloc_node'
 5552 |                 return __do_kmalloc_node(size, NULL, flags, node,
      |                                                             ^~~~
      |                                                             |
      |                                                             int
mm/slub.c:5341:41: note: expected 'kmalloc_token_t' but argument is of type 'int'
 5341 |                         kmalloc_token_t token, struct slab_alloc_context *ac)
      |                         ~~~~~~~~~~~~~~~~^~~~~
In file included from ./include/linux/mm.h:34:
./include/linux/slab.h:520:41: error: incompatible type for argument 5 of '__do_kmalloc_node'
  520 | #define PASS_TOKEN_PARAM(_token)        ((kmalloc_token_t){})
      |                                         ^~~~~~~~~~~~~~~~~~~~~
      |                                         |
      |                                         kmalloc_token_t
mm/slub.c:5553:33: note: in expansion of macro 'PASS_TOKEN_PARAM'
 5553 |                                 PASS_TOKEN_PARAM(token), &ac);
      |                                 ^~~~~~~~~~~~~~~~
mm/slub.c:5341:75: note: expected 'struct slab_alloc_context *' but argument is of type 'kmalloc_token_t'
 5341 |                         kmalloc_token_t token, struct slab_alloc_context *ac)
      |                                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
mm/slub.c:5552:24: error: too many arguments to function '__do_kmalloc_node'
 5552 |                 return __do_kmalloc_node(size, NULL, flags, node,
      |                        ^~~~~~~~~~~~~~~~~
mm/slub.c:5340:7: note: declared here
 5340 | void *__do_kmalloc_node(kmem_buckets *b, gfp_t flags, int node,
      |       ^~~~~~~~~~~~~~~~~
  CC      lib/zlib_inflate/inflate_syms.o
mm/slub.c:5558:1: error: control reaches end of non-void function [-Werror=return-type]
 5558 | }
      | ^
cc1: some warnings being treated as errors

=====================================================


# Builds where the incident occurred:

## haps_hs_smp_defconfig on (arc):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-arc-haps_hs_smp_defconfig-6a301b2ca1ade4ad5d108e15/.config
- dashboard: https://d.kernelci.org/build/maestro:6a301b2ca1ade4ad5d108e15


#kernelci issue maestro:88b7de4573d3ff7942d5e1c391739d0d3854fe51

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
