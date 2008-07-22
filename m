From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH] serial: fix struct uart_info change fallout
Date: Tue, 22 Jul 2008 11:44:36 +0100
Message-ID: <20080722114436.2c13edea@lxorguk.ukuu.org.uk>
References: <20080722102520.ca801ab5.sfr@canb.auug.org.au>
	<20080722025850.0d073a5e@lxorguk.ukuu.org.uk>
	<20080722130152.f115224d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:60958 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751189AbYGVLCn (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 22 Jul 2008 07:02:43 -0400
In-Reply-To: <20080722130152.f115224d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, ppc-dev <linuxppc-dev@ozlabs.org>

> What is your problem with the linux-next tree.  The problem was
> discovered and reported when I first merged the ttydev tree into
> linux-next on July 1.  The fixes were in linux-next on July 2.

Yes .. and ? The clashes kept happening despite that when I was doing the
merges (and going on holiday for a week and trying to sort it out with
limited time and internet access)

Sorry I don't follow your line of discussion at all here ?

> > just going to break the tree again and mean I have to run another set of
> > tests and regressions.
> 
> Please give what until tomorrow?

it - the situation. The patches have all gone to Linus.

Alan
