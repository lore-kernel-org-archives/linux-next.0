From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: linux-next: build warning after merge of the drm-panel tree
Date: Tue, 31 Mar 2015 14:16:03 +0200
Message-ID: <20150331121601.GA26483@ulmo.nvidia.com>
References: <20150325172056.20be6ba2@canb.auug.org.au>
 <20150331230355.747c30a0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:32901 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752386AbbCaMQJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 31 Mar 2015 08:16:09 -0400
Content-Disposition: inline
In-Reply-To: <20150331230355.747c30a0@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2015 at 11:03:55PM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> On Wed, 25 Mar 2015 17:20:56 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > After merging the drm-panel tree, today's linux-next build (powerpc
> > ppc64_defconfig) produced this warning:
> >=20
> > drivers/video/fbdev/Kconfig:5:error: recursive dependency detected!
> > drivers/video/fbdev/Kconfig:5:	symbol FB is selected by DRM_KMS_FB_HELP=
ER
> > drivers/gpu/drm/Kconfig:34:	symbol DRM_KMS_FB_HELPER depends on DRM_KMS=
_HELPER
> > drivers/gpu/drm/Kconfig:28:	symbol DRM_KMS_HELPER is selected by DRM_PT=
N3460
> > drivers/gpu/drm/bridge/Kconfig:6:	symbol DRM_PTN3460 depends on GPIOLIB
> > drivers/gpio/Kconfig:34:	symbol GPIOLIB is selected by ARCH_REQUIRE_GPI=
OLIB
> > drivers/gpio/Kconfig:23:	symbol ARCH_REQUIRE_GPIOLIB is selected by MCU=
_MPC8349EMITX
> > arch/powerpc/platforms/Kconfig:350:	symbol MCU_MPC8349EMITX depends on =
I2C
> > drivers/i2c/Kconfig:7:	symbol I2C is selected by FB_DDC
> > drivers/video/fbdev/Kconfig:59:	symbol FB_DDC is selected by FB_CYBER20=
00_DDC
> > drivers/video/fbdev/Kconfig:374:	symbol FB_CYBER2000_DDC depends on FB_=
CYBER2000
> > drivers/video/fbdev/Kconfig:362:	symbol FB_CYBER2000 depends on FB
> >=20
> > Introduced by commit 6a43766f6ef3 ("drm/bridge: ps8622 and ptn3460
> > depend on gpiolib").
>=20
> This is still going on ...

I tried turning the 'select I2C' from FB_DDC into a "depends on I2C",
which seems like the more appropriate type of dependency, but that
causes a slew of new warnings because now all of a sudden some symbols
have unmet direct dependencies.

This is really quite messy. The only solution I can think of would be to
provide stubs for all of the GPIO API so that the dependency can be
dropped again. That's a little extreme and shouldn't be necessary, but I
don't see any other way to untangle this mess, I'm afraid.

Arnd, any ideas?

Thierry

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVGo/7AAoJEN0jrNd/PrOh79wQAKIcqimHbADwclq0StZ0lDfK
ofgjUjjDXCJKSSDQGFbdw+ip1bHmapPCHWWgbMFJivGEjZaYDE0pgas5vOqPPfXT
2GrisuNO4zR+ltjwi4Isb+ZMTfNLoIdNK/FQhYogJeDx1no7xVtZFDiw8PLsu2tl
VkIUE6evJVZV8nrg+Hc2Hwg7Z0f6FaAwiHp+rIEBMShTphP1oG9EAmaVu3NjppfV
r9HYDdxX/Km1IGemfJ/ASRsB9pwEvlHO2zXM9/GN4IWn/ujVF5PxPLGQaiXOotDx
vvhFtY8uKxzX2tEBTBlasQRkiuNPsiVxZ7plOEDO+PZYGGgwVuBx4xs7MIw1JlOT
WcmIQGitRjy0oHWe8eYleZOxZACvVoYGSSJjXfdWcCIlY7sbnOCuZpyp2K0+gFuO
PtNNBrFo2W+6mfyhEQIRi+LmzqCWVIcPDbGTUPjhR9zcS4nZGyCh64KTx0Lcg40J
NAG+gnbPSRXoDCbnIpfmj1TbAzPy8b1IgJAQDQSqZ/YXcgNt0teoAS4htH7EWYFl
eE3dZq+nZblxI6chTb2ekzc2YcAwsh6niOJ2XXxzgrwLIVrTpvboxwUJvvSqMrnV
G9a/zeHkb125+B/IHOkSTBjPbCFNM7gSxOmkG+OsApu3GJFtocYNcZXzF6nayYOg
Qciiof9gDmJ6ulrUN2WV
=z/5q
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--
