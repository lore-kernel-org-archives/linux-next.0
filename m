From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: Re: linux-next: Tree for November 7
Date: Sat, 8 Nov 2008 20:13:03 +0100
Message-ID: <200811082013.04066.bzolnier@gmail.com>
References: <20081107205457.f64dea59.sfr@canb.auug.org.au> <200811081257.45184.bzolnier@gmail.com> <20081108184315.GA9382@x200.localdomain>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nf-out-0910.google.com ([64.233.182.187]:53679 "EHLO
	nf-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750921AbYKHTS5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 8 Nov 2008 14:18:57 -0500
In-Reply-To: <20081108184315.GA9382@x200.localdomain>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "Eric W. Biederman" <ebiederm@xmission.com>, "David S. Miller" <davem@davemloft.net>

On Saturday 08 November 2008, Alexey Dobriyan wrote:
> On Sat, Nov 08, 2008 at 12:57:44PM +0100, Bartlomiej Zolnierkiewicz wrote:
> > On Friday 07 November 2008, Stephen Rothwell wrote:
> > > Changes since 20081106:
> > 
> > The following patch fixes the panic on loopback device registration
> > (patch is an interdiff between old and new version of "net: Guaranetee
> > the proper ordering of the loopback device." fix from Eric).
> > 
> > [ I'm sure this will get fixed in -net tree (if not fixed already)
> >   but at the moment it is needed for linux-next. ]
> 
> This patch alone is a) not enough, and b) davem already pushed out correct
> version.

Well, it was enough to make next-20081107 bootable for me. :-)

However, it seems like the following patch is also neeed by linux-next users:
 http://git.kernel.org/?p=linux/kernel/git/davem/net-next-2.6.git;a=commitdiff;h=5d6d480908300a0c0b3be8b58567dfcef62c83a5

[ I also see that it is fixed now but it was actually an overdue mail from
  yesterday and like I said earlier, the sole its purpose was to help people
  trying linux-next kernels (linux-next is not released on weekends so from
  their POV it doesn't really matter if it already got fixed in net-next). ]

Thanks,
Bart
