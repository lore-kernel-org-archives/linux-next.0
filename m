Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D400832ED2A;
	Thu,  5 Feb 2026 20:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770324738; cv=none; b=iLqcA6DHj+aY8J5dk0giOy3uaajjOXToBt/xaGucmW5WEXEglhgq6lXH4nIPZ7WoqX6vifoCNX6tMW3q0MCBNyIV+zgz/cXTG4gwUEr6Ug/WibokfMJYJTSkW3ey8odE7hS/zsF9PGuJLCevpJplQxhGeK8TM2YuRTXl8pLj3xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770324738; c=relaxed/simple;
	bh=WPt2qsTFy497P35xH5ZYoNsD2l+1uiNj+hN1FAm7O0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=II+a22IJCrJ2b6qnQOnDGFMVjJEHqWlRdHohGC6RL2zXJo7q8pmVl6MSmWe9SfFhfmRYRPBlyddarVdTtZoORE4HxsJeBkQkw2Qix20De3niYRxobbiw6l99mvgEmm0QCYbZ20iosNaSsk68I4UV8N0yrt2xePAQYgva5mUkrWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TiX8WPC2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TiX8WPC2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F4B0C4CEF7;
	Thu,  5 Feb 2026 20:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770324738;
	bh=WPt2qsTFy497P35xH5ZYoNsD2l+1uiNj+hN1FAm7O0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TiX8WPC2DuhlQb7/RwWzsfzwrKi2Z21XGMcHJb6CBlzSPHzrffWCmaBeRhy9HNVG5
	 gKdbO3CXBOTKfNLu4ACQ5OA12SkY0mcrEzdyHXV5AVq7x14ZH7EvUwyQny3RV1RX4k
	 VZJ1qeqInrY9eXQXCAMhTycu1PmzEpxNQkWCKkevJRV7e8tJFoxwnJw7kF5/xpk4ys
	 7ZmCTiKU5kaP2rqu5Yek0dfmK4Ga8k9jnW//MKt0OXN5x2ei1ycvjBpyzPj8ET3IGm
	 mVriij+EJynf9EK+q0pqPGDt8uV7QMKJdoXT+2bibGd+eir8FVzptOXpQgqbtIcnmv
	 x8RNMHuNjG3UA==
Date: Thu, 5 Feb 2026 20:52:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Josua Mayer <josua@solid-run.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mmc tree
Message-ID: <3bde6a06-dcce-42a5-b97e-a44072330462@sirena.org.uk>
References: <aYScLt9IJ-odFmx_@sirena.org.uk>
 <b4d5a179-b0b6-403d-bedc-56b3ae69cadb@solid-run.com>
 <db9b6ada-896d-42f9-9072-d67803122190@solid-run.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8VWhL9gHR0NA37hc"
Content-Disposition: inline
In-Reply-To: <db9b6ada-896d-42f9-9072-d67803122190@solid-run.com>
X-Cookie: Non-sequiturs make me eat lampshades.


--8VWhL9gHR0NA37hc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 05, 2026 at 08:28:58PM +0000, Josua Mayer wrote:
> On 2/5/26 22:11, Josua Mayer wrote:

> > Any ideas?

> Looks like my mistake, I wrongly assumed that CONFIG_MULTIPLEXER
> would be defined in both cases MULTIPLEXER=y or =m.
> Sorry about the noise :(

> Instead I should have used IS_ENABLED macro:

Yes, exactly - IIRC the module ends up as CONFIG_MULTIPLEXER_MODULE or
something.  Common gotcha :(

--8VWhL9gHR0NA37hc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmFAv0ACgkQJNaLcl1U
h9ADZwgAgdK6qCegJjl93sxGliJ0Kf+WicQvRf8pBhPVrniH5R5YhlcyNk5XSDyC
TLJ2G++l7c2qmNyfJZo8k04mVldcJSLw8oMkW5pikA0NPzhxl94jPfluExM9y3SZ
+BRUq1iKDvQFteZtkN8WxAMZeFiNH1Fhsp9/Lu96IapYxzyMT2f3YSNkhuZeNsfE
SiWaPIK/EYMaYSjJcYL9URSpMPSLojDGoZeowDEBC26lCVo1KGCUlxjYzjh9X8SL
Qch1hdkb5TiSb6tGlhFZhuBussQUemIqzSTW6kSINA14n0gjsdMKYg7GmS0ePxhP
wuSdDxdMvcDRvZAeSqivW2OJgZO09g==
=8ASb
-----END PGP SIGNATURE-----

--8VWhL9gHR0NA37hc--
