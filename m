Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947FD4048BB;
	Mon, 29 Jun 2026 13:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782738375; cv=none; b=TdJejHAxVBxZSiE3XHircqBg6/RLHJFKJLrKtKcgfM5La4GSA6d3ToIS0SrOmxlJlJFTI4bTOPNC4dCJI/DVmZWDFBeE4dAo1waydankpqEAp7GkEOllAP8t2GkBhvq2QxaPGhNGggbntjqCzZDG+JaINnqseVQ+z51nqft87fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782738375; c=relaxed/simple;
	bh=exFoO7c8uDO+Hb3BhK4U/JkoT98DEw6I2naccfNFW4A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vFQTUVJaD5ovRCxKMaht0DNU81NWfkNRItoL4bI8zPl/dAqUrtP79Drwo+2nnSjhbvf/FAU+fwpcPGM+EWqMKEy/yY1Yhfyv8mRXQh7DLn0KG63pjlQuszTbPT0fGPit27L2MMbqLxFwy2dl5lYvwTxjILVqg6wUxxG/WJCCNqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TRw/Er0U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TRw/Er0U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B71D51F000E9;
	Mon, 29 Jun 2026 13:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782738374;
	bh=1/nc7KKezAcIJ5nLJCEOcEC4UOlMlWRGIuo3A/9RX80=;
	h=Date:From:To:Cc:Subject;
	b=TRw/Er0U2tOqM0KcLg1BRsMvl/cf59yE7PdAOHK46VVdlRVVj+UTDRlK8ekiNMxBW
	 LOVNq523ZoubZEqkB+VX7U8RHtxWgElaaJkaDd961HdUfvLWYcKVMGuNu1pmk9cm2w
	 QaBcYailAVQ539Trn80NyLXwJq2cVFclJRvEUIrn5YWxnk9cub2X4pNKRGjbIoblxe
	 ci2nv3clEbbVOD8KzYv5HaR0vfFqcDxNNKaoWScGASfczNWfBTu9aab9ortxaNizTK
	 9Qvo3LgiubnYqu5gi7n4FIBZySa0CAJ9gm8JUo1IcUnDnMRQZgS9VVVAdpCxZ0dCBN
	 c3gOFLAp0yNyQ==
Date: Mon, 29 Jun 2026 14:06:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the mm-hotfixes tree
Message-ID: <akJtw9Q-hcy64Ebg@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iFhb94t1Ysh9hbiq"
Content-Disposition: inline


--iFhb94t1Ysh9hbiq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  2f0a90124d661 ("mm: page_ext: add count limit to page_ext_iter_next to prevent invalid PFN access")

Fixes tag

  Fixes: 9039b9096ea2 ("mm: page_owner: use new iteration API")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--iFhb94t1Ysh9hbiq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpCbcIACgkQJNaLcl1U
h9ACcwf+KZtYXUZlQDB9n6u8/1/gBuCegV2PdXl7cer37PDKNyDFGj+HtUOlMU+p
T6ZEkfDuq4skczH1nn/phCheJJKQZeZChqJZKj9WTpPyZ4sW4LT0v2fHWxTPn7Pf
SNNRwypibA6Cdyw4MT6Y190yy0NbkzRk7llIrQItVSnLb5Nsh3/h2P067Meo+Gat
D/iw+y1kLkw6SA3p1MoSDoGgRnGJPKLaJj/3H2TlVShRcKqjUqdvF8fQAnWFXtMW
4LAe3XLR1djSmHbL+t6uvkGF4DKSNlCppSD6xeePJCfH69W8DQ3hGo6cRLvKj6Ge
durD2aXM70hFpP8+51fWw9w4jO7hmA==
=yMT1
-----END PGP SIGNATURE-----

--iFhb94t1Ysh9hbiq--
