Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B2A35E544;
	Mon,  2 Feb 2026 23:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770076320; cv=none; b=tCb7++VdEBFK4I5Q0zrHahomMysq+9N7D1K/wDdviWYvt+7/18y72JjpDvubpwwM6mWs6foU+nN/af0T4+HPpGQMRFXCGOVMfBfYi3/vpBKANlfVCCWED3/5dzaMqqgDZJIAXH6s6W1zDrAFaYjENlA6vdG7emDqao/cbDzqCRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770076320; c=relaxed/simple;
	bh=35uKuJPBBXBo8rI6WU3Tyr44dchwkBmtkD3OnPtIXIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KuCvk7jVS1RnoPbARZNlptiUbLVka0TmIX+WcmXFkOVShXOElWGDjTc0Dkttk6IZVTrXrdGP7TxqhymAFRZaYWQzCWpnm4pTuhh99/HUtsYeKQMsn2FL8JW4xhIyhqmI6Ll8e0RPnp+DLAIvkv0ZNg4gwK7lyEyHsEeG+rp6PVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WlTZyOFo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WlTZyOFo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F8E7C116C6;
	Mon,  2 Feb 2026 23:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770076319;
	bh=35uKuJPBBXBo8rI6WU3Tyr44dchwkBmtkD3OnPtIXIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WlTZyOFoA/KHvJpjJFQR7EGKD2XpgqmCjp2q5JhLmgb7ITOWwVjaMhYc7zIm1UIWH
	 3CRX+oPmC04q8j8tRyO+smZTI2HPYdJGZcXhOUEoCFgnfZcraTrd0paSeeJtFQZG34
	 iLcRTi2aPHaGWF1TLj1P6txhpWbajJdYGQjE/tTMiUFT4mdtSgALMdA6dmn6Ypi8Ol
	 lKT2gxa3GO/WE3utmYCrONiKGoFeGUtVvQX3D4KwvXeRU+/i7ulcwEDE6XO1S9B0Xq
	 361LVVkDAg9GcIdW0tvLn/mrgtT3mwCxMUz8iZcgtURiGHpfenbfi5rN2AT0SVCxAu
	 0QbcVyoG2uTzA==
Date: Mon, 2 Feb 2026 23:51:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Jonathan Santos <Jonathan.Santos@analog.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: linux-next: manual merge of the iio tree with the tip tree
Message-ID: <f9021d1c-4f49-4e6e-bf12-9ae0bc633507@sirena.org.uk>
References: <aYC-dATLw09TXP4K@sirena.org.uk>
 <87sebi4sh2.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2TZjChMBovQne36a"
Content-Disposition: inline
In-Reply-To: <87sebi4sh2.ffs@tglx>
X-Cookie: Bedfellows make strange politicians.


--2TZjChMBovQne36a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 03, 2026 at 12:48:41AM +0100, Thomas Gleixner wrote:
> On Mon, Feb 02 2026 at 15:10, Mark Brown wrote:

> > diff --cc drivers/iio/adc/ad7768-1.c
> > index 84ce23c8e5782,fcd8aea7152e8..0000000000000
> > --- a/drivers/iio/adc/ad7768-1.c
> > +++ b/drivers/iio/adc/ad7768-1.c

> That's an impressive fixup diff :)

Yeah, git does that sometimes - AFAICT it's when the resolution
corresponds entirely to one side of the diff (which it does in this
case), possibly other times too.  I'm sure there's a way to persuade it
to do something sensible here but didn't figure it out yet.

> I'll zap the iio: commit from my tree tomorrow...

Thanks.

--2TZjChMBovQne36a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmBOJoACgkQJNaLcl1U
h9Ag0wf/XUyUcb0PxnbSV6yI7A8G78fSgWDVR5ICAWpPN3DHLhfoZzszJSsd2rzV
jYSn1+QE0+Y+61JFbylFBmOZ4/zVC0c3YgNvbpcctkfQFexOp34IbhK8RLvrz3lH
34+7cllTrJxixYGp9DqRsP2OCzz4xUf3deiuP81hLl3XiIrifvC7Ylr9tZzvj6nT
oAxKAzZUuFtEZr/h2Gj/FepTcg7AwaqlNmwcZUUdGOphgW3NjdbwUqj17ON8Rshu
1BN11j9Byln6rvsKxa8V5lywvUOacse2hqQCEwT+A7LWKT8ICqTY48EVpcOW01Xb
5c11cMqzY7hC3ZIX4YMxhWsvvIkp5w==
=0NC0
-----END PGP SIGNATURE-----

--2TZjChMBovQne36a--
