From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Signed-off-by missing for commits in the bpf-next
 tree
Date: Thu, 13 Dec 2018 09:48:20 +1100
Message-ID: <20181213094820.62d26354@canb.auug.org.au>
References: <20181213073245.5b2d2536@canb.auug.org.au>
        <20181212205253.d3reuxcyjhnwh3ul@ast-mbp.dhcp.thefacebook.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/YhAEp84TgXfVWmN.9ptqAqn"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181212205253.d3reuxcyjhnwh3ul@ast-mbp.dhcp.thefacebook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Networking <netdev@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/YhAEp84TgXfVWmN.9ptqAqn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Alexei,

On Wed, 12 Dec 2018 12:53:11 -0800 Alexei Starovoitov <alexei.starovoitov@g=
mail.com> wrote:
>
> On Thu, Dec 13, 2018 at 07:32:45AM +1100, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > Commits
> >=20
> >   3bdc28aa2340 ("selftests/bpf: add btf annotations for cgroup_local_st=
orage maps")
> >   1dfd1959fed4 ("bpf: add bpffs pretty print for cgroup local storage m=
aps")
> >   3adc62d9a5be ("bpf: pass struct btf pointer to the map_check_btf() ca=
llback")
> >   9cf3a785dc4c ("selftests/bpf: use __bpf_constant_htons in test_prog.c=
")
> >=20
> > are missing a Signed-off-by from their committers. =20
>=20
> the must be a script mistake?
>=20
> I clearly see SOBs for all of them.

For example:

commit 3bdc28aa2340bf1e5af753287b373522bd1c02a9 (bpf-next/master)
Author: Roman Gushchin <guroan@gmail.com>
Date:   Mon Dec 10 15:43:02 2018 -0800

    selftests/bpf: add btf annotations for cgroup_local_storage maps
   =20
    Add btf annotations to cgroup local storage maps (per-cpu and shared)
    in the network packet counting example.
   =20
    Signed-off-by: Roman Gushchin <guro@fb.com>
    Cc: Alexei Starovoitov <ast@kernel.org>
    Cc: Daniel Borkmann <daniel@iogearbox.net>
    Acked-by: Martin KaFai Lau <kafai@fb.com>
    Signed-off-by: Daniel Borkmann <daniel@iogearbox.net>

But it was committed by you, not Daniel.
--=20
Cheers,
Stephen Rothwell

--Sig_/YhAEp84TgXfVWmN.9ptqAqn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwRkDQACgkQAVBC80lX
0GwcYQgApSY5aSjv4ynkNhg44iRlgOrfrE1WyMkGkVM23flsOeb4wSl0ucjM+QRu
bQtclpftjdkz0KY2ZwE7/4Mw6GNcITc5Z56MjzDXRgl/h82sz2nS0V+lVr1e6tKk
Up22X3Ixlf4/cPoIR17L3jJTSoiGBgmamF4QhMQoj9agSdB4PVN/c7dgwk8qvITZ
PTrFVnac+uVsEaPIiMPSBDDJuk78gGcixWZNzmu++kOFkHiLqa54rtEZYkrJvgVw
8ca4SRHL4DezJrUWw3KQnP1Mzcx1GZvzPkEHwCRZEI7xJ5LokcyuyljzY9Yf/Nts
OsHSr90wDmQVpBs8uYZ+FRt2xJwSNg==
=bCpM
-----END PGP SIGNATURE-----

--Sig_/YhAEp84TgXfVWmN.9ptqAqn--
