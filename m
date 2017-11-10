From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with Linus' tree
Date: Fri, 10 Nov 2017 12:27:50 +1100
Message-ID: <20171110122750.5be92638@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49083 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755317AbdKJB1y (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 9 Nov 2017 20:27:54 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/x86/mm/mem_encrypt.c

between commit:

  87df26175e67 ("x86/mm: Unbreak modules that rely on external PAGE_KERNEL availability")

from Linus' tree and commit:

  606b21d4a649 ("x86/io: Unroll string I/O when SEV is active")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/x86/mm/mem_encrypt.c
index 0286327e65fa,d247c14469de..000000000000
--- a/arch/x86/mm/mem_encrypt.c
+++ b/arch/x86/mm/mem_encrypt.c
@@@ -40,7 -42,11 +42,11 @@@ static char sme_cmdline_off[] __initdat
   * section is later cleared.
   */
  u64 sme_me_mask __section(.data) = 0;
 -EXPORT_SYMBOL_GPL(sme_me_mask);
 +EXPORT_SYMBOL(sme_me_mask);
+ DEFINE_STATIC_KEY_FALSE(sev_enable_key);
+ EXPORT_SYMBOL_GPL(sev_enable_key);
+ 
+ static bool sev_enabled __section(.data);
  
  /* Buffer used for early in-place encryption by BSP, no locking needed */
  static char sme_early_buffer[PAGE_SIZE] __aligned(PAGE_SIZE);
