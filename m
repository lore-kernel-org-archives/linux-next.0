From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the drm tree
Date: Fri, 2 Mar 2018 12:49:48 +1100
Message-ID: <20180302124948.0adff130@canb.auug.org.au>
References: <20180219101817.5f4fd5c2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0358353146=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180219101817.5f4fd5c2@canb.auug.org.au>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Cc: Michel =?UTF-8?B?RMOkbnplcg==?= <michel.daenzer@amd.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Alex Deucher <alexander.deucher@amd.com>, Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Monk Liu <monk.liu@amd.com>
List-Id: linux-next.vger.kernel.org

--===============0358353146==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/4qIN0cVcPxb9YXK_Mo8TmWd"; protocol="application/pgp-signature"

--Sig_/4qIN0cVcPxb9YXK_Mo8TmWd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 19 Feb 2018 10:18:17 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the drm tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
>=20
> In file included from include/linux/list.h:9:0,
>                  from include/linux/wait.h:7,
>                  from include/linux/wait_bit.h:8,
>                  from include/linux/fs.h:6,
>                  from include/linux/highmem.h:5,
>                  from drivers/gpu/drm/drm_memory.c:36:
> drivers/gpu/drm/drm_memory.c: In function 'drm_get_max_iomem':
> include/linux/kernel.h:808:16: warning: comparison of distinct pointer ty=
pes lacks a cast
>   (void) (&max1 =3D=3D &max2);   \
>                 ^
> include/linux/kernel.h:817:2: note: in expansion of macro '__max'
>   __max(typeof(x), typeof(y),   \
>   ^~~~~
> drivers/gpu/drm/drm_memory.c:159:15: note: in expansion of macro 'max'
>    max_iomem =3D max(max_iomem,  tmp->end);
>                ^~~
>=20
> Introduced by commit
>=20
>   82626363a217 ("drm: add func to get max iomem address v2")
>=20
> tmp->end is a resource_size_t ...

I am still getting this warning ...

--=20
Cheers,
Stephen Rothwell

--Sig_/4qIN0cVcPxb9YXK_Mo8TmWd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlqYrbwACgkQAVBC80lX
0GxqQAf+IfcopMg9JqtumT1vVWSmHZesOLBlLkfMoPqgBcEzct4dn/AYBGClw0so
ojgDMssQlICsini79AOk3/QuHOM5WGqV9dCst0wDiAeLgl2IGw68aLmTzdHtfntu
l05FyfEl0Sa6Ovi99YBe/FQoY9IDRWPAYIpCu9RvJF/HquYFKTin0yEm4JOc+4QU
xV8XJhDeukdzApKGtYYk2bn1TaK8oxjnSGXOaKLtqKw2FTtmw8TCRFDahuP2/sJl
PlRco21GGoztcXhJp3UEyVF+Ro8qSMTXxtEZkkeB33X+oZpMGFw+ksI295kLqXNf
WswhrFfcinTceu4TBOdmyi1kd2+zaA==
=m4r+
-----END PGP SIGNATURE-----

--Sig_/4qIN0cVcPxb9YXK_Mo8TmWd--

--===============0358353146==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0358353146==--
