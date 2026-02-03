Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BE83D3CF1;
	Tue,  3 Feb 2026 17:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770138164; cv=none; b=Jty9aDyj2EeBRDcfp50wYxzAbUDUPu2WONmky43OjDQXAGe4rMTFKkEN8atcBRcamSeStzLm6q+TZIl9q96jgJJfZ4Z/ARJesp6YnhorHHHY+W/f05caSnYOb/6xOpvXw7nHi4x/5zlNJRxIbCe6wAs2UbIOAuVPmLbEXoj5kkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770138164; c=relaxed/simple;
	bh=/+qHCVOKB0OYm7f+EgS9uSM5DP4tn+yQztZT2JhEj7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PkFhFwGcjwPc13yB1qS5o2vkgfXZev1lksKWV0oR5Y26HNWM4r255NfEfHVze6YG8X/PiVRTRHkO5SKiBIV9fxDg8Mqh8io1qr/GFzGxIISiCXNZaIfdFpDaUkgbCCr+UrLUhbkIHC728jrBPvHHwAJpd7tgehF3zD762AJTO+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pSaPboWx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pSaPboWx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 521D5C116D0;
	Tue,  3 Feb 2026 17:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770138163;
	bh=/+qHCVOKB0OYm7f+EgS9uSM5DP4tn+yQztZT2JhEj7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pSaPboWxWKLd0TQhOa8czY/yuW5L48RUN/psxu0WisEAEZhY1My7Re4d3iaBX3X0s
	 V+jTba1jsBUlMl0iuKDWohYtNW3iveZgME5hJwhLV3E31KE+6iMD9xXO6UZhVYDEVw
	 AekUhGr8KdF53CGiWWa4ziUjaa4CVsHohM4aQP9hvMasqXLOfEhKPP5nluUi2vwD+X
	 e1+pNHpLm3b3a5K9q/5G1mh1hlxhoOZTDsjI74wVj4j5TSyxWg0RBJTM3tedr9ARp0
	 BOMvgKxlieanioUqUzP+D6iBTfSRvQngdeh31PYODTLpX1C/NVpM2H1ZqeyxzBiI7U
	 yAG5l02Fs86BA==
Date: Tue, 3 Feb 2026 17:02:37 +0000
From: Mark Brown <broonie@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Eric Biggers <ebiggers@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>,
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the fsverity tree
Message-ID: <e062c6a3-b6ec-4be9-a1d8-c3775e0bd451@sirena.org.uk>
References: <aYH54qJee85qLLkN@sirena.org.uk>
 <20260203162913.GA28595@lst.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mFLLqTOOOJqAgSag"
Content-Disposition: inline
In-Reply-To: <20260203162913.GA28595@lst.de>
X-Cookie: Do you know Montana?


--mFLLqTOOOJqAgSag
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 03, 2026 at 05:29:13PM +0100, Christoph Hellwig wrote:
> On Tue, Feb 03, 2026 at 01:36:34PM +0000, Mark Brown wrote:
> >  		} else {
> >  			folio_zero_range(folio, offset << PAGE_SHIFT, PAGE_SIZE);
> >  			if (f2fs_need_verity(inode, index) &&

> This also need to be replaced with a

> 			if (vi &&

Thanks, I'll roll that in - I was a bit suspicious of that bit.

> Eric already posted the conflict resultion here:
>=20
> https://lore.kernel.org/fsverity/20260203053604.GC15956@lst.de/T/#m291294=
c1f6b7368d3c426ee47e6d23dc854b3ba6

Looks the same otherwise modulo whitespace changes.

--mFLLqTOOOJqAgSag
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmCKiwACgkQJNaLcl1U
h9A4Mgf+IwNbLoklcC2+yCL1vhiBLgB0G8kwlSDZHHjD9iXDWNy4ir/a1TpxijXf
ny0paqyZ8FFICn1F2/t7do2N7r9pBwyIYK05WktfTW0NE9eQQKYC91KKxKEEYnL4
DJn2Nz0LRmWpW6TFQ727mIow6iO4hqL/2MWMGXa+1GAeEBnvg48UXpm/qK9Ywf52
DFYtUXlUYQym4QdjhPOtDjyAGnWSStoktKrGlVdcAGaHY8KnHFPy7YYO6HudeNUL
Ym814tbmF0KcihgI05wOWxHGkdyFEDsGDJCuepR0ZSD4mNkAaXYv3OdulPDHi7Oi
xXK7xcGBTradiYFehOXZUyQ6S0Syrw==
=cbrB
-----END PGP SIGNATURE-----

--mFLLqTOOOJqAgSag--
