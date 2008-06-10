From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: linux-next: pci/kbuild-current merge conflict
Date: Tue, 10 Jun 2008 21:06:17 +0200
Message-ID: <20080610190617.GD15983@uranus.ravnborg.org>
References: <20080610143434.9cec3775.sfr@canb.auug.org.au> <200806092253.54654.jbarnes@virtuousgeek.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:45727 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753254AbYFJTFf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 10 Jun 2008 15:05:35 -0400
Content-Disposition: inline
In-Reply-To: <200806092253.54654.jbarnes@virtuousgeek.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Shaohua Li <shaohua.li@intel.com>, Sebastian Siewior <bigeasy@linutronix.de>, linux-next@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>

On Mon, Jun 09, 2008 at 10:53:54PM -0700, Jesse Barnes wrote:
> On Monday, June 09, 2008 9:34 pm Stephen Rothwell wrote:
> > Hi Jesse,
> >
> > Today's linux-next merge of the pci tree got a trivial merge conflict in
> > include/asm-generic/vmlinux.lds.h between commit
> > f1cb2ba8ca4a8b4b76bbf0b795375af52442501b ("generic: add
> > OUTPUT_DATA_SECTION to vmlinux.lds.h") from the kbuild-current tree and
> > commit 638d515d37e4cfc9af9d8672f9668324b7b6600d ("Suspend/Resume bug in
> > PCI layer wrt quirks") from the pci tree.
> >
> > I did the obvious fixup.
> >
> > This can be fixed by you merging Linus' tree into the pci tree sometime
> > after he takes the kbuild patch.  No real urgency, though.
> >
> > It is interesting that the pci patch is authored by Rafael, but has no
> > Signed-off-by from him.
> 
> Ok, I'll try to fix that up tomorrow.  I've been meaning to pull in Linus' 
> latest bits for awhile anyway...  Thanks for the heads up.
I have dropped the offending commit from kbuild.git for now.
So no need for you to do anything.
It was to benefit m68knommu only and I can apply it late in the
merge window.

	Sam
