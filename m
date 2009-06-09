From: Ingo Molnar <mingo@elte.hu>
Subject: Re: Request for linux-next inclusion of the voyager tree
Date: Tue, 9 Jun 2009 22:21:30 +0200
Message-ID: <20090609202130.GA5291@elte.hu>
References: <1244477423.4079.228.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:39558 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750885AbZFIUVo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Jun 2009 16:21:44 -0400
Content-Disposition: inline
In-Reply-To: <1244477423.4079.228.camel@mulgrave.site>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Linus Torvalds <torvalds@linux-foundation.org>, Andre
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org


* James Bottomley <James.Bottomley@HansenPartnership.com> wrote:

> Could you add this (as a postmerge tree) somewhere after the x86 
> trees, please (it depends on the auto-x86-next branch).
> 
> I'll be sending the pull request for it to Linus somewhere in the 
> next merge window (probably towards the end) and if he takes it, 
> linux-next inclusion for a small number of patches it contains 
> will probably be a recurring feature.

Sigh.

This code has been NAK-ed by the x86 maintainers:

 - Due to the absurd irrelevance of Voyager/x86/Linux hardware

 - Due to the thousands of lines of of code it adds to arch/x86
   to support a 486/P5 era piece of hardware

 - and due to its negative track record of:

    v2.6.27.0:   Voyager was broken - it did not even build. (!)
    v2.6.28.0:   Voyager was broken - it did not even build. (!)
    v2.6.29-rc5: Voyager was broken - it did not even build. (!)

   [ ... which was the point when we yanked it from the x86 devel 
     tree. Then you suddenly found interest in it again. But it was 
     too little, too late. Voyager is irrelevant and we've really 
     got better things to do than to worry about ancient, completely 
     irrelevant hardware. ]

And you were very much aware of its controversial nature and you 
were aware of the NAK, still you sent this mail to Stephen without 
Cc:-ing the x86 maintainers or without Cc:-ing lkml.

You did this on one of the last days of the development window - 
generally the most impossibly busy days for upstream maintainers who 
prepare for the next merge window.

I've Cc:-ed Linus - he might want to overrule our judgement and pull 
this from you directly or tell us to pull it - but this should be 
done above board, not below the radar on the last day of the 
development window.

I made it quite clear to you why i object to this code, didnt I? See 
the (long) thread at:

    http://lkml.org/lkml/2009/4/15/299

James, it also would have been really honest from you to Cc: us to 
this mail. I am not pushing SCSI changes into linux-next either, 
against your NAKs, behind your back. I'd have expected the same of 
you.

So i strongly object against this tree being included in linux-next.

Thanks,

	Ingo
