From: "Gabriel C" <nix.or.die@googlemail.com>
Subject: Re: linux-next: [PATCH] infiniband/hw/ipath/ipath_sdma.c , fix compiler warnings
Date: Thu, 22 May 2008 04:39:16 +0200
Message-ID: <1820d69d0805211939u7476ead9pe17946f5d4ee7248@mail.gmail.com>
References: <48342C6C.2010502@googlemail.com>
	 <20080522002335.GG20457@bakeyournoodle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.224]:30371 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755581AbYEVCjR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 21 May 2008 22:39:17 -0400
Received: by rv-out-0506.google.com with SMTP id l9so2988157rvb.1
        for <linux-next@vger.kernel.org>; Wed, 21 May 2008 19:39:16 -0700 (PDT)
In-Reply-To: <20080522002335.GG20457@bakeyournoodle.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tony Breeds <tony@bakeyournoodle.com>
Cc: rolandd@cisco.com, Linux Kernel list <linux-kernel@vger.kernel.org>, general@lists.openfabrics.org, sean.hefty@intel.com, hal.rosenstock@gmail.com, linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

2008/5/22 Tony Breeds <tony@bakeyournoodle.com>:
>
> On Wed, May 21, 2008 at 04:06:36PM +0200, Gabriel C wrote:
> > On linux-next from today , allmodconfig, I see the following warnings on 64bit:
>
> x86_64 right?
>
> <snip>
>
> > diff --git a/drivers/infiniband/hw/ipath/ipath_sdma.c b/drivers/infiniband/hw/ipath/ipath_sdma.c
> > index 3697449..5f80151 100644
> > --- a/drivers/infiniband/hw/ipath/ipath_sdma.c
> > +++ b/drivers/infiniband/hw/ipath/ipath_sdma.c
> > @@ -257,7 +257,7 @@ static void sdma_abort_task(unsigned long opaque)
> >       /* everything is stopped, time to clean up and restart */
> >       if (status == IPATH_SDMA_ABORT_ABORTED) {
> >               struct ipath_sdma_txreq *txp, *txpnext;
> > -             u64 hwstatus;
> > +             unsigned long hwstatus;
> >               int notify = 0;
> >
> >               hwstatus = ipath_read_kreg64(dd,
>
> This can't be right.  hwstatus needs to be u64, as that's what ipath_read_kreg64() retuns.
> and a little bit further down we see:
>
> ---
> if (/* ScoreBoardDrainInProg */
>    test_bit(63, &hwstatus) ||
>    /* AbortInProg */
>    test_bit(62, &hwstatus) ||
>    /* InternalSDmaEnable */
>    test_bit(61, &hwstatus) ||
> ---
>
> so hwstatus, clearly needs to be 64-bits.

Hmm , right it need be 64-bits.

I should drink my coffee first and read code more carefully
before sending out wrong patches , sorry.

> This brings up an interesting point.  test_bit() and co are
> essntally expecting to be passed the address
> of an unsigned long[], so is it correct to pass &u64?

I'm not sure about this one.

>
> Yours Tony
>

Gabriel
