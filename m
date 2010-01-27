From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: v4l-dvb tree build warning
Date: Wed, 27 Jan 2010 12:12:23 +1100
Message-ID: <20100127121223.9af2253f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__27_Jan_2010_12_12_23_+1100_TkUMWjiQFE.xN7G2"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755407Ab0A0BMg@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Theodore Kilgore <kilgota@banach.math.auburn.edu>, Hans de Goede <hdegoede@redhat.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Wed__27_Jan_2010_12_12_23_+1100_TkUMWjiQFE.xN7G2
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

Today's linux-next build (x86_64 allmodconfig) produced this warning:

drivers/media/video/gspca/sq905c.c: In function 'sd_config':
drivers/media/video/gspca/sq905c.c:207: warning: unused variable 'i'

Introduced by commit 6436e86d8920520f6650bedaa816ed596c7c30b7 ("V4L/DVB
(14006): gscpa_sq905c: Better detection of CIF resolution cameras").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__27_Jan_2010_12_12_23_+1100_TkUMWjiQFE.xN7G2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktfkvcACgkQjjKRsyhoI8y8XgCgt8onB0Z1IzSfAGD2VYO/Oy8c
kJkAn0ydsAE4/nHSA9EwiDC34iYrkFMD
=vIRu
-----END PGP SIGNATURE-----

--Signature=_Wed__27_Jan_2010_12_12_23_+1100_TkUMWjiQFE.xN7G2--
