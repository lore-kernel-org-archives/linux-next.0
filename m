From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: bad commit in the sunxi tree
Date: Thu, 27 Oct 2016 10:42:25 +1100
Message-ID: <20161027104225.4f0f2774@canb.auug.org.au>
References: <20161025092255.3f4f59e2@canb.auug.org.au>
        <20161025094409.hhf5rg3gbzaryjom@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33199 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932642AbcJZXm2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 26 Oct 2016 19:42:28 -0400
In-Reply-To: <20161025094409.hhf5rg3gbzaryjom@lukather>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Maxime,

On Tue, 25 Oct 2016 11:44:09 +0200 Maxime Ripard <maxime.ripard@free-electrons.com> wrote:
>
> On Tue, Oct 25, 2016 at 09:22:55AM +1100, Stephen Rothwell wrote:
> > Hi Maxime,
> > 
> > In today's sunxi tree
> > (git://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git#sunxi/for-next)
> > I noticed that commit
> > 
> >   3861b711f8b5 ("ARM: sun5i: chip: add a node for the w1 gpio controller")
> > 
> > has no Signed-off-by from its committer.  
> 
> Thanks, this has been fixed.
> 
> Just out of curiosity, what command do you run to catch this?

None :-)  I look at the differences in each tree as I fetch it and
just happen to notice some of these sometimes.  I should have a git
hook to check that there is a Signed-off-by for the author and
committer, but I would have to invest some time to figure out how :-)

-- 
Cheers,
Stephen Rothwell
