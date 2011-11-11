From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: linux-next: manual merge of the slave-dma tree with the s5p tree
Date: Fri, 11 Nov 2011 14:06:38 +0530
Message-ID: <CAJuYYwR6Vt4dbio3hATkLgYPbo2sVVpjH85DE+AUOAGS9-r0rA@mail.gmail.com>
References: <20111111120013.e425db4686acbd346e10a49b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:38451 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754130Ab1KKIgi convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 11 Nov 2011 03:36:38 -0500
In-Reply-To: <20111111120013.e425db4686acbd346e10a49b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Vinod Koul <vinod.koul@intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Boojin Kim <boojin.kim@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, joe@perches.com

Hi Stephen,

On 11 November 2011 06:30, Stephen Rothwell <sfr@canb.auug.org.au> wrot=
e:
> Hi Vinod,
>
> Today's linux-next merge of the slave-dma tree got a conflict in
> drivers/dma/pl330.c between commit c6e00b47067b ("DMA: PL330: Add dev=
ice
> tree support") from the s5p tree and commit dab6538e29e6 ("DMA: PL330=
:
> Fix build warning") from the slave-dma tree.
>
> I fixed it up (see below) and can carry the fix as necessary.
> --
> Cheers,
> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auug=
=2Eorg.au
>
> diff --cc drivers/dma/pl330.c
> index a626e15,186b822..0000000
> --- a/drivers/dma/pl330.c
> +++ b/drivers/dma/pl330.c
> @@@ -870,8 -856,8 +870,8 @@@ pl330_probe(struct amba_device *adev, c
> =A0 =A0 =A0 =A0INIT_LIST_HEAD(&pd->channels);
>
> =A0 =A0 =A0 =A0/* Initialize channel parameters */
> - =A0 =A0 =A0 num_chan =3D max(pdat ? pdat->nr_valid_peri : (u8)pi->p=
cfg.num_peri,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (u8)pi->pcfg.num_chan);
> =A0- =A0 =A0 =A0num_chan =3D max(pdat ? (int)pdat->nr_valid_peri : 0,
> =A0- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0(int)pi->pcfg.num_chan);
> ++ =A0 =A0 =A0num_chan =3D max(pdat ? (int)pdat->nr_valid_peri : (int=
)pi->pcfg.num_peri,
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(int)pi->pcfg.num_chan)=
;
> =A0 =A0 =A0 =A0pdmac->peripherals =3D kzalloc(num_chan * sizeof(*pch)=
, GFP_KERNEL);
>
> =A0 =A0 =A0 =A0for (i =3D 0; i < num_chan; i++) {
>

Thanks for the fix.
Also taking into account the suggestion from Joe Perches, this change c=
ould be

> -       num_chan =3D max(pdat ? pdat->nr_valid_peri : (u8)pi->pcfg.nu=
m_peri,
> -                       (u8)pi->pcfg.num_chan);
>  -      num_chan =3D max(pdat ? (int)pdat->nr_valid_peri : 0,
>  -                                      (int)pi->pcfg.num_chan);
> ++      num_chan =3D max_t(int, pdat ? pdat->nr_valid_peri : pi->pcfg=
=2Enum_peri,
> ++                      pi->pcfg.num_chan);
>        pdmac->peripherals =3D kzalloc(num_chan * sizeof(*pch), GFP_KE=
RNEL);
>

Regards,
Thomas.
