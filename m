Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83B23D3B3;
	Tue,  3 Feb 2026 19:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770147054; cv=none; b=KT4ZlvaP4wUTa1ALXiePS2wKr9ST3R3kgrRuFlEPlE3d5z57kQYoAitSloDt1pGxhO0YezoWEOvYeX81weUI2VvLl6tPQ1gDBLOFh+eRS9NO0Rj6zVM8Nkwj/WSEwRRVHNst0gxI/sxcqC1xW9UbjOdWgepN6HkQVyuWxD65++k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770147054; c=relaxed/simple;
	bh=Co7hFr4gSZ2C9jcjgdhUOfwVam0KHDq8L4zRlPNKKSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u/WAlRBk3AwFrDLrnsgla8xop+PSYRZW4ST/FVNULKNjTlOwihyoTfKv9WaY1h27jrrHDs88vtWqyBtcgsIoGmkYPsI0Yyc9aa7xbVUbmgg/n76Ewb4z+/CQifIk2/NcfwW44Ny65RHNyg1qUm501zeW4JMsRFgQV0IdbF6OZAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mWyeRFKS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mWyeRFKS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1137AC116D0;
	Tue,  3 Feb 2026 19:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770147054;
	bh=Co7hFr4gSZ2C9jcjgdhUOfwVam0KHDq8L4zRlPNKKSI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mWyeRFKSYmhDwvTez+/kf63esn6IoqxoXCgfjD/vJ8EEwSzH7AHc3Vmoc/4CD5nLh
	 vDzWzoyEQMCIZ5qGwoYzfQOa0wYj6TI3Pmw8x2KZC/hYbAspGp7Vg99ygZHOsEfd19
	 HdzPS8VC7tQfYDeiFGQ79iIyb2XUxk+4x0eY89/5HcZWGyP8y0BGH/0hdlPhGGZdYh
	 6whkxoNaPADqyT1llacDUGXKKcX1+JVvANRu+ELYfchqOVC17nppeopRzo0inTfkxs
	 5nqHaBTVWHIYbhcFjLDqUQ8RSJJJLIaLx82mED1AX3Og3VmdK8Ka1neSpKyM6VPOFW
	 H/HH3O7toTwmg==
Date: Tue, 3 Feb 2026 19:30:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: David Howells <dhowells@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>
Subject: Re: linux-next: manual merge of the keys-next tree with the modules
 tree
Message-ID: <0f1608de-77a8-4b79-9292-1dca378b480f@sirena.org.uk>
References: <aYJJ_w0_9DjvXYai@sirena.org.uk>
 <CABCJKucymgLdrp38MOo-Op3_BgZ50QcdROUPNaJDWYA6eE-u3w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HjUsJehAam1LuWMs"
Content-Disposition: inline
In-Reply-To: <CABCJKucymgLdrp38MOo-Op3_BgZ50QcdROUPNaJDWYA6eE-u3w@mail.gmail.com>
X-Cookie: Your supervisor is thinking about you.


--HjUsJehAam1LuWMs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 03, 2026 at 11:26:53AM -0800, Sami Tolvanen wrote:

> I believe this still needs the previous fix-up:

> https://lore.kernel.org/lkml/CABCJKuckAwav8bg20mz+SwgGb==pX09G1dhGV_3_URyMCGGTQw@mail.gmail.com/

Due to the way the scripting works that should have been carried forward
too.

--HjUsJehAam1LuWMs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmCTOkACgkQJNaLcl1U
h9C7Rwf9H8/4u1vMvRlcPVHNYy6XEFsEUGEEpcpD1pKkRYuKBCSoKeTWFuugiI3y
lLINcq0Y0wwN4T3R7znWb/beohWlGf+mew1MaVMDSttUE95+HjHxHmsEmTc7lOe6
H1VX11eWiab5wW0Hkgc4WWKTlB+E6lY+XsVeuBTakAhw8FamrJxMyMdnYQrSi3Dn
K2eM0Utwz6VAaXOt+UsonzAyYVTZlTSbYz2h3UDYN6Th8wNo+IQkGlSz4VM+9Nex
MHJjbFblQvrH42GUNZR8vWt/9DveZKXAi2yGtp6G+drj+s9DBG7hwKi5YZ6uRIN+
XAxaerj11xBjVZqsHBD1xaqyaN/LFQ==
=f4L2
-----END PGP SIGNATURE-----

--HjUsJehAam1LuWMs--
