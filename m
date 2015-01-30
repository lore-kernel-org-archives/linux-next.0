From: Mel Gorman <mgorman@suse.de>
Subject: [PATCH] mm: remove remaining references to NUMA hinting bits and
 helpers -fix
Date: Fri, 30 Jan 2015 10:04:06 +0000
Message-ID: <20150130100406.GK2395@suse.de>
References: <20150128152412.GX21293@sirena.org.uk>
 <CAPvkgC3OLdf7ZgDfAC5R4wgZDirAZAmY+ZsBLQedpjq+HJHACw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:49909 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753874AbbA3KEL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 30 Jan 2015 05:04:11 -0500
Content-Disposition: inline
In-Reply-To: <CAPvkgC3OLdf7ZgDfAC5R4wgZDirAZAmY+ZsBLQedpjq+HJHACw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Steve Capper <steve.capper@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org

The patch "mm: remove remaining references to NUMA hinting bits and helpers"
was meant to remove NUMA hinting bits and helpers but broke is_swap_pte.
>From the original bug report

	For at least the past couple of days tests of libhugetlbfs have
	been hanging on mustang in the mlock test running ARMv8 defconfig
	with both 32 bit and 64 bit userspace - after the mprotect test
	(the one before it) we get no console output for several hours so
	it appears that the test has deadlocked.  The tail of the log is:

	| find_path (2M: 64):   PASS
	| unlinked_fd (2M: 64): PASS
	| readback (2M: 64):    PASS
	| truncate (2M: 64):    PASS
	| shared (2M: 64):      PASS
	| mprotect (2M: 64):    PASS

This patch should address the problem and is a fix to the mmotm patch
mm-remove-remaining-references-to-numa-hinting-bits-and-helpers.patch

Reported-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Mel Gorman <mgorman@suse.de>
---
 include/linux/swapops.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/swapops.h b/include/linux/swapops.h
index 73ca28070a92..cedf3d3c373f 100644
--- a/include/linux/swapops.h
+++ b/include/linux/swapops.h
@@ -54,7 +54,7 @@ static inline pgoff_t swp_offset(swp_entry_t entry)
 /* check whether a pte points to a swap entry */
 static inline int is_swap_pte(pte_t pte)
 {
-	return !pte_none(pte);
+	return !pte_none(pte) && !pte_present(pte);
 }
 #endif
 
