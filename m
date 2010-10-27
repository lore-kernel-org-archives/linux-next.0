From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the xen tree with Linus' tree
Date: Wed, 27 Oct 2010 12:00:54 +1100
Message-ID: <20101027120054.249d1df5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38073 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1760755Ab0J0BBC (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 26 Oct 2010 21:01:02 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jeremy Fitzhardinge <jeremy@goop.org>, Xen Devel <Xen-devel@lists.xensource.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi all,

Today's linux-next merge of the xen tree got a conflict in
arch/x86/xen/mmu.c between commit
fef5ba797991f9335bcfc295942b684f9bf613a1 ("xen: Cope with unmapped pages
when initializing kernel pagetable") from Linus' tree and commit
41f2e4771a4f1ba26c35438daf32917b9ef7858d ("xen: add support for PAT")
from the xen tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/x86/xen/mmu.c
index f72d18c,6ba8f8a..0000000
--- a/arch/x86/xen/mmu.c
+++ b/arch/x86/xen/mmu.c
@@@ -56,7 -55,7 +56,8 @@@
  #include <asm/e820.h>
  #include <asm/linkage.h>
  #include <asm/page.h>
 +#include <asm/init.h>
+ #include <asm/pat.h>
  
  #include <asm/xen/hypercall.h>
  #include <asm/xen/hypervisor.h>
