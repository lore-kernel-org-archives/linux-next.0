Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A8E3D9020;
	Wed, 25 Feb 2026 16:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772037105; cv=none; b=K92QoSl5nKamSVesDsBfgWk0t78Wxsg95azuKHm9f9w4Sk2A6t5jyfuxXBr96Noq9/XlyYcBKkekNddhhgK5rtRQLH5DJWakwNoA/iGgcrNjWwkhRVgTRsC3kccXZ0FKkEl7yVvARb4Q2hYQLtQitJKgAlab8IYcg0M0ynThyyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772037105; c=relaxed/simple;
	bh=obP9Bcv4X5w7zufapUpYvDHFwdy/C4DRTx0EG/ebQP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RqPEhL2vplqBBRwhHo0f9OmEUEvnRFnKFJ4+gfh5q/wYMd2dOZOQ0hCRosvwOl9FYT1dNzzmLnS5tlJQKlOfyVOXKi/J4kOSKb84DkZmG3OAtD8J02LFAo+LJD3DC5x+CBv8M3NsJCkvUZwukkswDe4sUS1oTSV2EL5zp8eSyaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FlVeQ4Ag; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FlVeQ4Ag"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F3D5C116D0;
	Wed, 25 Feb 2026 16:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772037105;
	bh=obP9Bcv4X5w7zufapUpYvDHFwdy/C4DRTx0EG/ebQP4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FlVeQ4AgvbpantIH8X7hs5/KS+ou6tq3TzRh/Q4dxtrnT1EhU3iHl2t3A3Y/0SOx0
	 +uedZkvdXetjxPbqDVua0ngreQAYcYyo8AvNFNDqzAE1iG8GCoZ5pY1oz/ywnMPqFm
	 eE1kQZ6p8dk8Y28KBceZQZWfgL76pJCyHsjdvvJC0Lh9tB09h/rDekauwfgEUvk48C
	 CRTA05oYAoZ3Y8Et5I3XoFTzqflPwD6LVTtZZ449KHnf1DiruCTRMSu8bJ7EnFIV0z
	 bt+9xrE30KWDtjDfASEvCqoyvOD8uYnaFdeksfh9ICIvJcyWg2XIgDOXjeXw9jrMxk
	 7QD+UIOD0WZ3w==
Date: Wed, 25 Feb 2026 16:31:41 +0000
From: Mark Brown <broonie@kernel.org>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next inclusion request : ntfs filesystem
Message-ID: <762c325b-f43f-4e44-80d2-c52ebc9a00b5@sirena.org.uk>
References: <CAKYAXd_rfwTt+uhOgBa4mEO5j0CQhZdTp=YcoU2RCng+scDbXQ@mail.gmail.com>
 <1dc54be7-f8f1-4555-9004-8e15437023ef@sirena.org.uk>
 <d4e59537-f51e-4860-bc66-8fe5f9f3e66f@sirena.org.uk>
 <CAKYAXd-M+apvWoQUD=ucj0zhz3bN=Efi0GV8h+LtEhQZC4PU1Q@mail.gmail.com>
 <ecada199-b746-426d-9207-c2d6da2c2034@sirena.org.uk>
 <CAKYAXd-HvwQXeLSL3bE4ie9Ce+WwGnFW0FPwSmM3v+d3Xv6tKw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Sh1CpKLCZm9xLdba"
Content-Disposition: inline
In-Reply-To: <CAKYAXd-HvwQXeLSL3bE4ie9Ce+WwGnFW0FPwSmM3v+d3Xv6tKw@mail.gmail.com>
X-Cookie: From concentrate.


--Sh1CpKLCZm9xLdba
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 25, 2026 at 10:22:34PM +0900, Namjae Jeon wrote:
> On Wed, Feb 25, 2026 at 9:41=E2=80=AFPM Mark Brown <broonie@kernel.org> w=
rote:

> > I checked again today and it looks like the tree wasn't updated - if you
> > could let me know when it is that'd be great.

> I updated the tree and re-applied the patch last week. I just tested
> it again against the latest linux-next, and there are no build errors.

Ah, so it was - I've added it to -next today, but not fs-current since
I'd already done the merge.  It'll be in there fully tomorrow.

--Sh1CpKLCZm9xLdba
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmfI+wACgkQJNaLcl1U
h9CytAf/Wme/frzkeJup0fcqbDtytCy/nosF5WxEZ6uJvinmjDZspjARrjc0hS1x
fkcB2wf7wrSYV2LqpGLS06IMvlZmh4FynNuURvfZ3wFn/MAEcqhTK5JCJfAqAlQh
jHB2I/5ozH6Zyp5HTPmbWakWyAP66MTdUY12Z25eoKR2EGtqbDzaTbSlBuh9g8T8
ppM8jyKVT2aeQGBeaOzSRjWsz0K+F4FBy1C5jI+ATRqvcn8GbwXDHbnw0bS/r2Ef
2AkmcphxiyWpo4kNyxQMJZZXFyF7N0B/fjgfas3F7obQZO1r6leV059Yu/bU/6uf
nSwE19HnUQ9TUHAvdAAXxUNDyCi+qw==
=jz9g
-----END PGP SIGNATURE-----

--Sh1CpKLCZm9xLdba--
