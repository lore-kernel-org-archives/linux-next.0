From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the tip tree
Date: Fri, 18 Jan 2019 09:35:15 +1100
Message-ID: <20190118093515.4bee6eb3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/5PiD/2NNvmxyX0sF9CD35_k"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>
List-Id: linux-next.vger.kernel.org

--Sig_/5PiD/2NNvmxyX0sF9CD35_k
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  f0ca26ca4f36 ("genirq: Fix the kerneldoc comment for struct irq_affinity_=
desc")

Fixes tag

  Fixes: Commit c410abbbacb9 ("genirq/affinity: Add is_managed to struct ir=
q_affinity_desc")

has these problems:

  - No SHA1 recognised

The word "Commit" is unexpected in the Fixes tag line.

--=20
Cheers,
Stephen Rothwell

--Sig_/5PiD/2NNvmxyX0sF9CD35_k
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxBAyMACgkQAVBC80lX
0GxbLAf/VieyF6p6fTQBYXT/primhzrOqVllyMUpwak9ySL1UXP9Qe1O1HSGAIkT
irlg0BH6utD/J/l6iyVRKRy9NhKTGsbcLbVKfFs0Fk6RwvAqO7CmlAONzaCDrOvX
aTkHKSq6CQ8xLDvcdvsu3ECof9xjPR6O3iKk2onb5JsMDv2Tc+p5oFBWLxnwvJFH
8ymoVlIxJzuAs5OLSwSdmgeW5VVldhx+1bcKJHP9Tdb5DJ8r5WeztJkCryQkMLUO
vD4GlG3G/Eg1za2dFGW345BUolyvkyw2OMkgHUtXnw8xeUFNofDD0F4eD3dgBhTB
w20QRiGhu00Wla/WmVpPW7HNosdHaQ==
=j5pL
-----END PGP SIGNATURE-----

--Sig_/5PiD/2NNvmxyX0sF9CD35_k--
