Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6D12D97BA;
	Mon, 30 Mar 2026 22:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774908854; cv=none; b=k4cagFGiX/UAsjGio9Sz9sGHsP0XSVZTVw0ydyK3uwq0M8y1IYntLexHWhlGV0oVqjwyZGMSKHXXJGvIIGGovPqGF/1uIJPEeY/zYy1R9HsS14OTe6Qu2om9b7sHiPRvZq8NdwizpZ0D/4eRC01vVq9s4HwW624xJAN7e9f9Fhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774908854; c=relaxed/simple;
	bh=OCG+3hU5K3Gq7p4S+ZLvN4TKUV+f691+PCIVEA4ddHk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VYHrIh3gWsqyxdM4qJKx2hF67cYIc3/HBKhK8VND1FfUc99jFbZ1/YqsX6Ft4tMDlOdfBOZqChfwqcTadq6dv2SC2Wh1hrpUh+9NlW871ITtJ/m6KC2UjPk4NjQcydO0Iuw0lryNP9JpinKnPlyHT9nlsovbk7nYZy/25JX5sSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=frlWqfg9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="frlWqfg9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB14DC4CEF7;
	Mon, 30 Mar 2026 22:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774908853;
	bh=OCG+3hU5K3Gq7p4S+ZLvN4TKUV+f691+PCIVEA4ddHk=;
	h=Date:From:To:Cc:Subject:From;
	b=frlWqfg94VfREdJGxJZ/1E0JoWhvmEl2ZiA2oEkixqVShb3PxeX3arx894AJfSAhp
	 cUhoKmCO4IIXgILmfeJhBRnWfBXrl5iwofO1pln12uPo4aS61aOj5byboKNi3oDDQh
	 NP4rF9YYEwEeYrbjPq48h4Simy2LjSDzs7T2JIQBxqZM/RwnOZqebFIbCiA77ojz6d
	 Xon0nt7M24PbvAEZmAkCZV4x1qQUTVUh27jD/Hj8sh/yE531Hbhy7MxNeazphs+2Pq
	 WopBlZSw5DMpQZo5T7dKywCM8k8T13/jqKU3Q9d0u7PM1Qsnbdi7bK7RSm8fR94R4v
	 Ecz+CUWkF7TNw==
Date: Mon, 30 Mar 2026 23:14:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: -next status as at v7.0-rc6
Message-ID: <c6bfc4bc-ba8b-4402-be9a-518091c91237@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mRsiJpBWMpvAjlvt"
Content-Disposition: inline
X-Cookie: HUGH BEAUMONT died in 1982!!


--mRsiJpBWMpvAjlvt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Trees being held at old versions:

  pci            	next-20260326 (Fixed today)
  pm             	next-20260327 (Fixed today)
  vfs-brauner    	next-20260312 (Original issue got fixed, made a
				       further issue visible - fix
				       posted but not yet pushed.)

Trees with signoff problems:

  hid	(missing committer)
  rdma	(missing committer)
  rpmsg	(missing committer)

Non-merge commits relative to Linus' tree: 9468
 9078 files changed, 554820 insertions(+), 171917 deletions(-)

Top trees adding commits to -next:

  1378	drm
  973	net-next
  337	qcom
  333	tip
  300	mm-stable
  251	v4l-dvb
  229	char-misc
  212	imx-mxs
  181	sound-asoc
  149	block

Thanks,
Mark

--mRsiJpBWMpvAjlvt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnK9bEACgkQJNaLcl1U
h9CCHgf/fxgAidMMnQwuy6dQ9Hj+DkbGRpLaqnP9P8Baf5yHU2N8NaNvNB5RIO9M
fRPXR7i56WCs9LdlDw0DIGEeDokutu2NfjVQWl/AmKjsoiUtREXcnEgppkmST8Fj
eu+IAs0+e2oKdc0eXA3nPuE8PWh8c/4Ohl69UIzTGvYKHuH/Lp1F2W00O1DQTRQ6
2aFFQMH2k0ek0+AleKkdiIdydwDkJxZVPKSvL0PFaRgOGVOJ0xs2DeM4y+XL8cR7
S6RFUrm/lj25OZRs9ZL55IGuzNddA0RXx71pWxCHvNWQn2OPMn6wIjdnb6Ad2kNg
JpTDZjW+mbY13BqMr4ZZUinqmEZ6SA==
=TtfE
-----END PGP SIGNATURE-----

--mRsiJpBWMpvAjlvt--
