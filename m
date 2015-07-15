From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: please include init-v4.1-rc6 branch for v4.2
Date: Wed, 15 Jul 2015 16:59:03 -0400
Message-ID: <20150715205903.GB26147@windriver.com>
References: <20150602232318.GI29898@windriver.com>
 <20150603133904.5d8b0bfb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:65363 "EHLO
	mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753439AbbGOU7J convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 15 Jul 2015 16:59:09 -0400
Content-Disposition: inline
In-Reply-To: <20150603133904.5d8b0bfb@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

[Re: [linux-next] please include init-v4.1-rc6 branch for v4.2] On 03/06/2015 (Wed 13:39) Stephen Rothwell wrote:

> Hi Paul,
> 
> On Tue, 2 Jun 2015 19:23:18 -0400 Paul Gortmaker <paul.gortmaker@windriver.com> wrote:
> >
> > Please include init-v4.1-rc6 branch of:
> > 	git://git.kernel.org/pub/scm/linux/kernel/git/paulg/linux.git
> 
> OK, I will add it in just before I merge Andrew's tree and see how it
> goes.
> 

[...]

> 
> > Assuming I can get Linus to pull the chunks this time, it should be a
> > one shot (one version) tree from a linux-next point of view.
> 
> If he takes it, please remind me to remove the tree.

As of today, the final commit from this tree is merged, so it can be removed.

Thanks again for access to the increased test coverage on all of this.

Paul.
--

> 
> Thanks for adding your subsystem tree as a participant of linux-next.  As
> you may know, this is not a judgment of your code.  The purpose of
> linux-next is for integration testing and to lower the impact of
> conflicts between subsystems in the next merge window. 
> 
> You will need to ensure that the patches/commits in your tree/series have
> been:
>      * submitted under GPL v2 (or later) and include the Contributor's
>         Signed-off-by,
>      * posted to the relevant mailing list,
>      * reviewed by you (or another maintainer of your subsystem tree),
>      * successfully unit tested, and 
>      * destined for the current or next Linux merge window.
> 
> Basically, this should be just what you would send to Linus (or ask him
> to fetch).  It is allowed to be rebased if you deem it necessary.
> 
> -- 
> Cheers,
> Stephen Rothwell 
> sfr@canb.auug.org.au
