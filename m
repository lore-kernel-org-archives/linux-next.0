From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the powerpc tree with Linus' tree
Date: Mon, 2 May 2016 09:50:25 +1000
Message-ID: <20160502095025.562161dd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46298 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750909AbcEAXua (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 1 May 2016 19:50:30 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Anton Blanchard <anton@samba.org>, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>

Hi all,

Today's linux-next merge of the powerpc tree got a conflict in:

  arch/powerpc/kernel/prom.c

between commits:

  beff82374b25 ("powerpc: Update cpu_user_features2 in scan_features()")
  4705e02498d6 ("powerpc: Update TM user feature bits in scan_features()")

from Linus' tree and commit:

  5ddd6bb5968e ("powerpc/mm/radix: Use firmware feature to enable Radix MMU")

from the powerpc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/powerpc/kernel/prom.c
index a15fe1d4e84a,d924cd60fc8e..000000000000
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@@ -153,20 -153,20 +154,21 @@@ static struct ibm_pa_feature 
  	unsigned char	pabit;		/* bit number (big-endian) */
  	unsigned char	invert;		/* if 1, pa bit set => clear feature */
  } ibm_pa_features[] __initdata = {
 -	{0, 0, PPC_FEATURE_HAS_MMU,	0, 0, 0},
 -	{0, 0, PPC_FEATURE_HAS_FPU,	0, 1, 0},
 -	{CPU_FTR_CTRL, 0, 0,		0, 3, 0},
 -	{CPU_FTR_NOEXECUTE, 0, 0,	0, 6, 0},
 -	{CPU_FTR_NODSISRALIGN, 0, 0,	1, 1, 1},
 -	{0, MMU_FTR_CI_LARGE_PAGE, 0,	1, 2, 0},
 -	{CPU_FTR_REAL_LE, PPC_FEATURE_TRUE_LE, 5, 0, 0},
 +	{0, 0, PPC_FEATURE_HAS_MMU, 0,		0, 0, 0},
 +	{0, 0, PPC_FEATURE_HAS_FPU, 0,		0, 1, 0},
 +	{CPU_FTR_CTRL, 0, 0, 0,			0, 3, 0},
 +	{CPU_FTR_NOEXECUTE, 0, 0, 0,		0, 6, 0},
 +	{CPU_FTR_NODSISRALIGN, 0, 0, 0,		1, 1, 1},
 +	{0, MMU_FTR_CI_LARGE_PAGE, 0, 0,		1, 2, 0},
 +	{CPU_FTR_REAL_LE, 0, PPC_FEATURE_TRUE_LE, 0, 5, 0, 0},
  	/*
 -	 * If the kernel doesn't support TM (ie. CONFIG_PPC_TRANSACTIONAL_MEM=n),
 -	 * we don't want to turn on CPU_FTR_TM here, so we use CPU_FTR_TM_COMP
 -	 * which is 0 if the kernel doesn't support TM.
 +	 * If the kernel doesn't support TM (ie CONFIG_PPC_TRANSACTIONAL_MEM=n),
 +	 * we don't want to turn on TM here, so we use the *_COMP versions
 +	 * which are 0 if the kernel doesn't support TM.
  	 */
 -	{CPU_FTR_TM_COMP, 0, 0,		22, 0, 0},
 -	{0, MMU_FTR_RADIX, 0,		40, 0, 0},
 +	{CPU_FTR_TM_COMP, 0, 0,
 +	 PPC_FEATURE2_HTM_COMP|PPC_FEATURE2_HTM_NOSC_COMP, 22, 0, 0},
++	{0, MMU_FTR_RADIX, 0, 0,		40, 0, 0},
  };
  
  static void __init scan_features(unsigned long node, const unsigned char *ftrs,
