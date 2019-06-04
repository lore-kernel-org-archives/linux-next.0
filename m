From: Mark Brown <broonie@kernel.org>
Subject: Re: next/master boot: 257 boots: 11 failed, 229 passed with 16
 offline, 1 conflict (next-20190604)
Date: Tue, 4 Jun 2019 17:23:53 +0100
Message-ID: <20190604162353.GJ2456@sirena.org.uk>
References: <5cf685d0.1c69fb81.e3d89.43ae@mx.google.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7191685414016622897=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5cf685d0.1c69fb81.e3d89.43ae@mx.google.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>
Cc: linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.infradead.org
List-Id: linux-next.vger.kernel.org


--===============7191685414016622897==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ihETVmeDfwOC2qSl"
Content-Disposition: inline


--ihETVmeDfwOC2qSl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 04, 2019 at 07:53:04AM -0700, kernelci.org bot wrote:

The past week of -next has been failing to boot on the h2 and h3 plus
boards:

>     sunxi_defconfig:
>         gcc-8:
>           sun8i-h2-plus-libretech-all-h3-cc:
>               lab-baylibre: failing since 7 days (last pass: next-20190523 - first fail: next-20190528)
>           sun8i-h3-libretech-all-h3-cc:
>               lab-baylibre: failing since 7 days (last pass: next-20190524 - first fail: next-20190528)

In both cases it seems like it boots quite a way through but hangs at
some point trying to get userspace:

    https://kernelci.org/boot/id/5cf6569859b5149b53d514fd/
    https://kernelci.org/boot/id/5cf6569959b5149b53d514fe/

multi_v7_defconfig comes up fine on those systems, looking at the boot
reports for them it jumps out at me that the regulators never appear and
things like MMC that use them don't either:

    https://kernelci.org/boot/id/5cf6550659b514995fd51538/

--ihETVmeDfwOC2qSl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlz2mxgACgkQJNaLcl1U
h9Ddhwf/SLih1gCHTGrvjYaoyeL4fpvDoxfbhQ4TV0UAvoZSp+hQUkbGIe632vmz
6QUmtKaep4t91JFDk8qzEBLceLdJ94UjuBuotyPTvdnsNZE+tVA0h3mUHlWqufLv
FbEQIU6/IRBxdMCe2ypKzURObf2rXmgXj0FiLfjJhuq2zqWtLbBG7UZb7RJIbGpP
4+w3iLT5n0XroFrcswDsuwoBdZ9gDEyX4JSb1FiqEIKhy5w46NUQNSKujDHPnSdm
EbXuRPPGcOX98fR7KVvvN1RnqZeIrt8AY2w/kvpnoMA6ILYvTVVbD6Lw79LIsVH+
LM7eTii1ZUuc5V6GOlTjkf6Ez0P2Fg==
=KVlZ
-----END PGP SIGNATURE-----

--ihETVmeDfwOC2qSl--


--===============7191685414016622897==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7191685414016622897==--
