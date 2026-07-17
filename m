Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DF03FE35C;
	Fri, 17 Jul 2026 14:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784300051; cv=none; b=URLlOaGjGQ2mkksaKdIzkuMdn7Cm5Gj43B309//g0u3hNDuHpOnK6pUsLyRz/O/03cQ08R7wXyIt/S4m10v7RgDddl5ac3FPi0+g4nJv4w9AClbhN/ndhawmBy21yS0QSxHNrhS+G1IWZ5x4M6IbiunCycQhthBf3ouKyqeYtt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784300051; c=relaxed/simple;
	bh=gpsZ1YJUL1mjG37o9UguCzLLQVSUhmq68ti2x/84wa0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vf88jyu2jOmUrrwt49x5NgOWsEr64TNSWwNhh/TxzzOak4/cEX6EfMl/3JiRgaFHLA8rkv9xYKUpkTms3MZj2sNQZMeIj8iMqt/cqBmlaTr6SMUhgyvbVfQFz5I+jlcfiFQ8cdx7mOJY9e6vEG22dq7peKB5P6oeJn2KqkZIiso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PNhTyTHB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PNhTyTHB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64F4D1F000E9;
	Fri, 17 Jul 2026 14:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784300049;
	bh=RAAwJds3NooiG0bv41e2iKuvnElfbxCqAQdmnGXpXU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PNhTyTHB4nt/TbsdJ+bM4tg23v3uGS3l1pfV+N7A+itf5HQUvfqj5zj0uFNE3T5df
	 a5Ir2C0SFt0UVBYqCwWEcP8qz0NJXt8ifW53jP7uW+C/8CWGFb21J6oJRqol0QNNzV
	 2HwDhYoSsQK4NgVKaUxZkcLrZcLRgE42zmv0gASHXFedsNP8GC7UXxWcth2hCD+WL3
	 +beQvhYW1hHHO7Uu3Xc+n0wIKWrqW5P+q/y7yxbFz0xbtXXZfz/GXgC6OdwWeg+6oS
	 S3mIa9MhCIaWpW7sWA45Neb0UkErxqrwmyRsCFC14VF1a9ntVb9WBAsPDZjXFGVcAQ
	 e8h7AlR11eXjQ==
Date: Fri, 17 Jul 2026 15:54:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Manuel Ebner <manuelebner@mailbox.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure in the final build
Message-ID: <99d6a70c-3986-4267-9934-e8d8b293cb47@sirena.org.uk>
References: <alUk8OTfE-f9oQo8@sirena.org.uk>
 <4f9f5ff9-8eaa-4bd5-9331-37119f78e13f@sirena.org.uk>
 <c2fe4a81c639cddb65116d9b3526e82206927c0d.camel@mailbox.org>
 <2026071734-papyrus-unmovable-5826@gregkh>
 <alo-5gLdvyqY-TwB@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EhgvDWzKul/Ed+LT"
Content-Disposition: inline
In-Reply-To: <alo-5gLdvyqY-TwB@hovoldconsulting.com>
X-Cookie: Enjoy yourself while you're still old.


--EhgvDWzKul/Ed+LT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 17, 2026 at 04:40:38PM +0200, Johan Hovold wrote:

> I was also waiting on Mark to follow up on this, otherwise I can take
> closer look at it.

> Based on a quick look it seemed like Mark was right about missing static
> keywords in a driver indirectly enabled by the "offending" commit.

IIRC I replied to the patch for the offending commit the other day.  At
some point I will get fed up and just revert the usb tree back to one
that works, it's a real pain doing that for issues in the final build.

This seems like it really ought to be straightforward to reproduce
localy...

--EhgvDWzKul/Ed+LT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpaQg0ACgkQJNaLcl1U
h9Citgf+Klb+9bPn6b99mknoWyNFd9dpq8U/0KmjHr5l2gj+VIfH7dTzFJBisnYm
E49CjQisM7r1/2YqScFzXWHpe2a+GOOGwyOVyml2JAPFpigGiDU7lNYWK935VICN
cT36cvjZ2s5rdTtr9GiKTl1/rzHOfbUDNqMrX+NtQd4mKS/V+K/vqjkIm/2wCDBy
xJSc1GwYjjI0rZ4b5E7HZy1ZBrYaW6EwChIBIb1yCYdTKhXuEAl3Q03/r5Reb3Qy
+0zVNicfyUaCJPR5gYpz9w8MVi8TM4iA88KYOwMEb5iXN/VctWjUL2/UNop9KA28
rDvmNN+35kOAkWqjIA0VM/ZkIYfeZg==
=j5XV
-----END PGP SIGNATURE-----

--EhgvDWzKul/Ed+LT--
