From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the bpf-next tree with the bpf tree
Date: Wed, 17 Apr 2019 11:08:56 +1000
Message-ID: <20190417110856.54b4ac1c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/PToTIyXnHLFQ77QlRBaumDo"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Benjamin Poirier <bpoirier@suse.com>
List-Id: linux-next.vger.kernel.org

--Sig_/PToTIyXnHLFQ77QlRBaumDo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the bpf-next tree got a conflict in:

  tools/bpf/bpftool/map.c

between commit:

  e0665239e07f ("bpftool: Fix errno variable usage")

from the bpf tree and commit:

  0478c3bf8124 ("bpftool: Use print_entry_error() in case of ENOENT when du=
mping")

from the bpf-next tree.

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
index 1744bf61a0b8,44b192e87708..000000000000
--- a/tools/bpf/bpftool/map.c
+++ b/tools/bpf/bpftool/map.c
@@@ -722,11 -715,16 +715,16 @@@ static int dump_map_elem(int fd, void *
  		jsonw_string_field(json_wtr, "error", strerror(lookup_errno));
  		jsonw_end_object(json_wtr);
  	} else {
+ 		const char *msg =3D NULL;
+=20
 -		if (errno =3D=3D ENOENT)
 +		if (lookup_errno =3D=3D ENOENT)
- 			print_entry_plain(map_info, key, NULL);
- 		else
- 			print_entry_error(map_info, key,
- 					  strerror(lookup_errno));
+ 			msg =3D "<no entry>";
+ 		else if (lookup_errno =3D=3D ENOSPC &&
+ 			 map_info->type =3D=3D BPF_MAP_TYPE_REUSEPORT_SOCKARRAY)
+ 			msg =3D "<cannot read>";
+=20
+ 		print_entry_error(map_info, key,
+ 				  msg ? : strerror(lookup_errno));
  	}
 =20
  	return 0;

--Sig_/PToTIyXnHLFQ77QlRBaumDo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly2fKgACgkQAVBC80lX
0Gw8OQf/VvGCw2rn2B10cwgm/rjs+IduAfPs8kwMGJ+1YheHdRd6PggMRa2kqDPI
2NW4J1kENtmWz5Jx48JzKrKbbwmpK5Af19oWbg7nTApBwTIeePd/uHeqorJYt/7P
gSleXDPgq3TnyDhQhlzWLyTcRAaL7QadSdQWUjW1/zi/BI+HnzqzeXFDBX2F+yhn
cWB6V0irEqDw11sLG8CmZi6FMJ9G/5HyP/T+LAv3lKR3thF6B1m8KBdPKuLfylSI
kZ6cq6hcaINXHpO4ZMJ6rRWoE39kjOpv/nfuWTJUBY//xWkSsUxQuNmzt7DDV/Z5
oTdt+XPhJeSnZeiDHKoRGq0WyAhNxw==
=/wDW
-----END PGP SIGNATURE-----

--Sig_/PToTIyXnHLFQ77QlRBaumDo--
