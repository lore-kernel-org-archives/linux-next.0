From: Roland Dreier <rdreier@cisco.com>
Subject: [ofa-general] Re: linux-next: [PATCH]
	infiniband/hw/ipath/ipath_sdma.c , fix compiler warnings
Date: Fri, 23 May 2008 10:42:24 -0700
Message-ID: <adave14apdr.fsf@cisco.com>
References: <48342C6C.2010502@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <general-bounces@lists.openfabrics.org>
In-Reply-To: <48342C6C.2010502@googlemail.com> (Gabriel C.'s message of "Wed,
	21 May 2008 16:06:36 +0200")
List-Unsubscribe: <http://lists.openfabrics.org/cgi-bin/mailman/listinfo/general>,
	<mailto:general-request@lists.openfabrics.org?subject=unsubscribe>
List-Archive: <http://lists.openfabrics.org/pipermail/general>
List-Post: <mailto:general@lists.openfabrics.org>
List-Help: <mailto:general-request@lists.openfabrics.org?subject=help>
List-Subscribe: <http://lists.openfabrics.org/cgi-bin/mailman/listinfo/general>,
	<mailto:general-request@lists.openfabrics.org?subject=subscribe>
Sender: general-bounces@lists.openfabrics.org
Errors-To: general-bounces@lists.openfabrics.org
To: Gabriel C <nix.or.die@googlemail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux Kernel list <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, general@lists.openfabrics.org
List-Id: linux-next.vger.kernel.org

 > drivers/infiniband/hw/ipath/ipath_sdma.c: In function 'sdma_abort_task':
 > drivers/infiniband/hw/ipath/ipath_sdma.c:267: warning: passing argument 2 of 'constant_test_bit' from incompatible pointer type

Perhaps the best way to fix these is to change code like

		if (/* ScoreBoardDrainInProg */
		    test_bit(63, &hwstatus) ||
		    /* AbortInProg */
		    test_bit(62, &hwstatus) ||
		    /* InternalSDmaEnable */
		    test_bit(61, &hwstatus) ||
		    /* ScbEmpty */
		    !test_bit(30, &hwstatus)) {

to something like

		if ((hwstatus & (IPATH_SDMA_STATUS_SCORE_BOARD_DRAIN_IN_PROG |
				 IPATH_SDMA_STATUS_ABORT_IN_PROG	     |
				 IPATH_SDMA_STATUS_INTERNAL_SDMA_ENABLE)) ||
		    !(hwstatus & IPATH_SDMA_STATUS_SCB_EMPTY)) {

with appropriate defines for the constants 1ull << 63 etc.

(I think I got the logic correct but someone should check)

 > drivers/infiniband/hw/ipath/ipath_sdma.c:348: warning: format '%016llx' expects type 'long long unsigned int', but argument 3 has type 'long unsigned int'
 > drivers/infiniband/hw/ipath/ipath_sdma.c: In function 'ipath_restart_sdma':
 > drivers/infiniband/hw/ipath/ipath_sdma.c:618: warning: format '%016llx' expects type 'long long unsigned int', but argument 3 has type 'long unsigned int'

I have a fix for this pending; will ask Linus to pull today.
