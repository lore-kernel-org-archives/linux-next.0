From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: linux-next: build failure after merge of the slave-dma tree
Date: Mon, 24 Aug 2015 13:41:43 +0530
Message-ID: <20150824081143.GG13546@localhost>
References: <20150806122203.64e25587@canb.auug.org.au>
 <20150806030027.GS11789@localhost>
 <20150824065358.GC2413@lukather>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="j/HO4hzKTNbM1mOX"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:64139 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753694AbbHXIJd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 24 Aug 2015 04:09:33 -0400
Content-Disposition: inline
In-Reply-To: <20150824065358.GC2413@lukather>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>


--j/HO4hzKTNbM1mOX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2015 at 08:53:59AM +0200, Maxime Ripard wrote:
> > I am dropping this commit now, it need to be fixed to take into account
> > Cyrille work on remove tx_width and this patch should be updated to ref=
lect
> > that
>=20
> I'll send an updated version today, is there some time left for this
> to be part of 4.3?

Fortunately for you, Linus released rc8, so yes if you are quick we can sti=
ll
merge this

--=20
~Vinod


--j/HO4hzKTNbM1mOX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV2tG/AAoJEHwUBw8lI4NHbJMQAKVwZLPVsQT8raUO+eEn5LNR
wbxDfAiZdWyUdf7BwHg4oXNpl/sDik8KHb9OZU57dqc9r+fHgI7/BgtLctnH3hi/
7ra/Dhmsc3h/yEXSaNXpNkTNjxsTFp4uDk888/2D3oW8FEqpc4JkNl9rymzbT/s5
t/hJXZD1CjPD0s8bvAauaef8XbE/c3hOBtu+kYinrg44VAzI0auPaac/l000gxsf
sy50Soxi5tYn2xXbxOe8iD+Xg9yBTq4JnVmpF9d3ICz5g1TqRD3hUitd2pwpa9ks
wJujfbr8hI4fDn0dxRb8SztIvuKxv6YJDiEPY7Gl1KN6roHMZ4anDNT1qX2GKW0q
lmnd7W0vYlZ7l/DPQs9dYhDE1rUP7DTOoSdeAfTJhD+v82m2kPQ0AQJ7C2P4v2ab
KOZ0ZuzyxjuIvahKu9ANlH1YblD8LL8TXEbLGFP6UjoK1tQVGFGMsM9l+Q2p0XBr
rDYd34udM4SmbA7Qb8s6k9VxeI6vo9idl98NuEGaD2IKHPY5suhv52G6ga91ofKq
3cENIxYcwrsTYbPp5op+cLfL1rwHjNbc6Jrj3AHL/1pY/kc8q1VvlSw1Nqy+Bmc4
8zIhJjWNdXcVqQP4qgAnA/6Bz06V9xtWB4RFWs+g4JSit4MUrO1zWuJrBo3hxCD1
zwtSirzIRTD2dJ2/k4PX
=TFWY
-----END PGP SIGNATURE-----

--j/HO4hzKTNbM1mOX--
