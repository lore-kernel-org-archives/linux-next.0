From: Peter Chen <peter.chen@freescale.com>
Subject: Re: Apply for adding my tree for linux-next
Date: Mon, 2 Nov 2015 17:44:56 +0800
Message-ID: <20151102094455.GC5464@shlinux2>
References: <20151022025150.GA16895@shlinux2>
 <20151101092546.093cddfe@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bn1on0119.outbound.protection.outlook.com ([157.56.110.119]:58534
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751014AbbKBJqt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 Nov 2015 04:46:49 -0500
Content-Disposition: inline
In-Reply-To: <20151101092546.093cddfe@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Greg KH <greg@kroah.com>

On Sun, Nov 01, 2015 at 09:25:46AM +1100, Stephen Rothwell wrote:
> Hi Peter,
> 
> On Thu, 22 Oct 2015 10:51:51 +0800 Peter Chen <peter.chen@freescale.com> wrote:
> >
> > Would you please help adding my tree for linux-next tree,
> > currently it is mainly for usb chipidea driver, later it
> > will include USB OTG stuff.
> > 
> > Tree:
> > git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git
> > 
> > Fix stuff 
> > Name: usb-chipidea-fixes
> > branch name: ci-for-usb-stable
> > 
> > Next stuff
> > Name: usb-chipidea-next
> > branch name: ci-for-usb-next
> 
> Added from today.
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

I see, thanks.

-- 

Best Regards,
Peter Chen
