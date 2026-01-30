Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A35936AB61;
	Fri, 30 Jan 2026 18:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769796392; cv=none; b=up60vJ5PKrI/PnIC1sL1Tc/n49yG3KP4bYEPdm0c/sd6f+QQtBwNnwmTtbfCI3fOI66Oi9YobqMEa0DmyJouCjGaY+JxQTTpew9VjFDjyp3TaA8diQ24ATpgZwFc6WsLDI27CW8jESJF8IB8gzhAR2g+5fLXGwaD5YQYI6YPhMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769796392; c=relaxed/simple;
	bh=4CH1F0/U1Sx+maWBTBq9lQ+304rugrSsvYFfhHLWZy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GBlaj+Jj2ywwwKq2d3xJhZiFgL8Efn0iRZUhc1tMFhgoCzvmpwH6Qv+WsIFDQueP85EACqafOESBxr/thFYbI9lVBdxf8rvx/EgULUMxSBU1Bqrl7fLeDTN+B4OH02065fB/xl/NaG7as6/4tNjYIYsK+63Va+rnQBQhBQyQFME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cLm1EHYS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cLm1EHYS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC189C4CEF7;
	Fri, 30 Jan 2026 18:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769796392;
	bh=4CH1F0/U1Sx+maWBTBq9lQ+304rugrSsvYFfhHLWZy4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cLm1EHYSRk9MX/iCgOVnskpf2xmbuLKoJnXZrqmI14WfWBepK9SruF+UyDcuY4Dow
	 ue6UjawHjL3WLG5nyWVVtpjqEU19Kor0F/9PZG4+rR1moLWhGHg0b7HcvFtEORzmm8
	 UdKQ9Y6j92MAuIhy/U3AM/qI82+egzDEmT+Uzo2la5JGidaYcYFe9gVgryhAnI8jdv
	 WjxTpCdJ/vm26KZQiJWv2qy8485MDJt2MSlLWH85Iy1BtSelKZcoAi0MLZVyxeyjoj
	 j0rS090zigF+EcdjLLxwXFHDtQeTK7UDpix7nRtnaiyuHBkMvaMERzhyaggeZ6zLfI
	 mVaxZ20ZGksaw==
Date: Fri, 30 Jan 2026 18:06:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: David Howells <dhowells@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>
Subject: Re: linux-next: manual merge of the keys-next tree with the modules
 tree
Message-ID: <33417587-10b3-4cea-ad5f-595af16174fb@sirena.org.uk>
References: <aXzoSci8NPhIwDf-@sirena.org.uk>
 <CABCJKueCeHDpu+KMTT9z_iNP2Ljipt6r4KkJ-8h4ysoTRoCW4A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0vPSkpFa8u8wJQMk"
Content-Disposition: inline
In-Reply-To: <CABCJKueCeHDpu+KMTT9z_iNP2Ljipt6r4KkJ-8h4ysoTRoCW4A@mail.gmail.com>
X-Cookie: War is an equal opportunity destroyer.


--0vPSkpFa8u8wJQMk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 30, 2026 at 09:53:07AM -0800, Sami Tolvanen wrote:

> Thanks, Mark. David, I see the patches in keys-next were updated just
> a few hours ago. Would it make sense for you to rebase them on top of
> next-20260129? Petr's patch removed the use_signed_attrs variable, so
> we should ensure it's still initialized correctly. Otherwise the
> resolution looks trivial.

Please don't base anything on -next itself, that causes all kinds of
problems and clearly isn't what you should be sending to Linus.

--0vPSkpFa8u8wJQMk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml88yMACgkQJNaLcl1U
h9CxZwf/VpIcdzBTr/H9KIeEr++zRrGQ3B0yZihjMQFVTylDepPQRU6yD3kA0Q7z
wo0K3ZmMnWKbedp4GexJfqd/eC8ICpwJs+/zPBKPLN1i9gfkws4J/9zZK9/0bMHA
Z1tK8nvabccI5JVOJM5HnvPOsV3HUsSKm6cFHgJalDt/jl3B4ZUTTeAQXDH4fJLK
DLrk16csLmZrRRrrwRY6Llckm0c/FS4Rd5DTyprYhcameOfXHKd8io2GkMKbUyqO
G86p9E1wk1W6yhHRldoCZzfDhnXVHMJY8UwrcXKhNigyBq9D0rKx/Im52NXVvo9R
KaJKmAw5GA4o42prFG4BhYydnFSM6Q==
=Y4Pb
-----END PGP SIGNATURE-----

--0vPSkpFa8u8wJQMk--
