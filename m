Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792439949;
	b=bztd7UPfb4jR7zzmkRkX2ceSBXHfIKI6STDPtekqSHsmBqphB6Wl/L4BUZMgA3/6gp8M
	 QibqJHxlYlrEn604OIeDIYIW34kZTkaA31aoNWFYN2ubVsEfvIc7HjYBbDiAyR3PCZWpp
	 E0nRQBEjuONXkORFsRv7t+15JAxqKjivGx7g/LBTfIlSmRMuQl9ELwsAtBOCvS5bBMVSj
	 ZKNvGJ6dleqoKkYpx73J5+Pugh9tdvTIw67wBPZzKTrlZB6HQwwSfWXaTj9Df9iUY7g/c
	 xr6JC0IF3uNrenWnHhPkZ3jQq8fQG5W6F6pYKE8zOVMczOQ2AkKxW8GG4XVkp+Xg1Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792439949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:From:To:
	 Cc:Reply-To:Date:Message-ID;
	bh=bBJYWUvPESVGuX/lS7oqePLjhOTUHs8lrLsluP6zz08=;
	b=TcZ0UPxY/Y6hCfee4OIy2p8QLjmSNs9l8X2x4BmwdpiM3D4XLEyVXP55qxt+MuiTo/ao
	 uMFsysrILDIeFN8V9Bso8wRL4I+Hi9gH6aGtzWP7se+TN9LfQIyqQ6l+4r1FmD/Mhhu9u
	 UxXrZVxKsJnTQVt6kzjvoS/l95tHywXkspF3zBQVqlT7yp8cg8fJYkAqgaN2QqOLsLsUK
	 ejTKeJAFrXkh8FfejbsNc06tEg8M88DRX7RvpMaGyUf+3/iVaRlsOqQ7VpwvqKiH31Knz
	 sYH3XZLGDJDH10iIf7lDoBCqPXfHzLfxoDKH6CkLCBywcxttdcAMQ43/ZzK5dh4JQUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=RItqx7VD;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22DD606A319
	for <linux-next@vger.kernel.org>; Mon, 19 Oct 2026 19:59:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A22DD606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=RItqx7VD
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33fb4680717so4237620eec.1
        for <linux-next@vger.kernel.org>; Mon, 19 Oct 2026 12:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1792439948; x=1793044748; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bBJYWUvPESVGuX/lS7oqePLjhOTUHs8lrLsluP6zz08=;
        b=RItqx7VDbAeCctjq1QcmlkRK1unQ8crNZxcNbluWT6Ag7W8GhTh60uyPjshjBYzJVZ
         BPlSmayhCKcl9qoCFbUgKlpgOqiYIx+KEW5H/jVP69s0H8wsXKt4B/n+vr2PuIH5ft+K
         LUcBcexGC2ukxqPHdbRQUqXQUPPPRa9lhnNA+zk2a70gp2Nfztvds9o4tSQDVfybz9Xt
         BOJxkljafqsxBzSFXBhKsgA3erAJ/gQ1dR7ADPdyyXCKnGwSQ3PZFITWrqi8/TWWg+QM
         AzGGsUj6D5LHK6+oorEtGBm1i22FNmOqxTkk0GcI2G6Cnkl5t7tkcaRqXbfy9Pyuz8iV
         tjJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792439948; x=1793044748;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bBJYWUvPESVGuX/lS7oqePLjhOTUHs8lrLsluP6zz08=;
        b=NADgOt5Tad8Itb/+QNCvHF/XCETdHPx48McJ2/JZ0SmFt1xIyP7bgkaRdeie//RWaF
         ep2MEOxFS+Xpkf7s391Q5l8hGowbqFDP13SExWav4je4lCvmKsRertvZ9Kukd2o4PjA2
         jZm9XDio0MzVJPq45AW+NzR3oiN6X9inmDsyo70R6cZdPp4b5UWufDwX2hA2k10/7VID
         IVdlhRnvKeTVSUDez/i5B4X3AiXEMusVl99acLCspt3HrSaxl6SLlM9akH+Xl3FcHsRx
         HaVyNptnszWRAQ370U2myy/UwJpNDMfOgXWqnGO2L+JUUNanEb8pLOplIGEwAA8g5+zC
         spLA==
X-Forwarded-Encrypted: i=1; AKwUvBz2m14Mged/njQLuKGKrqVhYDxnDGR0/BAtQTZyTNJbzOQ+Y+YmaDhj9JgjPwWoRbGLlqiTLtUL0k1L@vger.kernel.org
X-Gm-Message-State: AFq9FYK3yIFXSiKYjqC7Rpqsc7NAlQIwp5EDk8z9sIlRr7pwDP+h6vy5
	yNJNwx3ccNT/Ztc+UpLGOcQdKFvRyqJU2VMpifvv80LiCMMHdL5yixwWC0wTbxb+ORvxImYDHHq
	YNhz2
