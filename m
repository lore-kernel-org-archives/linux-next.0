From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the tip tree
Date: Tue, 23 Feb 2010 21:43:56 +1100
Message-ID: <20100223214356.a9cf4db5.sfr@canb.auug.org.au>
References: <20100223160129.f3819f35.sfr@canb.auug.org.au>
	<4B839749.2060608@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__23_Feb_2010_21_43_56_+1100_dQTc.XCi26P2sb4l"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4B839749.2060608@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Yinghai Lu <yinghai@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Signature=_Tue__23_Feb_2010_21_43_56_+1100_dQTc.XCi26P2sb4l
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, 23 Feb 2010 00:52:25 -0800 Yinghai Lu <yinghai@kernel.org> wrote:
>
> please check

This patch fixes the warnings for me, thanks.

> [PATCH] sparsemem: fix compiling with ppc
>=20
> Stephen reported:
> build (powerpc
> ppc64_defconfig) produced these warnings:
>=20
> mm/sparse.c: In function 'sparse_init':
> mm/sparse.c:488: warning: unused variable 'map_count'
> mm/sparse.c:484: warning: unused variable 'size2'
> mm/sparse.c:481: warning: unused variable 'map_map'
> mm/sparse.c: At top level:
> mm/sparse.c:442: warning: 'sparse_early_mem_maps_alloc_node' defined but =
not used
>=20
> Introduced by commit 9bdac914240759457175ac0d6529a37d2820bc4d
> ("sparsemem: Put mem map for one node together").
>=20
> use macro to fix them
>=20
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Yinghai Lu <yinghai@kernel.org>

Acked-by: Stephen Rothwell <sfr@canb.auug.org.au>

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__23_Feb_2010_21_43_56_+1100_dQTc.XCi26P2sb4l
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkuDsWwACgkQjjKRsyhoI8xdrwCfVl3JrdKPUxfMauSpZmR8ZO1Y
BbsAn3dxjXQqtOF8ToxeWSZnvgNiiran
=5RpT
-----END PGP SIGNATURE-----

--Signature=_Tue__23_Feb_2010_21_43_56_+1100_dQTc.XCi26P2sb4l--
