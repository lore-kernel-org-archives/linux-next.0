Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792439948;
	b=WbUUDpvK44os47Lb5liY4yD8mrZimpdIh3SX47Lp/+rm1llrqhtTrWrGnm7vgJOxB2w+
	 B9z2p5gKE166RX2F/cQcs5Y1He+Fx1GJxYvWHcnSngKQE4S2ZZNS1LqY6tuKLcu4vCntz
	 N5rUJKPaWveP2M/ydsOS3TQyCC3bvwQqNXPVed41535z0t1I4+1UX95b5hJzlzB8Cwzfl
	 dvDisgPF2SgYEIxQh4tMp/tqc9bsMJVcftawwPCK3tUW3SRO0EshQySnhE+G984IO+maw
	 rfQ6CnKt+lT6TJNEnn6RJjcXkRbQhIHzcO1IHgH4mhpVxmY2dcn4KbFDDibjBlIftig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792439948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:From:To:
	 Cc:Reply-To:Date:Message-ID;
	bh=ZK5hFEIM2dKQb+E5njV6DP8czgM9WeGNd36c+l7VLmY=;
	b=1HQubzE3ApydyjC+cFTvHXJY9YYrImZcCM4e1WYs8CBgaRDufgEMZ85VZh0crBgLcQrC
	 jRstALApfWWZJnsQ7J/lFBxa1x0u4BLMTF+vA0bBzp5QSyqJyxFkdqTuNXHVLGZuKI8AI
	 SUtQ7zCdX3KJSAV+lL2byfh3Sm9cyyMueiClLJWrR04RRk6BWxG72v9jjXcptTrwa/zDc
	 91galh3ETqF5kkjQ/Xd2JFntfayV8GSd/C2KogdirfTHOnt+2RF81YK5UZ4xV9+9B2/nd
	 sniez3TMqb1kS+KTAZilTYVWK9uhe/sqYQoGnnNglp1VpapBBojDF1bRz6sq55rFd6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=QIKFt1Tc;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558E9606A31F
	for <linux-next@vger.kernel.org>; Mon, 19 Oct 2026 19:59:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 558E9606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=QIKFt1Tc
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso2919281eec.0
        for <linux-next@vger.kernel.org>; Mon, 19 Oct 2026 12:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1792439946; x=1793044746; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZK5hFEIM2dKQb+E5njV6DP8czgM9WeGNd36c+l7VLmY=;
        b=QIKFt1TcyxQk5F9JRR2UGxna5E3AOLbH7+sYXjucSoGnsGJ6bSi1os9OvL4ma7NLBr
         UZ5AYxex7CG6UAMnTY0B4kZY+pkxXLPK/YHX6QHJq0hoiHRtf5SY6u2tac1LfqBDcWp9
         qcIBDH/XIh+ZUQ3hmYNieEbCyUjjgGnbwRpJl2jXwHIx3fDQZf9onSENj24KYj/nOe0/
         0QNJsHVWnuf/O8TMTejrGKVTjcT5giIqDQJ7UJGo7a26bxR9fpRn9YF+UBJ+C9kST0Mk
         0pvuvzm5dZ+0jO2sN/Ps0mOiHJcjIVMwEbndbFSE5q1awjz7iMg4Xx4cJsZEJ3/Py21f
         qnVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792439946; x=1793044746;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZK5hFEIM2dKQb+E5njV6DP8czgM9WeGNd36c+l7VLmY=;
        b=OT6Q4kIYPBsRwnlAeJqBnz8ABY49NswemsOzrdQDuda3Y4jBgJ9ypmqNUbOW5XxPoT
         O2RMoUYI/rpfesVNLBiob6jEo8bYG2uKdoxEC0fvD2BPBmVogdGMhUUb7ukx/fgX/Oiw
         hjIRpBQ84IEATQSuKyBuaZyp7f9kgJYhwmPJ9hvmKil1eEUCtSmCJ818NzNS1J0dzeLO
         96fiM9hYuOIM7iIU0sZZLMvgN78meU2RLwemZaZk+DnN5bkRBCMIolEwPZAoFkQJ2XFb
         tEXgUEzOBL+zjO/Jy3qVWecKKuga6C6vKTiv0YO49vpI3sz+RYpbc+NpJtpILVoDZ5d4
         VuMg==
