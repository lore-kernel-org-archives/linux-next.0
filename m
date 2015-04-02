From: Thierry Reding <treding@nvidia.com>
Subject: Re: next-20150402 build: 3 failures 18 warnings (next-20150402)
Date: Fri, 3 Apr 2015 00:11:22 +0200
Message-ID: <20150402221120.GA25267@ulmo.nvidia.com>
References: <E1YdaYh-0000LL-D5@debutante>
 <20150402112231.GQ6023@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hqemgate14.nvidia.com ([216.228.121.143]:13377 "EHLO
	hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751666AbbDBWLo (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 2 Apr 2015 18:11:44 -0400
In-Reply-To: <20150402112231.GQ6023@sirena.org.uk>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Paul Walmsley <paul@pwsan.com>, Mike Turquette <mturquette@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org

--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 02, 2015 at 12:22:31PM +0100, Mark Brown wrote:
> * PGP Signed by an unknown key
>=20
> On Thu, Apr 02, 2015 at 09:33:03AM +0100, Build bot for Mark Brown wrote:
>=20
> > Failed defconfigs:
> > 	arm64-allmodconfig
>=20
> For the past few days -next has been failing to build an arm64
> allmodconfig due to:
>=20
> | drivers/built-in.o: In function `tegra124_132_clock_init_post':
> | :(.init.text+0x285d8): undefined reference to `tegra_emc_init'
>=20
> This is triggered by d035fdfa27ac124bc8 (arm64: Add Tegra132 support)
> which enables ARCH_TEGRA and ARCH_TEGRA_132_SOC for arm64 which in turn
> causes clk-tegra124 to be built on arm64.  That driver relies on
> TEGRA124_EMC but that depends on ARCH_TEGRA_124_SOC which is 32 bit
> only.
>=20
> We either need the EMC driver for Tegra132, a stub or some ifdefs.
>=20
> It also looks like there's an issue if the memory controller driver is
> not enabled (which looks to be something that can be controlled by the
> user) but I've not checked properly.

The ARM64 allmodconfig finally finished building and I've pushed
something that should hopefully fix things.

Thierry

--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVHb6FAAoJEN0jrNd/PrOhS8EQALDRQ6XnLmiARPOSch2BdUqm
dRVNrYmbABPTYDGF8kCu3Mw9z8c7/kpn3N6eFSJu+Pjt1s/XZR9Sx6sV+jesKfES
ofsouk8X6RMqLzfWXhV1HscVEqExIW7336l2KT2KhegW+8S/ylKE9BgVzL2eiGoh
jkNGI5nCGf8gpRBoNiuE5/BDirLeGLEEx8M+sDPyTroPBslWA3l2w7Q5onNGJIws
twfrpSzJZzhayiiRG63edgub9PwYxuZnWbsr/6TY07PQ6wLc+wCyvI6wfqnjwSd+
KnUvCHx3BjJnZmd/eCAMWPxEsIIDlwgQOe5/Z8dRTTkMojpt5jRjXZ5FgKsMNskO
S+ymCUv7Vo+fLOtKoM/Pxr+NjEP+ZSu6sBKPI2JbzU3d6eDha1fdRkbLkhyQffw7
W2W8D32XiJEOdjYap+JLAw8o4nznLnmYZW3Dy0K86TzoRU0Wu7zsLilwMpcQ7BGi
ux84QIv0JLQLPswcA2Lk+ACKQpBLObjnqdefF63e/fPmsnUklNMFVbJHCHrMAfF/
DdPbzVHV1BQYcQjJiPkFuZDJisYfIlMn9bUvT7DrOcytGwcX8NQKDQwpwW3PLsNq
RQdanZ866vcVv1yfPdIUVWfVZrRCNVgp0oFGE00E3uU+wL3gnckYgy+JfgcjwqAh
NYljKrdGrxW4id3MbvX9
=Mh0b
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--
