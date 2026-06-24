Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E8B347516;
	Wed, 24 Jun 2026 11:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782302293; cv=none; b=Rwu/NbJZ06+8z0Ht3gG35cRKw3zIeVJUgyI9NBGrb+QjkpuwVBJyQwEoXbQZXdip1irFVtS1YiRg5yWWG0RvZ3pvs2BaZIhO3AYxbsQOQ5dBB6Oh98Ygd/suHiKi6aDbunJwN0MlPggBzvyv3LEe8nZZgkK2+2QLMQeBn1RYem8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782302293; c=relaxed/simple;
	bh=cDIjsjPhrIyLBObIf0jIjDsIcUyF3OAw/Rvn9GqPiV4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uSN0A9rRwtGoiMZI5cK03pROW9si/aB3amJj1xikV64Hd2LErc3SsEbp36SJbh4r6ckAN6MhA5b6cMnDcVP/LcDJT/y+WGN81c06PPpz0DZXz94ZUjFuwnMcb4wdi/i/Izsq2RaiEQZ/zTd9aHiuNVYVHeBqaQpyK5F7rWgJK1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bXibbKUb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bXibbKUb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A725E1F000E9;
	Wed, 24 Jun 2026 11:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782302287;
	bh=nVh8TiJN0IV4vvNKbrU2GhQ3/o5eQXmtp2m9Gq6a92k=;
	h=Date:From:To:Cc:Subject;
	b=bXibbKUb68loozON2hDcmyvwVhUD5BVVulDQ6hlzVzBSPRH44W0LS4MR30v5ZPfdw
	 uJAW/sECH9eIRSjD0XZPrR9qaFA0QqKw4oraiIfBiFe3jVnVIZQkaifABSlTVGo6lJ
	 YFRSdTg4rfeAbgWEoagLd3Xo5FFzkZT0jgY0zGDrSuuEm70J/WO2ioXxh/u0pFzio3
	 RTE6zTHiBEc7imCTv+WITkl/zJz+J7gyYvB2FaYsLh7N8X5pYEftZ2mi6LeN+rirFt
	 lvPY+84Gy6kBrNFE2gWJNVLClkMSeechR6n5K0GkVPl3rQxoNwp7hW+9ekEEDriaRN
	 Q1uhVWuUcTQew==
Date: Wed, 24 Jun 2026 12:58:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the arm64 tree
Message-ID: <ajvGS7UBpWzJtzkw@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Sd3StwGWXlpbe5Nd"
Content-Disposition: inline


--Sd3StwGWXlpbe5Nd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the arm64 tree, today's linux-next build
(arm64 kselftest) failed like this:

  CC       iommufd_fail_nth
  CC       iommufd
  CC       msgque
  CC       ir_loopback
  CC       kcmp_test
  CC       harness-selftest
In file included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from lib/io.c:8:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:347:
/tmp/next/arm64_kselftest/kselftest/kvm/lib/io.o] Error 1 make[1]:
*** Waiting for unfinished jobs....  In file included from
/usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from lib/assert.c:7:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:347:
/tmp/next/arm64_kselftest/kselftest/kvm/lib/assert.o] Error 1 In file
included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from include/lru_gen_util.h:14,
                 from lib/lru_gen_util.c:8:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:347:
/tmp/next/arm64_kselftest/kselftest/kvm/lib/lru_gen_util.o] Error 1 In
file included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from lib/test_util.c:19:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:347:
/tmp/next/arm64_kselftest/kselftest/kvm/lib/test_util.o] Error 1 In file
included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from lib/sparsebit.c:158:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:347:
/tmp/next/arm64_kselftest/kselftest/kvm/lib/sparsebit.o] Error 1 In file
included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from /tmp/next/build/tools/testing/selftests/cgroup/lib/cgroup_util.c:9:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended to
silence earlier diagnostics make[1]: *** [../cgroup/lib/libcgroup.mk:17:
/tmp/next/arm64_kselftest/kselftest/kvm/lib/cgroup_util.o] Error 1 In
file included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from lib/elf.c:8:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from /tmp/next/arm64_kselftest/usr/include/linux/kvm.h:16,
                 from include/kvm_util.h:14,
                 from lib/elf.c:13:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:347:
/tmp/next/arm64_kselftest/kselftest/kvm/lib/elf.o] Error 1 In file
included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from include/kvm_util.h:8,
                 from demand_paging_test.c:17:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from /tmp/next/arm64_kselftest/usr/include/linux/kvm.h:16,
                 from include/kvm_util.h:14:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:332:
/tmp/next/arm64_kselftest/kselftest/kvm/demand_paging_test.o] Error 1
In file included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from lib/guest_sprintf.c:2:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from /tmp/next/arm64_kselftest/usr/include/linux/kvm.h:16,
                 from include/kvm_util.h:14,
                 from lib/guest_sprintf.c:3:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:347:
/tmp/next/arm64_kselftest/kselftest/kvm/lib/guest_sprintf.o] Error 1 In
file included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from include/kvm_util.h:8,
                 from lib/arm64/ucall.c:7:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from /tmp/next/arm64_kselftest/usr/include/linux/kvm.h:16,
                 from include/kvm_util.h:14:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:347:
/tmp/next/arm64_kselftest/kselftest/kvm/lib/arm64/ucall.o] Error 1 In
file included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from include/kvm_util.h:8,
                 from lib/ucall_common.c:6:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from /tmp/next/arm64_kselftest/usr/include/linux/kvm.h:16,
                 from include/kvm_util.h:14:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:347:
/tmp/next/arm64_kselftest/kselftest/kvm/lib/ucall_common.o] Error 1 In
file included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from kvm_create_max_vcpus.c:14:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from /tmp/next/arm64_kselftest/usr/include/linux/kvm.h:16,
                 from include/kvm_util.h:14,
                 from kvm_create_max_vcpus.c:16:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:332:
/tmp/next/arm64_kselftest/kselftest/kvm/kvm_create_max_vcpus.o] Error 1
In file included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from include/kvm_util.h:8,
                 from lib/userfaultfd_util.c:19:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from /tmp/next/arm64_kselftest/usr/include/linux/kvm.h:16,
                 from include/kvm_util.h:14:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:347:
/tmp/next/arm64_kselftest/kselftest/kvm/lib/userfaultfd_util.o] Error 1
In file included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from irqfd_test.c:7:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from /tmp/next/arm64_kselftest/usr/include/linux/kvm.h:16,
                 from include/kvm_util.h:14,
                 from irqfd_test.c:11:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:332:
/tmp/next/arm64_kselftest/kselftest/kvm/irqfd_test.o] Error 1 In file
included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from kvm_binary_stats_test.c:15:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from /tmp/next/arm64_kselftest/usr/include/linux/kvm.h:16,
                 from include/kvm_util.h:14,
                 from kvm_binary_stats_test.c:17:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:332:
/tmp/next/arm64_kselftest/kselftest/kvm/kvm_binary_stats_test.o] Error 1
In file included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from arm64/host_sve.c:10:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from arm64/host_sve.c:12:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:332:
/tmp/next/arm64_kselftest/kselftest/kvm/arm64/host_sve.o] Error 1 In
file included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from include/kvm_util.h:8,
                 from include/guest_modes.h:5,
                 from lib/guest_modes.c:5:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from /tmp/next/arm64_kselftest/usr/include/linux/kvm.h:16,
                 from include/kvm_util.h:14:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:347:
/tmp/next/arm64_kselftest/kselftest/kvm/lib/guest_modes.o] Error 1 In
file included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from include/kvm_util.h:8,
                 from include/timer_test.h:11,
                 from arch_timer.c:28:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from /tmp/next/arm64_kselftest/usr/include/linux/kvm.h:16,
                 from include/kvm_util.h:14:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:332:
/tmp/next/arm64_kselftest/kselftest/kvm/arch_timer.o] Error 1 In file
included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from include/kvm_util.h:8,
                 from lib/arm64/gic.c:10:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from /tmp/next/arm64_kselftest/usr/include/linux/kvm.h:16,
                 from include/kvm_util.h:14:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:347:
/tmp/next/arm64_kselftest/kselftest/kvm/lib/arm64/gic.o] Error 1 In file
included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from /tmp/next/arm64_kselftest/usr/include/linux/kvm.h:16,
                 from lib/arm64/vgic.c:7:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
In file included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from include/kvm_util.h:8,
                 from lib/arm64/vgic.c:13:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:347:
/tmp/next/arm64_kselftest/kselftest/kvm/lib/arm64/vgic.o] Error 1 In
file included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from include/kvm_util.h:8,
                 from dirty_log_perf_test.c:17:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from /tmp/next/arm64_kselftest/usr/include/linux/kvm.h:16,
                 from include/kvm_util.h:14:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:332:
/tmp/next/arm64_kselftest/kselftest/kvm/dirty_log_perf_test.o] Error 1
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from /tmp/next/arm64_kselftest/usr/include/linux/kvm.h:16,
                 from lib/arm64/gic_v3_its.c:7:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
In file included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from include/kvm_util.h:8,
                 from lib/arm64/gic_v3_its.c:12:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:347:
/tmp/next/arm64_kselftest/kselftest/kvm/lib/arm64/gic_v3_its.o] Error 1
In file included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from include/kvm_util.h:8,
                 from lib/memstress.c:8:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from /tmp/next/arm64_kselftest/usr/include/linux/kvm.h:16,
                 from include/kvm_util.h:14:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:347:
/tmp/next/arm64_kselftest/kselftest/kvm/lib/memstress.o] Error 1 In file
included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from include/kvm_util.h:8,
                 from lib/arm64/gic_v3.c:8:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from /tmp/next/arm64_kselftest/usr/include/linux/kvm.h:16,
                 from include/kvm_util.h:14:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:347:
/tmp/next/arm64_kselftest/kselftest/kvm/lib/arm64/gic_v3.o] Error 1 In
file included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from guest_print_test.c:13:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from /tmp/next/arm64_kselftest/usr/include/linux/kvm.h:16,
                 from include/kvm_util.h:14,
                 from guest_print_test.c:14:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:332:
/tmp/next/arm64_kselftest/kselftest/kvm/guest_print_test.o] Error 1 In
file included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from set_memory_region_test.c:6:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from /tmp/next/arm64_kselftest/usr/include/linux/kvm.h:16,
                 from include/kvm_util.h:14,
                 from set_memory_region_test.c:16:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:332:
/tmp/next/arm64_kselftest/kselftest/kvm/set_memory_region_test.o] Error 1
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from arm64/hypercalls.c:13:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
In file included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from include/kvm_util.h:8,
                 from arm64/hypercalls.c:14:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:332:
/tmp/next/arm64_kselftest/kselftest/kvm/arm64/hypercalls.o] Error 1 In
file included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from kvm_page_table_test.c:17:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from /tmp/next/arm64_kselftest/usr/include/linux/kvm.h:16,
                 from include/kvm_util.h:14,
                 from kvm_page_table_test.c:18:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:332:
/tmp/next/arm64_kselftest/kselftest/kvm/kvm_page_table_test.o] Error 1
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from arm64/kvm-uuid.c:7:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
In file included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from include/kvm_util.h:8,
                 from arm64/kvm-uuid.c:8:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:332:
/tmp/next/arm64_kselftest/kselftest/kvm/arm64/kvm-uuid.o] Error 1 In
file included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from include/kvm_util.h:8,
                 from arm64/vcpu_width_config.c:12:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from /tmp/next/arm64_kselftest/usr/include/linux/kvm.h:16,
                 from include/kvm_util.h:14:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:332:
/tmp/next/arm64_kselftest/kselftest/kvm/arm64/vcpu_width_config.o] Error 1
In file included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from include/kvm_syscalls.h:15,
                 from guest_memfd_test.c:20:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from /tmp/next/arm64_kselftest/usr/include/linux/kvm.h:16,
                 from include/kvm_util.h:14,
                 from guest_memfd_test.c:21:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:332:
/tmp/next/arm64_kselftest/kselftest/kvm/guest_memfd_test.o] Error 1 In
file included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from include/kvm_util.h:8,
                 from include/memstress.h:13,
                 from memslot_modification_stress_test.c:21:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from /tmp/next/arm64_kselftest/usr/include/linux/kvm.h:16,
                 from include/kvm_util.h:14:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:332:
/tmp/next/arm64_kselftest/kselftest/kvm/memslot_modification_stress_test.o]
Error 1 In file included from
/usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from include/kvm_util.h:8,
                 from include/arm64/processor.h:10,
                 from arm64/smccc_filter.c:17:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from /tmp/next/arm64_kselftest/usr/include/linux/kvm.h:16,
                 from include/kvm_util.h:14:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:332:
