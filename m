Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490946;
	b=zX92Hfg72B2aKzGSixzlmANOURRUcKpQAEQmGyhK5Asv1T8OHW/OKnueWvqET7C+nAVI
	 3uMD8ESRY24ipauOEsGq6jhLNouMRkmXX0HZ8NKhFwBalp5+YQis8eScxFPWf5pgPlk4B
	 fgj/YAg3mzmYvQBBRA3tbTvP8ZV//WkF4LC+Wv9TmDYG5cz5zIt9eYVx/Ii4E3poqmmVC
	 YBXxjCmNWCL15w31vAPKHp5tBtcIWhJT5mOetxLdYSAJSjNvbbAa1Jd2S1evSe5gtc73a
	 GeANW2vvlhmO3trcN9KPRZDcB2M7D1UaYDYkHX9ZHZ+NAr/iJqv+w7hjNdFot8yzsdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490946;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=fURV6DWchlWrvB5lM/bVlycf0N6/eoHoJ7O1pKZGT6Q=;
	b=vmA1Lb6OmVjM50Tb9EhpJvvGcL74n0u3y7HSLYirYKeYMYb3i5O5yV5UKEY/o+X9CnTr
	 7+fZVb+jBv/YUJySreu+5Kk++G/Ljbuyy8PomHSwdcfR4tbyKPsUizcnJXEcpn+EY/16j
	 ACTSEcjgFIC1/UK2ovNbd9f4Mf/U1xT//882DrxZDLEI/Hqizwyygkb4BVAlUbyDsXTTh
	 IM9p34k5/Mbodow6/6rShVC1r7zX/XT0zm0TPquPxS0FT1UhVaWgLqdB1xecjZ6TRS9Jz
	 +FRVM9GvDDLlHeKpDYq07TQzSsqv1kSAzijsI71GZNBrnEeEQBupxxuezGLYOJ9RPug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K0qxlyBy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CFF606A894
	for <linux-next@vger.kernel.org>; Thu, 12 Nov 2026 13:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K0qxlyBy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0296C1F00A05;
	Thu, 12 Nov 2026 13:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794490946;
	bh=fURV6DWchlWrvB5lM/bVlycf0N6/eoHoJ7O1pKZGT6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K0qxlyBygDPg1pU1T5vKE6FXEyy+nhkwjPzXG0sj/k5TDfJpl8lZMm/WZ5Fmm80bF
	 WjwR2+HSW/Y84xTSGKNuPVQB8co18w3tbVcHlzBngHhCXjYHzR3CY/hcL0yRPicEZ7
	 mT/a2SWdyIkxKAGXSvyCYhUCvMO4KMJZNb9ygkGv3/kjBSlAlA2fhWhn+Nvds0gtBs
	 4PwB39NC+hPz9fTd5eAbjC4Wb5xOZdhV7p81ZBg8shzykHArphmvWxLvBoATnnHBg8
	 iQuM0JreiO4KbmQ2QKNXDRPaYLRKIeSESTVslRLbpHJlmI/3MIi6mjSQ+Ui4oPMF2s
	 jIQXaop6D3ioA==
Date: Thu, 12 Nov 2026 13:42:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Thorsten Blum <blum@kernel.org>
Cc: linux-next@vger.kernel.org
Subject: Re: linux-next: Add blum/linux.git for-next
Message-ID: <0601ed55-a7fb-4f08-9e34-164103e140bb@sirena.org.uk>
References: <avW7g6pH3ILcSAkq@kernel.org>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4yFxPR6ce5HU+XKF"
Content-Disposition: inline
In-Reply-To: <avW7g6pH3ILcSAkq@kernel.org>
X-Cookie: Baby On Board.


--4yFxPR6ce5HU+XKF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 12, 2026 at 02:13:39PM +0100, Thorsten Blum wrote:

> Could you please add

>   https://git.kernel.org/pub/scm/linux/kernel/git/blum/linux.git for-next

> to linux-next?

What is this branch intended to contain?  Usually branches in -next are
for specific trees or purposes, and this affects where they are included
in the merge.

--4yFxPR6ce5HU+XKF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr1wj4ACgkQJNaLcl1U
h9Bw5Qf9Geiku7yZvZ991V1f8L4ek4otVGiRYM+5bAP7/tMmfR8H7re1Ux4BPDlz
YrpK4sPU7qpqeK0SnxGBEptO2L4sOJ3rullcH1WFiJBBG9U6J5HzcMS/qB2dxZji
WTUj3geVi6tFkiPRUGiIQluv1S5o7LpVlg5GVXZ5JxgwtlQiFnwxwQdSaf3RXBzI
F6hQNdjDKzfZcKURB1wxYMnxhDezoG08Ee1IoxTmjv/2mdnd1BoFLYvXAktajlUL
1PYFZRNsAQhq5Us+YnMK9tdxDnMXw73NyGlCKJAwA6kwfnUFdtdON0LN3LEQzJYo
KXhl1CqfRgkfpJ1XkZhyCa7w8LkI+Q==
=7yEI
-----END PGP SIGNATURE-----

--4yFxPR6ce5HU+XKF--
