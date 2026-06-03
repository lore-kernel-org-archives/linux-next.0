Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B070319852;
	Wed,  3 Jun 2026 14:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780498538; cv=none; b=t+0Qi6xbT82NFgZvRhpXyM1eOsxdhtm+RR35+HH9i/a9syb9doy8xv2mXFuMXn59NQW7bM9Frjzep5TfzJD1px8ZawZF85dnf0QIMDxKbnnk1t4wbr3PyFkg1uIhr8zgRNbttnw/jjhaAU6V2kYgyaAgWra72QMkkPEwGKlHjvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780498538; c=relaxed/simple;
	bh=lRt2iMXAw234wnDE6xtp/gTEMsqzlaYg5O87p2Nn+Zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b9XGoX/0URfCc7LHYspyRWr9Q+6I10nLVJnFxT2ulpwifQucyYcmKhgL06keWZvdjqUKNsIp6eQ7L9YqEwmKyWUMKvfZg6S/urLTU6phiN+5+9X5pJjmFfvlk2M0MrVCa7diTc/j9RFJy/8cXCzXM/EvGNAea1wHh2eZNy2lt9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyphar.com; spf=pass smtp.mailfrom=cyphar.com; dkim=pass (2048-bit key) header.d=cyphar.com header.i=@cyphar.com header.b=0OFDxP4o; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyphar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyphar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cyphar.com header.i=@cyphar.com header.b="0OFDxP4o"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gVrNG1Zqsz9v0g;
	Wed,  3 Jun 2026 16:55:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyphar.com; s=MBO0001;
	t=1780498526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w9byIzDuJCUt6io4onNyza1YyMqteOinzLhDFdFw5yE=;
	b=0OFDxP4or/36avJMxMUvi9mXEtheMGvLe4lSiGAAolmMtmS6ChmXh7Edxc8GDpyZ09b8ak
	1z5JodoMg9dRDxS9xuPXxRXDyrwMYOBNdi8B5Evxbjo0hnftlwnLKi+eC3ct+/pFLVlWBq
	5KzSng/X4/RR+lAAmh0Zs0E6EJa/4SwLPxyXjUJl20nymyz8PhtNONAv8B4gD+ocSiyUUH
	iv59sVi1MaRaFchYYsebVPc1b9MOFjFXZeDepjmg1Y9D5SeB7pfwZWsA6TKkXua2T4Sv+F
	cuWE13B+sHV2Wt2mn+geejQRjW68SZ/h1AYOGXb8N4JzXbyArzxayzhLmjgZqA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of cyphar@cyphar.com designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=cyphar@cyphar.com
Date: Thu, 4 Jun 2026 00:55:14 +1000
From: Aleksa Sarai <cyphar@cyphar.com>
To: Jori Koolstra <jkoolstra@xs4all.nl>
Cc: Aleksa Sarai <aleksa@amutable.com>, Mark Brown <broonie@kernel.org>, 
	Dorjoy Chowdhury <dorjoychy111@gmail.com>, Jeff Layton <jlayton@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Christian Brauner <brauner@kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <2026-06-03-static-roomy-ports-pigs-9IRSWx@cyphar.com>
References: <CAFfO_h5QdRG2ptyuGRQtqxrpndwan98aOsX92bvN4hyvpgLPMA@mail.gmail.com>
 <e221b631-00bf-44b5-865b-ac970e6cb11f@sirena.org.uk>
 <1286370201.1726989.1779131564699@kpc.webmail.kpnmail.nl>
 <4bd253fa-c363-43cb-adaa-0248ac707a0d@sirena.org.uk>
 <12198575.2129298.1779371885282@kpc.webmail.kpnmail.nl>
 <20260527-bordstein-reizt-gemindert-a76319be86a1@brauner>
 <2026-05-27-yapping-angled-spoof-tunic-AYfaAV@amutable.com>
 <1252517387.391165.1780495562312@kpc.webmail.kpnmail.nl>
 <2026-06-03-passive-wicked-stones-player-ciGFgM@cyphar.com>
 <1923539284.396325.1780497055216@kpc.webmail.kpnmail.nl>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ss4fqu5kemgollsu"
