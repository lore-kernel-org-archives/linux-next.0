From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH 1/5] dma: do not use 0x in front of %pad
Date: Tue, 8 Dec 2015 22:16:38 +0530
Message-ID: <20151208164637.GT1854@localhost>
References: <1448916349-13564-1-git-send-email-krivenok.dmitry@gmail.com>
 <1448916349-13564-2-git-send-email-krivenok.dmitry@gmail.com>
 <565D6200.9070709@atmel.com>
 <20151208144839.GA24928@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="K/NRh952CO+2tg14"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:38170 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932402AbbLHQny (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Dec 2015 11:43:54 -0500
Content-Disposition: inline
In-Reply-To: <20151208144839.GA24928@ulmo>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: "Dmitry V. Krivenok" <krivenok.dmitry@gmail.com>, linux-kernel@vger.kernel.org, Nicolas Ferre <nicolas.ferre@atmel.com>, Wolfram Sang <wsa@the-dreams.de>, Ross Zwisler <ross.zwisler@linux.intel.com>, Dan Williams <dan.j.williams@intel.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, Ray Jui <rjui@broadcom.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, linux-next@vger.kernel.org


--K/NRh952CO+2tg14
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 08, 2015 at 03:48:39PM +0100, Thierry Reding wrote:
> On Tue, Dec 01, 2015 at 10:01:52AM +0100, Nicolas Ferre wrote:
> > Le 30/11/2015 21:45, Dmitry V. Krivenok a =E9crit :
> > > Signed-off-by: Dmitry V. Krivenok <krivenok.dmitry@gmail.com>
> >=20
> > Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>
> >=20
> > > ---
> > >  drivers/dma/at_hdmac_regs.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/dma/at_hdmac_regs.h b/drivers/dma/at_hdmac_regs.h
> > > index 7f58f06..0474e4a 100644
> > > --- a/drivers/dma/at_hdmac_regs.h
> > > +++ b/drivers/dma/at_hdmac_regs.h
> > > @@ -385,7 +385,7 @@ static void vdbg_dump_regs(struct at_dma_chan *at=
chan) {}
> > >  static void atc_dump_lli(struct at_dma_chan *atchan, struct at_lli *=
lli)
> > >  {
> > >  	dev_crit(chan2dev(&atchan->chan_common),
> > > -		 "  desc: s%pad d%pad ctrl0x%x:0x%x l0x%pad\n",
> > > +		 "  desc: s%pad d%pad ctrl0x%x:0x%x l%pad\n",
> > >  		 &lli->saddr, &lli->daddr,
> > >  		 lli->ctrla, lli->ctrlb, &lli->dscr);
>=20
> Hi Vinod,
>=20
> I think this ended up being misapplied, possibly because the patch
> doesn't seem to have been based on something upstream. I got build
> warnings during sanity builds of linux-next today and applied this
> patch to fix them. Feel free to squash it into the original patch.

I have dropped that one and pushed updated tree few moments back !

--=20
~Vinod

>=20
> Thierry
>=20
> --->8---
> diff --git a/drivers/dma/at_hdmac_regs.h b/drivers/dma/at_hdmac_regs.h
> index 610907dbc11a..0474e4a0f02a 100644
> --- a/drivers/dma/at_hdmac_regs.h
> +++ b/drivers/dma/at_hdmac_regs.h
> @@ -386,8 +386,8 @@ static void atc_dump_lli(struct at_dma_chan *atchan, =
struct at_lli *lli)
>  {
>  	dev_crit(chan2dev(&atchan->chan_common),
>  		 "  desc: s%pad d%pad ctrl0x%x:0x%x l%pad\n",
> -		 lli->saddr, lli->daddr,
> -		 lli->ctrla, lli->ctrlb, lli->dscr);
> +		 &lli->saddr, &lli->daddr,
> +		 lli->ctrla, lli->ctrlb, &lli->dscr);
>  }


--K/NRh952CO+2tg14
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWZwltAAoJEHwUBw8lI4NH85QP/0RXc42ud6vc/tEZtnpHiMuC
jyD8KN1YEfXYv5zodiY9L6XlPU7J4shcm7q7i5eV1GiAAT81llh5JUcm3pe21tPN
ikP9cW4wHLSC9cwhHyJY88vM1ifaDzGKorI26rkjF3+9UlYITmPXQf7nQUUFcU2H
tl/P6BTIrewkf/Wj2Bc69aAxB1h7zJXqn8w6IM8fOOAaui6Q40dusNbHnf+BDu91
IZXm3PBGb2uTfbd+BQ8b54HHmFwAAIWGkCO8Hk/QKXodTQmFKX2utrfzdd92nH4O
vw3xfpH6fqzR0Vv5EmN7Th2vhIIvlDoHNMUNTeBggRX+y5I55HeugwvrqogfZluf
rbJf6i6CaRE5P1E79vYvc+Pg/IaAMxh41SJNXzqYnkbNNxC3SmC2wAg3tqDcNRpZ
MRimWWsTyOAzO4cpAEQ2VEO2VMMWl+eGVqQDMbKqAjBNQ4zVmW3jhxQiUUQD1NfO
5mMAwtgokhq9BksHFrq0cSP3ZgNvEc+xmqHRhiKHH+8Hlul2XZ4MBtWZQjaKq1r4
pel30cE5FcVEfphG9N+f8njG/opMm4tAXA75fXhYvtiD8QmoL16jYqOLWB9Vhkdq
f9obx+R4leVbbSt21XsKcjyajzDbyPjLoS/M5FSix4i55oEkvMKijkrimSbusBnp
tRyK1tB9Ty9Nrv/6djSd
=5hg7
-----END PGP SIGNATURE-----

--K/NRh952CO+2tg14--
