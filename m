From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: is the weeks before -rc1 the time to really be working on
 -next?
Date: Wed, 15 Oct 2008 23:36:07 +0100
Message-ID: <20081015233607.54c1d6b8@lxorguk.ukuu.org.uk>
References: <20081015174015.GB8663@kroah.com>
	<20081015145606.2af3baf1.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:35525 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753109AbYJOWgZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 15 Oct 2008 18:36:25 -0400
In-Reply-To: <20081015145606.2af3baf1.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Greg KH <greg@kroah.com>, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

> first.  So everyone who has been changing stuff which is outside their
> area of responsibility and breaking other people's stuff would get to
> see the consequences of their actions instead of Stephen and I bearing
> the brunt of it all the time.
> 
> 
> I fear we've reached the stage now where people are merrily merging
> bright-and-shiny things into their local trees without giving much
> thought at all to the consequences for others.

Its not that simple. There are areas where the tree divides don't fit the
coding divides. ttydev was horribly entwined with USB and there really
wasn't a way to break that up at the time in question. Because -next
tries to assemble all the trees based on Linus tree it can't cope with
that case well at all and in fact there was some neccessary rule bending
to make next work out where some of the ttydev work was done with ttydev
on top of other subtrees.

So at times it would be very helpful with -next to be able to do limited
tree ordering. If I could have flagged tty as requiring USB first for
example there would have been a lot less pain involved.

Alan
