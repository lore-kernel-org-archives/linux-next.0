From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rcu tree with the ext4 tree
Date: Sat, 16 Jul 2011 21:28:38 +1000
Message-ID: <20110716212838.a84936541c18fb866abcc308@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sat__16_Jul_2011_21_28_38_+1000_Ezf=v4TfJhfBDD8W"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>, Lai Jiangshan <laijs@cn.fujitsu.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Sat__16_Jul_2011_21_28_38_+1000_Ezf=v4TfJhfBDD8W
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Today's linux-next merge of the rcu tree got a conflict in
fs/jbd2/journal.c between commit 4862fd6047ed ("jbd2: remove
jbd2_dev_to_name() from jbd2 tracepoints") from the ext4 tree and commit
a5e245951e94 ("jbd2,rcu: Convert call_rcu(free_devcache) to kfree_rcu()")
from the rcu tree.

The former removes the function modified by the latter, so I did that.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sat__16_Jul_2011_21_28_38_+1000_Ezf=v4TfJhfBDD8W
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOIXXmAAoJEDMEi1NhKgbsU9sH/1gBN/PjFub7Eytbly1qTNLK
T/ZfedkMfeXhEYoAPDnWByT+aIwgTZ592Ow+L2M+RKafqeesfEg+SRiUMUVCuiEq
BBSYmzoFOmReON9cRE36FosoGZ4u+NALbbqX2st4H3N4OwR20907ReeFh483Mvt1
bnnbByu/qGb0y29qgOgiHoK9Fakkn0JyTfB3nG7DazclWcNyDSvconRqtJgyN2aH
r7j3+grUYSR48xQioOWLEKFJF3HUZsZ8TavtGHp0oEPq4bjQlDEHEGspGosRM69N
dTsn2xAUo3TC29Es9AwrTmnc2q7zJM8t/yCflWzya4Vk25s7XAdVQuH6rw/JU84=
=m8M5
-----END PGP SIGNATURE-----

--Signature=_Sat__16_Jul_2011_21_28_38_+1000_Ezf=v4TfJhfBDD8W--
