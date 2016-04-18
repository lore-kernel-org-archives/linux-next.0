From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the livepatching tree with the powerpc
 tree
Date: Mon, 18 Apr 2016 14:27:49 +1000
Message-ID: <20160418142749.3a5910c6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40433 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751358AbcDRE14 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Apr 2016 00:27:56 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jikos@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Axtens <dja@axtens.net>

Hi Jiri,

Today's linux-next merge of the livepatching tree got a conflict in:

  arch/powerpc/kernel/process.c

between commit:

  7f92bc569455 ("powerpc: sparse: Include headers for __weak symbols")

from the powerpc tree and commit:

  5d31a96e6c01 ("powerpc/livepatch: Add livepatch stack to struct thread_info")

from the livepatching tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/powerpc/kernel/process.c
index 4695088e7dd2,a290ee374aa0..000000000000
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@@ -56,7 -55,8 +56,9 @@@
  #include <asm/firmware.h>
  #endif
  #include <asm/code-patching.h>
 +#include <asm/exec.h>
+ #include <asm/livepatch.h>
+ 
  #include <linux/kprobes.h>
  #include <linux/kdebug.h>
  