/tmp/next/arm64_kselftest/kselftest/kvm/arm64/smccc_filter.o] Error 1
In file included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from dirty_log_test.c:12:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from /tmp/next/arm64_kselftest/usr/include/linux/kvm.h:16,
                 from include/kvm_util.h:14,
                 from dirty_log_test.c:19:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:332:
/tmp/next/arm64_kselftest/kselftest/kvm/dirty_log_test.o] Error 1 In
file included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from arm64/sea_to_user.c:17:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from /tmp/next/arm64_kselftest/usr/include/linux/kvm.h:16,
                 from include/kvm_util.h:14,
                 from arm64/sea_to_user.c:23:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:332:
/tmp/next/arm64_kselftest/kselftest/kvm/arm64/sea_to_user.o] Error 1 In
file included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from memslot_perf_test.c:24:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from /tmp/next/arm64_kselftest/usr/include/linux/kvm.h:16,
                 from include/kvm_util.h:14,
                 from memslot_perf_test.c:26:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:332:
/tmp/next/arm64_kselftest/kselftest/kvm/memslot_perf_test.o] Error 1 In
file included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from include/kvm_util.h:8,
                 from arm64/vgic_lpi_stress.c:13:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from /tmp/next/arm64_kselftest/usr/include/linux/kvm.h:16,
                 from include/kvm_util.h:14:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:332:
/tmp/next/arm64_kselftest/kselftest/kvm/arm64/vgic_lpi_stress.o] Error 1
In file included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from include/kvm_util.h:8,
                 from arm64/aarch32_id_regs.c:13:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from /tmp/next/arm64_kselftest/usr/include/linux/kvm.h:16,
                 from include/kvm_util.h:14:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:332:
/tmp/next/arm64_kselftest/kselftest/kvm/arm64/aarch32_id_regs.o] Error 1
In file included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from arm64/idreg-idst.c:8:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from /tmp/next/arm64_kselftest/usr/include/linux/kvm.h:16,
                 from include/kvm_util.h:14,
                 from arm64/idreg-idst.c:9:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:332:
/tmp/next/arm64_kselftest/kselftest/kvm/arm64/idreg-idst.o] Error 1 In
file included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from include/kvm_util.h:8,
                 from include/arm64/processor.h:10,
                 from include/arm64/arch_timer.h:9,
                 from arm64/arch_timer_edge_cases.c:21:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from /tmp/next/arm64_kselftest/usr/include/linux/kvm.h:16,
                 from include/kvm_util.h:14:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:332:
/tmp/next/arm64_kselftest/kselftest/kvm/arm64/arch_timer_edge_cases.o]
Error 1 In file included from
/usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from coalesced_io_test.c:2:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from /tmp/next/arm64_kselftest/usr/include/linux/kvm.h:16,
                 from include/kvm_util.h:14,
                 from coalesced_io_test.c:10:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:332:
/tmp/next/arm64_kselftest/kselftest/kvm/coalesced_io_test.o] Error 1 In
file included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from include/kvm_util.h:8,
                 from arm64/hello_el2.c:7:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from /tmp/next/arm64_kselftest/usr/include/linux/kvm.h:16,
                 from include/kvm_util.h:14:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:332:
/tmp/next/arm64_kselftest/kselftest/kvm/arm64/hello_el2.o] Error 1 In
file included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from include/kvm_util.h:8,
                 from include/arm64/processor.h:10,
                 from include/arm64/arch_timer.h:9,
                 from arm64/arch_timer.c:8:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from /tmp/next/arm64_kselftest/usr/include/linux/kvm.h:16,
                 from include/kvm_util.h:14:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:337:
/tmp/next/arm64_kselftest/kselftest/kvm/arm64/arch_timer.o] Error 1 In
file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from arm64/vgic_irq.c:10:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
In file included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from include/kvm_util.h:8,
                 from include/arm64/processor.h:10,
                 from arm64/vgic_irq.c:15:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:332:
/tmp/next/arm64_kselftest/kselftest/kvm/arm64/vgic_irq.o] Error 1 In
file included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from /usr/include/aarch64-linux-gnu/sys/wait.h:36,
                 from get-reg-list.c:26:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from /tmp/next/arm64_kselftest/usr/include/linux/kvm.h:16,
                 from include/kvm_util.h:14,
                 from get-reg-list.c:27:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:332:
