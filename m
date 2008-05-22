From: tony@bakeyournoodle.com (Tony Breeds)
Subject: Re: linux-next: [PATCH] infiniband/hw/ipath/ipath_sdma.c , fix compiler warnings
Date: Thu, 22 May 2008 10:23:35 +1000
Message-ID: <20080522002335.GG20457@bakeyournoodle.com>
References: <48342C6C.2010502@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pythia.bakeyournoodle.com ([203.82.209.197]:35829 "EHLO
	pythia.bakeyournoodle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757219AbYEVAXh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 21 May 2008 20:23:37 -0400
Content-Disposition: inline
In-Reply-To: <48342C6C.2010502@googlemail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Gabriel C <nix.or.die@googlemail.com>
Cc: rolandd@cisco.com, Linux Kernel list <linux-kernel@vger.kernel.org>, general@lists.openfabrics.org, sean.hefty@intel.com, hal.rosenstock@gmail.com, linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On Wed, May 21, 2008 at 04:06:36PM +0200, Gabriel C wrote:
> On linux-next from today , allmodconfig, I see the following warnings on 64bit:

x86_64 right?

<snip>

> diff --git a/drivers/infiniband/hw/ipath/ipath_sdma.c b/drivers/infiniband/hw/ipath/ipath_sdma.c
> index 3697449..5f80151 100644
> --- a/drivers/infiniband/hw/ipath/ipath_sdma.c
> +++ b/drivers/infiniband/hw/ipath/ipath_sdma.c
> @@ -257,7 +257,7 @@ static void sdma_abort_task(unsigned long opaque)
>  	/* everything is stopped, time to clean up and restart */
>  	if (status == IPATH_SDMA_ABORT_ABORTED) {
>  		struct ipath_sdma_txreq *txp, *txpnext;
> -		u64 hwstatus;
> +		unsigned long hwstatus;
>  		int notify = 0;
>  
>  		hwstatus = ipath_read_kreg64(dd,

This can't be right.  hwstatus needs to be u64, as that's what ipath_read_kreg64() retuns.
and a little bit further down we see:

---
if (/* ScoreBoardDrainInProg */
    test_bit(63, &hwstatus) ||
    /* AbortInProg */
    test_bit(62, &hwstatus) ||
    /* InternalSDmaEnable */
    test_bit(61, &hwstatus) ||
---

so hwstatus, clearly needs to be 64-bits.  This brings up an interesting
point.  test_bit() and co are essntally expecting to be passed the address
of an unsigned long[], so is it correct to pass &u64?

Yours Tony

  linux.conf.au    http://www.marchsouth.org/
  Jan 19 - 24 2009 The Australian Linux Technical Conference!

