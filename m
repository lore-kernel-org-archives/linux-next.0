Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603C32E401;
	Sun, 10 May 2026 01:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778376650; cv=none; b=EnXAYIZ9nDzG7G4jahizkWxfRUMGUqjDTYt6AwNmtGLi6iC5DGJQUzyWv07NAZaPxF2ApRzK2ttBOfuCm5IXHRaR0JZ861F2Oc/F2ExcZ665PGJECuWu2OzEPS5fttOagrT8tRMRdvIlTG4TjTKlMeuReufac+/nD8Ho+aqlKBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778376650; c=relaxed/simple;
	bh=6tOVxF34enneckuxQ6cvr4zEeMO3MfeWToP2DWTY0Rs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EYQsMeo1b1DX2zHPN88cp0hJhBC1sKv1QZCf+X5S1jRb/LWPT3i7M82vPbbiuIzwZlBuGJGAXzbtOIrHu34x+lQJ1u3rXs2j1GBzQG0MQGQ8wGTdOUqSdi/JWy9TAZir78Gejp+QvwbMBYYmlLofzevp9jZXogze7vu1AOKHU/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PmyjWGA2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PmyjWGA2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FA77C2BCB2;
	Sun, 10 May 2026 01:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778376649;
	bh=6tOVxF34enneckuxQ6cvr4zEeMO3MfeWToP2DWTY0Rs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PmyjWGA2rP9FUUIvOt4k6G+idYKnWKrImWNc3QaDQd01KQ6n08PDBKaKxSsjswhPO
	 HlbhHyWAPzw85FRvZQ84KArTe48n8YjydYt9sl2lIyFtcD8WXHRsW8vgM7aIXlUsX9
	 dpuyF+lUVgbbLI0My+g9GyShzMjSw1sVRdXsuWm6tNj/Y95BwAIvjN5wwFBlww2jak
	 QY2NBSzQPy55fhM4AnwQVh6zgV59imlcEBQ8ScKm/MVZqCjgpWBGC5xqbnwtcqNeBl
	 VpRq9c0NHEJX8w4TW83w2BtTSU6I5YWw2d1hFNdQVIYthKcsyVplA+E5ZAb4R80AdV
	 +khvbWDM6qOTg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 17C191AC5897; Sun, 10 May 2026 02:30:47 +0100 (BST)
Date: Sun, 10 May 2026 10:30:47 +0900
From: Mark Brown <broonie@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for May 8
Message-ID: <af_fx3k2MTVFG5L6@sirena.co.uk>
References: <17844ed25938ca416f1d8c88a4aa7441@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TB7FxALfEHLhsQJe"
Content-Disposition: inline
In-Reply-To: <17844ed25938ca416f1d8c88a4aa7441@kernel.org>
X-Cookie: Truckers welcome.


--TB7FxALfEHLhsQJe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 08, 2026 at 03:30:20PM +0200, Thierry Reding wrote:

> I will be on holiday for a week starting Monday, and I don't plan on
> creating a linux-next tree during that time.

Thanks for stepping up here!  I will also continue to be on holiday next
week so it is unlikely there will be any -next releases until 18th May.

--TB7FxALfEHLhsQJe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmn/38YACgkQJNaLcl1U
h9B6hAgAhUopTOVmg+3Z/m/ocCmx2r0oswkZatKZ3yBR6stWqZr8FMsf7Favyepq
Yp37GQgj45NhPtqq1Pff5NEieDe843XE/02ZOpQy84IscI5lk1/qsPL5/7gtZ3Db
3o//odBeLl+AP1rp9dkYqEFioTkMS5uibavqI4VWYTW+858hHJFOMMS8utKMmtOT
sfSvkhmdOAHFrq++lsx+beroE2vxH13tXJ5wknEzxywaonaXEmDQNTZkdQs31GZW
SjdOg7i6UlAe5W7PypkdOgBey6GAal2pWWmpatO3fJl4SRXKR3fA+NOlg4XQQd/y
Z94iqsqluoDvPG3Q8/BLUBW7pHZKmw==
=vl7U
-----END PGP SIGNATURE-----

--TB7FxALfEHLhsQJe--
