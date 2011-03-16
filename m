From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: linux-next: manual merge of the devicetree tree with the galak tree
Date: Tue, 15 Mar 2011 22:53:40 -0600
Message-ID: <AANLkTinPDaj3N7LrDGA7UA8RstyySXQS8yWG_3joHZ2Q@mail.gmail.com>
References: <20110316154653.c178910a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:41279 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750915Ab1CPEyA convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 16 Mar 2011 00:54:00 -0400
In-Reply-To: <20110316154653.c178910a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Scott Wood <scottwood@freescale.com>, Kumar Gala <galak@kernel.crashing.org>

On Tue, Mar 15, 2011 at 10:46 PM, Stephen Rothwell <sfr@canb.auug.org.a=
u> wrote:
> Hi Grant,
>
> Today's linux-next merge of the devicetree tree got a conflict in
> arch/powerpc/sysdev/fsl_msi.c between commit 6820fead714d
> ("powerpc/fsl_msi: Handle msi-available-ranges better") from the gala=
k
> tree and commit 000061245a67 ("dt/powerpc: Eliminate users of of_plat=
form_
> {,un}register_driver") from the devicetree tree.
>
> I fixed it up (see below) and can carry the fix as necessary.

Looks correct to me.  Thanks Stephen.

g.

> --
> Cheers,
> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auug=
=2Eorg.au
>
> diff --cc arch/powerpc/sysdev/fsl_msi.c
> index 8d6b074,ee6a8a5..0000000
> --- a/arch/powerpc/sysdev/fsl_msi.c
> +++ b/arch/powerpc/sysdev/fsl_msi.c
> @@@ -274,48 -273,23 +274,51 @@@ static int fsl_of_msi_remove(struct p=
la
> =A0 =A0 =A0 =A0return 0;
> =A0}
>
> =A0+static int __devinit fsl_msi_setup_hwirq(struct fsl_msi *msi,
> =A0+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 struct platform_device *dev,
> =A0+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 int offset, int irq_index)
> =A0+{
> =A0+ =A0 =A0 =A0struct fsl_msi_cascade_data *cascade_data =3D NULL;
> =A0+ =A0 =A0 =A0int virt_msir;
> =A0+
> =A0+ =A0 =A0 =A0virt_msir =3D irq_of_parse_and_map(dev->dev.of_node, =
irq_index);
> =A0+ =A0 =A0 =A0if (virt_msir =3D=3D NO_IRQ) {
> =A0+ =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(&dev->dev, "%s: Cannot transl=
ate IRQ index %d\n",
> =A0+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0__func__, irq_index);
> =A0+ =A0 =A0 =A0 =A0 =A0 =A0 =A0return 0;
> =A0+ =A0 =A0 =A0}
> =A0+
> =A0+ =A0 =A0 =A0cascade_data =3D kzalloc(sizeof(struct fsl_msi_cascad=
e_data), GFP_KERNEL);
> =A0+ =A0 =A0 =A0if (!cascade_data) {
> =A0+ =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(&dev->dev, "No memory for MSI=
 cascade data\n");
> =A0+ =A0 =A0 =A0 =A0 =A0 =A0 =A0return -ENOMEM;
> =A0+ =A0 =A0 =A0}
> =A0+
> =A0+ =A0 =A0 =A0msi->msi_virqs[irq_index] =3D virt_msir;
> =A0+ =A0 =A0 =A0cascade_data->index =3D offset + irq_index;
> =A0+ =A0 =A0 =A0cascade_data->msi_data =3D msi;
> =A0+ =A0 =A0 =A0set_irq_data(virt_msir, cascade_data);
> =A0+ =A0 =A0 =A0set_irq_chained_handler(virt_msir, fsl_msi_cascade);
> =A0+
> =A0+ =A0 =A0 =A0return 0;
> =A0+}
> =A0+
> - static int __devinit fsl_of_msi_probe(struct platform_device *dev,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const s=
truct of_device_id *match)
> + static int __devinit fsl_of_msi_probe(struct platform_device *dev)
> =A0{
> =A0 =A0 =A0 =A0struct fsl_msi *msi;
> =A0 =A0 =A0 =A0struct resource res;
> =A0- =A0 =A0 =A0int err, i, count;
> =A0+ =A0 =A0 =A0int err, i, j, irq_index, count;
> =A0 =A0 =A0 =A0int rc;
> =A0- =A0 =A0 =A0int virt_msir;
> =A0 =A0 =A0 =A0const u32 *p;
> - =A0 =A0 =A0 struct fsl_msi_feature *features =3D match->data;
> + =A0 =A0 =A0 struct fsl_msi_feature *features;
> =A0- =A0 =A0 =A0struct fsl_msi_cascade_data *cascade_data =3D NULL;
> =A0 =A0 =A0 =A0int len;
> =A0 =A0 =A0 =A0u32 offset;
> =A0+ =A0 =A0 =A0static const u32 all_avail[] =3D { 0, NR_MSI_IRQS };
>
> + =A0 =A0 =A0 if (!dev->dev.of_match)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> + =A0 =A0 =A0 features =3D dev->dev.of_match->data;
> +
> =A0 =A0 =A0 =A0printk(KERN_DEBUG "Setting up Freescale MSI support\n"=
);
>
> =A0 =A0 =A0 =A0msi =3D kzalloc(sizeof(struct fsl_msi), GFP_KERNEL);
>



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
