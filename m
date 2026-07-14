Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407182F7F1E;
	Tue, 14 Jul 2026 14:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784038787; cv=none; b=Hujp46/ltbOdRcY1YRb3rYXZw0uXnyvkGmfSBf8NzsFNpjMY/adfqyISUUcOmic/JX2wDGpB6t228KJhLmbw4hrrVM89lB5fasJLX2WEgztkVrTm47GlQ2hGK1S85O0L6sfbP7lUt2pk9SYmhHIFAN7IiT9TbJBeQDi3lqgOIN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784038787; c=relaxed/simple;
	bh=RacpczGCSDQWROsggKYx2/Be6clI35prMHvFlyI6Jqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QROAajabxXEidS2+S62TqamXalXM5tSS771qhWS87mVN+VyS79c9kF9kasaQuAU5mgk+xrHv8Ti/00axJQUeRRYe7W9fwYHQneIMRUZnQ80ZKUs4K4QCB4Ko/b9Km5QOgpP8tvYn4Ol/KG2ZDAR66uhrMKbHDQhClpeoiJM8/bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZNGiwN7A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZNGiwN7A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 510101F000E9;
	Tue, 14 Jul 2026 14:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784038785;
	bh=RacpczGCSDQWROsggKYx2/Be6clI35prMHvFlyI6Jqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZNGiwN7Ao0xfVsCycf80i/PY3P/9IzbkOaLO18QDY2dGN16ugcw+otF7e1FyRyTND
	 1m7Ip4rCPVH5tyzcqU7jzI0XhRzvFNW6HqV5iyIYGG1BrioCd1hDV4x9oy+mYay8Vu
	 eIqYtJAAYyd8hr+bIvBj1TuRUXzFby9jKHY7fMVLIAKjeVsmi5Sy1Nih9Tvh8GInYF
	 KekqWNXXlFNmsq1gNSZcs1lI2OO4ee351+9EyMsF6FKT1FVzzthn4XsOcMnud0IrIf
	 lShijGhWbUMm9I2lyycQABb7irzhe9YY+npgl23JqARWzlliwe7oBNwHahxZgZ84oV
	 4D56TiUW9ciIw==
Date: Tue, 14 Jul 2026 15:19:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Arnd Bergmann <arnd@arndb.de>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Keshav Verma <iganschel@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the char-misc tree with the origin
 tree
Message-ID: <cc5e4243-d179-4224-a196-7337d1ac51f8@sirena.org.uk>
References: <alTxRkflyqvAaGc-@sirena.org.uk>
 <alYvsW4eRWsA46YU@google.com>
 <2026071439-magnify-submersed-b5c0@gregkh>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/Xg8ZlPIyX/de7mG"
Content-Disposition: inline
In-Reply-To: <2026071439-magnify-submersed-b5c0@gregkh>
X-Cookie: Neutrinos have bad breadth.


--/Xg8ZlPIyX/de7mG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 14, 2026 at 02:55:14PM +0200, Greg KH wrote:

> That's a diff between the two, can someone provide me with the diff I
> should make now to the tree when I merge these branches together?

The resolution in -next today (when it's published, hopefully not too
long) should have integrated Alice's patch.

--/Xg8ZlPIyX/de7mG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpWRXwACgkQJNaLcl1U
h9Bh7wf+PKER7ct0ljuHBKLV66AP8C8QUrsGIkj4JbIwN7D5W/Jh8QaphPsf0DvO
QfPbdMkAcNnydixsvNKvn4I92qLyrxfrikQSQ/02qwfpuIm9fePjw5ZzYq850gJ+
RaNrE7se/UPEh0IP8ZLdSUAf3J1jHv4AlxwColiuGyROhrpY88xhL4wuEV52OAXu
hNvDnnPC08Xe/pT0tA3iX6St3bSDUTh9npIQTqulMrBgNxD4abyN8Fzg+PtF/nqG
3DA8er/Md+0jBS1gTr0y0bRXEs7SbBreUgseyOdulxQZAs95S9rd8ULCRuCprCLa
H0mx3/v8rGgxyMT+QixMy1j8ezHXbg==
=0YqQ
-----END PGP SIGNATURE-----

--/Xg8ZlPIyX/de7mG--
