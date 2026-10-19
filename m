Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792439950;
	b=msFsX/TWyn5JhzJAvGc/uC6HlMD+SgBs7D10iD1dgRcPXIZ/5sSFQa+613+TvoTAZbIz
	 kJckFLz+yDWDvPROe33ygIPDuHGZjfeUgwDbHaD7M2xhhaypr7elO4RGHEF1Uksa4LC4x
	 pCu8+JgayTVmQw+VcQWelnsQFspcgKz5yxht5b1qG2EwgOxfYSIhzUNAwpnXpT56hHn0U
	 H4FUvTaxSVwtfWH7DNDThRWJM+M1YXkXCnWVfhczxNL9Z0fOEPsWj3N/9Umqy0PcuYO76
	 ZcvMG9xncY8+9zZSnmnSFHhyySYVpiHtFncae8B1wrNGj0GF1AJz0kEETQ1uNevATwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792439950;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:From:To:
	 Cc:Reply-To:Date:Message-ID;
	bh=Jwei/uvf54LUzn/YXRsen7eqj10kqMQunhk+FQ1OGJY=;
	b=CvoXecPAhmVlPTi1/1cKicJQKlMmpvlRpftJrVy5QzQu+LY0OMnyloeExhVXRQ9J1fzA
	 Yu/s8MK+9R0zoXy2GjgrVt9DzZjx9kxvwjSd+7J8fzlqsSYpkk1ybC/gn/EIq2NQFyM0n
	 Eq+2TqPHWWIKAvkZuGb6os7X8JuPWTSqplaPjMAhJhEpq0QxHfNbSkUjBv8N1bLKMptQi
	 W1UvAAh5uMEcoTi+mg8P85VT7xF6BgaAsPqTlRFTnyKQQRVFBUohpCfhuj++ZyHr5pw5T
	 JCHlebc8AY0xfMdxMX4wX25FjVFUVkhhz+7XxBKz7ga05Z7Ss6VD/lFK/6yh4jZ63wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=hH5bR8ui;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C674B606A322
	for <linux-next@vger.kernel.org>; Mon, 19 Oct 2026 19:59:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C674B606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=hH5bR8ui
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35f036b17easo959068eec.1
        for <linux-next@vger.kernel.org>; Mon, 19 Oct 2026 12:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1792439949; x=1793044749; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Jwei/uvf54LUzn/YXRsen7eqj10kqMQunhk+FQ1OGJY=;
        b=hH5bR8uiRifJMT3iG4U1oL4YfIWKkubxXjkM2xujcD6sgRYg8cOGwE5khBh9v6o+2V
         u4eIJoSXoWbKyjW6/46usNnD5TaReop58WkDUxDHhezLgHRFRqgaoE3D1D6MgLVRffBE
         JVpxrsSchs6FNHiIx9qfXOdF8yfhXqKK+EN2SzCOWX5/aCIKvOH5ikCTVp1OYQi3031m
         cmKYjAq9E6hMtIBogPc14fDDgRJ98Dr4dmbro1jJJlsZPR6R/Bl/Z8MEucDpF5m52rnw
         Hgk7piwQYq70+xpbJaa6PhKIg4wulYMEmYlpSld6u16Rqvo8bRPE8HcD8q4AjdwZJnEq
         J16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792439949; x=1793044749;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jwei/uvf54LUzn/YXRsen7eqj10kqMQunhk+FQ1OGJY=;
        b=fm1aTvb3Z4+6z8OL0/U4hmbJlZoXoR9tBsIFBIgoj3NOFZIy0DkYeI08t4DHxbIdxW
         qWlv/M+zYsCXaiHzVHj2by66qq/b9/ZGSBmaSZKdp5w8Qkum5RHOudiKaJwwTuz5uN17
         GgSa9Y537ercFeo9wHirnUpy3ETpF1vuN+pnEZhsw22ZqMvaUyIgVrGq3gcqwIiTbLxb
         R58p3ZIGRmBjI/Sje7GjbbGIHZvAMe5fiX6zgvbGs/Y2qOFlKENKAuU64nO0T7q24f/9
         BAC/Cgk12Zg+2mjYrAGFC2XaPZgaGHnnkP5fHUBAoEap8jwEjj93ngMF3K25P3eTDkeM
         Acdg==
X-Forwarded-Encrypted: i=1; AKwUvBxjZE7qCE0K9/FdTP7basuQJNsVSXSLT04Z5JU08goFzgP94Q6iBBYuguo4tlt7v0+/na4ZZ6oZWmn7@vger.kernel.org
X-Gm-Message-State: AFq9FYK/CPnrv7WUFjt8pEkJUOOznCCTp+eYWZXiqvIPhjcCi1JXbP1I
	SKYp0aGrTsfqSv6rqHuawucNQdV4WwHvmkA9jRmdMiXoH7DNoMtQ7O8ytNso9gwltsI=
