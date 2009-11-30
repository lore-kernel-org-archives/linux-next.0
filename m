From: Marc Zyngier <maz@misterjones.org>
Subject: Re: linux-next: manual merge of the pcmcia tree with the pxa tree
Date: Mon, 30 Nov 2009 09:10:07 +0100
Message-ID: <20091130091007.7a5fd554@hina.wild-wind.fr.eu.org>
References: <20091130131627.8ccc6033.sfr@canb.auug.org.au>
	<f17812d70911291917y2aeebbberbf31775491f0df4f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from inca-roads.misterjones.org ([213.251.177.50]:51369 "EHLO
	inca-roads.misterjones.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752661AbZK3IKF convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 Nov 2009 03:10:05 -0500
In-Reply-To: <f17812d70911291917y2aeebbberbf31775491f0df4f@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Eric Miao <eric.y.miao@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Dominik Brodowski <linux@dominikbrodowski.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>

On Mon, 30 Nov 2009 11:17:08 +0800
Eric Miao <eric.y.miao@gmail.com> wrote:

Hi Eric,

> Could you take a look into this, I wonder you may need to rebase
> against Russell's PCMCIA generalization stuffs. Let me know if you
> want me to drop this patch.

Patch looks good. I'm more worried about creating dependencies between
trees:

- Stephen fix depends on Russell's changes, which are in Dominik's tree=
,
- My patch depends on Zeus support, which is in your tree,
- Rebasing Zeus PCMCIA support against Dominik's tree is just another
  dependency between the two trees.

Should we drop my PCMCIA changes until both Russell's changes and main
Zeus support are merged?

I'm opened to any suggestion.

	M.

>=20
> On Mon, Nov 30, 2009 at 10:16 AM, Stephen Rothwell
> <sfr@canb.auug.org.au> wrote:
> > Hi Dominik,
> >
> > Today's linux-next merge of the pcmcia tree got a conflict in
> > drivers/pcmcia/pxa2xx_viper.c between commit
> > c9b74a4489db7e6fe03fbee11f406b9641baae55 ("[ARM] pxa/zeus: make
> > Viper pcmcia support more generic to support Zeus") from the pxa
> > tree and commit 66024db57d5b9011e274b314affad68f370c0d6f ("PCMCIA:
> > stop duplicating pci_irq in soc_pcmcia_socket") from the pcmcia
> > tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary.
> > --
> > Cheers,
> > Stephen Rothwell =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0sfr@canb.auug.org.au
> >
> > diff --cc drivers/pcmcia/pxa2xx_viper.c
> > index 7a16ae9,27be2e1..0000000
> > --- a/drivers/pcmcia/pxa2xx_viper.c
> > +++ b/drivers/pcmcia/pxa2xx_viper.c
> > @@@ -30,35 -32,23 +30,35 @@@
> > =C2=A0#include "soc_common.h"
> > =C2=A0#include "pxa2xx_base.h"
> >
> > =C2=A0+static struct platform_device *arcom_pcmcia_dev;
> > =C2=A0+
> > =C2=A0static struct pcmcia_irqs irqs[] =3D {
> > =C2=A0- =C2=A0 =C2=A0 =C2=A0{ 0, gpio_to_irq(VIPER_CF_CD_GPIO), =C2=
=A0"PCMCIA_CD" }
> > =C2=A0+ =C2=A0 =C2=A0 =C2=A0{
> > =C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.sock =C2=A0=
 =3D 0,
> > =C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.str =C2=A0=
 =C2=A0=3D "PCMCIA_CD",
> > =C2=A0+ =C2=A0 =C2=A0 =C2=A0},
> > =C2=A0};
> >
> > =C2=A0+static inline struct arcom_pcmcia_pdata *viper_get_pdata(voi=
d)
> > =C2=A0+{
> > =C2=A0+ =C2=A0 =C2=A0 =C2=A0return arcom_pcmcia_dev->dev.platform_d=
ata;
> > =C2=A0+}
> > =C2=A0+
> > =C2=A0static int viper_pcmcia_hw_init(struct soc_pcmcia_socket *skt=
)
> > =C2=A0{
> > =C2=A0+ =C2=A0 =C2=A0 =C2=A0struct arcom_pcmcia_pdata *pdata =3D vi=
per_get_pdata();
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long flags;
> >
> > - =C2=A0 =C2=A0 =C2=A0 skt->irq =3D gpio_to_irq(pdata->rdy_gpio);
> > =C2=A0- =C2=A0 =C2=A0 =C2=A0skt->socket.pci_irq =3D gpio_to_irq(VIP=
ER_CF_RDY_GPIO);
> > ++ =C2=A0 =C2=A0 =C2=A0skt->socket.pci_irq =3D gpio_to_irq(pdata->r=
dy_gpio);
> > =C2=A0+ =C2=A0 =C2=A0 =C2=A0irqs[0].irq =3D gpio_to_irq(pdata->cd_g=
pio);
> >
> > =C2=A0- =C2=A0 =C2=A0 =C2=A0if (gpio_request(VIPER_CF_CD_GPIO, "CF =
detect"))
> > =C2=A0+ =C2=A0 =C2=A0 =C2=A0if (gpio_request(pdata->cd_gpio, "CF de=
tect"))
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_req=
uest_cd;
> >
> > =C2=A0- =C2=A0 =C2=A0 =C2=A0if (gpio_request(VIPER_CF_RDY_GPIO, "CF=
 ready"))
> > =C2=A0+ =C2=A0 =C2=A0 =C2=A0if (gpio_request(pdata->rdy_gpio, "CF r=
eady"))
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_req=
uest_rdy;
> >
> > =C2=A0- =C2=A0 =C2=A0 =C2=A0if (gpio_request(VIPER_CF_POWER_GPIO, "=
CF power"))
> > =C2=A0+ =C2=A0 =C2=A0 =C2=A0if (gpio_request(pdata->pwr_gpio, "CF p=
ower"))
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_req=
uest_pwr;
> >
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0local_irq_save(flags);
> >
>=20


--=20
And if you don't know where you're going, any road will take you
there...
