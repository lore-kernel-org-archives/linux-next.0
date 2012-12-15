From: Arvind R <arvino55@gmail.com>
Subject: [PATCH 3.7.0 0/9] i82975x_edac: driver cleanup
Date: Sun, 16 Dec 2012 02:07:51 +0530
Message-ID: <CAA_L+UNJ_zSaCvtvWSa_BriU9UYYPomWNXdGKOsoLPG6hTN=QA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-edac@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Subject: [PATCH 3.7.0 0/9] i82975x_edac: driver cleanup

This patchset cleans up the accumulated mess the driver has become.
Currently, it does not crash, but serves no other purpose. This patch-set
gets it to print correct DIMM labels on errors, and sync with the core
w.r.t memory layout.

It consists of 9 patches as follows:
	1. fix style errors:
	    clean up the source w.r.t. long lines

	2. fix layers initialisation:
		the wrong initialisation caused the fatal 3.6 crash that has been
		temporarily fixed. The csrow_init func did not handle rows
		exceeding 8 in number.
		This patch sets channels as 1 or 2 and chip_select accordingly, so
		that there are always 8 ranks of memory.

	3. cleanup debug code:
		Remove / modify debug levels to sane values. Fixes log flooding when
		CONFIG_EDAC_DEBUG set.
		Move local ifdef debug code to print DRAM settings into
		CONFIG_EDAC_DEBUG section.

	4. remove unnecessary function:
		function returning a constant DEV_X8 value and used only once, removed.
	
	5. optimise mode detection:
		dual_channel_active now returns bool. With minor optimisations.

	6. unmap pcibar after init:
		remove the unused iomapped mch_window in private data structure; and
		unmap the window after initialisation. Now that __devinit is deprecated,
		this is needed.

	7. correct dimm label initialisation:
		fix dimm labels to correspond to mobo legends. Assumes 2 ranks per DIMM
		and DIMMS not spanning channels - as it is on Asus P5WDG2 family at least.
		Currently, the label bears no correspondance to mobo legends.

	8. fix wrong offset reported:
		fixes the sometimes greate than PAGESIZE offset reporting caused by mixup
		of grain-size and grain-shift.

	9. set SW-SCRUB mode and bump revision:
		With the error address being correct in the core's view,
		enable SCRUB_SW_SRC so CEs can be written back.
		And update driver revision.

Signed-off-by: Arvind R. <arvino55@gmail.com>
---
Total changes:
 i82975x_edac.c |  349 +++++++++++++++++++++---------------------
  1 file changed, 175 insertions(+), 174 deletions(-)
