From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the bpf tree
Date: Wed, 1 Aug 2018 11:35:08 +1000
Message-ID: <20180801113508.54323706@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/6_.gedhC4A+UgcVCzLtjUyh"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Yonghong Song <yhs@fb.com>, Okash Khawaja <osk@fb.com>
List-Id: linux-next.vger.kernel.org

--Sig_/6_.gedhC4A+UgcVCzLtjUyh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  tools/bpf/bpftool/map.c

between commit:

  573b3aa69406 ("tools/bpftool: fix a percpu_array map dump problem")

from the bpf tree and commit:

  2d3feca8c44f ("bpf: btf: print map dump and lookup with btf info")

from the net-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc tools/bpf/bpftool/map.c
index f74a8bcbda87,9c8191845585..000000000000
--- a/tools/bpf/bpftool/map.c
+++ b/tools/bpf/bpftool/map.c
@@@ -34,9 -34,7 +34,8 @@@
  #include <assert.h>
  #include <errno.h>
  #include <fcntl.h>
 +#include <linux/kernel.h>
+ #include <linux/err.h>
  #include <stdbool.h>
  #include <stdio.h>
  #include <stdlib.h>
@@@ -162,11 -262,20 +264,21 @@@ static void print_entry_json(struct bpf
  		print_hex_data_json(key, info->key_size);
  		jsonw_name(json_wtr, "value");
  		print_hex_data_json(value, info->value_size);
+ 		if (btf) {
+ 			struct btf_dumper d =3D {
+ 				.btf =3D btf,
+ 				.jw =3D json_wtr,
+ 				.is_plain_text =3D false,
+ 			};
+=20
+ 			jsonw_name(json_wtr, "formatted");
+ 			do_dump_btf(&d, info, key, value);
+ 		}
  	} else {
 -		unsigned int i, n;
 +		unsigned int i, n, step;
 =20
  		n =3D get_possible_cpus();
 +		step =3D round_up(info->value_size, 8);
 =20
  		jsonw_name(json_wtr, "key");
  		print_hex_data_json(key, info->key_size);

--Sig_/6_.gedhC4A+UgcVCzLtjUyh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlthDkwACgkQAVBC80lX
0Gznegf/QzA4G36j7kLiJwsq0+f+eYGEMMl/tf4RTiHRPSbWZPvpyDMPXrF+oFDM
Jx9smZVtD96s9MJUgt8lW4Et9HS9rOeVGSzUHUfdnvnR2pQ+YkcOjHOFV43++LtA
Tm6GfV3n9U0/nZ41CY4Sz/SBsAA+DkygTDv4dDw8ZHlyO3CAbocgT8hwvEfTR0+v
3zRAwwrlgnWxlAtZ4si90Ot6e6IcKizcfM2mCRsOI4nJMkkjSeDjAE9HEBAPtniw
ekfdwK45J1PxIWq6TTDzvk8GJ+AnsFXZPIWG+5Lx5SCcrTiR2obU62j8G/p+fJn3
xd+g+0NkA11+5AVKenpeNc1H4FKBKA==
=Ex7n
-----END PGP SIGNATURE-----

--Sig_/6_.gedhC4A+UgcVCzLtjUyh--
