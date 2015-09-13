From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: bad base of the h8300 tree
Date: Mon, 14 Sep 2015 09:54:25 +1000
Message-ID: <20150914095425.1c6c3470@canb.auug.org.au>
References: <20150831074304.0ce16f9f@canb.auug.org.au>
	<20150901074033.4282c9c4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39659 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752163AbbIMXy1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 13 Sep 2015 19:54:27 -0400
In-Reply-To: <20150901074033.4282c9c4@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Yoshinori,

On Tue, 1 Sep 2015 07:40:33 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> On Mon, 31 Aug 2015 07:43:04 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > The h8300 tree today has been based on linux-next.  This cannto work.
> > Please rebase this onto Linus' tree (or some other stable base).
> > 
> > I cannot use your tree in this state, so it will be dropped from
> > linux-next until it is fixed.  Also, Linus cannot pull it in this state.
> 
> And now your tree conatins lots and lots of very old commits that do
> not even have Signed-off-by tags :-(.  The version I have been using
> has a HEAD of commit:
> 
> 99bcfda85f66 "Revert "asm-generic: {get,put}_user ptr argument evaluate only 1 time""
> 
> (which, it turns out" also has no Signed-off-by :-()
> 
> Maybe you should reset your tree to that and try to move on from there.

Can you please clean this up ...

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