X-Gm-Gg: AYBFou1Oxapbf6s8qWIlSocWTNXrwGo35QPkatjRir3KOFs9ZTZhL7jHm2FhQYwnzlO
	pUw5Eo579tmPmMliYXDH2qnkIU3uSk7ZUMOtGS1W+8mGSMKWjidnLtTIq6uJFDKDYqAvGMR0V6m
	UYNFdV7ImpLJWvhdNv+5JeDiMUmo+UUQ0Rcf5Cq3YkqNQts3jdKoLJmqpEDkMx6EzkeTa+LsZ23
	yP6Hx9F32X6l19j34P4Aqacci8zpOKBdcBHfYTzrS7/3I0BCabQHQx1oQwS8WOJeSUc1tvkaTpu
	O9M7hs6UU+0L7Qhr9RrtnX5nUcBB8GPQ1JKE9DTtpyjYhnGZkGnzlT7qCkJ6qkK5xrGXMjkM9lp
	kFq3ewTt6FhQKyz0MwoBZX6gxs/rvoSEcWScoyXXcZATXvjLju8xwTdWVxbfMLJWnqsp7Xi+oik
	TBx/gdC4OSAWWnT/uPO0SOFuz7jlOGOpc/KDXi0a+RtiXOhBdoRUAzQ44heLrNcno=
X-Received: by 2002:a05:7301:648d:b0:35c:813a:1c81 with SMTP id 5a478bee46e88-361a234233cmr11919174eec.18.1792439947329;
        Mon, 19 Oct 2026 12:59:07 -0700 (PDT)
Received: from 6e52bff8000c ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6e33sm36043287eec.7.2026.10.19.12.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 12:59:06 -0700 (PDT)
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
Content-Transfer-Encoding: 8bit
Subject: 
 =?utf-8?q?=5BREGRESSION=5D_next/master=3A_=28build=29/tmp/kci/linux/kernel/s?=
 =?utf-8?q?ched/ext/ext=2Ec=3A5690=3A68=3A_error=3A_=E2=80=98struct_scx=5Fd?=
 =?utf-8?q?=2E=2E=2E?=
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Mon, 19 Oct 2026 19:59:06 -0000
Message-ID: <179243994625.157792.5761151975328981641@kernelci.org>

New build issue found on next/master:

---
/tmp/kci/linux/kernel/sched/ext/ext.c:5690:68: error: ‘struct scx_dispatch_q’ has no member named ‘pcpu’ in kernel/sched/build_policy.o (kernel/sched/build_policy.c) [logspec:kbuild,kbuild.compiler.error]
---

Log excerpt:
=====================================================
                 from /tmp/kci/linux/kernel/sched/build_policy.c:16:
/tmp/kci/linux/kernel/sched/ext/ext.c: In function ‘free_dsq_irq_workfn’:
/tmp/kci/linux/kernel/sched/ext/ext.c:5690:68: error: ‘struct scx_dispatch_q’ has no member named ‘pcpu’
 5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
      |                                                                    ^~
/tmp/kci/linux/include/linux/percpu-defs.h:216:54: note: in definition of macro ‘__verify_pcpu_ptr’
  216 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
      |                                                      ^~~
/tmp/kci/linux/kernel/sched/ext/ext.c:5690:53: note: in expansion of macro ‘per_cpu_ptr’
 5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
      |                                                     ^~~~~~~~~~~
In file included from /tmp/kci/linux/include/linux/compiler_types.h:173,
                 from <command-line>:
/tmp/kci/linux/kernel/sched/ext/ext.c:5690:68: error: ‘struct scx_dispatch_q’ has no member named ‘pcpu’
 5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
      |                                                                    ^~
/tmp/kci/linux/include/linux/compiler-gcc.h:34:41: note: in definition of macro ‘RELOC_HIDE’
   34 |         __asm__ ("" : "=r"(__ptr) : "0"(ptr));                          \
      |                                         ^~~
/tmp/kci/linux/include/linux/percpu-defs.h:221:10: note: in expansion of macro ‘TYPEOF_UNQUAL’
  221 |         (TYPEOF_UNQUAL(*(__p)) __force __kernel *)((__force unsigned long)(__p))
      |          ^~~~~~~~~~~~~
/tmp/kci/linux/include/linux/percpu-defs.h:230:20: note: in expansion of macro ‘PERCPU_PTR’
  230 |         RELOC_HIDE(PERCPU_PTR(__p), (__offset))
      |                    ^~~~~~~~~~
/tmp/kci/linux/include/linux/percpu-defs.h:235:9: note: in expansion of macro ‘SHIFT_PERCPU_PTR’
  235 |         SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                 \
      |         ^~~~~~~~~~~~~~~~
