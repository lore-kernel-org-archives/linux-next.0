From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Tests tree not submitted?
Date: Mon, 19 May 2008 08:30:27 +0200
Message-ID: <20080519063027.GA17529@uranus.ravnborg.org>
References: <20080519135436.34d6d593.sfr@canb.auug.org.au> <20080519043822.GA3473@in.ibm.com> <20080518220003.5169892a.akpm@linux-foundation.org> <20080519153704.b0c9cb2d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:59324 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753429AbYESG3v (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 19 May 2008 02:29:51 -0400
Content-Disposition: inline
In-Reply-To: <20080519153704.b0c9cb2d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, ananth@in.ibm.com, linux-next@vger.kernel.org

On Mon, May 19, 2008 at 03:37:04PM +1000, Stephen Rothwell wrote:
> Hi Andrew,
> 
> On Sun, 18 May 2008 22:00:03 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:
> >
> > <brief panic>
> > 
> > I don't even know what the "tests" tree _is_.
> > 
> > Searching the past seven weeks lmkl archives for From:.*ananth.* turns
> > up zero hits.
> > 
> > So whatever this thing is, it's waaaaaaaaaaaaaaaaaaaaay too low-profile.
> > 
> > Did you even send Linus a pull request?  I have no record of one.
> > 
> > Secret tree :(
> 
> I don;t have the original pull request in my archive, but I do have an email from Sam Ravnborg dated Feb 19 saying (in part):
> 
> "Hi Anath.
> 
> Linus did not pull this in the -rc1 to -rc2 timeframe
> so please resubmit the patch serie one week into the
> next merge window (when most of the trees has hit linus' tree
> and Andrew has made his first merge).
> 
> IF you need an extra eye balling then you can submit
> a few weeks before the merge window opens.
> Thats typical after an -rc with only a few patches."
> 
> After which Ananth asked me to add it to linux-next and I did on Feb 24.
> 
> So, not a complete secret :-) and a pull request was sent on Feb 12
> (actually by Sam who put this stuff into a git tree for Ananth).  This
> tree (patch set) has not changed since Feb 24 and only has the one simple
> conflict I noted. 

Andrew mumbled about taking these patches via kbuild.it and in order to
avoid that I created a new test.git tree that I then have not given any care since.

Anath - I can update test.git if you send me a new patch-set but otherwise
I cannot do much work on it.
Too busy with other stuff.

	Sam
