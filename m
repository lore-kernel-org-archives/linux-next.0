Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E058426EA6;
	Wed, 10 Jun 2026 15:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781106721; cv=none; b=MFvKWZZk7X69QP3TQtRLaLn77Bn6cOF9k0ZEQL/I/+G3T7uY5jIQo1YPxXIAxbU6W72quhoyR6Yg+mq8k6vO1RGQQT/MN6ODlhPanPXv/96zKOg0pU2146FwZuijQApZSwvDB4otF8+5VUKS9hdBBu5tsY0pClAyoqJtJxmwy9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781106721; c=relaxed/simple;
	bh=mrV4C4iGr014vaA2UrEuC5g5/ugqlOxKw12YS+Rfkvw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A6AnlBTV59vtUGKvWDkqv3kXviNBtanHAUTsQWstkrrdzYpeXSoO0XVkeYD477L7qSV+nkYeVOwJWqzJ/TmhKt04qYWgwKQ2sCjJAbCku4agPt2w1ONO+Yr32HoVMj/AfCZwgCDWlOml+qdCm4W5datbieHSBcC3i4ffMPiXwYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FY9uEbsz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FY9uEbsz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E41A41F00898;
	Wed, 10 Jun 2026 15:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781106720;
	bh=xNeBEwiRv/Vj+4gYV3g6Z1yPXzE2CfhbTDlJysj+zmc=;
	h=Date:From:To:Cc:Subject;
	b=FY9uEbszgLVW+DKFzT85Jef4+v/rXh6OKZJbXeXqLw/bvXIAQ1ZPBQPBSTkCJnfxA
	 Q2NpNaEXES8iV+0iWLKrYEjFTZvLSSSVYiqhmcoqqA77aqPkmlOAgdGY8d77iP7bxT
	 XUPqoDcqB1dbGkozXUea4lsolh+VJjbR3kroj/2J8vCylfgNf0WRScsXsrzLI/9MWt
	 O5hQsVlqbMlcicUAMF/kGUZjtW5KIyjcQ38LvyJkznEFNmNVrhfRudzUu24EKjubwZ
	 6fBn1+kPQqfUYFz4GY7CeaA4lDP8r97xSVnXoGjNoUfsEc0W7Eic2hGvHntLx5XUcO
	 BcNJF8n0tgzNg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 5D8231AC56C5; Wed, 10 Jun 2026 16:51:57 +0100 (BST)
Date: Wed, 10 Jun 2026 16:51:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure in the final build
Message-ID: <aimIHT8KI0LZNERH@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aOR1XfKF7nutx74j"
Content-Disposition: inline


--aOR1XfKF7nutx74j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

In the final build, today's linux-next build (arm64 allyesconfig)
failed like this:

/tmp/next/build/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c:82:12: error: 'lpi_gpio_write' defined but not used [-Werror=unused-function]
   82 | static int lpi_gpio_write(struct lpi_pinctrl *state, unsigned int pin,
      |            ^~~~~~~~~~~~~~
cc1: all warnings being treated as errors make[6]:

The failure also shows up in a defconfig build but that doesn't enable
-Werror.  I have ignored this issue for today.

--aOR1XfKF7nutx74j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmopiBwACgkQJNaLcl1U
h9DelAf/QjtkAdX2Za18s/9gJY7g4ohueg0X56weueWo8DRyNssCK9JBjq7RB0U0
tLq9wpAQxs89tcRgeTgkRJTB1l1zfIksZNSNbNMLEyeZW7D9d8shR6Qqm7rLDlRt
TZ4VsWgvi3WYMwHVgElX7Kyagi+62s1VyEh34yrgkevNuFQL0sePzaNNRNk9Vdba
/939LfJNUxvCcmszucvQNTwaiqK0Wzp+xe0EaPsZDTTuTxedV+waZrl1An0cb8w1
wWSf9obnvp+y+2STJdYmURgYTiNPIre3+fVH+wpDFuNkWvOuclhohVrzJMdJKVrX
wQ4jf6tz5p7MBCimEOHnGzv64s5AKA==
=EPY3
-----END PGP SIGNATURE-----

--aOR1XfKF7nutx74j--
