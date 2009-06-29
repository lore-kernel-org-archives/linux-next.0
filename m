From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the percpu tree with Linus' tree
Date: Mon, 29 Jun 2009 15:33:29 +1000
Message-ID: <20090629153329.309e0420.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57381 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750725AbZF2Fd3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Jun 2009 01:33:29 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, Christoph Lameter <cl@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>

Hi all,

Today's linux-next merge of the percpu tree got a conflict in
arch/mn10300/kernel/vmlinux.lds.S between commit
2e8b5a09ebf1f98f02c1988a48415e89d4c25168 ("MN10300: Fix the vmlinux
ldscript") from Linus' tree and commit
405d967dc70002991f8fc35c20e0d3cbc7614f63 ("linker script: throw
away .discard section") from the percpu tree.

Just context changes.  I fixed it up (see below) and can carry the fix
for a while.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/mn10300/kernel/vmlinux.lds.S
index c96ba3d,5d9f2f9..0000000
--- a/arch/mn10300/kernel/vmlinux.lds.S
+++ b/arch/mn10300/kernel/vmlinux.lds.S
@@@ -117,7 -145,8 +117,8 @@@ SECTION
  
    /* Sections to be discarded */
    /DISCARD/ : {
 -	*(.exitcall.exit)
 +	EXIT_CALL
+ 	*(.discard)
  	}
  
    STABS_DEBUG
