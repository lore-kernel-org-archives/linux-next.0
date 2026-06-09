Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8336C47ECD3;
	Tue,  9 Jun 2026 15:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781019382; cv=none; b=ACuXH2vcfoJFutshxsD+tLBs1x9oz/JdxspwuzghZzm6OTfX708Eu5NsOVvKY6GcigOsm0fOJBqhwN55bMjm9MQ9tFCdcNJF/xKtgcHPZUqpKbhh1Dg/HuQQp8sQLSyRB7IKWfWZkZbwtIRt4GJ4AoSEytADdeXg+Qwhx2U/ECo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781019382; c=relaxed/simple;
	bh=kff3Ku106lZUNzk6BHmzON3Z3cA7eGoT+8P7h8cRfnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bI/vLSVsn7lDqPOKHR8WpEVC8rr2p+C1Ose19/LJUp3Id+fT9M+KT0mswqrW8fUe2484kVxa/wES7hgJ5LwGbWu2FY3np7pSRUi5J/bKbe5WkKU7tl+xvY8NPsvpBQN0h1wUoSXT6N7qLXSNpSKPgjXMTDd/an+x2G07kHAePA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fYIq0I7W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fYIq0I7W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 498351F00899;
	Tue,  9 Jun 2026 15:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781019381;
	bh=4BjD6b+IzebzZD/6gMlGvrnJ9uZ0wXUTzX1JzCj9xzI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fYIq0I7Wc5w0dA4cS1urF4uEhSvEN37xPpksOELur5l61tGTeKddlar8Q0WLPBN7Q
	 n3SAQEz6r3J0s/vzq0EbU8U1VlRV/1hVnLHA3n1A8xjK0Tph56kjKoMTSvh2edMHYy
	 MyoDPuqg14rEfKta5x1N6xi2hK2KIkr4NUUBgmtGQrzQgIYciLCxci13ik51gj7kcb
	 vCaepea/4wKtf5e9b7s/sU6PVkGaVuGWO5Bczb3M2jEoSL5+XlxjRLLjgR8RGaD+7e
	 RZYqadsGj0OEMVkuG8MJc/vVizciBRUyW+9j1/gaB7gytoTGrhXaPGs8GyI11KKrP4
	 4J7drXSP3SVtw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id E75F61AC56AE; Tue, 09 Jun 2026 16:36:18 +0100 (BST)
Date: Tue, 9 Jun 2026 16:36:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Johan Hovold <johan@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the kthread tree with the
 i2c-host-fixes tree
Message-ID: <aigy8n_AHpzjMahb@sirena.co.uk>
References: <aigwM8t2LnDJvgdy@sirena.co.uk>
 <aigypcUHHYFkor1x@ninjato>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c6ECCIJ6qZxLYGAB"
Content-Disposition: inline
In-Reply-To: <aigypcUHHYFkor1x@ninjato>
X-Cookie: Leave no stone unturned.


--c6ECCIJ6qZxLYGAB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 09, 2026 at 05:35:01PM +0200, Wolfram Sang wrote:
> On Tue, Jun 09, 2026 at 04:24:35PM +0100, Mark Brown wrote:

> > Today's linux-next merge of the kthread tree got a conflict in:
> >=20
> >   drivers/i2c/i2c-core-base.c
> >=20
> > between commit:
> >=20
> >   84762906e2666d ("i2c: core: fix adapter debugfs creation")
> >=20
> > from the i2c-host-fixes tree and commits:
> >=20
> >   07d5fb537928aa ("i2c: core: fix adapter debugfs creation")
> >   a378a2bc73e3b7 ("i2c: core: clean up bus id allocation")
> >=20
> > from the kthread tree.
>=20
> ? This doesn't come from the kthread tree, does it?

> I see the duplication from *my* for-next and Andi's for-next. I will fix
> my tree. Sorry for the confusion, a glitch while handing over the
> subsystem.

It's your tree, yes - the scripting got confused and is picking up
kthread as the anme for some reason.

--c6ECCIJ6qZxLYGAB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmooMvIACgkQJNaLcl1U
h9Ab4Af+OWNA69DyCU0yvBm6F4nzPRVDWDUJGJViDPaAJvFn4tGE6iu220wUroLH
LTBgLbGeRDdNwBcIWfh4AVuo015BW9U1Br8tgnmKs4AysAjRGMYIZ6Zpw3KJYUQJ
7QmmH7D+8nH3hCxBJYvZstblxRywkUlw79ajjjuLrm2NaAVjlJqCuMK1m0aFUEVD
FRne+hFc/PPE0ln4qFDsFmvg8BcO8MOo8NOS5RvYAm35PfooWwbA7FpcG0Ryk48f
2/FrNDReDcyRKMh9JfuKZs19VWjgkUGCX0jTWXifaRnZgrTweONc3rAQrjbcTTQB
7UKFt017pBbKraGnIvObM3ZUOImtvw==
=mI+P
-----END PGP SIGNATURE-----

--c6ECCIJ6qZxLYGAB--
