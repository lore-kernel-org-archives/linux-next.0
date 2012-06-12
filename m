From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: linux-next: build failure after merge of the final tree (pci tree related)
Date: Tue, 12 Jun 2012 09:31:49 -0600
Message-ID: <CAErSpo6LxpYz_WK2mHPW3RWkOMPLar0KUp1Pgh7shhOdmT49kw@mail.gmail.com>
References: <20120612145441.400975347f06785d391d0f8f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <sparclinux-owner@vger.kernel.org>
In-Reply-To: <20120612145441.400975347f06785d391d0f8f@canb.auug.org.au>
Sender: sparclinux-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Yinghai Lu <yinghai@kernel.org>, "David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Mon, Jun 11, 2012 at 10:54 PM, Stephen Rothwell <sfr@canb.auug.org.a=
u> wrote:
> Hi all,
>
> After merging the final tree, today's linux-next build (sparc64 defco=
nfig)
> failed like this:
>
> arch/sparc/kernel/pci.c: In function 'pci_scan_one_pbm':
> arch/sparc/kernel/pci.c:689:21: error: 'struct pci_pbm_info' has no m=
ember named 'pci_last_busn'
>
> Caused by commit 2c7f691b032b ("sparc/PCI: register busn_res for root=
 buses").
>
> I have added the following patch for today:
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 12 Jun 2012 14:48:39 +1000
> Subject: [PATCH] sparc/PCI: fix typo
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
> =A0arch/sparc/kernel/pci.c | =A0 =A02 +-
> =A01 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/sparc/kernel/pci.c b/arch/sparc/kernel/pci.c
> index 74e4bf3..4f92a9a 100644
> --- a/arch/sparc/kernel/pci.c
> +++ b/arch/sparc/kernel/pci.c
> @@ -686,7 +686,7 @@ struct pci_bus * __devinit pci_scan_one_pbm(struc=
t pci_pbm_info *pbm,
> =A0 =A0 =A0 =A0pci_add_resource_offset(&resources, &pbm->mem_space,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pbm->m=
em_space.start);
> =A0 =A0 =A0 =A0pbm->busn.start =3D pbm->pci_first_busno;
> - =A0 =A0 =A0 pbm->busn.end =A0 =3D pbm->pci_last_busn;
> + =A0 =A0 =A0 pbm->busn.end =A0 =3D pbm->pci_last_busno;
> =A0 =A0 =A0 =A0pbm->busn.flags =3D IORESOURCE_BUS;
> =A0 =A0 =A0 =A0pci_add_resource(&resources, &pbm->busn);
> =A0 =A0 =A0 =A0bus =3D pci_create_root_bus(parent, pbm->pci_first_bus=
no, pbm->pci_ops,

Thanks, I folded this typo fix into the relevant patch.  I'll rebase
"next" today.  Sorry for the trouble.

Bjorn
--
To unsubscribe from this list: send the line "unsubscribe sparclinux" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
