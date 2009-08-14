From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: linux-next: ground rules
Date: Fri, 14 Aug 2009 15:19:03 +0000
Message-ID: <1250263143.4021.14.camel@mulgrave.site>
References: <20090814180246.9ac3e78e.sfr@canb.auug.org.au>
	 <1250258173.4021.3.camel@mulgrave.site>
	 <20090815011617.bed3494e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:37801 "EHLO
	bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932508AbZHNPTH (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 14 Aug 2009 11:19:07 -0400
In-Reply-To: <20090815011617.bed3494e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Linus <torvalds@linux-foundation.org>

On Sat, 2009-08-15 at 01:16 +1000, Stephen Rothwell wrote:
> Hi James,
> 
> On Fri, 14 Aug 2009 08:56:13 -0500 James Bottomley <James.Bottomley@HansenPartnership.com> wrote:
> >
> > On Fri, 2009-08-14 at 18:02 +1000, Stephen Rothwell wrote:
> > > 
> > >      * successfully unit tested, and 
> > 
> > The rest are fine, but this one isn't feasible for a driver tree ... I
> > don't have all the hardware, and people will insist on fixing
> > theoretical bugs in drivers we can't test on.
> > 
> > A lot of time, bugs turn up in this code only after it has been on
> > release for several months and the small pool of HW owners actually gets
> > around to testing it.
> > 
> > Additionally, I have to carry patches on trust for HW I'm never likely
> > to see outside someones multi-million dollar lab.
> 
> OK, in the context of linux-next, "successfully unit tested" to me means
> that it doesn't break on "reasonable" builds (i.e. x86(_64) allmodconfig
> or something similar) and probably won't break if someone tries to use
> it.  Clearly, you are correct, you can't test everything.  I guess I just
> want to be able to be justifiably annoyed if my builds break for
> something obvious (which does happen from time to time :-().

OK, so I can do compile tested for almost everything except s390
drivers ...

James
