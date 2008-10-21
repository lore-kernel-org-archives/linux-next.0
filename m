From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the slab tree
Date: Tue, 21 Oct 2008 15:55:10 +1100
Message-ID: <20081021155510.64fcb2b6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43058 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750901AbYJUEzP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 21 Oct 2008 00:55:15 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pekka Enberg <penberg@cs.helsinki.fi>, Christoph Lameter <cl@linux-foundation.org>
Cc: linux-next@vger.kernel.org, Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>, KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>

Hi Pekka, Christoph,

Today's linux-next merge of the slab tree got a trivial conflict in
mm/Makefile between commit 52d4b9ac0b985168009c2a57098324e67bae171f
("memcg: allocate all page_cgroup at boot") from Linus' tree and commit
16c47ef3e86307c58149f417a6fa4925b90c7e9f ("kmemtrace: Core
implementation") from the slab tree.

Just a context change.  I fixed it up (see below).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc mm/Makefile
index c06b45a,7f42d55..0000000
--- a/mm/Makefile
+++ b/mm/Makefile
@@@ -33,4 -33,5 +33,5 @@@ obj-$(CONFIG_FS_XIP) += filemap_xip.
  obj-$(CONFIG_MIGRATION) += migrate.o
  obj-$(CONFIG_SMP) += allocpercpu.o
  obj-$(CONFIG_QUICKLIST) += quicklist.o
 -obj-$(CONFIG_CGROUP_MEM_RES_CTLR) += memcontrol.o
 +obj-$(CONFIG_CGROUP_MEM_RES_CTLR) += memcontrol.o page_cgroup.o
+ obj-$(CONFIG_KMEMTRACE) += kmemtrace.o
