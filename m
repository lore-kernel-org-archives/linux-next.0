From: Thierry Reding <treding@nvidia.com>
Subject: Re: next-20150402 build: 3 failures 18 warnings (next-20150402)
Date: Thu, 2 Apr 2015 15:50:05 +0200
Message-ID: <20150402135003.GA27011@ulmo.nvidia.com>
References: <E1YdaYh-0000LL-D5@debutante>
 <20150402112231.GQ6023@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:3370 "EHLO
	hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752347AbbDBNuQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 2 Apr 2015 09:50:16 -0400
In-Reply-To: <20150402112231.GQ6023@sirena.org.uk>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Paul Walmsley <paul@pwsan.com>, Mike Turquette <mturquette@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org

--+QahgC5+KEYLbs62
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

It's actually triggered by a newer patch (f8fd257fabf0 "clk: tegra: Add
EMC clock driver") which adds this new dependency.

> We either need the EMC driver for Tegra132, a stub or some ifdefs.

Tegra132 uses the same memory controller as Tegra124, so clk-emc should
work on both. I likely overlooked this when applying the patches. I also
have a local patch for this that I haven't pushed yet. Will do it right
away.

> It also looks like there's an issue if the memory controller driver is
> not enabled (which looks to be something that can be controlled by the
> user) but I've not checked properly.

I'll do some testing to see if I can break it by permutating some of the
Kconfig symbol combinations.

Thierry

--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVHUkIAAoJEN0jrNd/PrOhAiAQAIbjIdZGaH7OaxmZLbbwUzPY
NddlWDsOfq8OPRHgMyT/keVBiag7afYGlgObGF5NDlCjRGV5i/04+cSOHcM7BiJz
fQ/GxaY0ZXt9Xb8l2KZwdAGRYLLwprMRSBD32d9/kgAzJFoMuKGj3soZg1p0wSRn
vxMff8RnVxmc2IkMhEabgnLRIovU3N5J/cGqS9ISmn/UCnO6sa/S+2mt223jOZ7k
naf6DA41j3YbLZZn3gW0V4pkHWKjYzNKT9C5XhiNKoBBjqDmftbfqh04SA34biYR
UmnkkyRYVudZ035ZWKgYJNOzVoCkFJHauYEoxlEhH2p3nEd7sdi589NydCfivuyx
/K8p3QC7RWjnmWZBtPuSe5QT6FSwK4TPItcPpZOvjRr+ojalBdVOrOavXEgPzreq
ZYrWAs9B/zuiSA+X7/7kWRbO1sf3kQ/Q4Y6fRoV5RAk0+cSIsJb1tcYwGN1uUkAv
0GXhgEUe0Kslnv29MWdF1QmsTkHggaYmM2gda4huP+C9sq7SSJFxlkElS32zQTd4
jeD4StxLiwOt29Zogh6qTG7iTRmsDgwU3KZQKFZs0A0qtkHg8P0Rb1Kg51VBXnBh
vZakTWrEmJepjV6yQ4dro4XGTR3gN+JIPiJEW/LNX+Mwe1xhrZtezQf74Rw/1OWS
IywmJX5Q6Prfi0P6Nlwm
=kd1O
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--