/tmp/kci/linux/kernel/sched/ext/ext.c:5690:53: note: in expansion of macro ‘per_cpu_ptr’
 5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
      |                                                     ^~~~~~~~~~~
/tmp/kci/linux/kernel/sched/ext/ext.c:5690:68: error: ‘struct scx_dispatch_q’ has no member named ‘pcpu’
 5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
      |                                                                    ^~
/tmp/kci/linux/include/linux/compiler-gcc.h:34:41: note: in definition of macro ‘RELOC_HIDE’
   34 |         __asm__ ("" : "=r"(__ptr) : "0"(ptr));                          \
      |                                         ^~~
/tmp/kci/linux/include/linux/percpu-defs.h:230:20: note: in expansion of macro ‘PERCPU_PTR’
  230 |         RELOC_HIDE(PERCPU_PTR(__p), (__offset))
      |                    ^~~~~~~~~~
/tmp/kci/linux/include/linux/percpu-defs.h:235:9: note: in expansion of macro ‘SHIFT_PERCPU_PTR’
  235 |         SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                 \
      |         ^~~~~~~~~~~~~~~~
/tmp/kci/linux/kernel/sched/ext/ext.c:5690:53: note: in expansion of macro ‘per_cpu_ptr’
 5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
      |                                                     ^~~~~~~~~~~
/tmp/kci/linux/kernel/sched/ext/ext.c:5690:68: error: ‘struct scx_dispatch_q’ has no member named ‘pcpu’
 5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
      |                                                                    ^~
/tmp/kci/linux/include/linux/compiler-gcc.h:35:17: note: in definition of macro ‘RELOC_HIDE’
   35 |         (typeof(ptr)) (__ptr + (off));                                  \
      |                 ^~~
/tmp/kci/linux/include/linux/percpu-defs.h:221:10: note: in expansion of macro ‘TYPEOF_UNQUAL’
  221 |         (TYPEOF_UNQUAL(*(__p)) __force __kernel *)((__force unsigned long)(__p))
      |          ^~~~~~~~~~~~~
/tmp/kci/linux/include/linux/percpu-defs.h:230:20: note: in expansion of macro ‘PERCPU_PTR’
  230 |         RELOC_HIDE(PERCPU_PTR(__p), (__offset))
      |                    ^~~~~~~~~~
/tmp/kci/linux/include/linux/percpu-defs.h:235:9: note: in expansion of macro ‘SHIFT_PERCPU_PTR’
  235 |         SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                 \
      |         ^~~~~~~~~~~~~~~~
/tmp/kci/linux/kernel/sched/ext/ext.c:5690:53: note: in expansion of macro ‘per_cpu_ptr’
 5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
      |                                                     ^~~~~~~~~~~
/tmp/kci/linux/kernel/sched/ext/ext.c:5690:68: error: ‘struct scx_dispatch_q’ has no member named ‘pcpu’
 5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
      |                                                                    ^~
/tmp/kci/linux/include/linux/compiler-gcc.h:35:17: note: in definition of macro ‘RELOC_HIDE’
   35 |         (typeof(ptr)) (__ptr + (off));                                  \
      |                 ^~~
/tmp/kci/linux/include/linux/percpu-defs.h:230:20: note: in expansion of macro ‘PERCPU_PTR’
  230 |         RELOC_HIDE(PERCPU_PTR(__p), (__offset))
      |                    ^~~~~~~~~~
/tmp/kci/linux/include/linux/percpu-defs.h:235:9: note: in expansion of macro ‘SHIFT_PERCPU_PTR’
  235 |         SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                 \
      |         ^~~~~~~~~~~~~~~~
/tmp/kci/linux/kernel/sched/ext/ext.c:5690:53: note: in expansion of macro ‘per_cpu_ptr’
 5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
      |                                                     ^~~~~~~~~~~

=====================================================

When fixing this issue, please attribute this report according to the
patch submission rules:

Reported-by: kernelci.org bot <bot@kernelci.org>
Link: https://lore.kernel.org/all/179243994625.157792.5761151975328981641@kernelci.org/

For complete logs and details about the environment used, see the issue
on the KernelCI dashboard:

- dashboard: https://d.kernelci.org/i/maestro:ffbd67ed9d45c04ccbd3e5f32cf5904fb2ddb780
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  3d229ce89862b8e82d71a9e11d6f840ca272a6d6
- tags: next-20261019

# Builds where the incident occurred:

## x86_64_defconfig+kselftest+x86-board on (x86_64):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6ad6685e55fda5076042cbe4

#regzbot introduced: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64..3d229ce89862b8e82d71a9e11d6f840ca272a6d6
#regzbot link: https://d.kernelci.org/i/maestro:ffbd67ed9d45c04ccbd3e5f32cf5904fb2ddb780

#kernelci issue maestro:ffbd67ed9d45c04ccbd3e5f32cf5904fb2ddb780

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
