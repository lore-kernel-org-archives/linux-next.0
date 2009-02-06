From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: manual merge of the pci tree with the pci-current tree
Date: Sat, 7 Feb 2009 00:49:19 +0100
Message-ID: <200902070049.26453.rjw@sisk.pl>
References: <20090206135041.fd7a8e7e.sfr@canb.auug.org.au> <200902060909.32549.jbarnes@virtuousgeek.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:33395 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750831AbZBFXtn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 6 Feb 2009 18:49:43 -0500
In-Reply-To: <200902060909.32549.jbarnes@virtuousgeek.org>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Friday 06 February 2009, Jesse Barnes wrote:
> On Thursday, February 5, 2009 6:50 pm Stephen Rothwell wrote:
> > Hi Jesse,
> >
> > Today's linux-next merge of the pci tree got a conflict in
> > drivers/pci/pcie/portdrv_pci.c between commit
> > 27be54a65c89c4b4aa9b25fc6fba31ffd01a08ca ("PCI: PCIe portdrv: Simplify
> > suspend and resume") from the pci-current tree and commit
> > 120d3f44dd4c7a16ac71f26d4ff44ad7498cb81a ("PCI: PCIe portdrv: Implement
> > pm object") from the pci tree.
> >
> > I fixed it up (I used the pci tree version) and assume it will be fixed in
> > the pci tree soon.
> 
> Oops yeah, thanks for bringing this up.  I didn't rebase my linux-next branch 
> on top of my for-linus branch with the last set of changes...  Will do.

Please let me know if there are problems with rebasing any of my patches.

Best,
Rafael
