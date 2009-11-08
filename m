From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: limits tree fetch failure
Date: Mon, 9 Nov 2009 10:30:17 +1100
Message-ID: <20091109103017.6099f588.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__9_Nov_2009_10_30_17_+1100_MHp0RoHFRrGQ0/Pg"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1752036AbZKHXaU@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiri Slaby <jirislaby@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Signature=_Mon__9_Nov_2009_10_30_17_+1100_MHp0RoHFRrGQ0/Pg
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jiri,

Today's linux-next fetch of the limits tree produced this error:

decibel.fi.muni.cz[0: 147.251.50.163]: errno=3DConnection timed out
fatal: unable to connect a socket (Connection timed out)

I will use the version of the tree from next-20091106.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__9_Nov_2009_10_30_17_+1100_MHp0RoHFRrGQ0/Pg
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkr3VIkACgkQjjKRsyhoI8xbiQCZATCwInQUKOLAjLJvLBgIn0ty
i7cAoIsPL8JqIVnqaNGVZ18+andf8SCV
=CgtD
-----END PGP SIGNATURE-----

--Signature=_Mon__9_Nov_2009_10_30_17_+1100_MHp0RoHFRrGQ0/Pg--
