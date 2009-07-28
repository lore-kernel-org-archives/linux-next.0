From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: drbd tree build failure
Date: Tue, 28 Jul 2009 14:19:07 +1000
Message-ID: <20090728141907.0d9fb648.sfr@canb.auug.org.au>
References: <20090727173754.6a04e781.sfr@canb.auug.org.au>
	<200907271109.33271.philipp.reisner@linbit.com>
	<a4423d670907270438n3e8f07caoa45124b1bd7b2386@mail.gmail.com>
	<200907271707.58733.philipp.reisner@linbit.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__28_Jul_2009_14_19_07_+1000_5=Q93C5E.CiE/6NJ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52531 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750829AbZG1ETM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 28 Jul 2009 00:19:12 -0400
In-Reply-To: <200907271707.58733.philipp.reisner@linbit.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Philipp Reisner <philipp.reisner@linbit.com>
Cc: Alexander Beregalov <a.beregalov@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Tue__28_Jul_2009_14_19_07_+1000_5=Q93C5E.CiE/6NJ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Philipp,

On Mon, 27 Jul 2009 17:07:58 +0200 Philipp Reisner <philipp.reisner@linbit.=
com> wrote:
>
> On Monday 27 July 2009 13:38:44 Alexander Beregalov wrote:
> > One more issue
> >
> > drivers/block/drbd/drbd_main.c: In function 'drbd_buildtag':
> > drivers/block/drbd/drbd_main.c:3738: error: dereferencing pointer to
> > incomplete type
>=20
> Ohh, right. I have never tried to build a kernel with the DRBD patch
> without CONFIG_MODULES set.
>=20
> It is fixed now.

Thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__28_Jul_2009_14_19_07_+1000_5=Q93C5E.CiE/6NJ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkpufDsACgkQjjKRsyhoI8zDsQCfQ59nbVSWYbPV1dugVWYQNxxY
80UAni/UXlytZMQPI5UYWVo8+6Ec0xkN
=ifz6
-----END PGP SIGNATURE-----

--Signature=_Tue__28_Jul_2009_14_19_07_+1000_5=Q93C5E.CiE/6NJ--
