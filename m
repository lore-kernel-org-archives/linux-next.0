From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the drm-intel tree
Date: Mon, 23 Jul 2018 12:29:00 +1000
Message-ID: <20180723122900.60562ff8@canb.auug.org.au>
References: <20180713115419.1270c385@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/=6kqBa49ysBhdfu.ptLUJYi"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180713115419.1270c385@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Changbin Du <changbin.du@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/=6kqBa49ysBhdfu.ptLUJYi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 13 Jul 2018 11:54:19 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> [Dave cc'd because this will probably turn up in the drm tree soon.]

And now it has ...

> After merging the drm-intel tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> drivers/gpu/drm/i915/gvt/kvmgt.c: In function 'gvt_dma_map_page':
> drivers/gpu/drm/i915/gvt/kvmgt.c:188:17: error: 'pfn' undeclared (first u=
se in this function); did you mean 'gfn'?
>   if (!pfn_valid(pfn)) {
>                  ^~~
>=20
> Caused by commit
>=20
>   79e542f5af79 ("drm/i915/kvmgt: Support setting dma map for huge pages")
>=20
> interacting with commit
>=20
>   39b4cbadb9a9 ("drm/i915/kvmgt: Check the pfn got from vfio_pin_pages")
>=20
> from Linus' tree (v4.18-rc1).
>=20
> I added the following merge fix patch:
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 13 Jul 2018 11:48:41 +1000
> Subject: [PATCH] drm/i915/kvmgt: merge fixup for "Check the pfn got from
>  vfio_pin_pages"
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/i915/gvt/kvmgt.c | 6 ------
>  1 file changed, 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/=
kvmgt.c
> index 718ab307a500..4d2f53ae9f0f 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -185,12 +185,6 @@ static int gvt_dma_map_page(struct intel_vgpu *vgpu,=
 unsigned long gfn,
>  	if (ret)
>  		return ret;
> =20
> -	if (!pfn_valid(pfn)) {
> -		gvt_vgpu_err("pfn 0x%lx is not mem backed\n", pfn);
> -		vfio_unpin_pages(mdev_dev(vgpu->vdev.mdev), &gfn, 1);
> -		return -EINVAL;
> -	}
> -
>  	/* Setup DMA mapping. */
>  	*dma_addr =3D dma_map_page(dev, page, 0, size, PCI_DMA_BIDIRECTIONAL);
>  	ret =3D dma_mapping_error(dev, *dma_addr);

--=20
Cheers,
Stephen Rothwell

--Sig_/=6kqBa49ysBhdfu.ptLUJYi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltVPWwACgkQAVBC80lX
0Gx0+Qf/SiJ4LzDBTJ40ZAuwkVKuqpD0Eb3x3aLRpk2OiHfvQLfa4+H0YqFlXVzl
z+hEoCk2HEivWnYkePsknJcBqe3eroCdESZ3DebGGxTBL3I1+Qcll4bokNEnL6jJ
Khj5Ia4KVLfLFHyzyjFxnFjjjvb1pfB8wJh8gqDS2fVBDNH+WpPB5lHBwIAA9aIG
Fgzp5V5sTDzEsyix/EyXk/zY+pkIozTosQIZpJ0+22N1RwLCcJNY5befJXymUEtT
Ezu0frtWdOvlYUCc9dPJuCRF+x5wC36DnyatTgIM6b5z7tQqbgyH40GMTmlKrDQt
P6kJNVbGtB05kXkOh0Lqq7e6kdB9Zg==
=e9YC
-----END PGP SIGNATURE-----

--Sig_/=6kqBa49ysBhdfu.ptLUJYi--
