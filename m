From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: manual merge of the acpi tree
Date: Tue, 8 Jul 2008 16:33:39 +0200
Message-ID: <200807081633.40376.rjw@sisk.pl>
References: <20080708125926.5bf64056.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:39819 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751380AbYGHOb6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Jul 2008 10:31:58 -0400
In-Reply-To: <20080708125926.5bf64056.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Len Brown <lenb@kernel.org>, linux-next@vger.kernel.org, Jesse Barnes <jbarnes@virtuousgeek.org>, Andi Kleen <andi@firstfloor.org>

On Tuesday, 8 of July 2008, Stephen Rothwell wrote:
> Hi Len,
> 
> Today's linux-next merge of the acpi tree got conflicts in
> drivers/pci/pci.c and drivers/pci/pci.h between commit
> 961d9120fa6f078492a1c762dd91f2c097e56c83 ("PCI: Introduce
> platform_pci_power_manageable function") from the pci tree and commit
> d40f76ca5c165c9ff1490bbbdb34c520d7155c1f ("PCI ACPI: Drop the second
> argument of platform_pci_choose_state") from the acpi tree (which is also
> in the pci tree).
> 
> The former removes the code that the latter modifies.

It should be safe to drop commit d40f76ca5c165c9ff1490bbbdb34c520d7155c1f
("PCI ACPI: Drop the second argument of platform_pci_choose_state") from the
ACPI tree.

Should I prepare a revert patch?

Rafael
