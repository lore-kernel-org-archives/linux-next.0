Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393BB2D0620;
	Fri, 27 Mar 2026 22:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774649133; cv=none; b=kUf+BSCrfN9ppt4qfRhStu7oN6zj7n2WxuXKJQHPL/kIZ2YFcOJTW0IWACgLu9ehVvsQFNbcWVI9N50B6PVzDHj03jZ2tYdUjpSAVwjUkjl7jHjUTQM/PL4algaFtliqe/xLleUuwlkmDTirJiATA+J9cxzuH6Px9KByEyKQq34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774649133; c=relaxed/simple;
	bh=npKx+5M/0pevpoOr3rCdqc478AZV1oipvEHaa9ptGas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PuVnpCQgO9JjiNSrDgt2d7guZiixRs1ekLTuPuvDzka3L47+EcyWy3hqbHTCh9mRjchIpxpj64WqygvbpH9IeEZk484MChBM9LjshaP1CHWhvAYrlf16/QXRK4oP4PesqTyAzlAmskD3c9GDz5XMCMvpKaLCDTcTrDTFmO5mw7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kIOBWyJM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kIOBWyJM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5264C19423;
	Fri, 27 Mar 2026 22:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774649133;
	bh=npKx+5M/0pevpoOr3rCdqc478AZV1oipvEHaa9ptGas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kIOBWyJMUdO24hbWYQiZnX5Jza62DWeajkKJiNtcFAxiOcTkRxb6mrkF5scllsdt5
	 LY5PLZLnAnkKyzihzXhw1rmHbug7CvTUTSNKL+4Yhgh03QvOxGf1VbND9qyMWzEYdp
	 ZOx6UH/9N53UsbSyeB9vjiSPXsnzLs9fSXw2GdzF8gK7aWOv0Igu3F/py8Y46Q8jeK
	 pYQLmGIUZeNAKKUteSLEEA3AoP1biNh25AbxbE2uq3ojJC/NxQOJV5TOPUGCDxWFLS
	 hkw6hkntumdVTTJe2KguykopapWqsrw9gkAM+TdVpRlmPl3Q9caqSsgoVyDHXuG+jk
	 vlZONRbqJdd3A==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 0F5E11AC589B; Fri, 27 Mar 2026 22:05:30 +0000 (GMT)
Date: Fri, 27 Mar 2026 22:05:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure in final build
Message-ID: <acb_KohgLVh5u1yO@sirena.co.uk>
References: <acb-IuZ4vDkwwQLW@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/yrPCFYSunxlvJJi"
Content-Disposition: inline
In-Reply-To: <acb-IuZ4vDkwwQLW@sirena.co.uk>
X-Cookie: Are we not men?


--/yrPCFYSunxlvJJi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 10:01:06PM +0000, Mark Brown wrote:
> Hi all,
>=20
> After merging the kthread tree, today's linux-next build (i386
> defconfig) failed like this:

Sorry, didn't finish updating the template before I gut send - the
kthread tree is fine.

--/yrPCFYSunxlvJJi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnG/ykACgkQJNaLcl1U
h9CxcQf+PJxlQQbbxNvTYX2HLw6Y10ffVUMzuBAt0rqKYu51AlRZmsyRmekuOTeO
Pa5VkS7R9G37dCiamifhXojVDMM2JP3ct6ObYhCklESEhc1JIMG0IRf23yJKU1Uc
d4yAHYvZTrn6enR+0VLZwsK5NHBaiU2JJkbpRhdgxmJ+f5O3od3ajwQHdIuRRxKC
MaQPFVGH8kTuuE8eXtdTaRBaI95rlXk5kqT/ipHxZxERcDkuXr9ekhqTBjAQahtm
Q/v4ycJUc6G1qxp3qIfzvQoomLDFXejqCkf3ytvzza+zGck56WktDL3VaSqJ8VE0
Sk5dmbLm+3a/SmbD/8cag5FfwqWx4w==
=rBd+
-----END PGP SIGNATURE-----

--/yrPCFYSunxlvJJi--
