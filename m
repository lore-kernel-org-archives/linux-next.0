From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the vfs tree
Date: Thu, 29 Sep 2016 12:57:53 +1000
Message-ID: <20160929125753.66d921ff@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50723 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751420AbcI2C54 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Sep 2016 22:57:56 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/x86/mm/fault.c

between commit:

  df720ac12fc7 ("exceptions: detritus removal")

from the vfs tree and commit:

  744c193eb9a2 ("x86: Migrate exception table users off module.h and onto extable.h")

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

diff --cc arch/x86/mm/fault.c
index c0413d5541af,4dc13340653e..000000000000
--- a/arch/x86/mm/fault.c
+++ b/arch/x86/mm/fault.c
@@@ -5,7 -5,7 +5,7 @@@
   */
  #include <linux/sched.h>		/* test_thread_flag(), ...	*/
  #include <linux/kdebug.h>		/* oops_begin/end, ...		*/
- #include <linux/module.h>		/* search_exception_tables	*/
 -#include <linux/extable.h>		/* search_exception_table	*/
++#include <linux/extable.h>		/* search_exception_tables	*/
  #include <linux/bootmem.h>		/* max_low_pfn			*/
  #include <linux/kprobes.h>		/* NOKPROBE_SYMBOL, ...		*/
  #include <linux/mmiotrace.h>		/* kmmio_handler, ...		*/
