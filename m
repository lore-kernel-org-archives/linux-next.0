From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: linux-next: manual merge of the spi tree with the arm tree
Date: Tue, 20 Sep 2011 22:18:56 -0600
Message-ID: <CACxGe6vHDGQnr=h-oC1sfqqO2yKiYBj_opmVtugjqojy_zHZFQ@mail.gmail.com>
References: <20110921133456.3072657340220296eec6d7b6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:58447 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750861Ab1IUETR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 21 Sep 2011 00:19:17 -0400
In-Reply-To: <20110921133456.3072657340220296eec6d7b6@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>, Viresh Kumar <viresh.kumar@st.com>

Thanks Stephen.  I'll drop the offending hunk from my tree.

g.

On Tue, Sep 20, 2011 at 9:34 PM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Hi Grant,
>
> Today's linux-next merge of the spi tree got a conflict in
> drivers/spi/spi-pl022.c between commit 67fc8b9fe70c ("PM: add runtime=
 PM
> support to core Primecell driver") from the arm tree and commit
> 4eb389a89154 ("spi/spi-pl022: Resolve formatting issues") from the sp=
i
> tree.
>
> The former removes the lines modified by the latter, so I just remove=
d
> the lines (see below).
> --
> Cheers,
> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auug=
=2Eorg.au
>
> diff --cc drivers/spi/spi-pl022.c
> index 3520cf9,02b2eda..0000000
> --- a/drivers/spi/spi-pl022.c
> +++ b/drivers/spi/spi-pl022.c
> @@@ -2235,8 -2237,11 +2225,10 @@@ pl022_probe(struct amba_device *ade=
v, c
> =A0 err_start_queue:
> =A0 err_init_queue:
> =A0 =A0 =A0 =A0destroy_queue(pl022);
> - =A0 =A0 =A0 pl022_dma_remove(pl022);
> + =A0 =A0 =A0 if (platform_info->enable_dma)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pl022_dma_remove(pl022);
> +
> =A0 =A0 =A0 =A0free_irq(adev->irq[0], pl022);
> =A0- =A0 =A0 =A0pm_runtime_disable(&adev->dev);
> =A0 err_no_irq:
> =A0 =A0 =A0 =A0clk_put(pl022->clk);
> =A0 err_no_clk:
> @@@ -2429,9 -2404,10 +2422,8 @@@ static struct amba_driver pl022_driv=
er
> =A0 =A0 =A0 =A0.id_table =A0 =A0 =A0 =3D pl022_ids,
> =A0 =A0 =A0 =A0.probe =A0 =A0 =A0 =A0 =A0=3D pl022_probe,
> =A0 =A0 =A0 =A0.remove =A0 =A0 =A0 =A0 =3D __devexit_p(pl022_remove),
> =A0- =A0 =A0 =A0.suspend =A0 =A0 =A0 =A0=3D pl022_suspend,
> =A0- =A0 =A0 =A0.resume =A0 =A0 =A0 =A0 =3D pl022_resume,
> =A0};
>
> -
> =A0static int __init pl022_init(void)
> =A0{
> =A0 =A0 =A0 =A0return amba_driver_register(&pl022_driver);
>



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
