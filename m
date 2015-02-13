From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mips tree with Linus'  tree
Date: Fri, 13 Feb 2015 11:11:50 +1100
Message-ID: <20150213111150.528da7cf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/n8b.VdvB.CcO0_z3nNFB83J"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57699 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750992AbbBMAL5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Feb 2015 19:11:57 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, James Cowgill <James.Cowgill@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>

--Sig_/n8b.VdvB.CcO0_z3nNFB83J
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Ralf,

Today's linux-next merge of the mips tree got a conflict in
arch/mips/kernel/elf.c between commit fd75a33e0002 ("MIPS: ELF: fix
loading o32 binaries on 64-bit kernels") from Linus' tree and commit
d8fb6537f1d4 ("MIPS: kernel: elf: Improve the overall ABI and FPU mode
checks") from the mips tree.

I fixed it up (the latter seems to be a superset of the former) and can
carry the fix as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/n8b.VdvB.CcO0_z3nNFB83J
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU3UFLAAoJEMDTa8Ir7ZwVny8P/1/em+E1+xB2of3k9sR8c6Vd
/hlIGVm/kY5LuXnOIKIs+IGppY+fESnH4em2+UL7XHI8MDg6mtS5Ug9NlOItFNJV
K/82OMKazh4D+cbB6noGSIKrxE9yNDc/N8jlXC+ek/5RySlI1fieFejrNEf5Nbwm
bN47lPOMqml6zqs6jZJtU6lqbJFLvJAho8Yrb/BQlsIb2KvEQocFrGRiPLVQd23m
92uCF5ETtECUX9WI3rBON1rGGx7V8fjYpjPjZqkoNsr8OK0tdlFj1BmY8nQO2TSe
WW0maiVgTeNI+mP95Uqg3yymLAQNtt6BlCDIcFHCSfwPzHOKsprJ5q+u4VSetgns
itLd3wCXD+Sk6fyZo9XwCws9hZevtdTrsXV1LppcxgB2c4H3NHXhEnwlSTN7q12P
RI4rtyneJp3pZ5qGMODJh1xjpr0VT98o2LSUzXXMvrcJ7kQaUvRk/5YYqoh5YWnI
+5jPMIClKKiulO5zQRWWAVDEW8a3pUp5unBjjw4FQTFJPy7nR3eWVGmplHAJNeP0
TqPA9BALiROMpLPyNfa6R42J4tCEKVfxeHf9tTjFKvdyM/AINv3JgfAnUUoV90Mb
n7Dpc5FFaxRil858X59O6t5x/+KXQ9ega2JB5VnTXGnGV9MaW1NZDAzYBtXE7kca
de7945BdQEO2nDYzBKRT
=P8rF
-----END PGP SIGNATURE-----

--Sig_/n8b.VdvB.CcO0_z3nNFB83J--