/tmp/next/arm64_kselftest/kselftest/kvm/get-reg-list.o] Error 1 In file
included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from include/kvm_syscalls.h:15,
                 from access_tracking_perf_test.c:47:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from /tmp/next/arm64_kselftest/usr/include/linux/kvm.h:16,
                 from include/kvm_util.h:14,
                 from access_tracking_perf_test.c:48:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:332:
/tmp/next/arm64_kselftest/kselftest/kvm/access_tracking_perf_test.o]
Error 1 In file included from
/tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from steal_time.c:12:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
In file included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from steal_time.c:19:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:332:
/tmp/next/arm64_kselftest/kselftest/kvm/steal_time.o] Error 1 In file
included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from include/kvm_util.h:8,
                 from include/arm64/processor.h:10,
                 from arm64/external_aborts.c:7:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from /tmp/next/arm64_kselftest/usr/include/linux/kvm.h:16,
                 from include/kvm_util.h:14:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:332:
/tmp/next/arm64_kselftest/kselftest/kvm/arm64/external_aborts.o] Error 1
In file included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from include/kvm_util.h:8,
                 from arm64/psci_test.c:18:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from /tmp/next/arm64_kselftest/usr/include/linux/kvm.h:16,
                 from include/kvm_util.h:14:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:332:
/tmp/next/arm64_kselftest/kselftest/kvm/arm64/psci_test.o] Error 1 In
file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from arm64/vgic_v5.c:5:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
In file included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from include/kvm_util.h:8,
                 from include/arm64/processor.h:10,
                 from include/arm64/gic_v5.h:11,
                 from arm64/vgic_v5.c:8:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:332:
/tmp/next/arm64_kselftest/kselftest/kvm/arm64/vgic_v5.o] Error 1 In file
included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from mmu_stress_test.c:7:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from /tmp/next/arm64_kselftest/usr/include/linux/kvm.h:16,
                 from include/kvm_util.h:14,
                 from mmu_stress_test.c:14:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:332:
/tmp/next/arm64_kselftest/kselftest/kvm/mmu_stress_test.o] Error 1 In
file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from arm64/vgic_init.c:9:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
In file included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from arm64/vgic_init.c:14:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:332:
/tmp/next/arm64_kselftest/kselftest/kvm/arm64/vgic_init.o] Error 1 In
file included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from arm64/debug-exceptions.c:2:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from /tmp/next/arm64_kselftest/usr/include/linux/kvm.h:16,
                 from include/kvm_util.h:14,
                 from arm64/debug-exceptions.c:3:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:332:
/tmp/next/arm64_kselftest/kselftest/kvm/arm64/debug-exceptions.o] Error 1
In file included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from arm64/page_fault_test.c:12:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from /tmp/next/arm64_kselftest/usr/include/linux/kvm.h:16,
                 from include/kvm_util.h:14,
                 from arm64/page_fault_test.c:13:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:332:
/tmp/next/arm64_kselftest/kselftest/kvm/arm64/page_fault_test.o] Error 1
In file included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from include/kvm_util.h:8,
                 from arm64/vpmu_counter_access.c:15:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from /tmp/next/arm64_kselftest/usr/include/linux/kvm.h:16,
                 from include/kvm_util.h:14:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:332:
/tmp/next/arm64_kselftest/kselftest/kvm/arm64/vpmu_counter_access.o]
Error 1 In file included from
/usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from include/kvm_util.h:8,
                 from include/guest_modes.h:5,
                 from lib/arm64/processor.c:11:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from /tmp/next/arm64_kselftest/usr/include/linux/kvm.h:16,
                 from include/kvm_util.h:14:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:347:
/tmp/next/arm64_kselftest/kselftest/kvm/lib/arm64/processor.o] Error 1
In file included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from lib/kvm_util.c:7:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from /tmp/next/arm64_kselftest/usr/include/linux/kvm.h:16,
                 from include/kvm_util.h:14,
                 from lib/kvm_util.c:9:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:347:
