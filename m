From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20160707 build: 1 failures 6 warnings (next-20160707)
Date: Thu, 7 Jul 2016 14:22:19 +0200
Message-ID: <20160707122219.GO6247@sirena.org.uk>
References: <E1bL5XI-0004Z9-EP@optimist>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0116884259=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <E1bL5XI-0004Z9-EP@optimist>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mark Yao <mark.yao@rock-chips.com>, David Airlie <airlied@linux.ie>, Heiko Stuebner <heiko@sntech.de>, Simon Xue <xxm@rock-chips.com>, Shunqian Zheng <zhengsq@rock-chips.com>, Tomasz Figa <tfiga@chromium.org>, Joerg Roedel <jroedel@suse.de>
Cc: linaro-kernel@lists.linaro.org, kernel-build-reports@lists.linaro.org, dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-next.vger.kernel.org


--===============0116884259==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ClpMRN7ztK9mBQjN"
Content-Disposition: inline


--ClpMRN7ztK9mBQjN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 07, 2016 at 10:23:56AM +0100, Build bot for Mark Brown wrote:

Today's -next fails to build an arm64 allmodconfig due to:

> 	arm64-allmodconfig
> ../drivers/gpu/drm/rockchip/rockchip_drm_drv.c:17:27: fatal error: asm/dma-iommu.h: No such file or directory

triggered by c51f43a9c171ea (iommu/rockchip: Enable Rockchip IOMMU on
ARM64) which enables the Rockchip IOMMU driver on ARM64 which lacks the
above header.  Either the use of the header needs to be removed or an
explicit ARM64 dependency added at the DRM level.

--ClpMRN7ztK9mBQjN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXfkk9AAoJECTWi3JdVIfQNYsH/inRnDZXj2z6JBkqHOhAx3P0
jkEA11zb/bS1zyUA/SbTvE4Te/MQRgdBXHnbqAiFRttp43ZJ2po+PDdxB94Yyly6
JUsdaGJaHpwoBE7kq1X8MU2MgbUIaxOUNfYhuDr5KLkVenPCb8+oySWP2xkj4XqG
TZ3Pvdu4I6VFqCg0/9lZcmSKvmCILCsOf+16mXwidH1L2MDaxcwOJ3REiExGB+uU
9tK9//6R+DPh3pN0QiRDlqS3fUJqhUEpfBdghWgcNiQ3xCb2YVXP/jJLQNhvPosL
6XPqSh6N+UuL4C9u92PiO36K9TT/wQTpDoLx9B58qf/Du0ILwpXylvSTXceoB3Y=
=Ejdu
-----END PGP SIGNATURE-----

--ClpMRN7ztK9mBQjN--

--===============0116884259==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0116884259==--
