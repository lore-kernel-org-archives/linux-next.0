From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the usb tree with the arm tree
Date: Tue, 4 Jan 2011 16:07:08 +1100
Message-ID: <20110104160708.770eb1e2.sfr@canb.auug.org.au>
References: <20110104155843.f65f0bcd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__4_Jan_2011_16_07_08_+1100_CH/mJYH_BX5gPX.I"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50441 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751069Ab1ADFHP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 4 Jan 2011 00:07:15 -0500
In-Reply-To: <20110104155843.f65f0bcd.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mac Lin <mkl0301@gmail.com>, Anton Vorontsov <cbouatmailru@gmail.com>, Russell King <rmk@arm.linux.org.uk>

--Signature=_Tue__4_Jan_2011_16_07_08_+1100_CH/mJYH_BX5gPX.I
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Tue, 4 Jan 2011 15:58:43 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the usb tree got a conflict in
> drivers/usb/host/ehci-hcd.c between commit
> 760efe6910d5743084b586d3d0a3b65aea96fb2f ("USB: cns3xxx: Add EHCI and
> OHCI bus glue for cns3xxx SOCs") from the arm tree and various commits
> from the usb tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary.

The fix was not quite right (I left out a "#endif") - I fixed that up.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__4_Jan_2011_16_07_08_+1100_CH/mJYH_BX5gPX.I
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJNIqr8AAoJEDMEi1NhKgbsnBMH/jFTMqvzw6PGiuiPhWqO4W9l
2d9F1KnYnjGuUVPGl2dIS5nbYcP1ETLPf4lyJsIs8qRID5mh9GjfZM4gMAhdW+21
ySSfzKBHUN95u06WRbI3SoW1aebGBO1Fb6qGpG9IegkDe239SNXNJbpLh+Ai7aWT
GYMz4g+6HOh4yuqEQ8UThc2BNL2eVxIuPJs2zcLhWYg47Vt1oP4Un4loqW4KBl0f
Tj/eTXersumIHcrYWL0l+VXuOG2/+dt+J+i5ks0ML6V5yJZCejiH5Vs7GfuhDSo7
SDdS6RffVXLSVs/rVYAkOb5D3UGzlHFkBpBjJKPLPM3sjYTe3zMSFVV+mOcaYV8=
=DorP
-----END PGP SIGNATURE-----

--Signature=_Tue__4_Jan_2011_16_07_08_+1100_CH/mJYH_BX5gPX.I--
