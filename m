From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the v4l-dvb
 tree
Date: Tue, 18 Aug 2015 18:44:48 +1000
Message-ID: <20150818184448.439d5c2e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51527 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750950AbbHRIou (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 18 Aug 2015 04:44:50 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jan Kara <jack@suse.cz>, Vladimir Davydov <vdavydov@parallels.com>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  mm/Kconfig

between commit:

  8025e5ddf9c1 ("[media] mm: Provide new get_vaddr_frames() helper")

from the v4l-dvb tree and commit:

  f0b1a174238f ("proc: add kpageidle file")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc mm/Kconfig
index 0fb2e96653fe,01c302547e07..000000000000
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@@ -649,5 -655,14 +649,17 @@@ config DEFERRED_STRUCT_PAGE_INI
  	  processes running early in the lifetime of the systemm until kswapd
  	  finishes the initialisation.
  
 +config FRAME_VECTOR
 +	bool
++
+ config IDLE_PAGE_TRACKING
+ 	bool "Enable idle page tracking"
+ 	depends on SYSFS && MMU
+ 	select PAGE_EXTENSION if !64BIT
+ 	help
+ 	  This feature allows to estimate the amount of user pages that have
+ 	  not been touched during a given period of time. This information can
+ 	  be useful to tune memory cgroup limits and/or for job placement
+ 	  within a compute cluster.
+ 
+ 	  See Documentation/vm/idle_page_tracking.txt for more details.