X-Gm-Gg: AYBFou0fj6/yCEdk6S4sBBnm0bhcs48ixK+L3Xi/6JAbvaoVOHdopLUkqUnOrh4p2Xg
	vGaaj9jA7CEuHzhXrleMVYofr1C9lik4ZRRyKzfqOFq+hT5J03qkyl8eeMDNE+ajVRLGaXEpHKk
	YfyeS/lv0nVz7/iIpKS8qfimAIK4s/9r6ebd8Dia2YWDqwBsuK6qTn0hbDzXHXmLc6AyZA6DlBo
	qB0aU7WIqgeRBwW/7MkfD88+TK1DDgO70+bqaYfm4a/HMrpdum7mX8tOeH2sbXuwioARLkZnQpn
	mHWiNYy1m7gHVWEIsBNbUYtYEoH3zlRjsU52LHKKQqZJwDkGZLpDv2aBWRQ/0LsAaKa+6F4EOaz
	bA2GRdLvTVr5XNrfDRKY+t1S9ENagX+BezPG7YLEpZ4HDfEjIaPUfIdjWMiPTabXDLCknnHkyj8
	9nlmTwPTNoBBabKsXB7SkDNBnYrAJUGw4xG02T1/BxQbizKel4aRdULnRnlp87A5E=
X-Received: by 2002:a05:7300:7a9a:b0:35a:8dad:6724 with SMTP id 5a478bee46e88-361a1f495bamr12539352eec.22.1792439948710;
        Mon, 19 Oct 2026 12:59:08 -0700 (PDT)
Received: from 6e52bff8000c ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360820a02b8sm37250606eec.17.2026.10.19.12.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 12:59:08 -0700 (PDT)
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
 =?utf-8?b?W1JFR1JFU1NJT05dIG5leHQvbWFzdGVyOiAoYnVpbGQpa2VybmVsL3NjaGVkL2V4?=
 =?utf-8?b?dC9leHQuYzo1NjkwOjY4OiBlcnJvcjog4oCYc3RydWN0IHNjeF9kaXNwYXRjaF9x?=
 =?utf-8?b?4oCZIGhhcyAuLi4=?=
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Mon, 19 Oct 2026 19:59:08 -0000
Message-ID: <179243994757.157792.6578749550685907930@kernelci.org>

New build issue found on next/master:

---
kernel/sched/ext/ext.c:5690:68: error: ‘struct scx_dispatch_q’ has no member named ‘pcpu’ in kernel/sched/build_policy.o (kernel/sched/build_policy.c) [logspec:kbuild,kbuild.compiler.error]
---

Log excerpt:
=====================================================
                 from kernel/sched/build_policy.c:17:
kernel/sched/ext/ext.c: In function ‘free_dsq_irq_workfn’:
kernel/sched/ext/ext.c:5690:68: error: ‘struct scx_dispatch_q’ has no member named ‘pcpu’
 5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
      |                                                                    ^~
./include/linux/percpu-defs.h:216:54: note: in definition of macro ‘__verify_pcpu_ptr’
  216 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
      |                                                      ^~~
kernel/sched/ext/ext.c:5690:53: note: in expansion of macro ‘per_cpu_ptr’
 5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
      |                                                     ^~~~~~~~~~~
In file included from ././include/linux/compiler_types.h:173,
                 from <command-line>:
kernel/sched/ext/ext.c:5690:68: error: ‘struct scx_dispatch_q’ has no member named ‘pcpu’
 5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
      |                                                                    ^~
./include/linux/compiler-gcc.h:34:41: note: in definition of macro ‘RELOC_HIDE’
   34 |         __asm__ ("" : "=r"(__ptr) : "0"(ptr));                          \
      |                                         ^~~
./include/linux/percpu-defs.h:221:10: note: in expansion of macro ‘TYPEOF_UNQUAL’
  221 |         (TYPEOF_UNQUAL(*(__p)) __force __kernel *)((__force unsigned long)(__p))
      |          ^~~~~~~~~~~~~
./include/linux/percpu-defs.h:230:20: note: in expansion of macro ‘PERCPU_PTR’
  230 |         RELOC_HIDE(PERCPU_PTR(__p), (__offset))
      |                    ^~~~~~~~~~
./include/linux/percpu-defs.h:235:9: note: in expansion of macro ‘SHIFT_PERCPU_PTR’
  235 |         SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                 \
      |         ^~~~~~~~~~~~~~~~
