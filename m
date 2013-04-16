From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: manual merge of the pm tree with the pci tree
Date: Tue, 16 Apr 2013 19:53:11 +0200
Message-ID: <2351812.ay6x6qW83M@vostro.rjw.lan>
References: <20130416124611.3dd55ea49fc6724e0994ed8e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130416124611.3dd55ea49fc6724e0994ed8e@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jiang Liu <liuj97@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>
List-Id: linux-next.vger.kernel.org

On Tuesday, April 16, 2013 12:46:11 PM Stephen Rothwell wrote:
> Hi Rafael,
> 
> Today's linux-next merge of the pm tree got a conflict in
> drivers/acpi/scan.c between commit 5c0b04e3d913 ("PCI/ACPI: Handle PCI
> slot devices when creating/destroying PCI buses") from the pci tree and
> commit 0a34764411aa ("ACPI / scan: Make memory hotplug driver use struct
> acpi_scan_handler") from the pm tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

The fix look correct, thanks a lot for taking care of this!

Rafael


-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
