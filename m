From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the risc-v tree
Date: Thu, 9 May 2019 07:47:45 +1000
Message-ID: <20190509074745.65336288@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/JuVz_E.gihc1z=sUgwxe/Hl"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/JuVz_E.gihc1z=sUgwxe/Hl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  da8e7c379659 ("riscv: Support BUG() in kernel module")
  564bd22ea4e5 ("riscv: Add the support for c.ebreak check in is_valid_buga=
ddr()")
  67363778b72c ("riscv: support trap-based WARN()")
  efd48cf0b393 ("riscv: fix sbi_remote_sfence_vma{,_asid}.")
  89f7840cf346 ("riscv: move switch_mm to its own file")
  8c0e1593f15d ("riscv: move flush_icache_{all,mm} to cacheflush.c")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/JuVz_E.gihc1z=sUgwxe/Hl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzTToEACgkQAVBC80lX
0GwWjwf4wB2YFLNTSbr42lg6yvdodtwSa1b1gHnaFmD8hyc652cB3pgpoZ0fXR8o
284nZ1WomaqkemWG8hysMSJ6cEM8wU7aTWPkDkI+LdVAoGcsTuPMgTjT+cd09Eac
cRZTO8YQ9H5nUfmka5yOrUKCvkTUhBdQBJafOo9hZx56lkcojI7utGS0kSfeCDvN
P0jfDXdZNsqNTzys6lhCiwcZxD0+nmbn2Vh6CTNdH7o3OVOqm/XEy4EPQcpLSXZB
XYsEjANDK3W2VSZ1RY6mQ48Eaz3k5x+MTxAUZIFsjch9c6FOUk+nyE5lQROPoIoF
cOW51aynJXYlsUT0onQyXH58AUht
=ca2D
-----END PGP SIGNATURE-----

--Sig_/JuVz_E.gihc1z=sUgwxe/Hl--
