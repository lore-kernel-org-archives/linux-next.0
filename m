Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C29311C32;
	Tue,  2 Jun 2026 14:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780412013; cv=none; b=qxXC/0sNIdGreb9oOOt+cLW2t60ND0y3SOVRgBVmBC2XOB/P59SxTZWnravQU9K6cT2vhm6kx6uD854QapUuS0f4+whQ0HTaUijObLHeGYq1TXDHFi8jFaw435Cfp3r6y5ESdMCOCfeCLA3QIIx43TVZqhO8io3gYxzMdbepSGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780412013; c=relaxed/simple;
	bh=eUcaNbwL/PiIP6KxQrTu2lWyk4d1erOxWlLseGmZNg8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M0EYjvZbooDQ0s129PymSuB98Fc0fIQu5ow5FoX+SeIXGeL/0sfZSAOS0PPQdXuMCBEme7crcb5Q5O8qbFIyLj4Q1g2xkSIzkbxgxHnfKjwNq4pAJccH4AkOD4zhPVvRnWwMLCtExErmxgvgIHcrp4Tfou4H/MVr/XYkwz1nCc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZKf+yE7p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZKf+yE7p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E16CD1F00893;
	Tue,  2 Jun 2026 14:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780412011;
	bh=M6WVbhBjKwG+Ixi4afOV4V37dYpYYhGsbQHZpfx37kY=;
	h=Date:From:To:Cc:Subject;
	b=ZKf+yE7pYetxw7XH2EpYZqDlnK7Ucrp6njVpqqlmqwalFjoOlqFUBjMc5obrBNWSf
	 ELnT9JBOH7vU96mp0BRWKdfoh7sJXdhwU00mKg2CPZDh33ihn1vzdbPUfSO70U3gg2
	 TXrMfIx5g68MnnaoqkDoivy5S2IQYOYO5ZNGY770L1KgTKPs4VBmKE9l9H1Bx13bpn
	 vfXbOnrdVVtgE9ZOj0w8KkxtmfCgEax0lferXw+coN8asr9aKQlyGIV9E7QkKdoW0Y
	 KhrfZaKJKjK6MJQ37mTC7aAHyPPwMGTbUIFv/uYfG3WOPs+wXKe6YfTKaXgdCIcruv
	 DZRYzJUgN9Evg==
Date: Tue, 2 Jun 2026 15:53:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Frank Li <Frank.li@nxp.com>, Alice Guo <alice.guo@nxp.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the imx-mxs tree
Message-ID: <ah7uaEyP7mLUYLqf@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/6tEjy0h7UWAgaer"
Content-Disposition: inline


--/6tEjy0h7UWAgaer
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the imx-mxs tree, today's linux-next build
(arm_multi_v7_defconfig.log /tmp/next/x86_64 allmodconfig) failed
like this:

Error: /tmp/next/build/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi:337.14-15 syn=
tax error=20
FATAL ERROR: Unable to parse input tree

Caused by commit

   3d016a3272010 (arm64: dts: freescale: add ULP watchdog nodes for i.MX pl=
atforms)

That's not a ;.  I have used the version from next-20260601 instead.

--/6tEjy0h7UWAgaer
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoe7mcACgkQJNaLcl1U
h9CUpwf/f5ry30UNmpUeQdbYoh4d+gxrMdjlQzv7Z/Vwy5sTLd/rktFRmp5Dgbtd
LzodPD5T+gKFY0veoFlt69KOFvCXq/tU3z4uU6b0+ecA7ikBDYxGnRvdJ0hNJDxw
ONdC2ZFvOvQ9coMDI+VSfEBwNjOa8a7AF0rjk67q0YCwm9iYPvZbVibwVzbNTERk
YG6N8kqbKQIJVhBzHEuBAPGRJ3m26byAV+bU6HpZBo4EnL2BioRfMpTYNA6sClJI
UPTev/xWFmMxYL3LSlx6ygMn9bkAMtZ5fNvrUNk3kyiQKpaKibIvvolA4uzY6LM8
FPgTJLSHKV+wGhFb7bEpY3TG8/A7eg==
=zVX5
-----END PGP SIGNATURE-----

--/6tEjy0h7UWAgaer--
