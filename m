From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commits in the fscrypt tree
Date: Thu, 24 Jan 2019 17:37:18 +1100
Message-ID: <20190124173718.4549bf2a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/PqJ3JW9C9TX3.J89xb.cTXV"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Theodore Ts'o <tytso@mit.edu>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/PqJ3JW9C9TX3.J89xb.cTXV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Ted,

Commits

  f5e55e777cc9 ("fscrypt: return -EXDEV for incompatible rename or link int=
o encrypted dir")
  643fa9612bf1 ("fscrypt: remove filesystem specific build config option")
  62230e0d702f ("f2fs: use IS_ENCRYPTED() to check encryption status")
  592ddec7578a ("ext4: use IS_ENCRYPTED() to check encryption status")
  1058ef0dcb71 ("fscrypt: remove CRYPTO_CTR dependency")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/PqJ3JW9C9TX3.J89xb.cTXV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxJXR4ACgkQAVBC80lX
0GxrYAgAkcbm3Eb/XEyJB8m67F+dzJdl4MzHPTOWnr22BNSy7UFRG3ZmqHv6YTM9
hwPg3SdTwGb1J1UmngAr817xk5z0lbHhcnZLywjmVACI+aS4BoMCrBs5p6gc687Q
JiVV2wfTjF1tI4jmsAsdxn1tZu+D59Uq0hcdCXnj7yBmCf22Y1uZPCIfcFkxXLix
KbYT1zEHEdXsGjCEn/zqgtGq2Nufxoik2DsfJ5Lj/3Af7AV+4x2GziSoH46/ht/H
S68jJv9eToU5n19bIEk7VeI8cun391kZdw7Ab2b2pPn2MuT6eSknh4nMTEDK7Nul
j9LukzJV2eFienPV80XJznLz7s/hKA==
=Cfpm
-----END PGP SIGNATURE-----

--Sig_/PqJ3JW9C9TX3.J89xb.cTXV--
