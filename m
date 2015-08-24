From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: linux-next: build failure after merge of the slave-dma tree
Date: Mon, 24 Aug 2015 08:53:59 +0200
Message-ID: <20150824065358.GC2413@lukather>
References: <20150806122203.64e25587@canb.auug.org.au>
 <20150806030027.GS11789@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GPJrCs/72TxItFYR"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150806030027.GS11789@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>
List-Id: linux-next.vger.kernel.org


--GPJrCs/72TxItFYR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Vinod,

On Thu, Aug 06, 2015 at 08:30:27AM +0530, Vinod Koul wrote:
> On Thu, Aug 06, 2015 at 12:22:03PM +1000, Stephen Rothwell wrote:
> > Hi Vinod,
> >=20
> > After merging the slave-dma tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this:
> >=20
> > drivers/dma/at_hdmac.c: In function 'atc_prep_dma_memset':
> > drivers/dma/at_hdmac.c:960:6: error: 'struct at_desc' has no member nam=
ed 'tx_width'
> >   desc->tx_width =3D 2;
> >       ^
> >=20
> > Caused by commit
> >=20
> >   25fed8c2fff1 ("dmaengine: hdmac: Add memset capabilities")
> >=20
> > interacting with commit
> >=20
> >   93dce3a6434f ("dmaengine: at_hdmac: fix residue computation")
> Thanks Stephen,
>=20
> I am dropping this commit now, it need to be fixed to take into account
> Cyrille work on remove tx_width and this patch should be updated to refle=
ct
> that

I'll send an updated version today, is there some time left for this
to be part of 4.3?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--GPJrCs/72TxItFYR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV2r+GAAoJEBx+YmzsjxAgfAMP/j61sCD9t5A0p2tZ1MpoHL9A
FxWPITg+hvU1rVYPEWWMYcsI54v6cLFApR1e0jfqW68VBsoKKSfhE0yRyX96RrYf
xH/BMS2xJ8DQUh4n0CDVQaJiun7ryelMuQLsaZOkwH58BEMfCEyIir7Zusi2kI1n
og/dhUiZvSZtIMPALneQhPJDQspme5+GKZZzl0OK2Xs0/YPJLRC6UUKDO21wVI91
jOd+6S4hTc0pq3Tv+eVNBXiebG7BEXL9hs3WhxOgwBIj7KTH+h24dJglZ4xTH8KP
Hu73CpT3tShHnPSIqPt7CqYTJVkIElot9wYwuJrbXE5ji47NrwY72XUfiMDi5h7s
nPv7vLvPfmY6YHOxGxAh7kKxyRYb4II9QUMR4pinZYGGCUFvRoDXWs0DXSgr2NZ0
0sWVfd5doJHERAqALIS31CvmGU/w9nLsykQDZlFnewtRVwp96jhy0RusugMB40QM
znC6ut4qGsU2zglczueiUAwBJ0v90st7gOc2O9yZ9rac3oD3PWzWWRoW9pK/B7gK
0roV9a4l5dEy+QFQ+XUtMwUELdMk2OhasnNBBawJUPLRboUBOBE2pthlcYOLMN82
8m7nH0nqcE5lwPT37Gb9aOzn4X5vZlCm8RqRVVqDP1IIQLXDBv82Loq63JgMhn3q
h7I6pFZPqEqOuFJ7Gp4h
=A2y5
-----END PGP SIGNATURE-----

--GPJrCs/72TxItFYR--
