From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the bpf-next tree with the bpf tree
Date: Wed, 24 Apr 2019 13:12:40 +1000
Message-ID: <20190424131240.765178fa@canb.auug.org.au>
References: <20190417110856.54b4ac1c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/hg7Bz6yWY11NDvAbpdPlECU"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190417110856.54b4ac1c@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Networking <netdev@vger.kernel.org>, David Miller <davem@davemloft.net>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Benjamin Poirier <bpoirier@suse.com>
List-Id: linux-next.vger.kernel.org

--Sig_/hg7Bz6yWY11NDvAbpdPlECU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 17 Apr 2019 11:08:56 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the bpf-next tree got a conflict in:
>=20
>   tools/bpf/bpftool/map.c
>=20
> between commit:
>=20
>   e0665239e07f ("bpftool: Fix errno variable usage")
>=20
> from the bpf tree and commit:
>=20
>   0478c3bf8124 ("bpftool: Use print_entry_error() in case of ENOENT when =
dumping")
>=20
> from the bpf-next tree.
>=20
> diff --cc tools/bpf/bpftool/map.c
> index 1744bf61a0b8,44b192e87708..000000000000
> --- a/tools/bpf/bpftool/map.c
> +++ b/tools/bpf/bpftool/map.c
> @@@ -722,11 -715,16 +715,16 @@@ static int dump_map_elem(int fd, void *
>   		jsonw_string_field(json_wtr, "error", strerror(lookup_errno));
>   		jsonw_end_object(json_wtr);
>   	} else {
> + 		const char *msg =3D NULL;
> +=20
>  -		if (errno =3D=3D ENOENT)
>  +		if (lookup_errno =3D=3D ENOENT)
> - 			print_entry_plain(map_info, key, NULL);
> - 		else
> - 			print_entry_error(map_info, key,
> - 					  strerror(lookup_errno));
> + 			msg =3D "<no entry>";
> + 		else if (lookup_errno =3D=3D ENOSPC &&
> + 			 map_info->type =3D=3D BPF_MAP_TYPE_REUSEPORT_SOCKARRAY)
> + 			msg =3D "<cannot read>";
> +=20
> + 		print_entry_error(map_info, key,
> + 				  msg ? : strerror(lookup_errno));
>   	}
>  =20
>   	return 0;

This is now a conflict between the net-next and bpf trees.

--=20
Cheers,
Stephen Rothwell

--Sig_/hg7Bz6yWY11NDvAbpdPlECU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly/1CkACgkQAVBC80lX
0GwexAf/elm7U5ewo/HASPberAvkBUVACmF2FVFV9Y2kc5/P5lTUdiNdRVETtE2T
7EHmwCU9S5ZGoFo0ya+1R3l+bXLlVpA82qOO3eGl/l3ledV22MBcDpBDHcC8vjvv
p9YIWZecbXrHyxsqiSSUWQuoe8tEwvg3ycloy4r3K8EwEl0OVpofYzanl8zuMpob
HYniNf1EUQGI2UW/JvarFduSLrggbuT2OY/e6ISIm7vsMAAXmmXuZ1tUfZLtRsqt
OOdgA51qhg6TDOt04SuGJPSSw6vPLRSSrRl7dIkWJJ/x/5uN7UKXtE43zSbL4awJ
z5bHehxyzrrd33ORggzR98D0/VfNSQ==
=4QhK
-----END PGP SIGNATURE-----

--Sig_/hg7Bz6yWY11NDvAbpdPlECU--
