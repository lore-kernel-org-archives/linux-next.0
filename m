From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: linux-next: build failure after merge of the pci tree
Date: Mon, 5 Dec 2011 20:16:54 -0700
Message-ID: <CAErSpo6YrEZZjd=j6xoUfSvDHTT+-9g0zAb=ff2F1jA-0V9rHw@mail.gmail.com>
References: <20111206111852.6931fd03f0b1a86e318a29e3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:44624 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756452Ab1LFDRS convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 5 Dec 2011 22:17:18 -0500
Received: by bkbzv3 with SMTP id zv3so2778070bkb.19
        for <linux-next@vger.kernel.org>; Mon, 05 Dec 2011 19:17:17 -0800 (PST)
In-Reply-To: <20111206111852.6931fd03f0b1a86e318a29e3@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jesse Barnes <jbarnes@virtuousgeek.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Dec 5, 2011 at 5:18 PM, Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> Hi Jesse,
>
> After merging the pci tree, today's linux-next build
> (powerpc_ppc64_defconfig) failed like this:
>
> arch/powerpc/kernel/pci_64.c: In function 'pcibios_map_io_space':
> arch/powerpc/kernel/pci_64.c:201:2: error: implicit declaration of fu=
nction 'pcibios_phb_map_phb_io_space' [-Werror=3Dimplicit-function-decl=
aration]
>
> Caused by commit fb8fca4ff3f7 ("powerpc/PCI: split PHB part out of
> pcibios_map_io_space()").
>
> arch/powerpc/kernel/pci-common.c: In function 'pcibios_scan_phb':
> arch/powerpc/kernel/pci-common.c:1726:7: error: incompatible type for=
 argument 5 of 'pci_create_root_bus'
> include/linux/pci.h:665:17: note: expected 'struct list_head *' but a=
rgument is of type 'struct list_head'
>
> Caused by commit 3c73944e7ace ("powerpc/PCI: convert to
> pci_create_root_bus()").
>
> I have used the pci tree from next-20111205 for today.
> --
> Cheers,
> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auug=
=2Eorg.au
> http://www.canb.auug.org.au/~sfr/

I fixed these; the updated patches are on
git://github.com/bjorn-helgaas/linux.git on
the "pci-scan-v4" branch (head f9da8b214fef1ac4072e4af2a663293ab965f796=
).

Here's the incremental diff from v3 to v4 (hand-created and whitespace-=
damaged):

diff --git a/c4677881a:arch/powerpc/kernel/pci_64.c
b/f9da8b214:arch/powerpc/kernel/pci_64.c
index 4401425..3318d39 100644
--- a/c4677881a:arch/powerpc/kernel/pci_64.c
+++ b/f9da8b214:arch/powerpc/kernel/pci_64.c
@@ -197,7 +198,7 @@ int __devinit pcibios_map_io_space(struct pci_bus *=
bus)
                return 0;
        }

-       return pcibios_phb_map_phb_io_space(pci_bus_to_host(bus));
+       return pcibios_map_phb_io_space(pci_bus_to_host(bus));
 }
 EXPORT_SYMBOL_GPL(pcibios_map_io_space);

diff --git a/c4677881a:arch/powerpc/kernel/pci-common.c
b/f9da8b214:arch/powerpc/kernel/pci-common.c
index 8c47c57..2aa707b 100644
--- a/c4677881a:arch/powerpc/kernel/pci-common.c
+++ b/f9da8b214:arch/powerpc/kernel/pci-common.c
@@ -1711,7 +1712,7 @@ void __devinit pcibios_scan_phb(struct
pci_controller *hose)

        /* Create an empty bus for the toplevel */
        bus =3D pci_create_root_bus(hose->parent, hose->first_busno,
-                                 hose->ops, hose, resources);
+                                 hose->ops, hose, &resources);
        if (bus =3D=3D NULL) {
                pr_err("Failed to create bus for PCI domain %04x\n",
                        hose->global_number);
