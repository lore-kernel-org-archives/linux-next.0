From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [BUILD-FAILURE] linux-next: Tree for June 24 - missing files in
 drivers/media/dvb/
Date: Wed, 25 Jun 2008 13:28:10 +1000
Message-ID: <20080625132810.6f31b571.sfr@canb.auug.org.au>
References: <20080624175612.cdf29651.sfr@canb.auug.org.au>
	<486134B4.4050400@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__25_Jun_2008_13_28_10_+1000_cFTsZbTzvxarKg5="
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751793AbYFYD2n@vger.kernel.org>
In-Reply-To: <486134B4.4050400@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-testers@vger.kernel.org, v4l-dvb-maintainer@linuxtv.org, Andy Whitcroft <apw@shadowen.org>
List-Id: linux-next.vger.kernel.org

--Signature=_Wed__25_Jun_2008_13_28_10_+1000_cFTsZbTzvxarKg5=
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

On Tue, 24 Jun 2008 23:23:56 +0530 Kamalesh Babulal <kamalesh@linux.vnet.ib=
m.com> wrote:
>
> allyesconfig kernel build on next-20080624, fails due to missing files
>=20
> drivers/media/video/em28xx/em28xx-dvb.c:30:22: error: drx397xD.h: No such=
 file or directory

To fix this, I have reverted commit
969ff74e0ab707801150dc83eb254794bc574442 ("V4L/DVB (8006): em28xx: Split
HVR900 into two separate entries") from linux-next for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__25_Jun_2008_13_28_10_+1000_cFTsZbTzvxarKg5=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhhu0oACgkQTgG2atn1QN8+NQCdE+oaqJGJd3jGbtPSbRMMWNmR
ZCsAn3OC4BsVitvnlZSAGQgKG08uDHzL
=68nr
-----END PGP SIGNATURE-----

--Signature=_Wed__25_Jun_2008_13_28_10_+1000_cFTsZbTzvxarKg5=--
