From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree
Date: Sun, 4 Jan 2009 20:36:46 -0800
Message-ID: <20090105043646.GB16341@kroah.com>
References: <20081204104418.97f848b4.sfr@canb.auug.org.au> <20081204042154.GA18027@kroah.com> <20090105102800.c73bed11.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:40654 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752315AbZAEEh5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 4 Jan 2009 23:37:57 -0500
Content-Disposition: inline
In-Reply-To: <20090105102800.c73bed11.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>, Kumar Gala <galak@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@ozlabs.org

On Mon, Jan 05, 2009 at 10:28:00AM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> On Wed, 3 Dec 2008 20:21:54 -0800 Greg KH <greg@kroah.com> wrote:
> >
> > On Thu, Dec 04, 2008 at 10:44:18AM +1100, Stephen Rothwell wrote:
> > > 
> > > Today's linux-next merge of the driver-core tree got a conflict in
> > > arch/powerpc/platforms/85xx/mpc85xx_mds.c between commit
> > > 24a99596f7465274a8e65ddd29a7d9028969b9f9 ("powerpc/85xx: Fix compile
> > > warnings in mpc85xx_mds.c") from the galak tree and commit
> > > f58f23751464d095f9942304bc5f6072b79a2cc3 ("powerpc: struct device -
> > > replace bus_id with dev_name(), dev_set_name()") from the driver-core
> > > tree.
> > > 
> > > I fixed it up (see below) and can carry the fix as necessary.
> > > 
> > > Paul, maybe you should apply the patch from the driver-core tree as it
> > > was cc'd to you and all its prerequisites are upstream.
> > 
> > Yes, Paul, please apply the patch, and let me know.  It will make things
> > much easier in the end for everyone involved.
> 
> It looks like this has been applied to the powerpc tree and is now in
> Linus' tree.

Thanks for letting me know, I'll drop it from my tree when I sync up
with Linus's tree tomorrow.

greg k-h
