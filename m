From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: limits tree fetch error
Date: Thu, 21 Jan 2010 10:19:28 +1100
Message-ID: <20100121101928.014ae274.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__21_Jan_2010_10_19_28_+1100_DzJqq+zptXBlTPYL"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753769Ab0ATXTi@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiri Slaby <jirislaby@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Signature=_Thu__21_Jan_2010_10_19_28_+1100_DzJqq+zptXBlTPYL
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jiri,

Today's linux-next fetch of the limits tree produced this error:

decibel.fi.muni.cz[0: 147.251.50.163]: errno=3DConnection timed out
fatal: unable to connect a socket (Connection timed out)

Just letting you know.  I will use the tree from yesterday.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__21_Jan_2010_10_19_28_+1100_DzJqq+zptXBlTPYL
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktXj4AACgkQjjKRsyhoI8wlAgCgiwGZp2TO87yl6oV7tFYtNFmC
BNoAoI81StsfYLvhlC8NjWtCP9I5OmaR
=PRjV
-----END PGP SIGNATURE-----

--Signature=_Thu__21_Jan_2010_10_19_28_+1100_DzJqq+zptXBlTPYL--
