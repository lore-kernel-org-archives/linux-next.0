From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the scsi tree
Date: Fri, 27 May 2011 13:25:11 +1000
Message-ID: <20110527132511.20174ce1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__27_May_2011_13_25_11_+1000_/y.FS1fG6MT7hoQx"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Signature=_Fri__27_May_2011_13_25_11_+1000_/y.FS1fG6MT7hoQx
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi James,

After merging the scsi tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: "blk_put_queue" [drivers/scsi/scsi_mod.ko] undefined!
ERROR: "blk_get_queue" [drivers/scsi/scsi_mod.ko] undefined!

Caused by commit 069a596c12ca ("[SCSI] Fix oops caused by queue
refcounting failure").

I have used the scsi tree from next-20110526 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__27_May_2011_13_25_11_+1000_/y.FS1fG6MT7hoQx
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJN3xmXAAoJEDMEi1NhKgbsFXkH/RwjqY0d92AU+AA9qKK5ZRYW
Ww2rHEZswq8UQAF1OzrdVu12oqnW7XHNAEgjspGU4ulwn8I/e0V4SujvFXQAsyHu
fDF6pdt0fX50dfIPUcEJN0PjD7wg7c4boh+MKukVbuG4r85mUsdNCpfcjji5zpIW
o6ayNY3lHEzXajHglvrHTJ8aZ0/Q1oJpAjtNaMNInGRMnzmdePcHmGdabIiLd+WM
k9FzClddPhPrRo/oKDpgsrQ41bz7sZcnKG9iBw82Smrj7aqzPMTIdxKjAN5lfVbs
POnO1J1p8ZQyasokDXOHe4U3UFcYPnBMAWZEFPgimD1amMqgdGIj7DlLa8ozgm0=
=xtKe
-----END PGP SIGNATURE-----

--Signature=_Fri__27_May_2011_13_25_11_+1000_/y.FS1fG6MT7hoQx--
