From: Song Liu <songliubraving@fb.com>
Subject: Re: linux-next: manual merge of the bpf-next tree with the bpf tree
Date: Wed, 2 May 2018 04:40:20 +0000
Message-ID: <0942C278-336F-4795-BE63-FAD7FBAA231B@fb.com>
References: <20180502120921.654cc338@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180502120921.654cc338@canb.auug.org.au>
Content-Language: en-US
Content-ID: <E61EC67A3C5E7C459973C23488EB61CB@namprd15.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Networking <netdev@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Yonghong Song <yhs@fb.com>
List-Id: linux-next.vger.kernel.org



> On May 1, 2018, at 7:09 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote=
:
>=20
> Hi all,
>=20
> Today's linux-next merge of the bpf-next tree got a conflict in:
>=20
>  tools/testing/selftests/bpf/test_progs.c
>=20
> between commit:
>=20
>  a4e21ff8d9a3 ("bpf: minor fix to selftest test_stacktrace_build_id()")
>=20
> from the bpf tree and commit:
>=20
>  79b453501310 ("tools/bpf: add a test for bpf_get_stack with tracepoint p=
rog")
>=20
> from the bpf-next tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc tools/testing/selftests/bpf/test_progs.c
> index fac581f1c57f,aa336f0abebc..000000000000
> --- a/tools/testing/selftests/bpf/test_progs.c
> +++ b/tools/testing/selftests/bpf/test_progs.c
> @@@ -1137,9 -1193,14 +1193,14 @@@ static void test_stacktrace_build_id(vo
>  		  err, errno))
>  		goto disable_pmu;
>=20
> + 	stack_amap_fd =3D bpf_find_map(__func__, obj, "stack_amap");
> + 	if (CHECK(stack_amap_fd < 0, "bpf_find_map stack_amap",
> + 		  "err %d errno %d\n", err, errno))
> + 		goto disable_pmu;
> +=20
>  	assert(system("dd if=3D/dev/urandom of=3D/dev/zero count=3D4 2> /dev/nu=
ll")
>  	       =3D=3D 0);
> -	assert(system("./urandom_read if=3D/dev/urandom of=3D/dev/zero count=3D=
4 2> /dev/null") =3D=3D 0);
> +	assert(system("./urandom_read") =3D=3D 0);
>  	/* disable stack trace collection */
>  	key =3D 0;
>  	val =3D 1;
> @@@ -1188,8 -1249,15 +1249,15 @@@
>  		previous_key =3D key;
>  	} while (bpf_map_get_next_key(stackmap_fd, &previous_key, &key) =3D=3D =
0);
>=20
> - 	CHECK(build_id_matches < 1, "build id match",
> - 	      "Didn't find expected build ID from the map\n");
> + 	if (CHECK(build_id_matches < 1, "build id match",
> -		  "Didn't find expected build ID from the map"))
> ++		  "Didn't find expected build ID from the map\n"))

^^^  Is there a "+" at the beginning of this line?=20

Thanks,
Song

> + 		goto disable_pmu;
> +=20
> + 	stack_trace_len =3D PERF_MAX_STACK_DEPTH
> + 		* sizeof(struct bpf_stack_build_id);
> + 	err =3D compare_stack_ips(stackmap_fd, stack_amap_fd, stack_trace_len)=
;
> + 	CHECK(err, "compare_stack_ips stackmap vs. stack_amap",
> + 	      "err %d errno %d\n", err, errno);
>=20
>  disable_pmu:
>  	ioctl(pmu_fd, PERF_EVENT_IOC_DISABLE);