/tmp/next/arm64_kselftest/kselftest/kvm/lib/kvm_util.o] Error 1 In file
included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from ../rseq/rseq.c:27,
                 from rseq_test.c:8:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from /tmp/next/arm64_kselftest/usr/include/linux/kvm.h:16,
                 from include/kvm_util.h:14,
                 from rseq_test.c:27:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:332:
/tmp/next/arm64_kselftest/kselftest/kvm/rseq_test.o] Error 1 In file
included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from include/kvm_util.h:8,
                 from arm64/get-reg-list.c:14:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from /tmp/next/arm64_kselftest/usr/include/linux/kvm.h:16,
                 from include/kvm_util.h:14:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:337:
/tmp/next/arm64_kselftest/kselftest/kvm/arm64/get-reg-list.o] Error 1
In file included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from arm64/no-vgic.c:8:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from /tmp/next/arm64_kselftest/usr/include/linux/kvm.h:16,
                 from include/kvm_util.h:14,
                 from arm64/no-vgic.c:9:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:332:
/tmp/next/arm64_kselftest/kselftest/kvm/arm64/no-vgic.o] Error 1 In file
included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from include/kvm_util.h:8,
                 from arm64/at.c:5:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from /tmp/next/arm64_kselftest/usr/include/linux/kvm.h:16,
                 from include/kvm_util.h:14:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32
cc1: note: unrecognized command-line option
'-Wno-gnu-variable-sized-type-not-at-end' may have been intended
to silence earlier diagnostics make[1]: *** [Makefile.kvm:332:
/tmp/next/arm64_kselftest/kselftest/kvm/arm64/at.o] Error 1 In file
included from /usr/include/aarch64-linux-gnu/bits/sigcontext.h:30,
                 from /usr/include/signal.h:301,
                 from include/test_util.h:12,
                 from include/kvm_util.h:8,
                 from arm64/set_id_regs.c:13:
/tmp/next/arm64_kselftest/usr/include/asm/sigcontext.h:81:9: error:
unknown type name '__u128'; did you mean '__u32'?
   81 |         __u128 vregs[32];
      |         ^~~~~~ __u32
In file included from /tmp/next/arm64_kselftest/usr/include/asm/kvm.h:37,
                 from /tmp/next/arm64_kselftest/usr/include/linux/kvm.h:16,
                 from include/kvm_util.h:14:
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:96:9: error: unknown
type name '__u128'; did you mean '__u32'?
   96 |         __u128          vregs[32];
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:261:9: error: unknown
type name '__u128'; did you mean '__u32'?
  261 |         __u128  apiakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:262:9: error: unknown
type name '__u128'; did you mean '__u32'?
  262 |         __u128  apibkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:263:9: error: unknown
type name '__u128'; did you mean '__u32'?
  263 |         __u128  apdakey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:264:9: error: unknown
type name '__u128'; did you mean '__u32'?
  264 |         __u128  apdbkey;
      |         ^~~~~~ __u32
/tmp/next/arm64_kselftest/usr/include/asm/ptrace.h:268:9: error: unknown
type name '__u128'; did you mean '__u32'?
  268 |         __u128  apgakey;
      |         ^~~~~~ __u32

Caused by commit

  9d6306113f921 (arm64: uapi: Use __u128 instead of __uint128_t in UAPI headers)

I have used the tree from next-20260623 instead.

--Sd3StwGWXlpbe5Nd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmo7xkoACgkQJNaLcl1U
h9BaDwf/QP4Eb3m8fyY3oQCrbBxd3Vpar68lIU/QJO5pwN7HM11x3B5Q9zmP2Rye
nUymcxOGX+4Qx1IYD+p0i/GpJ4mt1W0IKBKtgrQqU7Nd2nIJl1rDEtGiz1iWw11P
wj6KccorxstU1LfozfL0wbhJ8y5zgQ5tQK+DsuHFeKtiEp5IBAlI5Aaf6IUfEvqs
kfR5ICIJfIWyBeYk91dyxDyU/uIKOniULdFLYGsHs0xGOQCqWYjOtaQKPbN2UlRY
v5d0wW4BIEQAxNxY6O15bYUiO21mz87lAY/YpR7loo1g1iETxD/4WxpCfnQiWkXZ
w8xVZKhX3GEIOayZQQtX1T3lGFB5Bg==
=iWov
-----END PGP SIGNATURE-----

--Sd3StwGWXlpbe5Nd--
