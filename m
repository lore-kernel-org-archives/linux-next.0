From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commits in the kgdb-dt tree
Date: Tue, 18 Dec 2018 08:49:18 +1100
Message-ID: <20181218084918.755551b7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/eALjmxwk.k9Zd7a0ljy_cR9"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/eALjmxwk.k9Zd7a0ljy_cR9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

Commits

  aee700022ad5 ("kdb: Don't back trace on a cpu that didn't round up")
  e046994f7695 ("kgdb: Don't round up a CPU that failed rounding up before")
  2649a5d9dccd ("kgdb: Fix kgdb_roundup_cpus() for arches who used smp_call=
_function()")
  990bbea1e0d1 ("kgdb: Remove irq flags from roundup")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/eALjmxwk.k9Zd7a0ljy_cR9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwYGd4ACgkQAVBC80lX
0GzinQf/fnPGJaZVqWGTtzqlQjECW40E10DmivNuvw+VZlZSCxR7l93wt4b6SHmk
c8pOjHvevx6OKKlOQ+DQJCB9KuuXgjKmxqXdr2p+SLho0DRGxK9QF2rQmqaYHxiN
AyOY35EchA69QY+26owU/76rKsOjm/fji9yPu6oA6R2Azud83MQQyIEU7RgSUZX6
tYn5r3zeCHMUEzu4MF8WfpMv07j0V40PcL656Lx1aIYfX2MZYvLagALyYF6WUf2X
tYjeM/LZT4eQbsAnqA9HkxBXGxsuapSh1ul43jxgOxglCNwM87F13q2/g8YI3jyx
VTpfkPhHXyppq5JXEiAvI9TURmRNDw==
=NkdK
-----END PGP SIGNATURE-----

--Sig_/eALjmxwk.k9Zd7a0ljy_cR9--
