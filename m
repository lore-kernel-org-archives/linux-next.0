From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: linux-next: build failure after merge of the final tree (pci tree related)
Date: Wed, 7 Dec 2011 08:08:43 -0700
Message-ID: <CAErSpo59CuEBbu4QWMkK23TyXafhMLOh1G7Z8YxojqiQmCM0Fw@mail.gmail.com>
References: <20111207170533.3dea865573c916e79d274eca@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:52424 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755798Ab1LGPJF convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 7 Dec 2011 10:09:05 -0500
Received: by bkbzv3 with SMTP id zv3so544537bkb.19
        for <linux-next@vger.kernel.org>; Wed, 07 Dec 2011 07:09:04 -0800 (PST)
In-Reply-To: <20111207170533.3dea865573c916e79d274eca@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jesse Barnes <jbarnes@virtuousgeek.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

On Tue, Dec 6, 2011 at 11:05 PM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Hi all,
>
> After merging the final tree, today's linux-next build (sparc64 defco=
nfig)
> failed like this:
>
> arch/sparc/kernel/pci.c: In function 'pci_scan_one_pbm':
> arch/sparc/kernel/pci.c:697:7: error: incompatible type for argument =
5 of 'pci_create_root_bus'
> include/linux/pci.h:665:17: note: expected 'struct list_head *' but a=
rgument is of type 'struct list_head'
>
> Caused by commit fa3cec8aff53 ("sparc/PCI: convert to pci_create_root=
_bus
> ()"). Same typo as for the powerpc tree. :-( =A0Please double check t=
he
> rest of those changes, please.
>
> I applied the following patch for today.

Thanks for doing that, sorry for the trouble.  I don't have a set of
cross-compilers, unfortunately, but I will inspect the rest manually.
Do we have to discover problems one-by-one, or can you tell us about
any other arch build problems at the same time?

> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 7 Dec 2011 17:02:12 +1100
> Subject: [PATCH] sparc/PCI: fix up typo from pci_create_root_bus conv=
ersion
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
> =A0arch/sparc/kernel/pci.c | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/arch/sparc/kernel/pci.c b/arch/sparc/kernel/pci.c
> index 0905dbd..bb8bc2e 100644
> --- a/arch/sparc/kernel/pci.c
> +++ b/arch/sparc/kernel/pci.c
> @@ -694,7 +694,7 @@ struct pci_bus * __devinit pci_scan_one_pbm(struc=
t pci_pbm_info *pbm,
> =A0 =A0 =A0 =A0pci_add_resource(&resources, &pbm->io_space);
> =A0 =A0 =A0 =A0pci_add_resource(&resources, &pbm->mem_space);
> =A0 =A0 =A0 =A0bus =3D pci_create_root_bus(parent, pbm->pci_first_bus=
no, pbm->pci_ops,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pbm=
, resources);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pbm=
, &resources);
> =A0 =A0 =A0 =A0if (!bus) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KERN_ERR "Failed to create bus =
for %s\n",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 node->full_name);
> --
> 1.7.7.3
>
> --
> Cheers,
> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auug=
=2Eorg.au
> http://www.canb.auug.org.au/~sfr/
