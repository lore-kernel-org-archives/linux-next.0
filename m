From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the scsi tree
Date: Fri, 31 May 2019 13:36:12 +1000
Message-ID: <20190531133612.35276ad9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/PzGjbrYAwJiDIyGlEKhqImh"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tyrel Datwyler <tyreld@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>
List-Id: linux-next.vger.kernel.org

--Sig_/PzGjbrYAwJiDIyGlEKhqImh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the scsi tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

drivers/scsi/ibmvscsi/ibmvscsi.c: In function 'ibmvscsi_work':
drivers/scsi/ibmvscsi/ibmvscsi.c:2151:5: warning: 'rc' may be used uninitia=
lized in this function [-Wmaybe-uninitialized]
  if (rc) {
     ^
drivers/scsi/ibmvscsi/ibmvscsi.c:2121:6: note: 'rc' was declared here
  int rc;
      ^~

Introduced by commit

  035a3c4046b5 ("scsi: ibmvscsi: redo driver work thread to use enum action=
 states")

--=20
Cheers,
Stephen Rothwell

--Sig_/PzGjbrYAwJiDIyGlEKhqImh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzwoSwACgkQAVBC80lX
0Gxn/gf9FlLUU9ikAUgDlMtJ/iwMNIAVIgV/ln5dZu9OiAVUwZVt27mSHvggZT15
xNVKD7BbzI5wRt3KbdEDXgvWRlmIYwwMR4ZmlqItLrEi4iYPIRE+pI0pBgfF5/hu
WTedkH1L8OG4Yt45Ty3kgLxkH2U2gdx0MM4lxa5FWtgkqwUOh+vXVTKB/MrpX2Kx
i369MQwbSdR+EFD2TPJokBqxrYjsQeHN+YYSTgCtldW/idNP4fxMuYkbcaLxF4yS
X4cuTQwC77E8h/eMhIEC6avEkoY4HYda4vIlHSjFycZ5CnoBw29d+O5YGJ0Py0/5
AeN1N0+/LHFXX3evKKzYPWPT+4rjKw==
=a1s0
-----END PGP SIGNATURE-----

--Sig_/PzGjbrYAwJiDIyGlEKhqImh--