Content-Disposition: inline
In-Reply-To: <1923539284.396325.1780497055216@kpc.webmail.kpnmail.nl>
X-Rspamd-Queue-Id: 4gVrNG1Zqsz9v0g


--ss4fqu5kemgollsu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
MIME-Version: 1.0

On 2026-06-03, Jori Koolstra <jkoolstra@xs4all.nl> wrote:
>=20
> > Op 03-06-2026 16:13 CEST schreef Aleksa Sarai <cyphar@cyphar.com>:
> >=20
> > =20
> > On 2026-06-03, Jori Koolstra <jkoolstra@xs4all.nl> wrote:
> > >=20
> > > > Op 27-05-2026 15:09 CEST schreef Aleksa Sarai <aleksa@amutable.com>:
> > > >=20
> > > > If we could also get some comments in asm-generic that tell you whi=
ch
> > > > flag bits are "cursed", that would also be quite great. My impressi=
on is
> > > > a fair number of people forget to check the arch-specific headers, =
so
> > > > having a note in the generic one would let us avoid this issue in f=
uture
> > > > (and IMHO will be more effective than just switching from octal).
> > > >=20
> > >=20
> > > Just to be sure, what do you mean by cursed here? Maybe just a remind=
er that
> > > there are arch-specific O_ flags? A list of all of them that may have=
 an
> > > arch specific redefinition is basically all of them...
> >=20
> > I was mainly thinking of the ones that appear free but actually aren't
> > -- so these are the ones where there are only arch-specific flags that
> > take them.
> >=20
> > Basically, I would prefer the list in the asm-generic header be
> > something like:
> >=20
> >  #define O_FOO 0x001
> >  #define O_BAR 0x002
> >  /* 0x004 must not be used -- it conflicts with flags on alpha and s390=
=2E */
> >  #define O_BAZ 0x010
> >  /* 0x020 must not be used -- it conflicts with flags on parisc. */
> >=20
> > The fact that some flags have their order mixed up on different
> > architectures is funny trivia but when allocating a new flag, the thing
> > that trips most people up is that it looks like a flag is free in
> > asm-generic but some architecture is using that flag and you'll only
> > find out when someone compile-tests for that other architecture.
> >=20
> > Depending on how many O_* flag bits we have, this might even allow us to
> > enforce non-arch-specific O_* flags (like we did for syscall numbers a
> > few years ago).
> >=20
>=20
> Okay, that makes sense. But you can reuse those bits in asm-generic if yo=
u just
> redefine the new O_ flag in the conflicting arch-specific fcntls, right? =
Maybe
> we don't want that, but that leaves fewer bits in the O_ space.

Actually the number of usable bits we have today is the same, regardless
of whether we choose to skip the "cursed" bits today or we keep filling
holes until we cannot express a bit on every architecture -- either way
you will eventually be unable to allocate a bit on every architecture
after the same number of steps.

But there is a usability difference -- if we use the same bits
everywhere for future O_* flags they are less painful to manually define
for userspace and less likely to lead to bugs (which was the same
argument used for uniform syscall numbers).

(Not to mention that we have the high-32-bit OPENAT2_* flag space now,
and I expect we will see very few new O_* flags because they are very
hard to add safely due to the -EINVAL problem we've discussed before.)

--=20
Aleksa Sarai
Founding Engineer at Amutable
https://www.cyphar.com/

--ss4fqu5kemgollsu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQS2TklVsp+j1GPyqQYol/rSt+lEbwUCaiBAURsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQKJf60rfpRG/n4wEA2fhsR4TtBD+6yn/z+ukJ
Gbx/4doPvB6e9RZsYIdHYX0A/R+2sOBJ22J+huekVBBLTwf81iFdHoMzUE8BV7XO
7AUM
=mt4i
-----END PGP SIGNATURE-----

--ss4fqu5kemgollsu--
