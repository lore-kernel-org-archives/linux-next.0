Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3FC2DCC05;
	Thu, 26 Mar 2026 13:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774532863; cv=none; b=PP+YaykuU2nNiTDUV7kGpQEfIYVe4BBocnopizq7WNYeQwn5QpCDC4esOsaktZ1UmglMjAufMK1OJ+uDPUhzudN+piAOs5ML47WcGdI7UPFngqM3rqeowjSlxu2aUZLZpDKJceFMnhdAwzNlTwdKqdn8bEzD7riybMJ6ld27w5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774532863; c=relaxed/simple;
	bh=patx0DjJ6e3R2s0lXW66x8zm4WKU+EnLaZi3fslffS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=js2VsDKt0L+zBep6l5uLDHhitrrGR9GF8XWooCYnufiVUnmxc8cTrxUMLI5SWPX0/6SBMcIRvYdzzMEUyxN4IESk2svB1Y4FiSTNxgqC2ojFGwONJzkLSG9hCEq6fFTemcR7LmbVxN7QXTOdTx7SwH+8OVrlOVbnRlCChg4KG+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mYOvalT9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mYOvalT9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5AB2C19424;
	Thu, 26 Mar 2026 13:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774532862;
	bh=patx0DjJ6e3R2s0lXW66x8zm4WKU+EnLaZi3fslffS4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mYOvalT90E/I6Fj9bwQdXRl+Z0xYvpTCoiSPvUwtWv/gbJNodwzWG7NxzaaU5hacJ
	 OTCCX7xzjF1sG+0HJkUQ02fwBkgNhYKCgfD/C6VRI8IXOSKwQ1XrgoniRukH8c+Oji
	 OTE2SU+mWCKwflJxySq2RRc7bc04k6jbwuY70EHzLoXFFgOqH8OIx2VZByOLTa92+a
	 f82qgy2DYwz/fr2Y1cP+KUY2nJ0UbYV1Jud97GQL6SfXb36HjBYGoTdItxA7NHkxOy
	 I9i4BGdpmhomr+ZfwkTZJC6Jd0B9B40RFhANXe+RBf4MwBnVCBQQztHs4//7OLK8Gd
	 ksEgDZ8fru1Hg==
Date: Thu, 26 Mar 2026 13:47:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>
Subject: Re: Missing signoff in the qcom tree
Message-ID: <8769b8be-ceac-4516-8e89-77860c5c2443@sirena.org.uk>
References: <abv-BVinizEwtCm2@sirena.org.uk>
 <61710c92-ee75-45c2-a9da-cfc7cd9b5d7b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+n+53ZyeQNhIn+oh"
Content-Disposition: inline
In-Reply-To: <61710c92-ee75-45c2-a9da-cfc7cd9b5d7b@kernel.org>
X-Cookie: Here there be tygers.


--+n+53ZyeQNhIn+oh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 26, 2026 at 02:43:39PM +0100, Krzysztof Kozlowski wrote:
> On 19/03/2026 14:45, Mark Brown wrote:

> >   a210cb039b41a ("arm64: dts: qcom: hamoa-evk: Add DP0/DP1 audio playback support")

> > is missing a Signed-off-by from its author

> I think you used old Cc-list or script did not use get_maintainers on
> that one, because it missed Bjorn's address.

-next uses it's own contacts list per tree, if there's any updates
needed please let me know.  For the qcom tree I currently have:

  Andy Gross <agross@kernel.org>

--+n+53ZyeQNhIn+oh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnFOPoACgkQJNaLcl1U
h9Dbggf+NxtYbcQnAVr9Ks4OHT2C5w25gibgYCfGqKQVS2W/fu2lGSvsTFw1RuAH
Fo7KRqQyAuI13558woiy50X+GDuA1BKm9LSJjhphjmOt+QeOJExAv13X8EtKmkV0
ZLQB4Lkb5keVq3pDupY4LSSzsMGBckyicCbkYkZbPMy6KXqjETnArLnegoeOkrao
bRPiqfU9HI7O1dM8nFbU7pRPyD+tsQc0Wbmpx81a288yV19Q0BmFVC7ox+Vo/8Ki
y9rCoN4nXwshaIAUpKPTCfW2qi77j+zj3nHZ/TegcUkDf0YyxIJVQY/wsn0q95q8
3xD8chfRj6S90+JkyyzR/RrO6KOL/A==
=OvzN
-----END PGP SIGNATURE-----

--+n+53ZyeQNhIn+oh--
