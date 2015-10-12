From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the crypto tree
Date: Mon, 12 Oct 2015 14:24:21 +1100
Message-ID: <20151012142421.2799de5c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45350 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752947AbbJLDYX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 11 Oct 2015 23:24:23 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, tim <tim.c.chen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/x86/Makefile

between commit:

  e38b6b7fcfd1 ("crypto: x86/sha - Add build support for Intel SHA Extensions optimized SHA1 and SHA256")

from the crypto tree and commit:

  7b956f035a9e ("x86/asm: Re-add parts of the manual CFI infrastructure")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/x86/Makefile
index a8009c77918a,2dfaa72260b4..000000000000
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@@ -165,11 -171,9 +171,11 @@@ asinstr += $(call as-instr,pshufb %xmm0
  asinstr += $(call as-instr,crc32l %eax$(comma)%eax,-DCONFIG_AS_CRC32=1)
  avx_instr := $(call as-instr,vxorps %ymm0$(comma)%ymm1$(comma)%ymm2,-DCONFIG_AS_AVX=1)
  avx2_instr :=$(call as-instr,vpbroadcastb %xmm0$(comma)%ymm1,-DCONFIG_AS_AVX2=1)
 +sha1_ni_instr :=$(call as-instr,sha1msg1 %xmm0$(comma)%xmm1,-DCONFIG_AS_SHA1_NI=1)
 +sha256_ni_instr :=$(call as-instr,sha256msg1 %xmm0$(comma)%xmm1,-DCONFIG_AS_SHA256_NI=1)
  
- KBUILD_AFLAGS += $(asinstr) $(avx_instr) $(avx2_instr) $(sha1_ni_instr) $(sha256_ni_instr)
- KBUILD_CFLAGS += $(asinstr) $(avx_instr) $(avx2_instr) $(sha1_ni_instr) $(sha256_ni_instr)
 -KBUILD_AFLAGS += $(cfi) $(cfi-sigframe) $(cfi-sections) $(asinstr) $(avx_instr) $(avx2_instr)
 -KBUILD_CFLAGS += $(cfi) $(cfi-sigframe) $(cfi-sections) $(asinstr) $(avx_instr) $(avx2_instr)
++KBUILD_AFLAGS += $(cfi) $(cfi-sigframe) $(cfi-sections) $(asinstr) $(avx_instr) $(avx2_instr) $(sha1_ni_instr) $(sha256_ni_instr)
++KBUILD_CFLAGS += $(cfi) $(cfi-sigframe) $(cfi-sections) $(asinstr) $(avx_instr) $(avx2_instr) $(sha1_ni_instr) $(sha256_ni_instr)
  
  LDFLAGS := -m elf_$(UTS_MACHINE)
  
