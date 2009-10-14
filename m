From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] ia64/sn: fix percpu warnings
Date: Wed, 14 Oct 2009 15:10:03 -0700
Message-ID: <20091014151003.0ef42973.randy.dunlap@oracle.com>
References: <20091014163445.f0441473.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet12.oracle.com ([141.146.126.234]:46093 "EHLO
	acsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1762060AbZJNWNn (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 14 Oct 2009 18:13:43 -0400
In-Reply-To: <20091014163445.f0441473.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jes Sorensen <jes@sgi.com>, linux-ia64@vger.kernel.org, Tejun Heo <tj@kernel.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, akpm <akpm@linux-foundation.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix percpu types warning in ia64/sn:

arch/ia64/sn/kernel/setup.c:74: error: conflicting types for '__pcpu_scope___sn_cnodeid_to_nasid'
arch/ia64/include/asm/sn/arch.h:74: error: previous declaration of '__pcpu_scope___sn_cnodeid_to_nasid' was here

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Jes Sorensen <jes@sgi.com>
---
 arch/ia64/include/asm/sn/arch.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20091014.orig/arch/ia64/include/asm/sn/arch.h
+++ linux-next-20091014/arch/ia64/include/asm/sn/arch.h
@@ -71,7 +71,7 @@ DECLARE_PER_CPU(struct sn_hub_info_s, __
  * Compact node ID to nasid mappings kept in the per-cpu data areas of each
  * cpu.
  */
-DECLARE_PER_CPU(short, __sn_cnodeid_to_nasid[MAX_COMPACT_NODES]);
+DECLARE_PER_CPU(short [MAX_COMPACT_NODES], __sn_cnodeid_to_nasid);
 #define sn_cnodeid_to_nasid	(&__get_cpu_var(__sn_cnodeid_to_nasid[0]))
 
 
