From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20160222 build: 5 failures 9 warnings (next-20160222)
Date: Mon, 22 Feb 2016 19:25:42 +0900
Message-ID: <20160222102542.GZ18327@sirena.org.uk>
References: <E1aXlz4-000486-Pb@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DTbNwtYx2n+Gggn7"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:55362 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754255AbcBVK0D (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 22 Feb 2016 05:26:03 -0500
Content-Disposition: inline
In-Reply-To: <E1aXlz4-000486-Pb@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Russell King <rmk+kernel@arm.linux.org.uk>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--DTbNwtYx2n+Gggn7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 22, 2016 at 08:36:46AM +0000, Build bot for Mark Brown wrote:

For the past few days -next has been failing to build an arm
allmodconfig due to:

> 	arm-allmodconfig
> ../arch/arm/kernel/hyp-stub.S:168: Error: selected processor does not support ARM mode `ubfx r7,r7,#28,#4'
> ../arch/arm/kernel/hyp-stub.S:176: Error: selected processor does not support ARM mode `isb'

caused by e59941b9b3817c (ARM: 8527/1: virt: enable GICv3 system
registers) in the ARM tree.  My hot take is that it looks like
CONFIG_ARM_GIC_V3 needs tighter dependencies so it can't get enabled for
a v6 system but I could be wrong.

--DTbNwtYx2n+Gggn7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWyuIkAAoJECTWi3JdVIfQE7EH/1DXSBaFCyRdig/koT7jD3tI
MzZarPB7cCMczaxfiYGg55HgtM3if4yi7uJaDj5Co9i6d6ZTpikc6QQ7VQvV2cE1
tPx5hEeOSaNdMO0itfRv2qrj16imZOjvddMD1VgRiwWtr27JTi7vFJNS+mbIgrSk
yjwmJyCul8aqh/ZKi66FRiAqKVET7sVRM8+5TgzHLjEQXh+eNBofUxUhafdUMPF4
Glwn4nbQcNBRBwPCt1hhB3P4sRAscU1C9Yrg4JISNMf/DYSh/Qm5gxlA2XDyoaFs
qPchACEpfZFgvmXQ200skzMGImyoI+LZs73p1zarbvHDZsbdkuptV4NNxliVCXg=
=oHd1
-----END PGP SIGNATURE-----

--DTbNwtYx2n+Gggn7--
