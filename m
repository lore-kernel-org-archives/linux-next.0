Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B4029BD87;
	Thu, 30 Jul 2026 15:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785423664; cv=none; b=uAuIa6lFQ+iEs9e4kXAGIprbGMPzraSjir0GvyvwH/zv3R5UNcMoZ3tqQeQTKkwEbbIg3ZE8x3c9745DNBr1xgtRDIoQMtE/np8jxDSR3/m7NoddtwdUvqN+OWKmEaDmlGTkQSYRnO4YYq3xZTjNDSsrW4aaCiXZARlXKLgsLlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785423664; c=relaxed/simple;
	bh=dexo2JOZKuiD+9CFwT/d0iWJsOr4LUvrxETMPclXh1A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VyU7Yb8yM3kGoXWwf0mKr9kNGpYUI3G4bpfPhP6VlAQE7vaTkT6OjAbmM5mtHylqQEeLFZ6BaLcuSWSoGUp1tiKia32Zq7rWL1Jm8GvgMFNqdshPyxWAk1hn+T+6TSfnIJCU7FsYU5onbaxURiKnQYYTdVT9Mb/TUxbUBM3/6Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C6fDu1cV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C6fDu1cV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AE8D1F00A3A;
	Thu, 30 Jul 2026 15:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785423662;
	bh=Kp2CsvGUP5C/h57T8gmlucnjwMrmxHawUmjbjD7CM9w=;
	h=Date:From:To:Cc:Subject;
	b=C6fDu1cVns1z5A4Fc3sbzZK8s5w0svOaQSzbIiW6FMSbc8BOk4U/ugqT1+OkEmf6A
	 Xiz3bRW5fStnOUpogCQtht7VGpXTWUM8hWI8LHf2wpuRBFiZAZjFElSHC562DmMuiO
	 wxh8fkzzqEh49U67M6QqR28bQFGasL9VOBtZ+oLY3c+FdMA+pRstblJ2xLu9v/zvgJ
	 U9DuEh3sp9UmYNi+IQqdUcejokM7mP2yWVzV29b1hB/oTALQ6LiWuiAqO0XUoJwzJ/
	 vWVtW2xpb7/w6noRgpKoSMc0Stmd6DypkOWZjKIuPqBRt+jLlWnotped7RZ176iIEC
	 Ee734fiPOawEw==
Date: Thu, 30 Jul 2026 16:00:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
	Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure in final build
Message-ID: <32fb10a1-c070-4f0f-bf89-796bb5e946d9@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rWSjuDjRBfPTZBYd"
Content-Disposition: inline
X-Cookie: In specially marked packages only.


--rWSjuDjRBfPTZBYd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After in the final build, today's linux-next build (arm64 allyesconfig)
failed like this:

/tmp/next/build/drivers/pinctrl/nxp/pinctrl-s32cc.c: In function 's32_pinctrl_probe':
/tmp/next/build/drivers/pinctrl/nxp/pinctrl-s32cc.c:1565:33: error: assignment to 'int (*)(struct gpio_regmap *, enum gpio_regmap_operation,  unsigned int,  unsigned int,  unsigned int *, unsigned int *)' from incompatible pointer type 'int (*)(struct gpio_regmap *, unsigned int,  unsigned int,  unsigned int *, unsigned int *)' [-Wincompatible-pointer-types]
 1565 |         gpio_cfg.reg_mask_xlate = s32_gpio_reg_mask_xlate;
      |                                 ^

Caused by commit

    94cb9e8f27079 (pinctrl: s32cc: implement GPIO functionality)

which I have reverted for today.

--rWSjuDjRBfPTZBYd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmprZyoACgkQJNaLcl1U
h9BcAQf8DcoyHvfid+2TBpfA3ofu6W3xCaALizh/OUnpZMTbLemppgS4jF6lGs+K
T+4NuO7LxSK6qqF3Uf7a+pzbpIVA3EH4tpUc4ZTf2b0BI7s9XKndbTruJSAEEusS
zaStwN/EEbqnpk266G2I6mg/T+nYTm7KQkrvwBnb42ikbAgx41zHHFrFDMpD5c9z
/S6C/QXVl8JYbR5ZzzcL7fbLNZSAXTAZ635c21zgpVCnec76TkryDeH2L5WFJVC8
moyWAdMInvxjOxW8OyR0aYk9BPiYXJarDE7uSoqjEEDx94Xhwz/1mZ8B+4FG15W/
qKN2PTadpkpkXxFa1bLiGlWBi6m2Jw==
=4NPZ
-----END PGP SIGNATURE-----

--rWSjuDjRBfPTZBYd--
