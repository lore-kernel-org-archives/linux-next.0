Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A290470440;
	Tue, 21 Jul 2026 20:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784665476; cv=none; b=Cioyb+IYs87o0UiLo3J5+2W7k4quaf8NiIKZPW9VKOtJS5DMvm9sbz9Zr7V9Z3vCu421Mzn4tP85q0kevmFkxEC9WkMbsP9XEa8PoiNP6zOZTrboxkYbwgyQz0e0moYSSrV77/DS5Fvn8BBXf5JQyPdDweavzTSC/F8YLeWycwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784665476; c=relaxed/simple;
	bh=ZfPNgU0wsYgfotpZN5uN1VkIrSGZgeEeD2GK3ZzBP4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NitO69bygRgm+N1MuZFVbNPK1ebKdEOaMeWDF9vXpdgLRLyUCbu1kwieSuPyswr4RBFFtoc1NnNBtzOTZFTlp3aKCbZ/loqGv1sh8wt82gma1Rj7lEnPR6YAGvkALMs6t3IUxep3nBbKFuFCUVHpg29lLATvQPH6WIM5bn53904=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RST+kyM9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RST+kyM9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEFC61F00A3A;
	Tue, 21 Jul 2026 20:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784665475;
	bh=iTToWr6zdutyMILESdo2SHrQrG+9UtmwKril0XU9zVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RST+kyM9Xu5alm0xC2bEw24XGoUX92R78wsdTcDNHohMyWrtUVYnVl7Dnk1pIMyZw
	 nz17TZ6sge4flNMD8ufJHUpWKZ4DZuxFcoKykXAuvlYEWw5ro1J/L1/0nzmj3T9orA
	 mwRNrhQQF48CAKU3NU3h4C9Tx9xC38VaLCj2TSinQqrlbKVfQtQimWlM5BFo/iYW1f
	 cmhc1j3jy0MTzhq2cHr8yLDL0ZuhcmZOxH0luTia6clfP9Hdkr2xiIv5Y14vGdkxCM
	 cIOD9Q0WuwYIYaMngxTSwPBT6vP2FJq8mHJ8P1AIEA0y8O7+v7A1EEMq82Jsf01kaI
	 i3ygFVLdCbO1Q==
Received: by venus (Postfix, from userid 1000)
	id 4C466180765; Tue, 21 Jul 2026 22:24:33 +0200 (CEST)
Date: Tue, 21 Jul 2026 22:24:33 +0200
From: Sebastian Reichel <sre@kernel.org>
To: Chris Morgan <macromorgan@hotmail.com>
Cc: Mark Brown <broonie@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the battery tree
Message-ID: <al_UHA6mYMSvcD7M@venus>
References: <al-HUrIVJZ-vLN2n@sirena.org.uk>
 <PH0PR19MB997338AD35728E948A41A7A05AA5C22@PH0PR19MB997338.namprd19.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="firwxyrwqnz6ataq"
Content-Disposition: inline
In-Reply-To: <PH0PR19MB997338AD35728E948A41A7A05AA5C22@PH0PR19MB997338.namprd19.prod.outlook.com>


--firwxyrwqnz6ataq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: linux-next: build failure after merge of the battery tree
MIME-Version: 1.0

Hi,

