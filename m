From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with Linus' tree
Date: Tue, 6 Oct 2015 16:46:01 +1100
Message-ID: <20151006164601.3d96d7a4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49868 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750812AbbJFFqD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 6 Oct 2015 01:46:03 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Eric B Munson <emunson@akamai.com>, Ralf Baechle <ralf@linux-mips.org>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got conflicts in:

  arch/mips/include/uapi/asm/unistd.h
  arch/mips/kernel/scall32-o32.S
  arch/mips/kernel/scall64-n32.S
  arch/mips/kernel/scall64-64.S
  arch/mips/kernel/scall64-o32.S

between commit:

  96fc7a9cee67 ("MIPS: Wire up userfaultfd and membarrier syscalls.")

from Linus' tree and commit:

  4f9b011b10e7 ("mips: add entry for new mlock2 syscall")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/mips/include/uapi/asm/unistd.h
index cfabadb135d9,d0bdfaa13ee9..000000000000
--- a/arch/mips/include/uapi/asm/unistd.h
+++ b/arch/mips/include/uapi/asm/unistd.h
@@@ -377,18 -377,17 +377,19 @@@
  #define __NR_memfd_create		(__NR_Linux + 354)
  #define __NR_bpf			(__NR_Linux + 355)
  #define __NR_execveat			(__NR_Linux + 356)
 -#define __NR_mlock2			(__NR_Linux + 357)
 +#define __NR_userfaultfd		(__NR_Linux + 357)
 +#define __NR_membarrier			(__NR_Linux + 358)
++#define __NR_mlock2			(__NR_Linux + 359)
  
  /*
   * Offset of the last Linux o32 flavoured syscall
   */
- #define __NR_Linux_syscalls		358
 -#define __NR_Linux_syscalls		357
++#define __NR_Linux_syscalls		359
  
  #endif /* _MIPS_SIM == _MIPS_SIM_ABI32 */
  
  #define __NR_O32_Linux			4000
- #define __NR_O32_Linux_syscalls		358
 -#define __NR_O32_Linux_syscalls		357
++#define __NR_O32_Linux_syscalls		359
  
  #if _MIPS_SIM == _MIPS_SIM_ABI64
  
@@@ -713,18 -712,17 +714,19 @@@
  #define __NR_memfd_create		(__NR_Linux + 314)
  #define __NR_bpf			(__NR_Linux + 315)
  #define __NR_execveat			(__NR_Linux + 316)
 -#define __NR_mlock2			(__NR_Linux + 317)
 +#define __NR_userfaultfd		(__NR_Linux + 317)
 +#define __NR_membarrier			(__NR_Linux + 318)
++#define __NR_mlock2			(__NR_Linux + 319)
  
  /*
   * Offset of the last Linux 64-bit flavoured syscall
   */
- #define __NR_Linux_syscalls		318
 -#define __NR_Linux_syscalls		317
++#define __NR_Linux_syscalls		319
  
  #endif /* _MIPS_SIM == _MIPS_SIM_ABI64 */
  
  #define __NR_64_Linux			5000
- #define __NR_64_Linux_syscalls		318
 -#define __NR_64_Linux_syscalls		317
++#define __NR_64_Linux_syscalls		319
  
  #if _MIPS_SIM == _MIPS_SIM_NABI32
  
@@@ -1053,17 -1051,16 +1055,18 @@@
  #define __NR_memfd_create		(__NR_Linux + 318)
  #define __NR_bpf			(__NR_Linux + 319)
  #define __NR_execveat			(__NR_Linux + 320)
 -#define __NR_mlock2			(__NR_Linux + 321)
 +#define __NR_userfaultfd		(__NR_Linux + 321)
 +#define __NR_membarrier			(__NR_Linux + 322)
++#define __NR_mlock2			(__NR_Linux + 323)
  
  /*
   * Offset of the last N32 flavoured syscall
   */
- #define __NR_Linux_syscalls		322
 -#define __NR_Linux_syscalls		321
++#define __NR_Linux_syscalls		323
  
  #endif /* _MIPS_SIM == _MIPS_SIM_NABI32 */
  
  #define __NR_N32_Linux			6000
- #define __NR_N32_Linux_syscalls		322
 -#define __NR_N32_Linux_syscalls		321
++#define __NR_N32_Linux_syscalls		323
  
  #endif /* _UAPI_ASM_UNISTD_H */
diff --cc arch/mips/kernel/scall32-o32.S
index 65a74e4f0f45,b0b377aa1d5d..000000000000
--- a/arch/mips/kernel/scall32-o32.S
+++ b/arch/mips/kernel/scall32-o32.S
@@@ -592,5 -599,4 +592,6 @@@ EXPORT(sys_call_table
  	PTR	sys_memfd_create
  	PTR	sys_bpf				/* 4355 */
  	PTR	sys_execveat
 +	PTR	sys_userfaultfd
 +	PTR	sys_membarrier
+ 	PTR	sys_mlock2
diff --cc arch/mips/kernel/scall64-64.S
index e732981cf99f,f12eb03c0961..000000000000
--- a/arch/mips/kernel/scall64-64.S
+++ b/arch/mips/kernel/scall64-64.S
@@@ -430,6 -436,5 +430,7 @@@ EXPORT(sys_call_table
  	PTR	sys_memfd_create
  	PTR	sys_bpf				/* 5315 */
  	PTR	sys_execveat
 +	PTR	sys_userfaultfd
 +	PTR	sys_membarrier
+ 	PTR	sys_mlock2
  	.size	sys_call_table,.-sys_call_table
diff --cc arch/mips/kernel/scall64-n32.S
index c79484397584,ecdd65a2b02c..000000000000
--- a/arch/mips/kernel/scall64-n32.S
+++ b/arch/mips/kernel/scall64-n32.S
@@@ -420,6 -429,5 +420,7 @@@ EXPORT(sysn32_call_table
  	PTR	sys_memfd_create
  	PTR	sys_bpf
  	PTR	compat_sys_execveat		/* 6320 */
 +	PTR	sys_userfaultfd
 +	PTR	sys_membarrier
+ 	PTR	sys_mlock2
  	.size	sysn32_call_table,.-sysn32_call_table
diff --cc arch/mips/kernel/scall64-o32.S
index 6369cfd390c6,7a8b2dff16d3..000000000000
--- a/arch/mips/kernel/scall64-o32.S
+++ b/arch/mips/kernel/scall64-o32.S
@@@ -575,6 -584,5 +575,7 @@@ EXPORT(sys32_call_table
  	PTR	sys_memfd_create
  	PTR	sys_bpf				/* 4355 */
  	PTR	compat_sys_execveat
 +	PTR	sys_userfaultfd
 +	PTR	sys_membarrier
+ 	PTR	sys_mlock2
  	.size	sys32_call_table,.-sys32_call_table
