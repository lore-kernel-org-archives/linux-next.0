Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119BF3DB325;
	Tue, 14 Jul 2026 15:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784041566; cv=none; b=qC90kuyF/vgMK1hh0EnzBENFMQlu9EuF2tA7cE1QumcESxyvAbZpqF8TjPxqu/nz4EuSzKpNaVnP3w5BVDo2q+mv9yvDyuUkekDOV7E0AdYspfeZaT2eMdy/tJ8E7r+iC6YW24CwOkpCKVM25hwhhKSZiCpreEJgpv71+x/iebw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784041566; c=relaxed/simple;
	bh=Zabd7/ySoj8fNojLKEFQ6TiDtiDYgzzCLew2SVlyNso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cloDgUXX4Pe0r4aFGuq/IF3g7zkBm1+KhCTGhLbiYyjCVIc6PjM+VK+VZfZXABI/h+BNuagbS+e35PJKK1vD4fO1SYW2TZukOjNEMAE/TrAVbT6NLt0RTBk0YDRhjxJVnRS4W5uVFx0zM0PzY1Imo8BYLHhicQZnlBm7ZZnUGjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WIPayQiz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WIPayQiz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C5111F000E9;
	Tue, 14 Jul 2026 15:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784041564;
	bh=Zabd7/ySoj8fNojLKEFQ6TiDtiDYgzzCLew2SVlyNso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WIPayQizvwRm0wW9qYxEwvtoA/J6QVIwOnvni7u8l5qK6EE8VufeCUmaP+7+EtmKu
	 UUAh2lw0hs5ee8iHdoDrVocy7bGCOyX20WWzPQ7Sn1Aj5lNtYI4MaCOuvjFG6tlerA
	 OAz/UoHIwsNX3oFwPOcNa+pDtHrX4K/XHTduiWw2baUy42mX/CZK80WXKJ100ovFXl
	 LV7Z/wtfqJH7igS9th2xzP+urrxLY+lE2uQ2r0b/23/VqnaWN9Xzr9vNxqQezkP1s1
	 5Rh6YaKumLt58ml7JqzwIuPd82F/OD1hjYDnrhQvWRvWYKrlK3OtvVWAN6sCfxGpj/
	 plQvUl1dbrrxw==
Date: Tue, 14 Jul 2026 16:06:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Arnd Bergmann <arnd@arndb.de>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Keshav Verma <iganschel@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the char-misc tree with the origin
 tree
Message-ID: <b8939935-19dd-425f-aae0-8879fe3fa68b@sirena.org.uk>
References: <alTxRkflyqvAaGc-@sirena.org.uk>
 <alYvsW4eRWsA46YU@google.com>
 <2026071439-magnify-submersed-b5c0@gregkh>
 <cc5e4243-d179-4224-a196-7337d1ac51f8@sirena.org.uk>
 <2026071423-joyride-gainfully-f851@gregkh>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8m2SxBTxXVSUlJwU"
Content-Disposition: inline
In-Reply-To: <2026071423-joyride-gainfully-f851@gregkh>
X-Cookie: Neutrinos have bad breadth.


--8m2SxBTxXVSUlJwU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 14, 2026 at 04:22:30PM +0200, Greg KH wrote:
> On Tue, Jul 14, 2026 at 03:19:41PM +0100, Mark Brown wrote:

> > The resolution in -next today (when it's published, hopefully not too
> > long) should have integrated Alice's patch.

> Cool, I'll copy that, thanks!

Just pushed it out.

--8m2SxBTxXVSUlJwU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpWUFgACgkQJNaLcl1U
h9Cr4Af9Hf13WDDJN8h+JljplmXMBbPeZeYlXxAWi8yPClwT53Alcn+TCi7E9GDL
GLY+0OkdF7NBsftyUEo9M1XOcu5+r0UJqaWuetsfKnUq82t4stXoZ8pe6i7n3vXg
OiyY/NUVee+ZQ7SMT3Q47oNeg2HbqFPHKjFy6fQwIHJXhi5lm5Va4Wzo1UiIyTZx
LXq+nKP97usud4GzUJMTWnUo5xGM0E24pzTMQq2gi+mFHE2Eap+Z+Z/OQzBVzJsH
DqGjwYnpAg+ZYag3Lwcl9X3k6qIkURgKR7jWZg3eg5dkncYf75YkUXx5j6mx/KBj
Hdwu6sfV39+ULOh0C6z2ibeKgHpjzA==
=1K5U
-----END PGP SIGNATURE-----

--8m2SxBTxXVSUlJwU--
