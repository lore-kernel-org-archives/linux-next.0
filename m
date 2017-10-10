From: Mark Brown <broonie@kernel.org>
Subject: linux-next: build failure after merge of the keystone tree
Date: Tue, 10 Oct 2017 08:19:24 +0100
Message-ID: <20171010071924.ddxkylkwq44qh47q@sirena.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="426bvsttycsu6xfd"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Santosh Shilimkar <santosh.shilimkar@ti.com>, Murali Karicheri <m-karicheri2@ti.com>, Franklin S Cooper Jr <fcooper@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org


--426bvsttycsu6xfd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Santosh,

After merging the keystone tree, today's linux-next build
(multi_v7_defconfig) failed like this:

  DTC     arch/arm/boot/dts/keystone-k2g-evm.dtb
Error: /home/broonie/tmpfs/next/arch/arm/boot/dts/keystone-k2g-evm.dts:150.1-15 syntax error
FATAL ERROR: Unable to parse input tree
scripts/Makefile.lib:316: recipe for target 'arch/arm/boot/dts/keystone-k2g-evm.dtb' failed
make[2]: *** [arch/arm/boot/dts/keystone-k2g-evm.dtb] Error 1

Caused by commit

   a6f244505915f ("ARM: dts: keystone-k2g-evm: Add I2C EEPROM DT entry")

I've used the keystone tree from yesterday.

--426bvsttycsu6xfd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlncdHsACgkQJNaLcl1U
h9DJ1Af/QfswVM9vmKcXKsL8sb1IQjH/z57M+vgEfQINvkB2yHCVLxMJKJ+OJivU
UI3nfISrA6bhToUBcHWqqmgBlCo9AchG8uJAJzrPcHDBNHkiLtxyPCOztlnLQqtG
S8rZVFFlzkH87mSB+yfi588BGE16L1nDN+WywTY1Y7OXHh0Z0NVHE0kdNOC7K9ir
Y9JVTKPQ5m1cPWrgqgEUMUUYXy0GeLW7zgrnNieE0cAJwW9ISRpN74v5nakUVrfs
0byYbMoha0Q1ANHi16CUOhecUk0cnsghXOrvIkNo4YJiQEbnraMNeCEiFoAIyx1y
o5yC8i2yZujf9kp/3zFeQmDZB5M7QA==
=Q76/
-----END PGP SIGNATURE-----

--426bvsttycsu6xfd--
