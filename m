From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the scsi tree
Date: Fri, 5 Apr 2019 14:25:10 +1100
Message-ID: <20190405142347.1f264cdf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/qG1lbi3eneWefH0rN68cbG3"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bart Van Assche <bvanassche@acm.org>, "Martin K. Petersen" <martin.petersen@oracle.com>
List-Id: linux-next.vger.kernel.org

--Sig_/qG1lbi3eneWefH0rN68cbG3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi James,

After merging the scsi tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

drivers/scsi/lpfc/lpfc_nvme.c:2140:1: warning: 'lpfc_nvme_lport_unreg_wait'=
 defined but not used [-Wunused-function]
 lpfc_nvme_lport_unreg_wait(struct lpfc_vport *vport,
 ^~~~~~~~~~~~~~~~~~~~~~~~~~

Introduced by commit

  3999df75bccb ("scsi: lpfc: Declare local functions static")

It use is guarded by IS_ENABLED(CONFIG_NVME_FC).

--=20
Cheers,
Stephen Rothwell

--Sig_/qG1lbi3eneWefH0rN68cbG3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlymypYACgkQAVBC80lX
0Gw9Qwf+PcECZy9lorHevXKLfXYKO0tk7/o2Q3/5l6jBl+G5QmsK7MwZbjHvu1pf
7bXNjYtE+HZnwMDQGFxiYQwa/X2cUmXRj92YcJT62AZjy+uRyxrjjvHxkSKNziYW
7djP+G9pxzuMfXDhmVsac9K3kDx1p+12Ii1mSQgm0ZI5au+X+Ic7U5KEbOcS+KtH
OzCW882RqKvVMpfurHq8NgI18IcNxMx8uY+sQdMjYYSIo8GZLf1Qx9k0uo3y6B5j
RZDMZBGzUI1w4I6mtjmK7NT2zPrZvGGpWSQqfmBubFU+z3g1DEqT/dJBOhJ9cBFX
BPfezKbTGo7k+sK62tmqP0OPA+hrjg==
=w1Bb
-----END PGP SIGNATURE-----

--Sig_/qG1lbi3eneWefH0rN68cbG3--
