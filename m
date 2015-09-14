From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: bad base of the h8300 tree
Date: Tue, 15 Sep 2015 09:10:30 +1000
Message-ID: <20150915091030.13b2a149@canb.auug.org.au>
References: <20150831074304.0ce16f9f@canb.auug.org.au>
	<20150901074033.4282c9c4@canb.auug.org.au>
	<20150914095425.1c6c3470@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55107 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751208AbbINXKd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 14 Sep 2015 19:10:33 -0400
In-Reply-To: <20150914095425.1c6c3470@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Yoshinori,

On Mon, 14 Sep 2015 09:54:25 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> On Tue, 1 Sep 2015 07:40:33 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > On Mon, 31 Aug 2015 07:43:04 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > The h8300 tree today has been based on linux-next.  This cannto work.
> > > Please rebase this onto Linus' tree (or some other stable base).
> > > 
> > > I cannot use your tree in this state, so it will be dropped from
> > > linux-next until it is fixed.  Also, Linus cannot pull it in this state.
> > 
> > And now your tree conatins lots and lots of very old commits that do
> > not even have Signed-off-by tags :-(.  The version I have been using
> > has a HEAD of commit:
> > 
> > 99bcfda85f66 "Revert "asm-generic: {get,put}_user ptr argument evaluate only 1 time""
> > 
> > (which, it turns out" also has no Signed-off-by :-()
> > 
> > Maybe you should reset your tree to that and try to move on from there.
> 
> Can you please clean this up ...

I see it has changed, but it is still not right :-(

Please do "gitk 9751a9e449da..h8300-next" in your tree and look at
it (9751a9e449da is in Linus' tree).  As I suggested above, maybe you
should go back to commit 99bcfda85f66 and work forward from there
(after amending it have a SOB).  Or just start all over with v4.3 ...

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