X-Forwarded-Encrypted: i=1; AKwUvBxr1qkrEECG9HykuHdAuf2uVAcScAk2/JPp7bcvAKbf4uUYOmfsyhVgjnJE9woPpIL5XnYCNd2OXPdU@vger.kernel.org
X-Gm-Message-State: AFq9FYL3eAzS10la/DNPwG+qaByr6l7ztnfHGS/WsoKJba5SmPw2tjFG
	eBxtyNtavA9vFAvRgzuqYvKtXo7JoQlVXwG2GehDfcUY3n7NrKE/UAzAKKDJJBNG0DA=
X-Gm-Gg: AYBFou2rYwZFs5acNPwPAjQxKthiVMI8oOeqAJzDlK9gd3wIpBYPiya2/ZUHwI0mXJE
	zwxbkP+a6QE4t/EWfCYJIsK21Th+1ubUc4AuOhdJb8hfct2H/0H5qP/mYdYKTCZpqxY8Xf62C0t
	7dba2FRFFHDqMrMWpmEJvYfNvzrjKo8uXWMmcBb+vxgItqfCNx961fwA0+nQtiV2hdN3VSrGLlW
	eScSF7YVO32HafCN8MKVBstArpYEergNLh8enfCI/2XzbK/e3UIQB8FVY/0bAGzz6i+RZr7KVS1
	tMvPatLidPE6BqseWIEQXCAFE//YONLXou3L7sEIE+teyfQlfcDVGSsdFqPTYZn4VrmNuPebCXY
	VGl1RL4RoaHRyu/37i6QU6B0ObfqYNdpEVh5XDy22/FxqjzbpW4lL2ajmf4PrdaU4SzR9W0a/6Z
	8hxM1aLevZqyZGwl0W0mGr9iJ2MCRxHt+18rb38tSIPIEUKp0QcShlAbqWWBz2su0=
X-Received: by 2002:a05:7301:6447:b0:35c:3941:c7bd with SMTP id 5a478bee46e88-361a136ac8bmr19469007eec.19.1792439946058;
        Mon, 19 Oct 2026 12:59:06 -0700 (PDT)
Received: from 6e52bff8000c ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081ab80f9sm55704415eec.12.2026.10.19.12.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 12:59:05 -0700 (PDT)
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
Date: Mon, 19 Oct 2026 19:59:05 -0000
Message-ID: <179243994358.157792.10951804910694087418@kernelci.org>

New build issue found on next/master:

---
/tmp/kci/linux/kernel/sched/ext/ext.c:5690:68: error: ‘struct scx_dispatch_q’ has no member named ‘pcpu’ in kernel/sched/build_policy.o (kernel/sched/build_policy.c) [logspec:kbuild,kbuild.compiler.error]
---

Log excerpt:
=====================================================
                 from /tmp/kci/linux/kernel/sched/build_policy.c:17:
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
Link: https://lore.kernel.org/all/179243994358.157792.10951804910694087418@kernelci.org/

For complete logs and details about the environment used, see the issue
on the KernelCI dashboard:

- dashboard: https://d.kernelci.org/i/maestro:7ed368722038f8a902f4a6da878dc48b8ba88c66
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  3d229ce89862b8e82d71a9e11d6f840ca272a6d6
- tags: next-20261019

# Builds where the incident occurred:

## defconfig+allnoconfig+lab-setup+kselftest on (arm64):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6ad6683855fda5076042cb1e

#regzbot introduced: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64..3d229ce89862b8e82d71a9e11d6f840ca272a6d6
#regzbot link: https://d.kernelci.org/i/maestro:7ed368722038f8a902f4a6da878dc48b8ba88c66

#kernelci issue maestro:7ed368722038f8a902f4a6da878dc48b8ba88c66

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
