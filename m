From: Ingo Molnar <mingo@elte.hu>
Subject: Re: Request for linux-next inclusion of the voyager tree
Date: Wed, 10 Jun 2009 01:56:47 +0200
Message-ID: <20090609235647.GE23846@elte.hu>
References: <1244477423.4079.228.camel@mulgrave.site> <20090609202130.GA5291@elte.hu> <20090610004126.491508c9@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:40208 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752108AbZFIX5E (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Jun 2009 19:57:04 -0400
Content-Disposition: inline
In-Reply-To: <20090610004126.491508c9@lxorguk.ukuu.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org


* Alan Cox <alan@lxorguk.ukuu.org.uk> wrote:

> > This code has been NAK-ed by the x86 maintainers:
> > 
> >  - Due to the absurd irrelevance of Voyager/x86/Linux hardware
> > 
> >  - Due to the thousands of lines of of code it adds to arch/x86
> >    to support a 486/P5 era piece of hardware
> > 
> >  - and due to its negative track record of:
> > 
> >     v2.6.27.0:   Voyager was broken - it did not even build. (!)
> >     v2.6.28.0:   Voyager was broken - it did not even build. (!)
> >     v2.6.29-rc5: Voyager was broken - it did not even build. (!)
> 
> So Ingo you are arguing "It didn't work in some releases so we 
> want to make it continue not to work by trying to keep the fixes 
> out" ?

No. This code is not in Linux right now, and that i see no reason to 
put it back, for the (many) reasons outlined.

	Ingo
