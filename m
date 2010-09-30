From: Greg KH <greg@kroah.com>
Subject: Re: [Vipin.Mehta@Atheros.com: [PATCH] staging: ath6kl: Fixing the
	driver to use modified mmc_host structure
Date: Wed, 29 Sep 2010 19:21:40 -0700
Message-ID: <20100930022140.GA4035@kroah.com>
References: <20100930003419.GB5906@vmehta-desktop> <20100930105748.5b049c44.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:56562 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751455Ab0I3CiZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Sep 2010 22:38:25 -0400
Content-Disposition: inline
In-Reply-To: <20100930105748.5b049c44.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Vipin Mehta <vmehta@atheros.com>, linux-next@vger.kernel.org

On Thu, Sep 30, 2010 at 10:57:48AM +1000, Stephen Rothwell wrote:
> Hi Vipin,
> 
> On Wed, 29 Sep 2010 17:34:19 -0700 Vipin Mehta <vmehta@atheros.com> wrote:
> >
> >     Can you pls help me apply the following patch to the linux-next 
> > tree. The patch fixes a compilation problem with ath6kl due to a
> > change in the mmc_host structure. The driver compiles fine in the
> > staging-next-2.6 tree which is where the changes for this driver 
> > actually go. However, the mmc stack in the linux-next tree and 
> > staging-next-2.6 is out of sync and so this patch is only applicable
> > to linux-next.
> 
> I will carry it as a merge fixup patch for the staging-next tree.
> Someone just needs to make sure that this patch gets applied (or sent to
> Linus) at the right time.

I'll keep in my "todo" file to handle it when the merge happens.

thanks,

greg k-h
