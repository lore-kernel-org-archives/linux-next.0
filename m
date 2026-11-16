Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794868400;
	b=K3TfNxiOJq57ILpeCdiR3o8CPMs4mmkTp8202lr463e6xdQvo8yBgdZ7byxe/Rp0925q
	 WRwIhrJAqR9llzzuQ0rTNgQivRpUabV0YZLlQGnkBGyaSRyGPF0JN8nGoUZ9wLIUOgQWn
	 rhpUC1FG53lOhlFaX505q5S/EMfXSp7u9vkULqMtsZy5KwxiGCq6/DYDZSfCdS4di+TGf
	 tQrQEha0NsskKz3Z2goEv9n4EwdBOAnQKKahciivy+W3syZfWciefY6idya1a9YtsLEXa
	 ny2rlf9TVRwNHFORNmSPDf/oDs7+JEJ0JZZeTJP0jkbsoY1zaRGD3fTqvB3zZDr055A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794868400;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=Q/tZ2Zr78Is40jf7e+nBuzh3+h/n8zK4De9jGrO/udA=;
	b=Mlzlkj/kOYhNLyqNE3At3RXfv/mPCe189ouyWSXoT6ZQSK8AF7CgEX/vjBWIcSmMGOYl
	 xKgcrdLQcCayc0WAMNLJgmt8WU/PA+Zo94rpQ4fUQv5WE4pNtT5LegdI/QH8SlbdBIm84
	 wQQCbs+w/3nDYc5XjT4uvXwv0NOTrzurzqxe7D8fiPq0TccYIUw/gpRR9q8H8QQEbe9Zu
	 bIq/jZR51E2aVAbhM3FUoKeSZh73vfQa/ocxJm6n27wgHuQQLGIDcMykb15h8qtzmRWLN
	 GW/Dax4JHa5lLwKCHPWFG2XRjvuWNNvSquGPDFcCfd4i54IOoFoSrxRPkdpDCCi7Yng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JAZv5oq8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A77606A89D
	for <linux-next@vger.kernel.org>; Mon, 16 Nov 2026 22:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JAZv5oq8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 448001F000C4;
	Mon, 16 Nov 2026 22:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794868399;
	bh=Q/tZ2Zr78Is40jf7e+nBuzh3+h/n8zK4De9jGrO/udA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JAZv5oq8DmvB/5GOwlplWuKplB0x+0albJYUhDKga6Z1ab/WbryPhsEaPRIGAnQ2G
	 8i5KgT8Ii6KnaP5z4fDzetMtbF0Vqiwn5bVKkgcz7oCf/O5fSWWZjreIzTBIww+ouU
	 MCVe9FVQyFeLU1b7b2SmUS5JmkSp0A+EcHU/vKZ0KaSz549H4MX24b2r10yXavYplM
	 e9DM1kS4aK1R0DGVE7ry92Am2EIXiYrWbtW9y7PEcL+h7zfdsibqmvlAPaKIyJqrg8
	 qoRZ18mUt08G369prCD3+MsmJW28fuB93U8y0PEquvOTk34rXZ3+9JospaWUxgr1xN
	 1nIoMuENaRGzg==
Date: Mon, 16 Nov 2026 22:33:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Thorsten Blum <blum@kernel.org>
Cc: linux-next@vger.kernel.org
Subject: Re: linux-next: Add blum/linux.git for-next
Message-ID: <caf1c9d5-2d25-446c-ae8f-5851cd0a4708@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="mexMzEva49/Gu840"
Content-Disposition: inline
In-Reply-To: <avW7g6pH3ILcSAkq@kernel.org>
X-Cookie: Madness takes its toll.


--mexMzEva49/Gu840
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 02:13:39PM +0100, Thorsten Blum wrote:
> Hi Mark,
>=20
> Could you please add
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/blum/linux.git for-next
>=20
> to linux-next?

This will appear from tomorrow.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--mexMzEva49/Gu840
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr7hKsACgkQJNaLcl1U
h9D7tQf+IzTc5ErFQzOOukVKh0IkK5uiAvLs/Qx6yyPbfLVhA9H8/VrYn34+LURP
1UQnzxQaRHRC6JRtGuMTsBEQLo3R05g3eAhDISWambv4KteXt0UjwVDcyre7tvkZ
k9veZ7qYUizenKV99Tml8HZqJnPkJY4UGCesFlyf9MjjxDYx15NArZ06LLq2o+fF
jzwaaARTC+8uq1K9RxkjTvjzGW2DRngQO8RoCA7Tq0AITNZBsNkVVTDoMjbIAOu7
pXH7A5TNdftSBslilkI7TCM/fyzbDwikv3Loa/EBjrpAF6e3ScKy8k3qRBo0s3I8
CFLpJ/H0mp8PHPnEhkgMqOxMgwJ7uA==
=L2Fy
-----END PGP SIGNATURE-----

--mexMzEva49/Gu840--
