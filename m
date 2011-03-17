From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tile tree with Linus' tree
Date: Fri, 18 Mar 2011 10:34:44 +1100
Message-ID: <20110318103444.f3ff064e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52198 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755182Ab1CQXer (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 17 Mar 2011 19:34:47 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Chris Metcalf <cmetcalf@tilera.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>

Hi Chris,

Today's linux-next merge of the tile tree got a conflict in
arch/tile/kernel/vmlinux.lds.S between commit 19df0c2fef01 ("percpu:
align percpu readmostly subsection to cacheline") from Linus' tree and
commit 2cb82400719e ("arch/tile: catch up with section naming convention
in 2.6.35") from the tile tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/tile/kernel/vmlinux.lds.S
index c6ce378,4e211c1..0000000
--- a/arch/tile/kernel/vmlinux.lds.S
+++ b/arch/tile/kernel/vmlinux.lds.S
@@@ -59,11 -59,8 +59,8 @@@ SECTION
  
    . = ALIGN(PAGE_SIZE);
    VMLINUX_SYMBOL(_sinitdata) = .;
-   .init.page : AT (ADDR(.init.page) - LOAD_OFFSET) {
-     *(.init.page)
-   } :data =0
-   INIT_DATA_SECTION(16)
+   INIT_DATA_SECTION(16) :data =0
 -  PERCPU(PAGE_SIZE)
 +  PERCPU(L2_CACHE_BYTES, PAGE_SIZE)
    . = ALIGN(PAGE_SIZE);
    VMLINUX_SYMBOL(_einitdata) = .;
  
