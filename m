From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the integrity tree
Date: Tue, 17 Jul 2018 14:40:38 +1000
Message-ID: <20180717144038.50394022@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ai.jCjB9ONn6CD0SP3vdnNf"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mimi Zohar <zohar@linux.vnet.ibm.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, James Morris <jmorris@namei.org>
List-Id: linux-next.vger.kernel.org

--Sig_/ai.jCjB9ONn6CD0SP3vdnNf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the integrity tree, today's linux-next build (x86_64
allmodconfig) failed like this:

security/integrity/ima/ima_main.c:549:5: error: redefinition of 'ima_load_d=
ata'
 int ima_load_data(enum kernel_load_data_id id)
     ^~~~~~~~~~~~~
security/integrity/ima/ima_main.c:506:5: note: previous definition of 'ima_=
load_data' was here
 int ima_load_data(enum kernel_load_data_id id)
     ^~~~~~~~~~~~~

Caused by commit

  4995c7ac4490 ("ima: based on policy require signed kexec kernel images")

interacting with commit

  16c267aac86b ("ima: based on policy require signed kexec kernel images")

from the sceurity tree.

Basically the same set of patches are in the security tree and the
integrity tree as different commits.  The merge managed to add this
function twice.  I have added a patche to remove one copy of the function.

Please clean up the integrity tree relative to the security tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/ai.jCjB9ONn6CD0SP3vdnNf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltNc0YACgkQAVBC80lX
0Gz+lQgAj/zzeIaU8cXZQesXXSczjGxfPtCv1HNJhy4NRVNh6Zcn1fXI7SRNvZEr
UMBIz68eF2h1xFfcU3SerzAZth8LJ0m5BiW2RueJT++y8ZnqaasBZpWVSCNOOIfC
bv4P3z2/b7u9TaqMiEOTrXGQz9mFsxDWGNCHRTSMZVxvd2ILK0s03ZXlKxBWaC2A
/PmUztfQP2A14BLjMLradzY6RH0qOWVeotZsZPSd0uIc9A+kyc0SspANJl3piNUk
SvgJ6kLAeoAxIZKwExD5qrGJYaAFMafpZuQmymEyZ1VDmupszO9PpOP0CTEvdmwR
1P4oXE1vFDDMmhYxZDPZxGpyv9k+MA==
=w+ya
-----END PGP SIGNATURE-----

--Sig_/ai.jCjB9ONn6CD0SP3vdnNf--
