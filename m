From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20180723 build: 2 failures 11 warnings (next-20180723)
Date: Mon, 23 Jul 2018 19:11:50 +0100
Message-ID: <20180723181150.GF13981@sirena.org.uk>
References: <E1fheAy-0003tU-Dq@optimist>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2149427254769158226=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <E1fheAy-0003tU-Dq@optimist>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: linaro-kernel@lists.linaro.org, khilman@kernel.org, kernel-build-reports@lists.linaro.org, linux-next@vger.kernel.org, matthew.hart@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-next.vger.kernel.org


--===============2149427254769158226==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Uwl7UQhJk99r8jnw"
Content-Disposition: inline


--Uwl7UQhJk99r8jnw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 23, 2018 at 05:59:12PM +0100, Build bot for Mark Brown wrote:

Today's -next fails to build an arm64 allmodconfig with:

> 	arm64-allmodconfig
> ERROR: "__sync_icache_dcache" [drivers/xen/xen-privcmd.ko] undefined!

using

   aarch64-linux-gnu-gcc (Linaro GCC 5.3-2016.05) 5.3.1 20160412

however it builds perfectly fine with

   aarch64-linux-gnu-gcc (Linaro GCC 6.2-2016.11) 6.2.1 20161016

which honestly seems like a sensible and worthwhile upgrade at this
point anyway given that it's a year and a half old so I'm going to do
that for my builder (perhaps even jump on a newer version) but it seemed
worth highlighting in case this is considered undesirable.  A similar
issue is hitting on KernelCI, we should probably look at upgrading the
toolchain there too.

--Uwl7UQhJk99r8jnw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAltWGmUACgkQJNaLcl1U
h9Ciswf8CPKKm1cdUiTi6VqSlkHKJDc7PfJ/41MqmvccaAqPXn9qkUsVeo1V/8lQ
89dWVEDYedZ6nM7/ltv6vU6v3mu+arSUK1wlCMCIBz3nrUXNXTKZuJYFPWbbQCoB
sQOH6FUn3ikznHB1mLf5OAhHgkZAEvqce1hHtru7caNvo/4Hs1VHG00pUtc6sVpR
aXQ96M6kBkWDkgfeYeRLfE6HaSqzyNP/ho+DyS6EuNDZBRBrtcLt+T45YwVZXtvp
b8586hbnhkiipnGCkkV54RxvIhIRiEwyGBvBkCOIXa29f5Dl5fvHdFALzcWUa6vL
m1SvqrssHT10sXnGnAVZwed6uDG5Sw==
=0Wm3
-----END PGP SIGNATURE-----

--Uwl7UQhJk99r8jnw--


--===============2149427254769158226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2149427254769158226==--
