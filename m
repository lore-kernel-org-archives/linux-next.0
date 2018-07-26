From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the bpf tree
Date: Thu, 26 Jul 2018 11:19:16 +1000
Message-ID: <20180726111916.47a47dbf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/KrEKTqefwe2s5mJCS828dQR"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Okash Khawaja <osk@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Martin KaFai Lau <kafai@fb.com>
List-Id: linux-next.vger.kernel.org

--Sig_/KrEKTqefwe2s5mJCS828dQR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got conflicts in:

  tools/lib/bpf/btf.c
  tools/lib/bpf/btf.h

between commits:

  5b891af7fca1 ("bpf: Replace [u]int32_t and [u]int64_t in libbpf")
  38d5d3b3d5db ("bpf: Introduce BPF_ANNOTATE_KV_PAIR")

from the bpf tree and commit:

  92b57121ca79 ("bpf: btf: export btf types and name by offset from lib")

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

diff --cc tools/lib/bpf/btf.c
index 2d270c560df3,03161be094b4..000000000000
--- a/tools/lib/bpf/btf.c
+++ b/tools/lib/bpf/btf.c
@@@ -269,9 -259,29 +266,29 @@@ __s64 btf__resolve_size(const struct bt
  	return nelems * size;
  }
 =20
+ int btf__resolve_type(const struct btf *btf, __u32 type_id)
+ {
+ 	const struct btf_type *t;
+ 	int depth =3D 0;
+=20
+ 	t =3D btf__type_by_id(btf, type_id);
+ 	while (depth < MAX_RESOLVE_DEPTH &&
+ 	       !btf_type_is_void_or_null(t) &&
+ 	       IS_MODIFIER(BTF_INFO_KIND(t->info))) {
+ 		type_id =3D t->type;
+ 		t =3D btf__type_by_id(btf, type_id);
+ 		depth++;
+ 	}
+=20
+ 	if (depth =3D=3D MAX_RESOLVE_DEPTH || btf_type_is_void_or_null(t))
+ 		return -EINVAL;
+=20
+ 	return type_id;
+ }
+=20
 -int32_t btf__find_by_name(const struct btf *btf, const char *type_name)
 +__s32 btf__find_by_name(const struct btf *btf, const char *type_name)
  {
 -	uint32_t i;
 +	__u32 i;
 =20
  	if (!strcmp(type_name, "void"))
  		return 0;
@@@ -368,3 -379,20 +385,11 @@@ int btf__fd(const struct btf *btf
  {
  	return btf->fd;
  }
+=20
+ const char *btf__name_by_offset(const struct btf *btf, __u32 offset)
+ {
+ 	if (offset < btf->hdr->str_len)
+ 		return &btf->strings[offset];
+ 	else
+ 		return NULL;
+ }
 -
 -const struct btf_type *btf__type_by_id(const struct btf *btf,
 -				       __u32 type_id)
 -{
 -	if (type_id > btf->nr_types)
 -		return NULL;
 -
 -	return btf->types[type_id];
 -}
diff --cc tools/lib/bpf/btf.h
index e2a09a155f84,24f361d99a5e..000000000000
--- a/tools/lib/bpf/btf.h
+++ b/tools/lib/bpf/btf.h
@@@ -15,10 -14,12 +15,12 @@@ typedef int (*btf_print_fn_t)(const cha
  	__attribute__((format(printf, 1, 2)));
 =20
  void btf__free(struct btf *btf);
 -struct btf *btf__new(uint8_t *data, uint32_t size, btf_print_fn_t err_log=
);
 -int32_t btf__find_by_name(const struct btf *btf, const char *type_name);
 -int64_t btf__resolve_size(const struct btf *btf, uint32_t type_id);
 +struct btf *btf__new(__u8 *data, __u32 size, btf_print_fn_t err_log);
 +__s32 btf__find_by_name(const struct btf *btf, const char *type_name);
- const struct btf_type *btf__type_by_id(const struct btf *btf, __u32 id);
 +__s64 btf__resolve_size(const struct btf *btf, __u32 type_id);
+ int btf__resolve_type(const struct btf *btf, __u32 type_id);
  int btf__fd(const struct btf *btf);
+ const char *btf__name_by_offset(const struct btf *btf, __u32 offset);
+ const struct btf_type *btf__type_by_id(const struct btf *btf, __u32 type_=
id);
 =20
  #endif

--Sig_/KrEKTqefwe2s5mJCS828dQR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltZIZQACgkQAVBC80lX
0Gx0agf/UmZXN8ro9LhVhmTDM8faWIx69l5Rhgsf2z2vELLgPnouZKt48qRhi8DY
PW4iu2lj02sTqS36hVAdvUrBi8o93viDenHpWTIQZmhRpf3LOhOpG2iVn2+dAjT3
/dnbXL8wv2bbUBlAmTgMvhzVRDus3pGiHBC1DmAhYJZEsxds52GvjTKBmz7OaogE
nLj1BUGEfkVzVs1TzCX4luhDQ7BU/61KbPktTVAMMfWXsIBjMcuNIzZM7cO4tDvc
CPOGyOzHLwtnZAxGUIdWmqkZF+YAnhUdySZcy50mvkk9cK36Cb8/mxBvjr7LvSYB
6NfUKtDTloFK+0CTumLxb5BZWC6N2w==
=yCKs
-----END PGP SIGNATURE-----

--Sig_/KrEKTqefwe2s5mJCS828dQR--
