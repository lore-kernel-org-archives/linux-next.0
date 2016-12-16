From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: Issue with DRM and "reimplement IDR and IDA using the radix tree"
Date: Fri, 16 Dec 2016 17:16:44 +0100
Message-ID: <20161216161644.GA2018@ulmo.ba.sec>
References: <fd3db206-8b3e-150f-a060-e88cc2f49606@nvidia.com>
 <ca40ae10-2352-9cec-94db-94bca3c14616@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uAKRQypu60I7Lcqm"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:35390 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755331AbcLPQQt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 16 Dec 2016 11:16:49 -0500
Content-Disposition: inline
In-Reply-To: <ca40ae10-2352-9cec-94db-94bca3c14616@nvidia.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Matthew Wilcox <willy@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org


--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 14, 2016 at 11:08:20PM +0900, Alexandre Courbot wrote:
> Forgot to add the most relevant list for this issue (linux-next).
>=20
> Stephen, maybe you will want to temporarily revert this patch until this
> is cleared? This probably affects other users than DRM.
>=20
> On 12/13/2016 04:14 PM, Alexandre Courbot wrote:
> > Hi Matthew,
> >=20
> > Trying the latest -next on the Jetson TK1 board (with two different DRM
> > devices and display and render), I noticed that the GPU device probe
> > always failed with error -ENOSPC. After investigating I figured out that
> > this was due to the minor device allocation failing when a second DRM
> > device is added.
> >=20
> > More precisely, when drm_minor_alloc() is called with DRM_MINOR_PRIMARY
> > (0) as argument for a second time, the call to idr_alloc() (which has a
> > requested range of 0..64) fails instead of returning 1 as expected. Note
> > that the first call is successful.
> >=20
> > Reverting "reimplement IDR and IDA using the radix tree" on 20161213's
> > next fixes the issue for me, suggesting a bug may have slipped in there.
> >=20
> > Not sure how this could be fixed, so reporting the issue for now in case
> > it is not known yet.

I can confirm Alex' findings, though the symptoms seem to be slightly
different, which may be related to me testing on next-20161216 rather
than next-20161213.

What I'm seeing is that all drivers get probed correctly, but when an
application tries to open the DRM device files (/dev/dri/card0 in this
case), then all devices of a given minor type disappear. So in my case
upon boot I get this:

	# ls -l /dev/dri/
	total 0
	crw-rw---- 1 root video 226,   0 Dec 16 15:59 card0
	crw-rw---- 1 root video 226,   1 Dec 16 15:59 card1
	crw-rw---- 1 root video 226, 128 Dec 16 15:59 renderD128

The modetest program from libdrm is then unable to open any devices:

	# modetest
	trying to open device 'i915'...failed
	trying to open device 'amdgpu'...failed
	trying to open device 'radeon'...failed
	trying to open device 'nouveau'...failed
	trying to open device 'vmwgfx'...failed
	trying to open device 'omapdrm'...failed
	trying to open device 'exynos'...failed
	trying to open device 'tilcdc'...failed
	trying to open device 'msm'...failed
	trying to open device 'sti'...failed
	trying to open device 'tegra'...failed
	trying to open device 'imx-drm'...failed
	trying to open device 'rockchip'...failed
	trying to open device 'atmel-hlcdc'...failed
	trying to open device 'fsl-dcu-drm'...failed
	trying to open device 'vc4'...failed
	trying to open device 'virtio_gpu'...failed
	trying to open device 'mediatek'...failed
	no device found

And after that all of the primary minors are gone:

	# ls -l /dev/dri/
	total 0
	crw-rw---- 1 root video 226, 128 Dec 16 15:59 renderD128

Strangely this can't be reproduced for renderD128. So explicitly passing
the renderD128 node to modetest:

	# modetest -D /dev/dri/renderD128=20
	trying to open device 'i915'...failed
	trying to open device 'amdgpu'...failed
	trying to open device 'radeon'...failed
	trying to open device 'nouveau'...failed
	trying to open device 'vmwgfx'...failed
	trying to open device 'omapdrm'...failed
	trying to open device 'exynos'...failed
	trying to open device 'tilcdc'...failed
	trying to open device 'msm'...failed
	trying to open device 'sti'...failed
	trying to open device 'tegra'...failed
	trying to open device 'imx-drm'...failed
	trying to open device 'rockchip'...failed
	trying to open device 'atmel-hlcdc'...failed
	trying to open device 'fsl-dcu-drm'...failed
	trying to open device 'vc4'...failed
	trying to open device 'virtio_gpu'...failed
	trying to open device 'mediatek'...failed
	no device found

It isn't finding anything either, but the renderD128 node at least
doesn't disappear like the card* nodes:

	# ls -l /dev/dri/
	total 0
	crw-rw---- 1 root video 226, 128 Dec 16 15:59 renderD128

Oddly enough, though:

	# cat /dev/dri/renderD128
	cat: /dev/dri/renderD128: No such device

Something's really weird.

Reverting b05bbe3ea2db ("Reimplement IDR and IDA using the radix tree"),
which is the version in today's linux-next of the patch that Alex had
pinpointed, restores everything to normal.

Andrew, Stephen, can we drop this patch for now?

Matthew, since I have an easy and reliable way of reproducing this, feel
free to enlist me for testing any new revisions of your patch.

Thanks,
Thierry

--uAKRQypu60I7Lcqm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlhUE2oACgkQ3SOs138+
s6Gpqg//VYenDPLmZIsA6br3VhCkJpBELnYyFlJApghPfUjxyQuo3FHSLuQaL8Rp
ARpzvnSz/4qYkX5lUtZ5EXk/AFh9HWcTr4IIRyTxFJXzGhv8rxpyNWkxhFK3GRQf
pjV8Ksrlt9+ciDYf4SNzfZO2raV7bUJlz8AX1GWpsZNsHrpH6HZuRnuggUgkIrFG
lfTskQS2Jxl6eu/0dITuid5ItQ+PtXaakybE3nnkw8K28VnI3rCNC4f/fFe5FkX5
4qsnntJ+Aq/kNmKdSkQI8quBmJFT/iF8cDiiV1xFf9cmaKvVJAht9caFiEw1meRe
SLj7pLHJPO0hKBUNf7adfjQ8HigpdRXHKu+h11JbE19h46ZmloYp48M43VPbh945
H7B7XHDSo4nDzVSuft27T4ENiyqAcBTaBPr1czQ8PzqK6zAAiy69YaGGZlS65u9N
6WZO19t0vYrhkLytxDCToQe8OPARHzbRtSgAlnBchKyAhYu+TvNv0/wTPdPh4YIF
w8ldcSyw9xZ+W7LZZksn7cXNJuxPbXWRvCwcKIxM66N82+4RGUMQ/JNZD4ZNRKAH
bea/htqVB2zoxqOkxxZG3OIqpdXPqTOb49D9kcbQoNf6GP4XZt+nVUg2oRy+2w4/
EgEWhzpwcZ+fJK3M51HAyMdR4PinI+kZNmMoC5HvpsQ9yopc798=
=u6QP
-----END PGP SIGNATURE-----

--uAKRQypu60I7Lcqm--
