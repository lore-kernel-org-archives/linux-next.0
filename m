From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the powerpc tree
Date: Sun, 24 Feb 2019 01:05:11 +1100
Message-ID: <20190224010511.74f25272@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ioXh4QPO9VkP60je8D=8ArN"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/ioXh4QPO9VkP60je8D=8ArN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  f68e7927212f ("Revert "powerpc/book3s32: Reorder _PAGE_XXX flags to simpl=
ify TLB handling"")

is missing a Signed-off-by from its author and committer.

Reverts are commits as well :-)

--=20
Cheers,
Stephen Rothwell

--Sig_/ioXh4QPO9VkP60je8D=8ArN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxxUxcACgkQAVBC80lX
0Gxx5Qf7BnKPha2u1xMJBx5xoklk9av9LFuDOse22ee8m4nznWE7QxBicgMNy6Yp
OoKA+h31QqtB/QRbd13uJoAaO3oP4ou+IpXfKao3tNolnP3SlYhQ8f4SEeLH4FlZ
9RUC9Ej3iBCyBfx3Xr64vkUp3U9BaCuIxyPl1/c8NBAd9qAZb2zBZyhz8HpIEEVv
arZ4m6TkhG+TaoxVXsnisbT4Ru6J1QN8j+mN4nHsjhy37uGPKNGKR1rEG7NK4pYE
0zNCQrLGGGcWTHEdh4L+gTOGqLxeLfEjYg6FtfVJ7Ubj1MMtWWxBUmVFYlPfD62+
rjx4cH8MAUb4SXqyd4iyXHcRlwE2JQ==
=TZV/
-----END PGP SIGNATURE-----

--Sig_/ioXh4QPO9VkP60je8D=8ArN--
