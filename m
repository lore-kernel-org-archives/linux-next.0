From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: manual merge of the pm tree with the pci tree
Date: Fri, 15 Feb 2013 13:51:46 +0100
Message-ID: <1673630.BcVjZeif4m@vostro.rjw.lan>
References: <20130215122313.19a651c33ef3bb60c0f3d827@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130215122313.19a651c33ef3bb60c0f3d827@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Yinghai Lu <yinghai@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Jiang Liu <jiang.liu@huawei.com>
List-Id: linux-next.vger.kernel.org

On Friday, February 15, 2013 12:23:13 PM Stephen Rothwell wrote:
> Hi Rafael,
> 
> Today's linux-next merge of the pm tree got conflicts in
> drivers/acpi/scan.c and drivers/pci/hotplug/acpiphp_glue.c between
> commits 668192b67820 ("PCI: acpiphp: Move host bridge hotplug to
> pci_root.c") and be6d2867b4f6 ("PCI: acpiphp: Remove dead code for PCI
> host bridge hotplug") from the pci tree and commit 3757b94802fb ("ACPI /
> hotplug: Fix concurrency issues and memory leaks") from the pm tree.
> 
> I fixed it up (thanks to Yinghai Lu for the resolution - see below) and
> can carry the fix as necessary (no action is required).

Thanks Stephen!


-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
