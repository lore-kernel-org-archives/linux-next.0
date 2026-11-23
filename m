Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795457989;
	b=K9303t7KajB49f2XY+BB/fnt1+0KLxLTPKlcE97i+RPP/KfzY46JVG0oS5SINMEIQscV
	 rxpJmoUCfK6ARQTqmMZLBCb7BnQQcrBSTQBpnInOAsrXIXYz8Nbz2myWA4CHTSJQcZis7
	 jHMEUP8V+EapogYYxIAYr5XANAnjcC/PYH+9CjGpc089XLgLw8mKSWZbsiiPeXCwQygi6
	 y7xRadYhcLr/dWD+sYI3WZ+Sn6jG+WT8PsfK4HpKAOr6TJDdraAb16zCrCtMHiOGZaRg+
	 xWh3S/fyikn/7gPvQIPH+J912XTrj6e015awh/wIulvRNHPuNgyGTw1xzLRu9Ewampg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795457989;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=dGgiNkRgnUJlNQaFA2WXyYcHHrm2iupMzdvZ+F5I9dY=;
	b=yKMQBQbC+ot+Kn/F82a6Ju4UJWzoGQzrgWw6PRiiGk4Dt2iBsRKEcJvDSYiQoyNKLP82
	 hr3jQqGoK+bD1bJXveBLJjO36mwxBZwc8vRgboPiNvyt/N/2dO6IOzwRsG5AREuMMMrLD
	 kHewnhxy3cgrlEJOhWaWRn2znNrRahASB/8kBvpj/yAfQ7akl7RKVCgh32mDAlCZB0nH/
	 DV+vZE7YWL24ccp/NcsB9BaiLw/tYnJP8bS9tICMK4ztEvmFYCeX/aNoRJ3fAoZ9Y3goI
	 rIOWNJBqwJXmInlUxSu08Q7i6ObziPR4J6CJ8CcNpXeyMozkU5hBPF8AMKgbugVRbQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="O/MEL0Ry";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5166606A31A;
	Mon, 23 Nov 2026 18:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O/MEL0Ry
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26AE61F000C6;
	Mon, 23 Nov 2026 18:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795457989;
	bh=dGgiNkRgnUJlNQaFA2WXyYcHHrm2iupMzdvZ+F5I9dY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O/MEL0Ryj5G4bErVTu5vcnvSBcle0Vi32SiPc+vjdNySV6D7n2QXwkY6Z/JDFxE5l
	 JvQ/s0XKP4MWVekW93unfhpbifDIB2n9q+TUKZd6ZpqdVbrKt45f+quCBJFdVvs+vD
	 Hu0RqxnU+GBUhm9d2xzijo1I67zwyprGqlrOwPGR4Uj0Hz5/dMDqtGP1vN1cVAnQ1o
	 v+r+yA1/0Dd34vj5ZVAv44BNvk698DQM0SrY57aI18bRsPSkmJNgJuxm8GH7dSmQVO
	 z+V/S8C888qDPKJnAVCB7DK4wXPqCuEGzZXgYcwyDpTqLSehs/+loHEUq+uV126QBJ
	 0lQ8g0LeUGVdA==
Date: Mon, 23 Nov 2026 18:19:45 +0000
From: Mark Brown <broonie@kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the ext4 tree
Message-ID: <a2b4d8de-fee1-4b6a-9a5c-7f4876341b95@sirena.org.uk>
References: <av8ZYMRMN2w-w0om@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="mtRl07lDAHtqx/ez"
Content-Disposition: inline
In-Reply-To: <av8ZYMRMN2w-w0om@sirena.org.uk>
X-Cookie: Brain off-line, please wait.


--mtRl07lDAHtqx/ez
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 03:44:32PM +0000, Mark Brown wrote:
> Commit
>=20
>   42be4bd54735e ("ext4: fix the logical block counter overflow in indirec=
t migration")
>=20
> is missing a Signed-off-by from its committer

This is still present today.

--mtRl07lDAHtqx/ez
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsEg8AACgkQJNaLcl1U
h9DAYQf9HTdAjzGeI6XMWjP6y/sPWpTNYpRHdgi6wZ8ckaaFeRLftqsd2vKWqQaw
4GDDFxW3kqESjSqPxDEJEMo/phqGA6HEsngqXMyTGvRjoqBZMfYBAxlJwW4594QN
aly1OAncdFubXCHdwpdtRFd1xqgR0YkAxxPLqCnQPOviopc5flE287ZJn7nsoOuD
WMKnm2U+dj4qp+VMnYOJxwRhzJ01AJHSSl1v+r7ROf4W3BFvhaWbr4DZm2K3FToy
FfG5Y4u/dwrlaREtcMvC2cUVyipz+ur98JD9aGsdiDyjCzFGp8p10kl9/2jFRo1w
yEVyLdlfOK1Pj5QOS/rvtd4A6Xurvw==
=MOry
-----END PGP SIGNATURE-----

--mtRl07lDAHtqx/ez--
