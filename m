From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/5] dma: do not use 0x in front of %pad
Date: Tue, 8 Dec 2015 15:48:39 +0100
Message-ID: <20151208144839.GA24928@ulmo>
References: <1448916349-13564-1-git-send-email-krivenok.dmitry@gmail.com>
 <1448916349-13564-2-git-send-email-krivenok.dmitry@gmail.com>
 <565D6200.9070709@atmel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cWoXeonUoKmBZSoM"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f54.google.com ([74.125.82.54]:35302 "EHLO
	mail-wm0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752019AbbLHOsn (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 8 Dec 2015 09:48:43 -0500
Content-Disposition: inline
In-Reply-To: <565D6200.9070709@atmel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vinod Koul <vinod.koul@intel.com>
Cc: "Dmitry V. Krivenok" <krivenok.dmitry@gmail.com>, linux-kernel@vger.kernel.org, Nicolas Ferre <nicolas.ferre@atmel.com>, Wolfram Sang <wsa@the-dreams.de>, Ross Zwisler <ross.zwisler@linux.intel.com>, Dan Williams <dan.j.williams@intel.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, Ray Jui <rjui@broadcom.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, linux-next@vger.kernel.org


--cWoXeonUoKmBZSoM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 01, 2015 at 10:01:52AM +0100, Nicolas Ferre wrote:
> Le 30/11/2015 21:45, Dmitry V. Krivenok a =C3=A9crit :
> > Signed-off-by: Dmitry V. Krivenok <krivenok.dmitry@gmail.com>
>=20
> Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>
>=20
> > ---
> >  drivers/dma/at_hdmac_regs.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/dma/at_hdmac_regs.h b/drivers/dma/at_hdmac_regs.h
> > index 7f58f06..0474e4a 100644
> > --- a/drivers/dma/at_hdmac_regs.h
> > +++ b/drivers/dma/at_hdmac_regs.h
> > @@ -385,7 +385,7 @@ static void vdbg_dump_regs(struct at_dma_chan *atch=
an) {}
> >  static void atc_dump_lli(struct at_dma_chan *atchan, struct at_lli *ll=
i)
> >  {
> >  	dev_crit(chan2dev(&atchan->chan_common),
> > -		 "  desc: s%pad d%pad ctrl0x%x:0x%x l0x%pad\n",
> > +		 "  desc: s%pad d%pad ctrl0x%x:0x%x l%pad\n",
> >  		 &lli->saddr, &lli->daddr,
> >  		 lli->ctrla, lli->ctrlb, &lli->dscr);

Hi Vinod,

I think this ended up being misapplied, possibly because the patch
doesn't seem to have been based on something upstream. I got build
warnings during sanity builds of linux-next today and applied this
patch to fix them. Feel free to squash it into the original patch.

Thierry

--->8---
diff --git a/drivers/dma/at_hdmac_regs.h b/drivers/dma/at_hdmac_regs.h
index 610907dbc11a..0474e4a0f02a 100644
--- a/drivers/dma/at_hdmac_regs.h
+++ b/drivers/dma/at_hdmac_regs.h
@@ -386,8 +386,8 @@ static void atc_dump_lli(struct at_dma_chan *atchan, st=
ruct at_lli *lli)
 {
 	dev_crit(chan2dev(&atchan->chan_common),
 		 "  desc: s%pad d%pad ctrl0x%x:0x%x l%pad\n",
-		 lli->saddr, lli->daddr,
-		 lli->ctrla, lli->ctrlb, lli->dscr);
+		 &lli->saddr, &lli->daddr,
+		 lli->ctrla, lli->ctrlb, &lli->dscr);
 }

--cWoXeonUoKmBZSoM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWZu3DAAoJEN0jrNd/PrOhAm8QAJTkCBwM5HlZ7RvdU6XjRFJD
LEGgdvEq1VUlXKg7sjHjCx9hjpwvu/6aD/LmT38swjAMk6180oLFzBs9Wdd9GFCJ
+ZlboInrnq5kgiTjOYNT3/y9xAReDvtjr0OvdUb2n1BvDWpYfPz9mmszopI/61Bb
DP+2EW+76ks50ep+59aVbVtSJFPoXDjXHzk1OjmU/SLrk9Zw/pxQiSm2f/8PSXl0
Kvmlsiu/YTV/9e4RHPyEK4grn7ylESwMkNDV+4vyuO9ima/PgW0wkRpFP3A2Snde
B2HpGup4ZGwGtS93P18FjJSiRRxnhmLpXFaoAC7jzuJNa6nSd64viKxs6oLvtm50
wTMBWbGkEWE+iEA+c6HQW9zM9li9hTjqHAPC58I1htrfqoe030iNsm+MNSaKnA1S
7kGEEcBeKkWw2xENrDcxLwQSdsNaXzLteh3sAfvE0fL8i1UH6SGvdEUpKKVQvJGn
moTcYh+s7/frawnbQ4yT2nBVt/H7cj1ANnn9/kV1MAfre4uSRrMb0tJizVN41qCS
gskmgCh5KUAb1x70W+xeehK0xg3DwDqJJZ4HwKjgZqyWn72kDarhvZqacQO/HnOs
i9qJp4XJtQxvphQclXZArqpi38TILL4iSUWRs9xv6PJUUWxYJH8g1Axp/Yw3Bop3
qyoygcNDC82WPB6k0J2u
=T7C2
-----END PGP SIGNATURE-----

--cWoXeonUoKmBZSoM--
