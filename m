From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the kspp tree
Date: Fri, 17 Feb 2017 12:51:45 +1100
Message-ID: <20170217125145.28ebd5d9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55331 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754856AbdBQBvs (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 16 Feb 2017 20:51:48 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Kees Cook <keescook@google.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Laura Abbott <labbott@redhat.com>

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/x86/Kconfig.debug

between commit:

  ad21fc4faa2a ("arch: Move CONFIG_DEBUG_RODATA and CONFIG_SET_MODULE_RONX to be common")

from the kspp tree and commit:

  3ad38ceb2769 ("x86/mm: Remove CONFIG_DEBUG_NX_TEST")

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

diff --cc arch/x86/Kconfig.debug
index 69cdd0b2176b,783099f2ac72..000000000000
--- a/arch/x86/Kconfig.debug
+++ b/arch/x86/Kconfig.debug
@@@ -109,14 -109,17 +109,6 @@@ config DEBUG_W
  
  	  If in doubt, say "Y".
  
- config DEBUG_NX_TEST
- 	tristate "Testcase for the NX non-executable stack feature"
- 	depends on DEBUG_KERNEL && m
 -config DEBUG_SET_MODULE_RONX
 -	bool "Set loadable kernel module data as NX and text as RO"
 -	depends on MODULES
--	---help---
- 	  This option enables a testcase for the CPU NX capability
- 	  and the software setup of this feature.
- 	  If in doubt, say "N"
 -	  This option helps catch unintended modifications to loadable
 -	  kernel module's text and read-only data. It also prevents execution
 -	  of module data. Such protection may interfere with run-time code
 -	  patching and dynamic kernel tracing - and they might also protect
 -	  against certain classes of kernel exploits.
 -	  If in doubt, say "N".
--
  config DOUBLEFAULT
  	default y
  	bool "Enable doublefault exception handler" if EXPERT
