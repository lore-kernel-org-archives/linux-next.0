From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: manual merge of the pm tree with the pci tree
Date: Thu, 10 Jan 2013 14:12:55 +0100
Message-ID: <3580741.9uNSi7V1RO@vostro.rjw.lan>
References: <20130110112836.19126ca740c8e13a15860dc0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hydra.sisk.pl ([212.160.235.94]:36757 "EHLO hydra.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753551Ab3AJNHK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 10 Jan 2013 08:07:10 -0500
In-Reply-To: <20130110112836.19126ca740c8e13a15860dc0@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Yinghai Lu <yinghai@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>

Hi,

On Thursday, January 10, 2013 11:28:36 AM Stephen Rothwell wrote:
> Hi Rafael,
> 
> Today's linux-next merge of the pm tree got a conflict in
> drivers/acpi/pci_root.c between commit 3c449ed00759 ("PCI/ACPI: Reserve
> firmware-allocated resources for hot-added root buses") from the pci tree
> and commit 47525cda88f5 ("ACPI / PCI: Fold acpi_pci_root_start() into
> acpi_pci_root_add()") from the pm tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Thanks for the fixup and please carry it for now (the conflict should go away
when Bjorn pulls from my acpi-scan branch).

Thanks,
Rafael


-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
