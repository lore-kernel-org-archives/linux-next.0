From: Ingo Molnar <mingo@elte.hu>
Subject: Re: Request for linux-next inclusion of the voyager tree
Date: Wed, 10 Jun 2009 02:30:55 +0200
Message-ID: <20090610003055.GA26492@elte.hu>
References: <1244477423.4079.228.camel@mulgrave.site> <20090609202130.GA5291@elte.hu> <20090610004126.491508c9@lxorguk.ukuu.org.uk> <20090609235647.GE23846@elte.hu> <alpine.LFD.2.01.0906091702580.6847@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:48196 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751658AbZFJAbO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Jun 2009 20:31:14 -0400
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.01.0906091702580.6847@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, James Bottomley <James.Bottomley@HansenPartnership.com>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org


* Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Wed, 10 Jun 2009, Ingo Molnar wrote:
> 
> > 
> > * Alan Cox <alan@lxorguk.ukuu.org.uk> wrote:
> > 
> > > > This code has been NAK-ed by the x86 maintainers:
> > > > 
> > > >  - Due to the absurd irrelevance of Voyager/x86/Linux hardware
> > > > 
> > > >  - Due to the thousands of lines of of code it adds to arch/x86
> > > >    to support a 486/P5 era piece of hardware
> > > > 
> > > >  - and due to its negative track record of:
> > > > 
> > > >     v2.6.27.0:   Voyager was broken - it did not even build. (!)
> > > >     v2.6.28.0:   Voyager was broken - it did not even build. (!)
> > > >     v2.6.29-rc5: Voyager was broken - it did not even build. (!)
> > > 
> > > So Ingo you are arguing "It didn't work in some releases so we 
> > > want to make it continue not to work by trying to keep the fixes 
> > > out" ?
> > 
> > No. This code is not in Linux right now, and that i see no reason to 
> > put it back, for the (many) reasons outlined.
> 
> Ingo, "absurd irrelevance" is not a reason. If it was, we'd lose 
> about half our filesystems etc.
> 
> Neither is "thousands of lines of code", or "it hasn't always 
> worked". Again, if it was, then we'd have to get rid of just about 
> all drivers out there.
> 
> So give some real reasons. "It's a maintenance nightmare because 
> it does xyz" might be a reason. But then we really need to see the 
> "xyz" part too.
> 
> Alan is definitely right that we're likely to see more of the 
> "non-PC" platforms as x86 tries to do embedded.

That is true, and the whole painful conversion from the build-time 
32-bit sub-arch code to the unified runtime quirk code (which is 
really 'non-PC platform driver' kind of thing) that i did a few 
months ago was partly about that.

I dont dispute that aspect - in fact we merged a rare subarch as 
well.

But Voyager has been the most painful subarchitecture by far - for 
an extended period of time the code didnt even build in its 
defconfig - and it is also the most useless one as well. So it was 
just a token really.

The only action i got from James was when _I_ implemented the 
proper, runtime subarch mechanism and when we actually _removed_ the 
voyager code. Before it James resisted such changes, see this thread 
almost a year ago, in the Nth "voyager breaks the build" discussion, 
where i suggested:

  " btw., any chance to turn it into a quirk space thing? "

  http://lkml.org/lkml/2008/4/21/441

I got no action from James for my technical requests. Right now i 
dont see any guarantee that this wont be repeated, once the code is 
upstream again after meeting some threshold minimally.

Voyager was a painful experience to all x86 maintainers and i'd 
expect pushers and supporters of rarely used code to do such work, 
not maintainers.

Are the quality thresholds i outlined in the previous thread(s) 
unreasonable? They were:

 " If the code is absolutely trouble-free out of tree, for an
   equivalent amount of time (3 kernel releases or so), and gathers
   users/testers/etc., then we might add it, after a thorough
   technical review. "

  http://lkml.org/lkml/2009/4/19/181

Given that there are only two known boxes left (both James's, the 
other one went missing in action somewhere in Brasil), the 'gather 
testers' bit is unreasonable i guess. 'Prove you can stay trouble 
free' is more realistic. Dunno.

See for example what happened in linux-next today: Voyager broke x86 
and didnt even build, and Stephen had to keep it out of today's 
linux-next build.

	Ingo