kernel/sched/ext/ext.c:5690:53: note: in expansion of macro ‘per_cpu_ptr’
 5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
      |                                                     ^~~~~~~~~~~
kernel/sched/ext/ext.c:5690:68: error: ‘struct scx_dispatch_q’ has no member named ‘pcpu’
 5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
      |                                                                    ^~
./include/linux/compiler-gcc.h:34:41: note: in definition of macro ‘RELOC_HIDE’
   34 |         __asm__ ("" : "=r"(__ptr) : "0"(ptr));                          \
      |                                         ^~~
./include/linux/percpu-defs.h:230:20: note: in expansion of macro ‘PERCPU_PTR’
  230 |         RELOC_HIDE(PERCPU_PTR(__p), (__offset))
      |                    ^~~~~~~~~~
./include/linux/percpu-defs.h:235:9: note: in expansion of macro ‘SHIFT_PERCPU_PTR’
  235 |         SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                 \
      |         ^~~~~~~~~~~~~~~~
kernel/sched/ext/ext.c:5690:53: note: in expansion of macro ‘per_cpu_ptr’
 5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
      |                                                     ^~~~~~~~~~~
kernel/sched/ext/ext.c:5690:68: error: ‘struct scx_dispatch_q’ has no member named ‘pcpu’
 5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
      |                                                                    ^~
./include/linux/compiler-gcc.h:35:17: note: in definition of macro ‘RELOC_HIDE’
   35 |         (typeof(ptr)) (__ptr + (off));                                  \
      |                 ^~~
./include/linux/percpu-defs.h:221:10: note: in expansion of macro ‘TYPEOF_UNQUAL’
  221 |         (TYPEOF_UNQUAL(*(__p)) __force __kernel *)((__force unsigned long)(__p))
      |          ^~~~~~~~~~~~~
./include/linux/percpu-defs.h:230:20: note: in expansion of macro ‘PERCPU_PTR’
  230 |         RELOC_HIDE(PERCPU_PTR(__p), (__offset))
      |                    ^~~~~~~~~~
./include/linux/percpu-defs.h:235:9: note: in expansion of macro ‘SHIFT_PERCPU_PTR’
  235 |         SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                 \
      |         ^~~~~~~~~~~~~~~~
kernel/sched/ext/ext.c:5690:53: note: in expansion of macro ‘per_cpu_ptr’
 5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
      |                                                     ^~~~~~~~~~~
kernel/sched/ext/ext.c:5690:68: error: ‘struct scx_dispatch_q’ has no member named ‘pcpu’
 5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
      |                                                                    ^~
./include/linux/compiler-gcc.h:35:17: note: in definition of macro ‘RELOC_HIDE’
   35 |         (typeof(ptr)) (__ptr + (off));                                  \
      |                 ^~~
./include/linux/percpu-defs.h:230:20: note: in expansion of macro ‘PERCPU_PTR’
  230 |         RELOC_HIDE(PERCPU_PTR(__p), (__offset))
      |                    ^~~~~~~~~~
./include/linux/percpu-defs.h:235:9: note: in expansion of macro ‘SHIFT_PERCPU_PTR’
  235 |         SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                 \
      |         ^~~~~~~~~~~~~~~~
kernel/sched/ext/ext.c:5690:53: note: in expansion of macro ‘per_cpu_ptr’
 5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
      |                                                     ^~~~~~~~~~~
  CC      crypto/krb5/rfc8009_aes2.o
  CC      mm/mmap.o
  CC      fs/mnt_idmapping.o
  CC      block/blk-zoned.o

=====================================================

When fixing this issue, please attribute this report according to the
patch submission rules:

Reported-by: kernelci.org bot <bot@kernelci.org>
Link: https://lore.kernel.org/all/179243994757.157792.6578749550685907930@kernelci.org/

For complete logs and details about the environment used, see the issue
on the KernelCI dashboard:

- dashboard: https://d.kernelci.org/i/maestro:73852e14f70c4fa20c57f8f41ccbe2bc6342d96b
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  3d229ce89862b8e82d71a9e11d6f840ca272a6d6
- tags: next-20261019

# Builds where the incident occurred:

## defconfig+netdev+nfs-root-boot+kselftest on (arm64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-arm64-nfsboot-6ad6683655fda5076042cad6/.config
- dashboard: https://d.kernelci.org/build/maestro:6ad6683655fda5076042cad6

#regzbot introduced: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64..3d229ce89862b8e82d71a9e11d6f840ca272a6d6
#regzbot link: https://d.kernelci.org/i/maestro:73852e14f70c4fa20c57f8f41ccbe2bc6342d96b

#kernelci issue maestro:73852e14f70c4fa20c57f8f41ccbe2bc6342d96b

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
