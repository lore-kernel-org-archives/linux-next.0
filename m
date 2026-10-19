Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792439951;
	b=HYIZD2mcmojjqHYp8fJySvgpgZHnfEcGphcb6/fKQz5ahpQnmx3RVzW39P493dMHUiJI
	 tr8wMwvLBkcVUcrqitSzy5J93fgDDyALE7xwmRkoh/ttqj8PdIYhmY6fadWRA0EpWydNb
	 iZLew+BVPdS6bKI6GVhUk2OaFigNtZBUkQAEWY6+pZ6iI+clC9QWDbO3OteYSdw0Q9Rh4
	 DVw4cMABIFuquQ71pdcxugyf/Vf9c7l03C016qNOxESF64iXmpxxtJu82rnIKqKlC+KxL
	 8AhZZpqY5e3UNnC6kY5srMhCGgZ1Om7SXwTKFRHaIAriHqZtO7A9bznQGtjC3Ld2SXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792439951;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:From:To:
	 Cc:Reply-To:Date:Message-ID;
	bh=NAZJsKWtcIwD0Z2t17dZ8Bj3h4xKz9TEQCr7wm06Y4A=;
	b=PZ9rm8ScYhX7g9x6hci7q+V4RNBkUwP9wDFPJHFK3xmvBG/rAf4cIKN+NCEPvRxlj8NT
	 VrJiXYw7ir+O4NdF/f3K5/UsOCcvVrZoBT39C1J5ECOq/VmsV2ZH2v20GcOmdNKU5Z/Ey
	 4GvEz5WWV0XDjsmkYi5/xejB2kLtGBMgeXavk4xxFXLs0OtfNO6vAqnlefsP4JNJHLkkm
	 aiF/kzqbi6yaLA5y1pda91Y8G8p1G/xkEL68AFnx5AYZyYbn7kadKFFovXlc1gmOPTa25
	 qoGQU+B3bbjHRCytrUFLaggNGmoXHNw3v1w0kiHqrtI+SSN/IYBHP/0ki/ErT5yI5Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=NHpsAqIP;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7454F606A319
	for <linux-next@vger.kernel.org>; Mon, 19 Oct 2026 19:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7454F606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=NHpsAqIP
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1517bda04a0so1992153c88.0
        for <linux-next@vger.kernel.org>; Mon, 19 Oct 2026 12:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1792439950; x=1793044750; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NAZJsKWtcIwD0Z2t17dZ8Bj3h4xKz9TEQCr7wm06Y4A=;
        b=NHpsAqIPHfy73HgaFI0lCx2boVDnvpaPUGxTsDSaElDFxWj2GiS/YzwiJWFRPpDaPG
         Ifjx1BiNcg4bYTgNzikWIo0HqP8lltI/wZDx7pHD4SRlmB6CygF5Q2Y7uyIkQlE8ckp9
         ZwRvNp8bNFTxSb2MLosno/hJodanL39RHovH26BeHm9DHrZEbRzEntwekEu79FQc22DD
         2oXjZ3Ie746sRe2omGKAN8aiixJqU1Cv4oWM1/mSn+kLR9zbXN2UPMcFkZ/dIYe/uVox
         F1sHhH+S8zYqougJaQS3A88QQ171jkjGEW0MJCY5oikHfWXmb94YUpQAXMZTbSxpia1E
         FV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792439950; x=1793044750;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NAZJsKWtcIwD0Z2t17dZ8Bj3h4xKz9TEQCr7wm06Y4A=;
        b=jZGNktES2UJoRMWxix+KF6EVlW7vZA4Rb9++MkRcRyjjiX+h1aSHYEwEMfh2cug++7
         q65V9BR3O8sVAg4m0hV57GV21wQCF7vM7oeYxAgiLyRVNBuqDBDv++sOoogXgn9v/E1X
         QVWdK7SuiAbzYNqqr9Q2lWAj/bdyTq1uZ+mv466FgccFLmOVhO4MYovVQ72+RCN2yABv
         LPme+G25/EtQcv+JHvuTyDEaLaCQmcXmqwvUwQ0w/F1ym56FN4seA5qWiXDh1KHJkDpH
         aMIer1YMvcgswYc5W2+dGXipm1eTsZyqeM1bfMSCLfZzE2ZsALkDHdarFyQ6RrCRCD3i
         TcjA==
