From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the arm64
 tree
Date: Mon, 6 Nov 2017 16:33:09 +1100
Message-ID: <20171106163309.6612ffb0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54105 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750715AbdKFFdL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 6 Nov 2017 00:33:11 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, =?UTF-8?B?SsO8cmc=?= Billeter <j@bitron.ch>, Dave Martin <Dave.Martin@arm.com>, Will Deacon <will.deacon@arm.com>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  include/uapi/linux/prctl.h

between commit:

  7582e22038a2 ("arm64/sve: Backend logic for setting the vector length")
  2d2123bc7c7f ("arm64/sve: Add prctl controls for userspace vector length management")

from the arm64 tree and commit:

  4391ebaac0d6 ("prctl: add PR_[GS]ET_PDEATHSIG_PROC")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc include/uapi/linux/prctl.h
index af5f8c2df87a,5e7068e45126..000000000000
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@@ -198,13 -198,8 +198,17 @@@ struct prctl_mm_map 
  # define PR_CAP_AMBIENT_LOWER		3
  # define PR_CAP_AMBIENT_CLEAR_ALL	4
  
+ /* Process-based variant of PDEATHSIG */
+ #define PR_SET_PDEATHSIG_PROC		48
+ #define PR_GET_PDEATHSIG_PROC		49
+ 
 +/* arm64 Scalable Vector Extension controls */
 +/* Flag values must be kept in sync with ptrace NT_ARM_SVE interface */
 +#define PR_SVE_SET_VL			50	/* set task vector length */
 +# define PR_SVE_SET_VL_ONEXEC		(1 << 18) /* defer effect until exec */
 +#define PR_SVE_GET_VL			51	/* get task vector length */
 +/* Bits common to PR_SVE_SET_VL and PR_SVE_GET_VL */
 +# define PR_SVE_VL_LEN_MASK		0xffff
 +# define PR_SVE_VL_INHERIT		(1 << 17) /* inherit across exec */
 +
  #endif /* _LINUX_PRCTL_H */
