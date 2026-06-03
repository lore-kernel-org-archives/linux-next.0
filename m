Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EE147DF8F;
	Wed,  3 Jun 2026 14:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780496046; cv=none; b=uSV7AqVhmBNec+8e1bzKJzXQh5m9RloO/pOP0Bzjv8znWSsOLU79HiZYLe3xfxdX9OAzt9T+ctAusuAUv83aqcQz+/70qtvcnnGA02A7ndTFA1Dvj8y05dSDd75EGo3xiSLkFEK8uTaZGVCp4LtIMZ0t6JAcTFT6nyBv+z759bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780496046; c=relaxed/simple;
	bh=krkBiqIeVqwjGCWysgZsWcuhot4Mwo/uoOAOPvmtVV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=otuPlogxl7EUgxlSLXQK/b0EuYqR5Z6rq72Lodb1nCGFU4NaNwHK37idNV7KdLLslgudcm3JoPqII2TO10Xt9zshYL0xxeFDVNsEKp0izjQpLMInLkP6fHYAKiA8t3hWf4uQBitijApAaMg9B03sJqTlbs6WEzTgcRyTP6Wwjbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyphar.com; spf=pass smtp.mailfrom=cyphar.com; dkim=pass (2048-bit key) header.d=cyphar.com header.i=@cyphar.com header.b=zchlZLbU; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyphar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyphar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cyphar.com header.i=@cyphar.com header.b="zchlZLbU"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gVqSK4xZzz9vMp;
	Wed,  3 Jun 2026 16:13:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyphar.com; s=MBO0001;
	t=1780496033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=krkBiqIeVqwjGCWysgZsWcuhot4Mwo/uoOAOPvmtVV0=;
	b=zchlZLbU5tBDILB6J2zyP8n95CEEe74pCMmQdy6bdLNlrzf2ffsgpF8dNYXKMUSotFnXgA
	9V32OV8qH4aYTEwAgVLPe1D+H4wEsMlq93IVYcxTB45GDSRKvBDtbI5EP1hM1A+rlZgTsd
	ya1T3tNq6LnT5ggM/Zjyx8/r1awd8i2hPcvxmpNkjNbNP9F5oct2CDm/wGSIKFSeJeKauV
	Gm/UqUHOx6gsL1MBiApeMQkhklqP5SoGW/5ri0qJAQFr7ji8fLDvsNTzRgGBdPcwBSTlfi
	9RU26ak+jXeer7NZGFJB+E1girGgVcBZWvqrUy3qhMuEj5rnlItxY3JWxokH3A==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of cyphar@cyphar.com designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=cyphar@cyphar.com
Date: Thu, 4 Jun 2026 00:13:41 +1000
From: Aleksa Sarai <cyphar@cyphar.com>
To: Jori Koolstra <jkoolstra@xs4all.nl>
Cc: Aleksa Sarai <aleksa@amutable.com>, Mark Brown <broonie@kernel.org>, 
	Dorjoy Chowdhury <dorjoychy111@gmail.com>, Jeff Layton <jlayton@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Christian Brauner <brauner@kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <2026-06-03-passive-wicked-stones-player-ciGFgM@cyphar.com>
References: <agruPPybCx8q2XcJ@sirena.org.uk>
 <c34d1f0e-0707-40cc-b0c7-7b2648ec1863@sirena.org.uk>
 <CAFfO_h5QdRG2ptyuGRQtqxrpndwan98aOsX92bvN4hyvpgLPMA@mail.gmail.com>
 <e221b631-00bf-44b5-865b-ac970e6cb11f@sirena.org.uk>
 <1286370201.1726989.1779131564699@kpc.webmail.kpnmail.nl>
 <4bd253fa-c363-43cb-adaa-0248ac707a0d@sirena.org.uk>
 <12198575.2129298.1779371885282@kpc.webmail.kpnmail.nl>
 <20260527-bordstein-reizt-gemindert-a76319be86a1@brauner>
 <2026-05-27-yapping-angled-spoof-tunic-AYfaAV@amutable.com>
 <1252517387.391165.1780495562312@kpc.webmail.kpnmail.nl>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mp4eazjm6kati3br"
Content-Disposition: inline
In-Reply-To: <1252517387.391165.1780495562312@kpc.webmail.kpnmail.nl>
X-Rspamd-Queue-Id: 4gVqSK4xZzz9vMp


--mp4eazjm6kati3br
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
MIME-Version: 1.0

On 2026-06-03, Jori Koolstra <jkoolstra@xs4all.nl> wrote:
>=20
> > Op 27-05-2026 15:09 CEST schreef Aleksa Sarai <aleksa@amutable.com>:
> >=20
> > If we could also get some comments in asm-generic that tell you which
> > flag bits are "cursed", that would also be quite great. My impression is
> > a fair number of people forget to check the arch-specific headers, so
> > having a note in the generic one would let us avoid this issue in future
> > (and IMHO will be more effective than just switching from octal).
> >=20
>=20
> Just to be sure, what do you mean by cursed here? Maybe just a reminder t=
hat
> there are arch-specific O_ flags? A list of all of them that may have an
> arch specific redefinition is basically all of them...

I was mainly thinking of the ones that appear free but actually aren't
-- so these are the ones where there are only arch-specific flags that
take them.

Basically, I would prefer the list in the asm-generic header be
something like:

 #define O_FOO 0x001
 #define O_BAR 0x002
 /* 0x004 must not be used -- it conflicts with flags on alpha and s390. */
 #define O_BAZ 0x010
 /* 0x020 must not be used -- it conflicts with flags on parisc. */

The fact that some flags have their order mixed up on different
architectures is funny trivia but when allocating a new flag, the thing
that trips most people up is that it looks like a flag is free in
asm-generic but some architecture is using that flag and you'll only
find out when someone compile-tests for that other architecture.

Depending on how many O_* flag bits we have, this might even allow us to
enforce non-arch-specific O_* flags (like we did for syscall numbers a
few years ago).

--=20
Aleksa Sarai
Founding Engineer at Amutable
https://www.cyphar.com/

--mp4eazjm6kati3br
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQS2TklVsp+j1GPyqQYol/rSt+lEbwUCaiA2lRsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQKJf60rfpRG9bhwD+Kd0Ydx4B/rU+3X7pOIsA
HEL8qE67J9HYH/088/CQ+RoA/0nGH8ICaJZ2oi60fpaxF/OWkYfViL87YW2naB0d
a6EG
=7Yb6
-----END PGP SIGNATURE-----

--mp4eazjm6kati3br--
