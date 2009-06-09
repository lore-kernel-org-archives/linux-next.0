From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: Request for linux-next inclusion of the voyager tree
Date: Wed, 10 Jun 2009 00:41:26 +0100
Message-ID: <20090610004126.491508c9@lxorguk.ukuu.org.uk>
References: <1244477423.4079.228.camel@mulgrave.site>
	<20090609202130.GA5291@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:49361 "EHLO
	www.etchedpixels.co.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751230AbZFIXkp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 9 Jun 2009 19:40:45 -0400
In-Reply-To: <20090609202130.GA5291@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

> This code has been NAK-ed by the x86 maintainers:
> 
>  - Due to the absurd irrelevance of Voyager/x86/Linux hardware
> 
>  - Due to the thousands of lines of of code it adds to arch/x86
>    to support a 486/P5 era piece of hardware
> 
>  - and due to its negative track record of:
> 
>     v2.6.27.0:   Voyager was broken - it did not even build. (!)
>     v2.6.28.0:   Voyager was broken - it did not even build. (!)
>     v2.6.29-rc5: Voyager was broken - it did not even build. (!)

So Ingo you are arguing "It didn't work in some releases so we want to
make it continue not to work by trying to keep the fixes out" ?

Sounds pretty dumb to me.

Getting this in -next has to be a good thing given the fact you and James
don't agree on it, because thats the one place any merge collisions can
be fixed and the combined bleeding edge x86 and voyager mods can be seen
together and refined.

I don't think ignoring voyager is useful - separating it out more
probably is. Not-quite-PC hardware is on the way back, and OLPC is just
the beginning so we *need* the mechanisms to support such platforms.

Alan
