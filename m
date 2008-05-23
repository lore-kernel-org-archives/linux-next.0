From: Ralph Campbell <ralph.campbell@qlogic.com>
Subject: Re: [ofa-general] Re: linux-next: [PATCH]
	infiniband/hw/ipath/ipath_sdma.c , fix compiler warnings
Date: Fri, 23 May 2008 14:45:01 -0700
Message-ID: <1211579101.3949.326.camel@brick.pathscale.com>
References: <48342C6C.2010502@googlemail.com>  <adave14apdr.fsf@cisco.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <general-bounces@lists.openfabrics.org>
In-Reply-To: <adave14apdr.fsf@cisco.com>
List-Unsubscribe: <http://lists.openfabrics.org/cgi-bin/mailman/listinfo/general>,
	<mailto:general-request@lists.openfabrics.org?subject=unsubscribe>
List-Archive: <http://lists.openfabrics.org/pipermail/general>
List-Post: <mailto:general@lists.openfabrics.org>
List-Help: <mailto:general-request@lists.openfabrics.org?subject=help>
List-Subscribe: <http://lists.openfabrics.org/cgi-bin/mailman/listinfo/general>,
	<mailto:general-request@lists.openfabrics.org?subject=subscribe>
Sender: general-bounces@lists.openfabrics.org
Errors-To: general-bounces@lists.openfabrics.org
To: Roland Dreier <rdreier@cisco.com>
Cc: Gabriel C <nix.or.die@googlemail.com>, linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, general@lists.openfabrics.org, Linux Kernel list <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

This looks good to me.

On Fri, 2008-05-23 at 10:42 -0700, Roland Dreier wrote:
>  > drivers/infiniband/hw/ipath/ipath_sdma.c: In function 'sdma_abort_task':
>  > drivers/infiniband/hw/ipath/ipath_sdma.c:267: warning: passing argument 2 of 'constant_test_bit' from incompatible pointer type
> 
> Perhaps the best way to fix these is to change code like
> 
> 		if (/* ScoreBoardDrainInProg */
> 		    test_bit(63, &hwstatus) ||
> 		    /* AbortInProg */
> 		    test_bit(62, &hwstatus) ||
> 		    /* InternalSDmaEnable */
> 		    test_bit(61, &hwstatus) ||
> 		    /* ScbEmpty */
> 		    !test_bit(30, &hwstatus)) {
> 
> to something like
> 
> 		if ((hwstatus & (IPATH_SDMA_STATUS_SCORE_BOARD_DRAIN_IN_PROG |
> 				 IPATH_SDMA_STATUS_ABORT_IN_PROG	     |
> 				 IPATH_SDMA_STATUS_INTERNAL_SDMA_ENABLE)) ||
> 		    !(hwstatus & IPATH_SDMA_STATUS_SCB_EMPTY)) {
> 
> with appropriate defines for the constants 1ull << 63 etc.
> 
> (I think I got the logic correct but someone should check)
> 
>  > drivers/infiniband/hw/ipath/ipath_sdma.c:348: warning: format '%016llx' expects type 'long long unsigned int', but argument 3 has type 'long unsigned int'
>  > drivers/infiniband/hw/ipath/ipath_sdma.c: In function 'ipath_restart_sdma':
>  > drivers/infiniband/hw/ipath/ipath_sdma.c:618: warning: format '%016llx' expects type 'long long unsigned int', but argument 3 has type 'long unsigned int'
> 
> I have a fix for this pending; will ask Linus to pull today.
> _______________________________________________
> general mailing list
> general@lists.openfabrics.org
> http://lists.openfabrics.org/cgi-bin/mailman/listinfo/general
> 
> To unsubscribe, please visit http://openib.org/mailman/listinfo/openib-general
