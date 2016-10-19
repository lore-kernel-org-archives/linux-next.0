From: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: linux-next: build warnings after merge of the drm-intel tree
Date: Wed, 19 Oct 2016 09:57:59 +0800
Message-ID: <20161019015759.fhvadx5m7jqoe6sb@zhen-hp.sh.intel.com>
References: <20161019105753.65cac1aa@canb.auug.org.au>
Reply-To: Zhenyu Wang <zhenyuw@linux.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0779795423=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20161019105753.65cac1aa@canb.auug.org.au>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, linux-kernel@vger.kernel.org, DRI <dri-devel@lists.freedesktop.org>, linux-next@vger.kernel.org, Zhi Wang <zhi.a.wang@intel.com>
List-Id: linux-next.vger.kernel.org


--===============0779795423==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lqdbufq5mn5k2iwi"
Content-Disposition: inline


--lqdbufq5mn5k2iwi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2016.10.19 10:57:53 +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the drm-intel tree, today's linux-next build (x86_64
> allmodconfig) produced these warnings:
>=20
> drivers/gpu/drm/i915/gvt/execlist.c: In function 'release_shadow_batch_bu=
ffer':
> drivers/gpu/drm/i915/gvt/execlist.c:501:4: warning: 'drm_gem_object_unref=
erence' is deprecated [-Wdeprecated-declarations]
>     drm_gem_object_unreference(&(entry_obj->obj->base));
>     ^
> In file included from drivers/gpu/drm/i915/gvt/execlist.c:35:0:
> drivers/gpu/drm/i915/i915_drv.h:2344:13: note: declared here
>  extern void drm_gem_object_unreference(struct drm_gem_object *);
>              ^
> drivers/gpu/drm/i915/gvt/execlist.c: In function 'release_shadow_wa_ctx':
> drivers/gpu/drm/i915/gvt/execlist.c:514:2: warning: 'drm_gem_object_unref=
erence' is deprecated [-Wdeprecated-declarations]
>   drm_gem_object_unreference(&(wa_ctx->indirect_ctx.obj->base));
>   ^
> In file included from drivers/gpu/drm/i915/gvt/execlist.c:35:0:
> drivers/gpu/drm/i915/i915_drv.h:2344:13: note: declared here
>  extern void drm_gem_object_unreference(struct drm_gem_object *);
>              ^
>=20
> Introduced by commit
>=20
>   be1da7070aea ("drm/i915/gvt: vGPU command scanner")
>=20
> interacting with commit
>=20
>   f8c417cdb1b8 ("drm/i915: Rename drm_gem_object_unreference in preparati=
on for lockless free")
>=20
> from Linus' tree.
>=20

Sorry for this, we will fix that in next pull request to replace old interf=
ace.

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--lqdbufq5mn5k2iwi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iEYEABECAAYFAlgG0ycACgkQsQQaM014GCdqfQCbB4NT7TcY21YDzW5xRp+Fn198
R6MAnA1vtl8VwcaZ8hobG/LKgq2hcrZh
=EzL0
-----END PGP SIGNATURE-----

--lqdbufq5mn5k2iwi--

--===============0779795423==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0779795423==--
