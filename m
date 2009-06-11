From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Request for linux-next inclusion of the voyager tree
Date: Thu, 11 Jun 2009 01:39:39 +0000
Message-ID: <1244684380.17432.424.camel@mulgrave.site>
References: <1244477423.4079.228.camel@mulgrave.site>
	 <20090609202130.GA5291@elte.hu>
	 <20090610004126.491508c9@lxorguk.ukuu.org.uk>
	 <20090609235647.GE23846@elte.hu>
	 <alpine.LFD.2.01.0906091702580.6847@localhost.localdomain>
	 <alpine.LFD.2.00.0906101454420.3367@localhost.localdomain>
	 <alpine.LFD.2.01.0906100821540.6847@localhost.localdomain>
	 <20090610153954.GA3464@elte.hu> <1244649759.4109.75.camel@mulgrave.site>
	 <20090610165331.GA31096@elte.hu>
	 <20090611113543.29528bf3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:33234 "EHLO
	bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1761247AbZFKBjn (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 10 Jun 2009 21:39:43 -0400
In-Reply-To: <20090611113543.29528bf3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ingo Molnar <mingo@elte.hu>, Linus Torvalds <torvalds@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Alan Cox <alan@lxorguk.ukuu.org.uk>, "H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org

On Thu, 2009-06-11 at 11:35 +1000, Stephen Rothwell wrote:
> On Wed, 10 Jun 2009 18:53:31 +0200 Ingo Molnar <mingo@elte.hu> wrote:
> >
> > * James Bottomley <James.Bottomley@HansenPartnership.com> wrote:
> > > 
> > > OK, so this is an acceptable compromise for me too.
> > > 
> > > What I think now is needed (from me) are three patch sets:
> > > 
> > > 1. The final subarchitecture cleanups
> > > 2. The quirk model/smp ops additions
> > > 3. The voyager put back.
> > 
> > Yes, that looks fine.
> > 
> > You can have them in a single series for convenience if you want to 
> > (it's probably easier for you to test that way) - but 3 separate 
> > series are fine too, no strong preference either way - as long as 
> > the internal structure and details follows the ordering and 
> > parameters we outlined in previous mails.
> 
> OK, given this looks like a rewrite of the voyager tree, I will drop it
> from linux-next for a while.

Yes, I think that's the correct thing in the circumstances.

Thanks for running it through linux-next; it certainly turned up a
couple of problems I wouldn't have seen otherwise.

James
