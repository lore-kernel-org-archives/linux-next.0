From: Mauro Carvalho Chehab <mchehab@infradead.org>
Subject: Re: linux-next: manual merge of the v4l-dvb tree
Date: Tue, 28 Oct 2008 09:48:27 -0200
Message-ID: <20081028094827.1c4e4f97@pedra.chehab.org>
References: <20081014182846.d60f2e8b.sfr@canb.auug.org.au>
	<20081027181632.97d18410.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:50612 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752613AbYJ1LsZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 28 Oct 2008 07:48:25 -0400
In-Reply-To: <20081027181632.97d18410.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

Hi Stephen,

On Mon, 27 Oct 2008 18:16:32 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Mauro,
> 
> On Tue, 14 Oct 2008 18:28:46 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the v4l-dvb tree got a lot of conflicts
> > against Linus' tree.  It looks like it has been rebased and has
> > cherry-picked a lot of commits from Linus' tree.  However it got into
> > this state, it needs a major fixup.
> > 
> > I have dropped it for today.
> 
> And continue to do so.  Please clean it up.
> 
> (Just as a reminder, I fetch your "stable" branch.)

I've changed my git procedures on 2.6.27 to avoid having to rebase my tree, but
this works really badly, generating lots of rework for me. So, I had to alter
my procedures again for 2.6.28.

Now, everything is simpler and I hope it will work like a charm.

I've finished those procedures yesterday by preparing my first set of patches
after the end of the merge window, with an independent tree with patches that
aren't just fixes (in the past, this were a branch at the same tree, but this
weren't work fine).

I've just updated today my linux-next tree. I'm now using branch "master" for
V4L/DVB patches. "stable" is now just a copy of your "stable" branch.

I have one doubt about what would work better for you: should I merge also the
patches for the current kernel version, that I intend to send upstream, or it
would be better to just have there the newer patches for the next version?

Anyway, please start pushing from 
 ssh://master.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-next.git master

Cheers,
Mauro
