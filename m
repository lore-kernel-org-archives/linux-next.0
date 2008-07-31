From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the m68k tree
Date: Thu, 31 Jul 2008 17:21:11 +1000
Message-ID: <20080731172111.9f7acf5d.sfr@canb.auug.org.au>
References: <20080731140557.a9c66bb3.sfr@canb.auug.org.au>
	<Pine.LNX.4.64.0807310900540.10810@anakin>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__31_Jul_2008_17_21_11_+1000_lO7I.dcH2J+gLH0="
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53277 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752443AbYGaHVS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 31 Jul 2008 03:21:18 -0400
In-Reply-To: <Pine.LNX.4.64.0807310900540.10810@anakin>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-next@vger.kernel.org

--Signature=_Thu__31_Jul_2008_17_21_11_+1000_lO7I.dcH2J+gLH0=
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Thu, 31 Jul 2008 09:02:17 +0200 (CEST) Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
>
> On Thu, 31 Jul 2008, Stephen Rothwell wrote:
> > Today's linux-next merge of the m68k tree got a conflict in init/main.c
>=20
> Sorry, still haven't updated my queue after OLS...

S'ok.

> > between commit bd673c7c3b1681dbfabab0062e67398dadf806af ("initrd: cast
> > `initrd_start' to `void *'") from Linus' tree and commit
> > d9c4ef589d1eda15333fb3d307bf4df85337820a ("initrd: Fix virtual/physical
> > mix-up in overwrite test") from the m68k tree (which is also in Linus'
> > tree).
>=20
> Interesting, so git didn't notice that my version got merged, and an
> additional patch was applied on top?

No, it noticed that the particular lines in that file got changed
differently by both sides of the merge.  It doesn't notice that Linus'
tree and your tree changed it the same and then Linus' tree changed it
again.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__31_Jul_2008_17_21_11_+1000_lO7I.dcH2J+gLH0=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiRZ+cACgkQjjKRsyhoI8wP4gCfYhGGRBtWFnyccrLUj6XkbGt4
OqMAoJF5JMkvn2Ed0q358CMofaffksuj
=RF5m
-----END PGP SIGNATURE-----

--Signature=_Thu__31_Jul_2008_17_21_11_+1000_lO7I.dcH2J+gLH0=--
