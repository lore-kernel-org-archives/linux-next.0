From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the arm64 tree
Date: Mon, 15 Apr 2019 14:21:34 +1000
Message-ID: <20190415142134.0956422f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/t3_dEJ+Z55BQXx9L74Sbklh"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Waiman Long <longman@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/t3_dEJ+Z55BQXx9L74Sbklh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/s390/include/asm/Kbuild

between commit:

  fdcd06a8ab77 ("arch: Use asm-generic header for asm/mmiowb.h")

from the arm64 tree and commit:

  46ad0840b158 ("locking/rwsem: Remove arch specific rwsem files")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/s390/include/asm/Kbuild
index bdc4f06a04c5,d5fadefea33c..000000000000
--- a/arch/s390/include/asm/Kbuild
+++ b/arch/s390/include/asm/Kbuild
@@@ -20,8 -20,6 +20,7 @@@ generic-y +=3D local.
  generic-y +=3D local64.h
  generic-y +=3D mcs_spinlock.h
  generic-y +=3D mm-arch-hooks.h
 +generic-y +=3D mmiowb.h
- generic-y +=3D rwsem.h
  generic-y +=3D trace_clock.h
  generic-y +=3D unaligned.h
  generic-y +=3D word-at-a-time.h

--Sig_/t3_dEJ+Z55BQXx9L74Sbklh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly0Bs4ACgkQAVBC80lX
0Gw59gf/WtQapbHy3Zt/wrdgGGvPCPzxL6Vu2IqOx/8odyaKoS/iJg9UV5cx5/TV
cTEj+Voy2QoV4VH7GUMwNLuMf6sEPT5e1M9GChRa7+c6XpbMzGIwxbdg17/Gdwxo
okC4m0Vy0ik44xSCQQoyDbyj4+o6uNEPbDb03wXs3nkOJ/T2iq3iSBVAr/LYVNp9
/t/Za6n6nC9l/oO9U6zOSraTUYxTckpCadog8iU39LfH98K1hs6s7VYiNisaXsAb
H1dxpqNeQooh4eND1smLQ+nWWsAg/ffWuXN84kyJY1lIbFia6W/JdXp1OycftZyJ
RUagmd/6gJUNc4I4pXe6eupbIAgcig==
=70Xt
-----END PGP SIGNATURE-----

--Sig_/t3_dEJ+Z55BQXx9L74Sbklh--
