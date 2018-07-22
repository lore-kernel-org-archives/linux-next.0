From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the tip tree
Date: Mon, 23 Jul 2018 07:54:58 +1000
Message-ID: <20180723075458.12da7c0c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/+z1LtcPj73z..IBdfbM+8C4"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/+z1LtcPj73z..IBdfbM+8C4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  6fffacb30349 ("x86/alternatives, jumplabel: Use text_poke_early() before =
mm_init()")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/+z1LtcPj73z..IBdfbM+8C4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltU/TIACgkQAVBC80lX
0Gzjygf9HDSnSEPFS5OnlKxk5ScExexo4ovH3LVSZ9m1DRtEy3J6HQA090VYVpvZ
d1HdzlyffHOHAULqAKmfjkqv9iQdNRIBi9TiynodMx2NzXFTMX8uo5ap6Euaps39
e0ljZqJ0lGcSi+ULjkz2VYP5isPhjLTFTq5iE9Oy3U6izWdzEWwOFqstaMaPnhff
fNYxvKjS2FJZasq+QBoL1ZXRRt/vKZYvvpcBlZP9CHs3tYCArMxPMvnsmpz2XMRU
U3iHt/3CfqkGeN0SK5vr8+Zq4LLjuIADolsqnt41MOre+SkE613GX2k5LNaC8E6l
KvTi/n/BGcKWV1iHv2NEmStxhVXxIA==
=RVXp
-----END PGP SIGNATURE-----

--Sig_/+z1LtcPj73z..IBdfbM+8C4--
