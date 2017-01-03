From: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the drm-intel-fixes tree
Date: Tue, 3 Jan 2017 10:59:29 +0800
Message-ID: <20170103025929.35gp5n27uc7iszra@zhen-hp.sh.intel.com>
References: <20170103104239.67dd95ba@canb.auug.org.au>
Reply-To: Zhenyu Wang <zhenyuw@linux.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1016735697=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170103104239.67dd95ba@canb.auug.org.au>
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
Cc: Jike Song <jike.song@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, linux-kernel@vger.kernel.org, DRI <dri-devel@lists.freedesktop.org>, Alex Williamson <alex.williamson@redhat.com>, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org


--===============1016735697==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4blbkqsaexifh2lh"
Content-Disposition: inline


--4blbkqsaexifh2lh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2017.01.03 10:42:39 +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the drm-intel-fixes tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> drivers/gpu/drm/i915/gvt/kvmgt.c: In function 'intel_vgpu_open':
> drivers/gpu/drm/i915/gvt/kvmgt.c:511:32: error: dereferencing pointer to =
incomplete type 'struct mdev_device'
>   vfio_unregister_notifier(&mdev->dev, VFIO_GROUP_NOTIFY,
>                                 ^  =20
>=20
> Caused by commit
>=20
>   99e3123e3d72 ("vfio-mdev: Make mdev_device private and abstract interfa=
ces")
>=20
> from the vfio-fixes tree interacting with commit
>=20
>   364fb6b789ff ("drm/i915/gvt/kvmgt: prevent double-release of vgpu")
>=20
> from the drm-intel-fixes tree.

Alex, I liked to have kvmgt related mdev interface change be merged through
vfio tree, but wasn't awared one of Jike's fix had conflict. Could you apply
below fix in your tree? I think in general for possible interface change in
future we still need a pull request for i915 to resolve dependence earlier.

Thanks.

>=20
> I applied this merge fix patch:
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 3 Jan 2017 10:38:48 +1100
> Subject: [PATCH] vfio-mdev: fixup for "Make mdev_device private and abstr=
act interfaces"
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/i915/gvt/kvmgt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/=
kvmgt.c
> index c24b665e007b..faaae07ae487 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -508,7 +508,7 @@ static int intel_vgpu_open(struct mdev_device *mdev)
>  	return ret;
> =20
>  undo_group:
> -	vfio_unregister_notifier(&mdev->dev, VFIO_GROUP_NOTIFY,
> +	vfio_unregister_notifier(mdev_dev(mdev), VFIO_GROUP_NOTIFY,
>  					&vgpu->vdev.group_notifier);
> =20
>  undo_iommu:
> --=20
> 2.10.2
>=20
> --=20
> Cheers,
> Stephen Rothwell

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--4blbkqsaexifh2lh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlhrE5EACgkQsQQaM014GCfo4gCfQ5t810APPM37BXWFtjxChbr1
hfcAoINsEzZh4VNlPbxOimxSEDqc/KiU
=GW9q
-----END PGP SIGNATURE-----

--4blbkqsaexifh2lh--

--===============1016735697==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1016735697==--
