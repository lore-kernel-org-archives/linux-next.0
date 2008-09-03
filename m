From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the x86 tree
Date: Wed, 3 Sep 2008 10:57:55 +1000
Message-ID: <20080903105755.d70e9f0b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36106 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753715AbYICA6F (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 2 Sep 2008 20:58:05 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Vegard Nossum <vegard.nossum@gmail.com>, David Woodhouse <David.Woodhouse@intel.com>

Hi all,

Today's linux-next merge of the x86 tree got a conflict in
include/asm-x86/statfs.h between commit
e4e2079e475520e02f55f0b225fc044e39a357e0 ("x86_64: Use
<asm-generic/statfs.h>") from the dwmw2 tree and commit
77ef50a522717fa040636ee1017179ceba12ff62 ("x86: consolidate header
guards") from the x86 tree.

Trivial fix (see below).  I can carry it.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc include/asm-x86/statfs.h
index 4c935ca,3f005bc..0000000
--- a/include/asm-x86/statfs.h
+++ b/include/asm-x86/statfs.h
@@@ -1,12 -1,63 +1,12 @@@
- #ifndef _ASM_X86_STATFS_H
- #define _ASM_X86_STATFS_H
+ #ifndef ASM_X86__STATFS_H
+ #define ASM_X86__STATFS_H
  
 -#ifdef __i386__
 -#include <asm-generic/statfs.h>
 -#else
 -
 -#ifndef __KERNEL_STRICT_NAMES
 -
 -#include <linux/types.h>
 -
 -typedef __kernel_fsid_t	fsid_t;
 -
 -#endif
 -
  /*
 - * This is ugly -- we're already 64-bit clean, so just duplicate the
 - * definitions.
 + * We need compat_statfs64 to be packed, because the i386 ABI won't
 + * add padding at the end to bring it to a multiple of 8 bytes, but
 + * the x86_64 ABI will.
   */
 -struct statfs {
 -	long f_type;
 -	long f_bsize;
 -	long f_blocks;
 -	long f_bfree;
 -	long f_bavail;
 -	long f_files;
 -	long f_ffree;
 -	__kernel_fsid_t f_fsid;
 -	long f_namelen;
 -	long f_frsize;
 -	long f_spare[5];
 -};
 -
 -struct statfs64 {
 -	long f_type;
 -	long f_bsize;
 -	long f_blocks;
 -	long f_bfree;
 -	long f_bavail;
 -	long f_files;
 -	long f_ffree;
 -	__kernel_fsid_t f_fsid;
 -	long f_namelen;
 -	long f_frsize;
 -	long f_spare[5];
 -};
 +#define ARCH_PACK_COMPAT_STATFS64 __attribute__((packed,aligned(4)))
  
 -struct compat_statfs64 {
 -	__u32 f_type;
 -	__u32 f_bsize;
 -	__u64 f_blocks;
 -	__u64 f_bfree;
 -	__u64 f_bavail;
 -	__u64 f_files;
 -	__u64 f_ffree;
 -	__kernel_fsid_t f_fsid;
 -	__u32 f_namelen;
 -	__u32 f_frsize;
 -	__u32 f_spare[5];
 -} __attribute__((packed));
 -
 -#endif /* !__i386__ */
 +#include <asm-generic/statfs.h>
- #endif
+ #endif /* ASM_X86__STATFS_H */
