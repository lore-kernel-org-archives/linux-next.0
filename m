From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: driver-core/pci merge failure
Date: Tue, 20 May 2008 00:39:59 +0200
Message-ID: <200805200039.59938.rjw@sisk.pl>
References: <20080519120328.40aa6d5d.sfr@canb.auug.org.au> <200805191625.02966.rjw@sisk.pl> <20080519152243.GB7620@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:39820 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1760819AbYESWjV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 19 May 2008 18:39:21 -0400
In-Reply-To: <20080519152243.GB7620@kroah.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jesse Barnes <jbarnes@virtuousgeek.org>, linux-next@vger.kernel.org, Shaohua Li <shaohua.li@intel.com>

On Monday, 19 of May 2008, Greg KH wrote:
> On Mon, May 19, 2008 at 04:25:02PM +0200, Rafael J. Wysocki wrote:
> > On Monday, 19 of May 2008, Stephen Rothwell wrote:
> > > Hi Greg, Jesse,
> > > 
> > > Today's linux-next merge of the pci tree got a conflict in
> > > drivers/pci/pci-driver.c between commit
> > > 681e027ef934e9892b199180129be772208f735b ("PM: New suspend and
> > > hibernation callbacks for PCI bus type") from the driver-core tree and
> > > commit 176bc7cff4442d3795c0599b70ecbe9b11ccd775 ("Suspend/Resume bug in
> > > PCI layer wrt quirks") from the pci tree.  The former changed
> > > pci_default_resume() to pci_default_pm_resume() while the latter added a
> > > call to pci_fixup_device() immediately after the call to
> > > pci_default_resume() in pci_device_resume() (which became
> > > pci_legacy_resume() in the former patch).  I assume the obvious fixup is
> > > correct, but may be worth a check.
> > 
> > Well, it's not really obvious. :-)
> > 
> > Please revert "PM: New suspend and hibernation callbacks for PCI bus type"
> > until we fix that up.
> 
> Do you want me to drop this from my tree?

Yes, please.  I'll send the updated patch to Jesse, if he doesn't object, as I
said in the other thread.

Thanks,
Rafael