On Tue, Jul 21, 2026 at 12:15:32PM -0500, Chris Morgan wrote:
> On Tue, Jul 21, 2026 at 03:50:58PM +0100, Mark Brown wrote:
> > Hi all,
> >=20
> > After merging the battery tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >=20
> > /tmp/next/build/drivers/power/supply/sgm41542_charger.c:209:12: error: =
call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support =
implicit function declarations [-Wimplicit-function-declaration]
> >   209 |         reg_val =3D FIELD_PREP(SGM4154X_PRECHRG_CUR_MASK, reg_v=
al);
> >       |                   ^
> > /tmp/next/build/drivers/power/supply/sgm41542_charger.c:249:8: error: c=
all to undeclared function 'FIELD_GET'; ISO C99 and later do not support im=
plicit function declarations [-Wimplicit-function-declaration]
> >   249 |         val =3D FIELD_GET(SGM4154X_ICHRG_CUR_MASK, reg);
> >       |               ^
> > /tmp/next/build/drivers/power/supply/sgm41542_charger.c:271:12: error: =
call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support =
implicit function declarations [-Wimplicit-function-declaration]
> >   271 |         reg_val =3D FIELD_PREP(SGM4154X_VREG_V_MASK, reg_val);
> >       |                   ^
> > /tmp/next/build/drivers/power/supply/sgm41542_charger.c:293:8: error: c=
all to undeclared function 'FIELD_GET'; ISO C99 and later do not support im=
plicit function declarations [-Wimplicit-function-declaration]
> >   293 |         val =3D FIELD_GET(SGM4154X_VREG_V_MASK, reg);
> >       |               ^
> > /tmp/next/build/drivers/power/supply/sgm41542_charger.c:452:9: error: c=
all to undeclared function 'FIELD_PREP'; ISO C99 and later do not support i=
mplicit function declarations [-Wimplicit-function-declaration]
> >   452 |         time =3D FIELD_PREP(SGM4154X_WDT_TIMER_MASK, time);
> >       |                ^
> > 5 errors generated.
> >=20
> >=20
> > Caused by commit
> >=20
> >    ac55d04627d41 (power: supply: sgm41542: Add SG Micro sgm41542 charge=
r)
> >=20
> > I have used the version from next-20260720 instead.
> >=20
>=20
> Sorry, I wasn't aware this was getting pulled for Linux next or I
> would have noted that in the last revision I just sent.

mh, looks like b4 ty did not generate a response to you.

> I suspect I'm just missing a header here, which I am also missing
> in V8 just submitted. I'll add an include for linux/bitfield.h in
> revision 9 which I'll send just as soon in the next day or two
> once I can get a code review from a human and from the sashiko.dev
> code bot.

I will drop the driver for now and wait for a v9.

Greetings,

-- Sebastian

--firwxyrwqnz6ataq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmpf1X0ACgkQ2O7X88g7
+ppIXBAAou4CZobyjySNF/qucbwndmQ3/yNWKpQNaUT2FdMeYkuC37Z7eC8CFTF+
YAJajyktKUtzUCCsiRYQFaa4b56IDgy9ZZUPrEPUTVeUvEm3DY1lOvo/OkxqtaK2
Jj4DcmOn86Nu+5ZiLG0dbL5rXUv9XoPEStz4B9i8EZYIhJxXJBjM0Lp26Vi1Xrk6
tohchtPqV2rH7CeGbzpmyq3etld5DsE3gzZ6hkZwN/7tn0oZ7DIiRs+Wgq/zdMfm
USLPKhvW23fEELpqx8GGmYMZ240q4n9Qvqtlt6VeW11NSM+XJhFRl6/8dz86w+Dy
NQP7T1rBTuGny2o8ji0erpGHyCLo0m1+5Vw03u6VUm4anYfLSs6zz4hsHeuUrTVN
4IHI6QxJriTivNH7khIomYrUT1EW+GqcIbj24ZwCxrCz6x9TJGTlxAnCcrAimVy9
LiXLw3t1SlsmyQCNL35IjMHiXchErVbAA3e3rRXAJ+2GfTm9DcyAWKJZ03Z2MP2o
BLNt3cMiwflhPE+UEKLw+1UesLl3hT2MRr/uX4Ww0YYDs/EzI9TBvE3lUksTMD0y
yAhzyOhGx5ax9dQvnm+KvDLcpD5gQlIrleQY1WvBqlWk4iTWfSPnb8OYk0qPIpTt
I7uLfQdPI3sUk3kBsuJin2Px3fRJVFyaLGmNW1kYQNDipFvAm/c=
=oGT3
-----END PGP SIGNATURE-----

--firwxyrwqnz6ataq--
