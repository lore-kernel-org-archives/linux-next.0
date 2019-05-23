From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commits in the block tree
Date: Fri, 24 May 2019 07:45:00 +1000
Message-ID: <20190524074500.1fde68d6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/y52rQ8z3mv4S7FteBgWEXIL"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Keith Busch <keith.busch@intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/y52rQ8z3mv4S7FteBgWEXIL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  5fb4aac756ac ("nvme: release namespace SRCU protection before performing =
controller ioctls")
  90ec611adcf2 ("nvme: merge nvme_ns_ioctl into nvme_ioctl")
  3f98bcc58cd5 ("nvme: remove the ifdef around nvme_nvm_ioctl")
  100c815cbd56 ("nvme: fix srcu locking on error return in nvme_get_ns_from=
_disk")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/y52rQ8z3mv4S7FteBgWEXIL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlznFFwACgkQAVBC80lX
0GxJDwf+LIxpoR/eFcibFlWjjBAc2m0IQd6BX0EANi8555org0lHg3NcfLOaWpOZ
zppotatVeqqhFv2prL/VbWPnkM9GsMIS+HRvln6m57rPw2l2L1a5WOBsLmToqUpP
+YToAqakRbAWJ9EuU041AMoDyc8kbOLohDsgIYBpxM9gKKhT1g8jjSEmHE9/3sBM
gI2/d7DZhcxO0jCvGFoxqzAIRpwCGk+TnQUwRz30C2ywxcaSxlnk7IWrIb17gPSg
Ro9C5n0FzwsJCmQSzPD1RQvwqQQmUZnSLga+2TDvnCHE234Q289KCarioshTQH/5
MbmENvJTYnL/douFsSfAZcHuvp7Fig==
=OivL
-----END PGP SIGNATURE-----

--Sig_/y52rQ8z3mv4S7FteBgWEXIL--
