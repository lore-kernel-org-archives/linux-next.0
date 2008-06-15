From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: Tree for June 13
Date: Sun, 15 Jun 2008 20:31:01 +0200
Message-ID: <200806152031.01959.rjw@sisk.pl>
References: <20080613232214.394fd6fd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:53799 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758847AbYFOS3p (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 15 Jun 2008 14:29:45 -0400
In-Reply-To: <20080613232214.394fd6fd.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Friday, 13 of June 2008, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since next-20080612:
> 
> New tree: kgdb
> Dropped trees (temporary): ldp (it is unfetchable - probably something to
> do with the new Staging tree)
> Restored trees: block
> 
> The x86 tree gained a conflict with Linus' tree.
> 
> The acpi tree gained a conflict with the pci tree.
> 
> The mtd tree gained a trivial conflict with the avr32 tree.
> 
> The rr tree lost its conflict with the net-current tree.
> 
> The block tree gained several conflict with various other trees.  It also
> required a build fix patch.
> 
> The firmware tree lost its build fix patch.
> 
> The patches for known build problems are no longer needed.

20080613 doesn't boot on my HP nx6325.  Bisecting ...

Thanks,
Rafael