X-Forwarded-Encrypted: i=1; AKwUvBxiGcJlkFMZWPS6kB7GzyU4bsyIDuVa2BgDyQBjnE/BVEBZIJJMyjHqqKrAecgbHOf00OsUq07HtciY@vger.kernel.org
X-Gm-Message-State: AFq9FYL2s17e8+mneh9wiK+L5NkD2CV226ldMRI+WhanK3aSWLgYwjPb
	Kf1BE/SWxZpfZSkJBbBLguhjw9zzguZxN+0hPXXG95HuuUS6yv+t8mJgZWc0Rlb6RXc=
X-Gm-Gg: AYBFou0HR37R2YnESC1ulGKm26ja0d1MZ3HKy9PKyQ5aEQ3BmLnPnCq917sGZilHXtk
	PaJbFsVrC56i/UHJlav5EvaIaEnw3FVnpbfhIh7KpbWTLzpLtXmcQkJNCwwd18KmcFdEdLyIq4Y
	3VkHRit7iNYpgVFTBoeiVErkkKlb13IBXTyC8B8seDBEhN0mhzYwIWYaaTNVHkurIdQEsGQw3Ob
	WbbPi3mrcW7IEHudp/2lFBoxgKqcwJ59XoTb/qDzVjIVyQ3pIqCtEHVZWsfiYW93KtXTnFR7fuk
	rtvRgiGIEAwU0+aT9NKyV0Me0fXfhRfLJ2XcePtCAcaiPw9LI8KuBVsSBlqNu5jSZqfexaMecgX
	Hff40x5ktqL7X7I3f10aCs0rV9/CCaF9/bz1JVezaihwjhukXS3maI2iMhBuKBOWUkOHJdbF60a
	W8wxO2v8m3SmdBqLaor5wBuH4DEsdwa3fB8AumBK9bssGnYGAYHahCIj2BnbW13PI=
X-Received: by 2002:a05:7022:1583:b0:158:b51c:4502 with SMTP id a92af1059eb24-18512f1ee00mr12977891c88.34.1792439950246;
        Mon, 19 Oct 2026 12:59:10 -0700 (PDT)
Received: from 6e52bff8000c ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75be5esm42397844c88.16.2026.10.19.12.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 12:59:09 -0700 (PDT)
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
Date: Mon, 19 Oct 2026 19:59:09 -0000
Message-ID: <179243994891.157792.7812879229965993143@kernelci.org>

New build issue found on next/master:

---
kernel/sched/ext/ext.c:5690:68: error: ‘struct scx_dispatch_q’ has no member named ‘pcpu’ in kernel/sched/build_policy.o (kernel/sched/build_policy.c) [logspec:kbuild,kbuild.compiler.error]
---

Log excerpt:
=====================================================
                 from kernel/sched/build_policy.c:16:
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
  CC      fs/notify/group.o
  CC      crypto/krb5/rfc3961_simplified.o
  CC      security/landlock/audit.o
  CC      fs/notify/mark.o
  CC      mm/madvise.o
  CC      security/integrity/ima/ima_queue_keys.o

=====================================================

When fixing this issue, please attribute this report according to the
patch submission rules:

Reported-by: kernelci.org bot <bot@kernelci.org>
Link: https://lore.kernel.org/all/179243994891.157792.7812879229965993143@kernelci.org/

For complete logs and details about the environment used, see the issue
on the KernelCI dashboard:

- dashboard: https://d.kernelci.org/i/maestro:0b3c665aa5978c471800ab879201d48f07e28d7b
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  3d229ce89862b8e82d71a9e11d6f840ca272a6d6
- tags: next-20261019

# Builds where the incident occurred:

## i386_defconfig+kselftest on (i386):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-i386-kselftest-6ad6684855fda5076042cb7d/.config
- dashboard: https://d.kernelci.org/build/maestro:6ad6684855fda5076042cb7d

#regzbot introduced: d419d682257d813f6cb7a28e42b35d0edf4ad038..3d229ce89862b8e82d71a9e11d6f840ca272a6d6
#regzbot link: https://d.kernelci.org/i/maestro:0b3c665aa5978c471800ab879201d48f07e28d7b

#kernelci issue maestro:0b3c665aa5978c471800ab879201d48f07e28d7b

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
