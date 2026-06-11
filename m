Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42544364EAA
	for <linux-next@vger.kernel.org>; Thu, 11 Jun 2026 19:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781206162; cv=none; b=HRuzeP145eTQ59eerUaMVktz/njFdehqMOXHTHzGOEjktO/pKOpDzzHe2n1zGd6e/ggHLcd8sO6nf9j8FoLQhClUs1yC+lByixHhfPZUOLoY4tdgyYP3qMQ59snut0xNZb4cVU6QT6BkHkR3g5mpMmpkh8sE7c8SyW9M65ed6NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781206162; c=relaxed/simple;
	bh=G6McVqGHfExTosx+IBUskm8O3gNWjZhiN0yG65B+sco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D9NHfpqsNgClTlDcCgowR9jkRIUPRoM/fBxq9FUaKT06KscawFfzG2zKlh4oadHtWgYIK6rfGh18Dh8y5j3J6WSOg1PGK3/3tJIBA+uZVwVKnJPv8W6BPKFZnfNOrt5YmyV1x4rjtoA/myIXgo7i0padSF6w0gWsxvYwTTAWewY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YfCJJ2OR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YfCJJ2OR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68E1F1F000E9;
	Thu, 11 Jun 2026 19:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781206160;
	bh=hSADnVxLHEoFyKr+XzbTPXt5PAH8H/mgVtZYQ7h2ewc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YfCJJ2ORYnqWP12eUSBmRVvU+MNTwVPGcfbJ53RsANqcEh8uWA0IRfYrzZRSnhMni
	 yLZWBaVc1xePKraZoDySqR3k00Azs+/IVMZhzPH7Ob3zKOBbnmLGYKYm82ZXW1wcMI
	 U1BoIUnuK+z5mChJ2GIUvpNCEP6DqZfE12/61GsvTA1Xz/r6rYu74hVPJyhVIG1QCD
	 13Al+KYqwPkNndt51ayuYMqxouFKbjFOO94bL8T3M9Je3n6Ue7Z3jL4O/kOr/2Rprp
	 wrIZbzLhHnw0v7QvgUgbJ5MRdPfvAMV6dPPpBsK2WAE48iD7fsyYNc9rTpxv2k9MWc
	 hMdDO21O9gMcw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 478DC1AC56C9; Thu, 11 Jun 2026 20:29:13 +0100 (BST)
Date: Thu, 11 Jun 2026 20:29:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	helpdesk@kernel.org
Subject: Re: linux-next: Tree for Jun 10
Message-ID: <aisMicRreOJ1bcYl@sirena.co.uk>
References: <aimIc7ciEUrhXV23@sirena.co.uk>
 <608ff135-c113-4bda-9812-26ee8f8cdf7f@infradead.org>
 <ac803cb5-37c8-4e41-af3b-1c15955cb219@infradead.org>
 <20260611-invincible-whale-of-progress-69ffd1@meerkat>
 <aisC0nU0ZnN7wv6e@sirena.co.uk>
 <f4ca5f0b-a897-4249-8b04-759dc2d10610@infradead.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0NyQpjW2NUm56mmO"
Content-Disposition: inline
In-Reply-To: <f4ca5f0b-a897-4249-8b04-759dc2d10610@infradead.org>
X-Cookie: Leave no stone unturned.


--0NyQpjW2NUm56mmO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 11, 2026 at 12:25:17PM -0700, Randy Dunlap wrote:
> On 6/11/26 11:47 AM, Mark Brown wrote:

> > I see kup running and didn't notice any errors, the output is lost to
> > scrollback now.  I'm on my laptop rather than my desktop, presumably
> > there's something different though not knowingly.  I'm not sure it
> > matters, I don't know that anyone but Randy even looks at the patch
> > files.

> Maybe you should just announce that they are being discontinued.
> It will alter my workflow but I can handle it.

Whatever is up should be resolved whenever I'm back on my desktop on
Monday I'd expect, like I say it's not a deliberate change.  I can't
check for differences since the reason I'm using my laptop is that I'm
not near my destkop, and I won't be able to double check for any error
reports from kup until I next try to publish - I did see it running
today, don't think I stared at it until the upload was finished though.

--0NyQpjW2NUm56mmO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmorDIgACgkQJNaLcl1U
h9Aiwwf/caKvAQkQez0Ed4QoQfaKxEDyI6ne+LVHPpxk0Hzw/oE2EDDKT9lVJRQZ
SnvdGzyAEal2n1nNOkEnh+woT638IbhrxBNsjrkol8GIjpJ+9OMWKfz84chy7QkT
NMVdZH9yOAJWMX77KBIO0AwZtf3Bn4Ygpn9s/XWq6t+lJSoBZHqmsb/1ML+1Q26O
wYSfeR+xz5MIoSIKWQuEz0JUzoUmqru49p5V/QAWRaraQjsJIDX7FHHd79jRxVph
p0KVAbmo1UfdMkP7xTXFISpBH+KNlAMWPY7XUH3VYWb8XX68K5U0mup9AxWr5mzs
KVMyOSsFcU4th7IANUL8XJEdahUFJA==
=SKnt
-----END PGP SIGNATURE-----

--0NyQpjW2NUm56mmO--
