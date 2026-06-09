Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982FE4921A2
	for <linux-next@vger.kernel.org>; Tue,  9 Jun 2026 15:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781019307; cv=none; b=erthkhPfgH/bZMG2gzrnO+nXyGXVt/TODXbaf4ZDpfK6cUeT/pO1UI19UIGvj3hiaVf+V8OYIsrcCrwVqnKlERXq3zDHlSV2OMOX4xZdxap3IoUa+B1ovGCTNxUK99AyRj8XlIqnnnPhrj2WmnhGsd69NKacoTrCaMJGHHCM3Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781019307; c=relaxed/simple;
	bh=KATzdAnzmxIUxiDK9UI89oYQZGjRCMqL1Uk2C1ErpII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=adJBPtfnMB4g751qQh2PWOBVqMtDPmQ1/KgnQy1097rQEXedy57xZY68Saaa3BiUT2oFmgw7MhFhcFMDiCDL0GlcjabwkKAlyFkx6D/l5Mk8pST8NeQs/gCgIM1lahNGMewZjLfOXPXvuoh126CFpk7CIUMbObh91bU0oYCidvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ed0xAVoC; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ed0xAVoC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=tOV2
	DYH6ZiY/g1aV4Vpso854+xqs2MYIXetxGF249yY=; b=ed0xAVoCV9gnrPnS0FT7
	sylElEcljW7hJu4XjQB6/Hhuas4n5Z7P5anDWY7ujMQOV+9ZgnZ6HSFbYjyVkQCw
	MKKSwlxtVAdNcp4m2TgLOfz5UhXuFHsVlObcZ1RKB/mJiKnTTi7G/x1PVbj86RN4
	xEHbXAXNtnV/TKDS1SsDlaeV4o2rHlsC7siDN4svNzMPy5tsei1Q6/OwH8L9bTkh
	yvVh3GWIOPDIfQA0zonkcyMicGHQF2hck11Q9wtYQ7biNhNsXj7c8F8iY5B+LXvf
	4KZ95roKmXAtucU+/QZwV7GaCuwlmYgKwAkZZ8vIwx20WPLvLbJHeqUXDykfiNzn
	XA==
Received: (qmail 1333669 invoked from network); 9 Jun 2026 17:35:02 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Jun 2026 17:35:02 +0200
X-UD-Smtp-Session: l3s3148p1@Et7X3tNTPrEujnvA
Date: Tue, 9 Jun 2026 17:35:01 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Mark Brown <broonie@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Johan Hovold <johan@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the kthread tree with the
 i2c-host-fixes tree
Message-ID: <aigypcUHHYFkor1x@ninjato>
References: <aigwM8t2LnDJvgdy@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Vxem4nbqz+MM4kYD"
Content-Disposition: inline
In-Reply-To: <aigwM8t2LnDJvgdy@sirena.co.uk>


--Vxem4nbqz+MM4kYD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 09, 2026 at 04:24:35PM +0100, Mark Brown wrote:
> Hi all,
>=20
> Today's linux-next merge of the kthread tree got a conflict in:
>=20
>   drivers/i2c/i2c-core-base.c
>=20
> between commit:
>=20
>   84762906e2666d ("i2c: core: fix adapter debugfs creation")
>=20
> from the i2c-host-fixes tree and commits:
>=20
>   07d5fb537928aa ("i2c: core: fix adapter debugfs creation")
>   a378a2bc73e3b7 ("i2c: core: clean up bus id allocation")
>=20
> from the kthread tree.

? This doesn't come from the kthread tree, does it?

I see the duplication from *my* for-next and Andi's for-next. I will fix
my tree. Sorry for the confusion, a glitch while handing over the
subsystem.


--Vxem4nbqz+MM4kYD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmooMqUACgkQFA3kzBSg
KbYw0A//S77idj/bZbfzehCFLGFNvANqYFXQTfSo9Js4ERJD2sVIKV1W48NWGtrQ
zoFklUrMPJUGyTrOnHx20laBsyEYa7lDBp6p+K86DKuYf0zN1HuVxs5X9w5hOfjz
RNg7lt59yLZO6Ynr9yvPAGF9Vnqptsw80DVrm1kuifUPFV+HG0M/S+ufkbGBUP6A
pUp4pvpN5sG9O7qYUxysUf7eH8qd/FcOOsMahkHmzTeiCConusTAQ2ew1qqVrLfG
qm/jjSTlZ/pg3ySFYBI/rACFYXtGJEXrYyj+I7hLWJqGQMezvCDm61/INNXKJzo6
mdrBmERdqr++VAq3r3fio8FLG0gOp6cCl9XbZ71cVtm65qncM4bkGbEBnzyZoWYU
1YvlhcMY3qROjbHmBNrtlBxu8c/1ZgrFRiR15srQvZSr3SrAYTkEUwPfRlMsLjUM
v9xHvWt4/R+UnPDElwLC8DrXqdbuiTSKD5XfEBCG+nmUqqyD91/EoAdnr9/74UnI
UH+H0SCYF7JDF4R3Efx3iWyyCuixJrDuKv2nNJKv/XbPQM55FCRUracQqLSZpgc9
qPoZ1TyVDmgj/6FdGvXpTGpoEgGZB48maHNleFlMrVBj7qlJGKoaIDhqU7P97mlg
3kM5kK6bPCTM0qNNE9uOYICbhrtQY+z9RRyYvupV6KtYV9bBNv0=
=zmsZ
-----END PGP SIGNATURE-----

--Vxem4nbqz+MM4kYD--
