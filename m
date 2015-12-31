From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the nvdimm
 tree
Date: Thu, 31 Dec 2015 21:51:40 +1100
Message-ID: <20151231215140.4905c760@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53231 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751215AbbLaKvm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 31 Dec 2015 05:51:42 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Dan Williams <dan.j.williams@intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andrey Ryabinin <aryabinin@virtuozzo.com>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  lib/Kconfig.debug

between commit:

  96efc4fed452 ("arch: consolidate CONFIG_STRICT_DEVM in lib/Kconfig.debug")

from the nvdimm tree and commit:

  3e138efd477e ("UBSAN: run-time undefined behavior sanity checker")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc lib/Kconfig.debug
index 01be6fcceda2,19f7461e1594..000000000000
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@@ -1886,42 -1860,4 +1893,44 @@@ source "samples/Kconfig
  
  source "lib/Kconfig.kgdb"
  
 +config ARCH_HAS_DEVMEM_IS_ALLOWED
 +	bool
 +
 +config STRICT_DEVMEM
 +	bool "Filter access to /dev/mem"
 +	depends on MMU
 +	depends on ARCH_HAS_DEVMEM_IS_ALLOWED
 +	default y if TILE || PPC
 +	---help---
 +	  If this option is disabled, you allow userspace (root) access to all
 +	  of memory, including kernel and userspace memory. Accidental
 +	  access to this is obviously disastrous, but specific access can
 +	  be used by people debugging the kernel. Note that with PAT support
 +	  enabled, even in this case there are restrictions on /dev/mem
 +	  use due to the cache aliasing requirements.
 +
 +	  If this option is switched on, and IO_STRICT_DEVMEM=n, the /dev/mem
 +	  file only allows userspace access to PCI space and the BIOS code and
 +	  data regions.  This is sufficient for dosemu and X and all common
 +	  users of /dev/mem.
 +
 +	  If in doubt, say Y.
 +
 +config IO_STRICT_DEVMEM
 +	bool "Filter I/O access to /dev/mem"
 +	depends on STRICT_DEVMEM
 +	default STRICT_DEVMEM
 +	---help---
 +	  If this option is disabled, you allow userspace (root) access to all
 +	  io-memory regardless of whether a driver is actively using that
 +	  range.  Accidental access to this is obviously disastrous, but
 +	  specific access can be used by people debugging kernel drivers.
 +
 +	  If this option is switched on, the /dev/mem file only allows
 +	  userspace access to *idle* io-memory ranges (see /proc/iomem) This
 +	  may break traditional users of /dev/mem (dosemu, legacy X, etc...)
 +	  if the driver using a given range cannot be disabled.
 +
 +	  If in doubt, say Y.
++
+ source "lib/Kconfig.ubsan"
