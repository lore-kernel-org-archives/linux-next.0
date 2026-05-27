Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F1F41323A;
	Wed, 27 May 2026 12:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779886604; cv=none; b=TXAD21g0iQuZizooHlnET+OzLo0Y91uO89mszZiE8DITAuPLXGDRaKeygnP1Pt9ZKRXRRDKaXW+QJRjtEhhnoUBrjDzbC/WSS6APwJreyyQuTJAaBdJ+Ll6i/VTi1rLm5kso/cICWdg5rwnLwSu/ls1yPu9djEXCkDt8RoBjOAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779886604; c=relaxed/simple;
	bh=4rLxwUUobtxLi2aYb10parAuE8GlcyZjcJhD/XhGRwM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AitQCfRWGkwpfKyE/FF1e2M5lGm2XOjMW4n6W8WWDagoz49Xsm7PJTzI7pQK+TZQ1SwhIZttuh0G/H+dPsMWcrfvCASLvs3N/hjwzISq/uXCbcX9GSisn4WNZR91glND+rXoDIigqu6kV2VmrEBkHn0TEmKAZvjRvbmDqXY7Fnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EEZSUQui; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EEZSUQui"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D79541F000E9;
	Wed, 27 May 2026 12:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779886602;
	bh=Iz6ILHYps36z57Fi0IYa4Ox1s2BzxTLYqpFQAL/+8Ak=;
	h=Date:From:To:Cc:Subject;
	b=EEZSUQuiZNfCfNpnbnB2yNdfAznULlOnX2K9Nc9sdDoyo4AjM+xNyhsw/dxxYhh80
	 h2CayGXNdNry/x0EqU8vjuSJAhvl8xCdoNkdDlcqAOrj8Miyn1ZhFz4MiQ+uodlWTs
	 KANa6AlQcS/8japbShQhxKcvGomo2MxW2Q1Mhs91qwRGQcl1Ab/zEzhfxmmjJizvhu
	 KsbQIL0HSIYmJ6B3e81gtGS8Nev9UTIHbju7lRiJUN2/b9uFKtlcPrCkKHsYBy5v78
	 RcXJI19FoEzdU2GoP9kWkzwAvbKbrZhyVQN55fH/FfIGVWpwmWQI5ThTF4uKkN0OzA
	 MqhpdjxKP9ZoQ==
Date: Wed, 27 May 2026 13:56:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the thermal tree
Message-ID: <ahbqBvZF_zZGJyrF@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3bEBuBnZo4k/NNOs"
Content-Disposition: inline


--3bEBuBnZo4k/NNOs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the thermal tree, today's linux-next build (arm_multi_v7
defconfig) failed like this:

arm-linux-gnueabihf-ld: drivers/thermal/amlogic_thermal.o: in function `amlogic_thermal_probe_sm':
/tmp/next/build/drivers/thermal/amlogic_thermal.c:196:(.text+0x2f4): undefined reference to `meson_sm_get'
arm-linux-gnueabihf-ld: /tmp/next/build/drivers/thermal/amlogic_thermal.c:205:(.text+0x320): undefined reference to `meson_sm_get_thermal_calib'

Caused by commit

  b21d88de69184 (thermal/drivers/amlogic: Add support for secure monitor calibration readout)

I have used the tree from next-20260526 instead.

--3bEBuBnZo4k/NNOs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoW6gUACgkQJNaLcl1U
h9Dlsgf+KCtrY/byJHomeAuC7dz1xT10elaQ22mgtkO4olrqs8KCS+zUi68a2Dvy
w6J36R3TUVM77rIQUx2SLwVmH5YSpIZ1rXTmHvgu3bMy40JzhEFhF5x8kGdkoZJy
I1lGvXfrnybZLOBZ/teTcr8lB2jknstpwk2GiD2rjmalgUTJ+3hsP1H8NquNOEYc
yRQ6CEjnCBoMCLL6w3+C2NhEWM2qTHgg1D/jZ8zHFYjR8uNaTCMyYFgPj6fyXrXh
mGWRtamp4+Zvgktkz4Tfoga1SJ6I5gqLKtTmYCbKnlRsT1crxA1NAgb2543og7R6
IYikVFA2rkh3Kaj11Ed4UnKYEoGvqQ==
=+II9
-----END PGP SIGNATURE-----

--3bEBuBnZo4k/NNOs--
