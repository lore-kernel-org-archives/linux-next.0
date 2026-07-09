Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5507F1BBBFC;
	Thu,  9 Jul 2026 14:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783606891; cv=none; b=QaVHyXvIPkpIOLxX7LiUX8dQDrOXfRMctwQpR5r2hU9tbCAdD8+QCH47OfukxXWXYaVR7eB/eZA9ijB11/nFRNmrXFtjlzndwBxZt9pzTf9DdwKk844QR4z436IokeHswlJF95gPQS0tAjkbijqMEhJqpLr9nYfAFARtSGQbdw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783606891; c=relaxed/simple;
	bh=bNezC36/RO/liNm+G91NLUrUbM6BYkRWrTrImnzUu3g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rrmMAEGnmWi9BhAdpm+5CQq4jQCflygxROsyaBP+rIQzsGwVCYIBICnHBnFcPazV3QfJZTw2FFCc+piztJCpphRNxEtO1hLcY4lo5cFOyUIjNPJ0fdb1hPoqkvKX4EPCD8dh2u0vTqMpEtzORVaGZpD16tYS6jKGwdLH02/7rMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i/gSw1Fx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i/gSw1Fx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C168B1F000E9;
	Thu,  9 Jul 2026 14:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783606890;
	bh=wLNSqPYiNWslyrKW4sA/n7g81bgi3TN2U9DNtwkgnfQ=;
	h=Date:From:To:Cc:Subject;
	b=i/gSw1Fx2ZWJndVxnAocslxeTBSGey59R4UVceEVM4YENcxJ/mmgzSqLCQtCgDjQP
	 lQOLY0BCr1j9WHXw7a+KFDVlkH8pTb+H/1+2s9wl0yEahMfaVHvR7NnFQdZ+zWxfso
	 LdKZKJPGlXrd8h+iWUTw8Gd4jvquMSGJIQm4yvQx4ZI5KUqlmwQ/iv2U8mcdmbEMn5
	 dAdr7aPwgYHfopfWrcmCqKlVy6cl7enjquR8SGYm6mqKWvT8vJy7oJejZsbHx07KLK
	 tj2I/2gNqZU96vbCkp7Nzr56+36RS+wpGJ17iXe8wMbQG+FUeS4N2QsyCyoJygXSCL
	 SNv7tkWfTlzaw==
Date: Thu, 9 Jul 2026 15:21:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Nabige Aala <nabige.aala@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the qcom tree
Message-ID: <ak-uZvV0XcQP7byi@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jf1AdJYp9vySZ0Ol"
Content-Disposition: inline


--jf1AdJYp9vySZ0Ol
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the qcom tree, today's linux-next build (arm64 defconfig)
failed like this:

/tmp/next/build/drivers/soc/qcom/ubwc_config.c:148:9: error: expected
expression before '{' token
  148 | +       { .compatible = "qcom,shikra", .data = &ubwc_0_0_hbb15, },
      |         ^

Caused by commit

  a45af9d6e6175 (soc: qcom: ubwc: Add Shikra UBWC config)

I have used the tree from next-20260708 instead.

--jf1AdJYp9vySZ0Ol
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpPrmUACgkQJNaLcl1U
h9Cpywf/YrP3IME77o3q1r2AgsbtQZwwod8Vf1eKJkC7ejf8ZWh42t6n9B0ehu42
ZLeM8AVf0hrqgtws0xvhWoWT40LXTM6x8BjUKX+ftwyNDpG+pkRmA8JAdmbSzjM4
ZKy2YoZ3bQnW4s9gKo0Hd2hhVVi3pZyLr0VOjXrae7m3kfd4F2BvrgUm6fekrV8x
ID1WwbpeSkJRef21EuXbaXFrnmv6CqM2vwTM0tOXMdB0H5O4O7Ot9d1KjfX3BxFe
jF4/dJ2RYt4kaVHwGbwILbK2PaNcQUq8YbmaPCY3X6S1zJzrPyMbujO/hCqtGiGU
5XeOxwk6Nxx/ad7MdvYM/CigpE1EdA==
=gqn6
-----END PGP SIGNATURE-----

--jf1AdJYp9vySZ0Ol--
