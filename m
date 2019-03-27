From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the drm-intel tree
Date: Wed, 27 Mar 2019 13:59:04 +1100
Message-ID: <20190327135904.7830c60c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0194115323=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paulo Zanoni <paulo.r.zanoni@intel.com>
List-Id: linux-next.vger.kernel.org

--===============0194115323==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Ia1Gj60M+J_G=l6Dzpsyw2j"; protocol="application/pgp-signature"

--Sig_/Ia1Gj60M+J_G=l6Dzpsyw2j
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-intel tree, today's linux-next build (i386
defconfig) failed like this:

In file included from drivers/gpu/drm/i915/intel_guc.h:28:0,
                 from drivers/gpu/drm/i915/intel_uc.h:27,
                 from drivers/gpu/drm/i915/intel_uc.c:25:
drivers/gpu/drm/i915/intel_uncore.h: In function '__raw_uncore_read64':
drivers/gpu/drm/i915/intel_uncore.h:257:9: error: implicit declaration of f=
unction 'readq'; did you mean 'readl'? [-Werror=3Dimplicit-function-declara=
tion]
  return read##s__(uncore->regs + i915_mmio_reg_offset(reg)); \
         ^
drivers/gpu/drm/i915/intel_uncore.h:269:1: note: in expansion of macro '__r=
aw_read'
 __raw_read(64, q)
 ^~~~~~~~~~
drivers/gpu/drm/i915/intel_uncore.h: In function '__raw_uncore_write64':
drivers/gpu/drm/i915/intel_uncore.h:264:2: error: implicit declaration of f=
unction 'writeq'; did you mean 'writel'? [-Werror=3Dimplicit-function-decla=
ration]
  write##s__(val, uncore->regs + i915_mmio_reg_offset(reg)); \
  ^
drivers/gpu/drm/i915/intel_uncore.h:274:1: note: in expansion of macro '__r=
aw_write'
 __raw_write(64, q)
 ^~~~~~~~~~~

Caused by commit

  6cc5ca768825 ("drm/i915: rename raw reg access functions")

I have reverted that commit and the following ones in the tree up to

  9511cb6481af ("drm/i915: Adding missing '; ' to ENGINE_INSTANCES")

--=20
Cheers,
Stephen Rothwell

--Sig_/Ia1Gj60M+J_G=l6Dzpsyw2j
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlya5vgACgkQAVBC80lX
0GyFfQgAi7dRjhiXA+BM8N8B637jL5naqlVhgGyfiImegPNTN2Sr7jLKR4v8XFcZ
MHBzucDThx+w9SrWua7Xa/QiGvgMKiJff1AeCOnMwf6nIbEzCgzIDqUxrIdelq5k
VvyXwLJqUJmXQRcCDdOXK9cyfG4NJSGuuok80jvzbeLhAIYY4CAde2IglWFz7tBo
ZwD/SOYO6Acw1UQLVb3Or/I5prevtkLG4vk/0d4v4TgLFJP1yz/1DMv4mDSqf4nO
8aQXvklT9g39UGn853D7pENqYs2Df46BniHIPTDOMw3N8FZtaVb+qdzMCywMWSt+
+kO0SPS5mB8IN5+e2+TNuyE421M7ZQ==
=d0Jl
-----END PGP SIGNATURE-----

--Sig_/Ia1Gj60M+J_G=l6Dzpsyw2j--

--===============0194115323==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0194115323==--
