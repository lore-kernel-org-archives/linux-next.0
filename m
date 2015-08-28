From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the nvdimm tree with the v4l-dvb tree
Date: Fri, 28 Aug 2015 16:19:18 +1000
Message-ID: <20150828161918.43e93192@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38919 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750750AbbH1GTT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 28 Aug 2015 02:19:19 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dan Williams <dan.j.williams@intel.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jan Kara <jack@suse.cz>

Hi Dan,

Today's linux-next merge of the nvdimm tree got a conflict in:

  mm/Kconfig

between commit:

  8025e5ddf9c1 ("[media] mm: Provide new get_vaddr_frames() helper")

from the v4l-dvb tree and commit:

  033fbae988fc ("mm: ZONE_DEVICE for "device memory"")

from the nvdimm tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc mm/Kconfig
index 0fb2e96653fe,a0cd086df16b..000000000000
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@@ -649,5 -655,19 +649,22 @@@ config DEFERRED_STRUCT_PAGE_INI
  	  processes running early in the lifetime of the systemm until kswapd
  	  finishes the initialisation.
  
 +config FRAME_VECTOR
 +	bool
++
+ config ZONE_DEVICE
+ 	bool "Device memory (pmem, etc...) hotplug support" if EXPERT
+ 	default !ZONE_DMA
+ 	depends on !ZONE_DMA
+ 	depends on MEMORY_HOTPLUG
+ 	depends on MEMORY_HOTREMOVE
+ 	depends on X86_64 #arch_add_memory() comprehends device memory
+ 
+ 	help
+ 	  Device memory hotplug support allows for establishing pmem,
+ 	  or other device driver discovered memory regions, in the
+ 	  memmap. This allows pfn_to_page() lookups of otherwise
+ 	  "device-physical" addresses which is needed for using a DAX
+ 	  mapping in an O_DIRECT operation, among other things.
+ 
+ 	  If FS_DAX is enabled, then say Y.
