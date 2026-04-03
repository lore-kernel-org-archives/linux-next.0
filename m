Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36833C2779;
	Fri,  3 Apr 2026 14:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775224882; cv=none; b=U0I1vSKqjwphe0bCNlKhPfzYFv6IJ9yyRSNOAUFvJP92TodLo1zUz9Cnz5CRDjm01RScpeBgsdcAVC/Kr7XGofyhHX4xWQGHTg1bOI5GrPtIpjYV8zhScw8F5iTCTItZbc5j2kDQbgb0FEX7C7F3drFnpLQSPD16ttjT+Xv8fVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775224882; c=relaxed/simple;
	bh=8YRFNC8/B4oNBN8gK6xoUavSCSpn/5xw/Akyq7UWzEI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r2klHUsc/wGf5A5LXVNcijZ04Gai65XBkHthIWMMO0rpjYbw9qJXALOdvDz/famJla4K+RxeSkKKLznFz4HAJLmagUxE86ekqim5qO1j8jpyIgiYsbRuDG6DQLcvjBC1P2N2voTnA/CYCkrNXfykXVn0mB0JDBIJYjS7U8erb/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DgoAi0vG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DgoAi0vG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6035C4CEF7;
	Fri,  3 Apr 2026 14:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775224881;
	bh=8YRFNC8/B4oNBN8gK6xoUavSCSpn/5xw/Akyq7UWzEI=;
	h=Date:From:To:Cc:Subject:From;
	b=DgoAi0vGV7fTXERgDBr/dwvKF+Hef1UcBtOkP1hNF80LvWB6vpcz8WQCi0tHOz/i5
	 s232h+ETt+/OfdF5Sl0Wz6s07b2V83tpUh2izUmQvj7pPur38o/LA2sEB4N0iTEi52
	 lawGbXX4mBvahfienZCqr12As6Yc9v4TChXmc3rhjR/zL7qjQ5EqAfHBTUKKp00yJ/
	 RX88BcKVjHJnvX76ZI8Yz/vEdYCw8ak8mKp1Z+DOBHdmkibBrfAfS17ewgDrEzrOnw
	 skXKVDwcaQZnX/jBM2vMUE/ittzc7hL/ExQ9fV5HeZ6GVGdTAnU0DAxHGgH4uJHjf2
	 H9I7RI4gB+BlA==
Date: Fri, 3 Apr 2026 15:01:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Jian Zhang <zhangjian.3032@bytedance.com>,
	Corey Minyard <corey@minyard.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the ipmi tree
Message-ID: <ac_ILgraQZ1KcNDF@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QyMfIi/bIEvXAkjI"
Content-Disposition: inline


--QyMfIi/bIEvXAkjI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the ipmi tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/tmp/next/build/drivers/char/ipmi/ssif_bmc.c: In function 'ssif_bmc_remove'=
:=20
/tmp/next/build/drivers/char/ipmi/ssif_bmc.c:865:9: error: implicit declara=
tion of function 'del_timer_sync' [-Wimplicit-function-declaration]
  865 |         del_timer_sync(&ssif_bmc->response_timer);
      |         ^~~~~~~~~~~~~~

Caused by commit

  e1748349a14d3 (ipmi: ssif_bmc: cancel response timer on remove)

I have used the version from next-20260402 instead.

--QyMfIi/bIEvXAkjI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnPyC0ACgkQJNaLcl1U
h9DkdAf/QrbxKVwEgLsS7dOTQa6/PONZgJZpL08TSsMGw9BFM9AvxHmaqNOq4TjU
lum9R0zWczRfKPxMQXKydkYhVCx1DsdKiHQ6GDTjRXlv0A2DQNMByGcZn4Yyygng
GwCuGC2gx78mPbczyQvngqXZh6rjFQUwdoHlSaAdkEn1drrTVl6hvb5u1x+fIm56
nER6FDdQgGqx7tbyp2JhYpbrLTRAqhZjqUf2T5lMPcNR1nzr+leyGi6xQWcHanWx
riR8fZQzkL8KePnfw1qUagLGu901NJaUFRUqgQb+pfziXUdGtE+M31+4F+pOQGr8
aXUKIE4Qj82FYf8NT0aSFPwvRLspvw==
=qGrb
-----END PGP SIGNATURE-----

--QyMfIi/bIEvXAkjI--
