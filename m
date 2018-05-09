From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the
 drm-intel tree
Date: Wed, 9 May 2018 15:02:55 +1000
Message-ID: <20180509150255.38a5b1cc@canb.auug.org.au>
References: <20180508110716.53dfef41@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1092596021=="
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <20180508110716.53dfef41@canb.auug.org.au>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Christoph Hellwig <hch@lst.de>, Dave Airlie <airlied@linux.ie>
Cc: Rob Herring <robh@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Nipun Gupta <nipun.gupta@nxp.com>, Bjorn Helgaas <bhelgaas@google.com>
List-Id: linux-next.vger.kernel.org

--===============1092596021==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/KgYm4F6hqbL=bzBEBhDHv1q"; protocol="application/pgp-signature"

--Sig_/KgYm4F6hqbL=bzBEBhDHv1q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 8 May 2018 11:07:16 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the drm-intel tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> drivers/gpu/drm/xen/xen_drm_front.c: In function 'xen_drv_probe':
> drivers/gpu/drm/xen/xen_drm_front.c:740:10: error: 'struct bus_type' has =
no member named 'force_dma'
>   dev->bus->force_dma =3D true;
>           ^~
> drivers/gpu/drm/xen/xen_drm_front.c:742:8: error: too few arguments to fu=
nction 'of_dma_configure'
>   ret =3D of_dma_configure(dev, NULL);
>         ^~~~~~~~~~~~~~~~
> In file included from drivers/gpu/drm/xen/xen_drm_front.c:16:0:
> include/linux/of_device.h:58:5: note: declared here
>  int of_dma_configure(struct device *dev,
>      ^~~~~~~~~~~~~~~~
>=20
> Caused by commit
>=20
>   c575b7eeb89f ("drm/xen-front: Add support for Xen PV display frontend")
>=20
> interacting with commit
>=20
>   3d6ce86ee794 ("drivers: remove force dma flag from buses")
>=20
> from the dma-mapping tree.
>=20
> I have added the following merge fix patch:
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 8 May 2018 11:02:24 +1000
> Subject: [PATCH] drm/xen-front: merge fix for "drivers: remove force dma =
flag from buses"
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/xen/xen_drm_front.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xe=
n_drm_front.c
> index 1b0ea9ac330e..0e486cb1c10c 100644
> --- a/drivers/gpu/drm/xen/xen_drm_front.c
> +++ b/drivers/gpu/drm/xen/xen_drm_front.c
> @@ -737,9 +737,8 @@ static int xen_drv_probe(struct xenbus_device *xb_dev,
>  	 * is not correct: to fix this call of_dma_configure() with a NULL
>  	 * node to set default DMA ops.
>  	 */
> -	dev->bus->force_dma =3D true;
>  	dev->coherent_dma_mask =3D DMA_BIT_MASK(32);
> -	ret =3D of_dma_configure(dev, NULL);
> +	ret =3D of_dma_configure(dev, NULL, true);
>  	if (ret < 0) {
>  		DRM_ERROR("Cannot setup DMA ops, ret %d", ret);
>  		return ret;
> --=20
> 2.17.0

This is now needed for the merge of the drm and dma-mapping trees.
--=20
Cheers,
Stephen Rothwell

--Sig_/KgYm4F6hqbL=bzBEBhDHv1q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlrygP8ACgkQAVBC80lX
0Gxhwgf/T7Nc4rfcR5P7lf9exue4dBbXIfSn+uGfH+69hBX/mxk8TqNto57cvzF3
14T35gjljpqLqPq6aodcDcPSeEIt/TPMDDLUWD54xhUQBY93jNnTWUjPIZ8Og6Th
3xm4y6Zi4prGInvjAqVMGyV41+TUQExUE5KSXkM47MQai0j4LXtevHn2dqWO2WcN
txeGMMqCkB9qpjUKM1QxLG68Pce4BAh59ZzxSQw8dLHxPPC1ln96Q0K6pl9KKx3a
xf8Od8+DDUFc1PmhEcWWCksW1QXWYrD6BEGhNq5/dSLP3FM8Dx80F68XrrnAj8tZ
h2HmzMwzXL30uV/gMT56Mh6EHFbmkw==
=mWda
-----END PGP SIGNATURE-----

--Sig_/KgYm4F6hqbL=bzBEBhDHv1q--

--===============1092596021==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==

--===============1092596021==--
