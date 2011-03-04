From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the v4l-dvb tree
Date: Fri, 4 Mar 2011 16:38:49 +1100
Message-ID: <20110304163849.651cfbbe.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__4_Mar_2011_16_38_49_+1100_P1D9p2viBeskIjHJ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@redhat.com>, Timo von Holtz <tvh@informatik.uni-kiel.de>, Alan Cox <alan@linux.intel.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Fri__4_Mar_2011_16_38_49_+1100_P1D9p2viBeskIjHJ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in
drivers/staging/usbvideo/vicam.c between commit
af6302700e87a883481c342001ef81b77641bf98 ("[media] staging-usbvideo:
remove") from the v4l-dvb tree and commits
046d747e0d2cb597e0b6fa4a79c32b43e97ed792 ("Staging: usbvideo: vicam:
fixed some coding style issues") and
38a26ef272d8a93c88de54d8d3bd14ac3ce36056 ("staging: usbvideo: vicam: Fix
build in -next") from the staging tree.

I removed the file.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__4_Mar_2011_16_38_49_+1100_P1D9p2viBeskIjHJ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJNcHrpAAoJEDMEi1NhKgbsPzoH/AnWCi/H55/wKzoTRUPvB+Co
NLLvhew7/pwDW5qZNosZoZlDDdjjtdQ0ugrR3EIynhXfqMuYex7mgB7fcrY0yemH
n7FTiTETYAw/XRAiUtAdsM5NeirkNG0Ots4LAVkch5ieXW8WqfeEIp4PuvdRRw0s
vgc18f+/utmYGHaYilBxq8JcoB+V6DVf1s1sjc+3zf3LnPBkZTsDxDp3LjM/TchR
uxl3m+z7cGpBGQ7yfhb9Nmu4xu5uzRadhd0W6M9P4d+mh1ZqhefCJFLZzy/g0NIa
L7YvrKiTSCNu9PGzvY6lWd40HppoYbRKOqZknMtBzl03UOoOcDzsX/XnGGCQjlU=
=voAM
-----END PGP SIGNATURE-----

--Signature=_Fri__4_Mar_2011_16_38_49_+1100_P1D9p2viBeskIjHJ--
