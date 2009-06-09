From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Request for linux-next inclusion of the voyager tree
Date: Tue, 09 Jun 2009 20:33:32 +0000
Message-ID: <1244579612.12321.128.camel@mulgrave.site>
References: <1244477423.4079.228.camel@mulgrave.site>
	 <20090609202130.GA5291@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:47534 "EHLO
	bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754253AbZFIUdf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 9 Jun 2009 16:33:35 -0400
In-Reply-To: <20090609202130.GA5291@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Tue, 2009-06-09 at 22:21 +0200, Ingo Molnar wrote:
> * James Bottomley <James.Bottomley@HansenPartnership.com> wrote:
> 
> > Could you add this (as a postmerge tree) somewhere after the x86 
> > trees, please (it depends on the auto-x86-next branch).
> > 
> > I'll be sending the pull request for it to Linus somewhere in the 
> > next merge window (probably towards the end) and if he takes it, 
> > linux-next inclusion for a small number of patches it contains 
> > will probably be a recurring feature.
> 
> Sigh.
> 
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
> 
>    [ ... which was the point when we yanked it from the x86 devel 
>      tree. Then you suddenly found interest in it again. But it was 
>      too little, too late. Voyager is irrelevant and we've really 
>      got better things to do than to worry about ancient, completely 
>      irrelevant hardware. ]
> 
> And you were very much aware of its controversial nature and you 
> were aware of the NAK, still you sent this mail to Stephen without 
> Cc:-ing the x86 maintainers or without Cc:-ing lkml.
> 
> You did this on one of the last days of the development window - 
> generally the most impossibly busy days for upstream maintainers who 
> prepare for the next merge window.
> 
> I've Cc:-ed Linus - he might want to overrule our judgement and pull 
> this from you directly or tell us to pull it - but this should be 
> done above board, not below the radar on the last day of the 
> development window.
> 
> I made it quite clear to you why i object to this code, didnt I? See 
> the (long) thread at:
> 
>     http://lkml.org/lkml/2009/4/15/299
> 
> James, it also would have been really honest from you to Cc: us to 
> this mail. I am not pushing SCSI changes into linux-next either, 
> against your NAKs, behind your back. I'd have expected the same of 
> you.
> 
> So i strongly object against this tree being included in linux-next.

Your actual statement was that I should take this to Linus, which I
will.  However, procedurally, I need it through linux-next first before
I can send a pull request, otherwise I'm asking for code which hasn't
been through the usual integration testing to be included, which is
dangerous.

The whole purpose of linux-next is integration testing for code on
upstream track ... whether it actually gets upstream is a different
argument.  You've already made your personal objections to voyager
clear ... you'll likely do so again at the pull request.  However, have
the courtesy to follow the usual process instead of trying to politicise
linux-next into being a pre rejection gate for code you don't like.

James
