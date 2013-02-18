From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: manual merge of the pm tree with the pci tree
Date: Mon, 18 Feb 2013 13:28:30 +0100
Message-ID: <19197367.nhbiu0r0r6@vostro.rjw.lan>
References: <20130218121707.221f3f24673d92066b6603ad@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hydra.sisk.pl ([212.160.235.94]:39365 "EHLO hydra.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752158Ab3BRMV4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Feb 2013 07:21:56 -0500
In-Reply-To: <20130218121707.221f3f24673d92066b6603ad@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jiang Liu <liuj97@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Yinghai Lu <yinghai@kernel.org>

Hi Stephen,

On Monday, February 18, 2013 12:17:07 PM Stephen Rothwell wrote:
> Hi Rafael,
> 
> Today's linux-next merge of the pm tree got a conflict in
> drivers/acpi/scan.c between commits 668192b67820 ("PCI: acpiphp: Move
> host bridge hotplug to pci_root.c") and ab1a2e038ff2 ("ACPI / PCI: Make
> pci_slot built-in only, not a module") from the pci tree and commits
> 4daeaf68379f ("ACPI / PCI: Make PCI IRQ link driver use struct
> acpi_scan_handler") and  3757b94802fb ("ACPI / hotplug: Fix concurrency
> issues and memory leaks") from the pm tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Thanks for the notice and the fix (which is the right one).

Rafael


-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
