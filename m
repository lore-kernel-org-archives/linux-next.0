Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A633DDB04;
	Fri, 17 Jul 2026 15:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784300807; cv=none; b=OdB+RwMG/6ybxTjEuQmqJtk/y4DhxkLlxf1/mwD+2a8GKHFNr2FEjbwjZYWCt8CoGeAPcg8nq/t+kgwNQ2RP//3h2liGWXVUJzYmNt6XXv9xJSKCtOzN8133rLugruS1CgBzlZsKTbjXVtNoW4esNxd7TRSnHAkb4NjVPXKw0oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784300807; c=relaxed/simple;
	bh=u43OrpAdzjx8i5nr5EfDqm/Zy3FttA5vjjC+HkzhrUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nq0pKIQIbNQFaixbPaLwgY98EO79oD6LNe0fP27qA1ODB3Z+QjQsrlO45XuKCG9V3nVXmupLKtwBVCLqIS5JNF8+8/nXaUZTO1O3qE+IFXFDNXcjG8KKDnKJR669YYyTataSbHS6EHb/4lcLU27cVnjnlsBQfCsWkmm/brh9xuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fvh/1ZYx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fvh/1ZYx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6CFB1F00A3A;
	Fri, 17 Jul 2026 15:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784300804;
	bh=SGo9Ahhy5DeRhGd46FR4yFwXuPOcj4LGAxdldDN4Uj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fvh/1ZYxmL7mHLmaTF5kKIrRzQs/ape/y0fxft588IV8ez/lYSqCPLyJW4KXJLuyy
	 heWuDriG8NRmJMJMo+3AibZiUQATsRvv+u+upOOCZ/msz+g1gWanGBFUZdShwepPxG
	 WEW/pJrOSFKHQ1qMBz59rKW5olnk9deAgeVSHoIhmFvg5rqheA4DXmHi5r0F8eLiuq
	 CJ1Z4g14sNyK5eIk1gOYkPUla8fBS/p63Xf8zIZn/BaOGdjztFnrHkijDo8qSV4O/d
	 RNz7byr/krMXw/lp9Lw4jJmrDY7k5u4jvOzq7ssPaDUcdcg534PFaz/SaYS75PCOU8
	 OvEbvCnrQ1Y8w==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wkk9C-00000007cxk-3WsE;
	Fri, 17 Jul 2026 17:06:42 +0200
Date: Fri, 17 Jul 2026 17:06:42 +0200
From: Johan Hovold <johan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Manuel Ebner <manuelebner@mailbox.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure in the final build
Message-ID: <alpFAvt1AExGKx5f@hovoldconsulting.com>
References: <alUk8OTfE-f9oQo8@sirena.org.uk>
 <4f9f5ff9-8eaa-4bd5-9331-37119f78e13f@sirena.org.uk>
 <c2fe4a81c639cddb65116d9b3526e82206927c0d.camel@mailbox.org>
 <2026071734-papyrus-unmovable-5826@gregkh>
 <alo-5gLdvyqY-TwB@hovoldconsulting.com>
 <99d6a70c-3986-4267-9934-e8d8b293cb47@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j9jgMfF74rMkmYQ2"
Content-Disposition: inline
In-Reply-To: <99d6a70c-3986-4267-9934-e8d8b293cb47@sirena.org.uk>


--j9jgMfF74rMkmYQ2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 03:54:05PM +0100, Mark Brown wrote:
> On Fri, Jul 17, 2026 at 04:40:38PM +0200, Johan Hovold wrote:
>=20
> > I was also waiting on Mark to follow up on this, otherwise I can take
> > closer look at it.
>=20
> > Based on a quick look it seemed like Mark was right about missing static
> > keywords in a driver indirectly enabled by the "offending" commit.
>=20
> IIRC I replied to the patch for the offending commit the other day.  At
> some point I will get fed up and just revert the usb tree back to one
> that works, it's a real pain doing that for issues in the final build.
>=20
> This seems like it really ought to be straightforward to reproduce
> localy...

Oh, sorry. I misunderstood your comment about doing "something about
this tomorrow" to mean that you intended to send a fix yourself.

I'll send a fix in a bit.

Johan

--j9jgMfF74rMkmYQ2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQQHbPq+cpGvN/peuzMLxc3C7H1lCAUCalpE/xsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQC8XNwux9ZQiEBgD/XP3jM122CkaZ+n1tfNoR
F4Xn6MlzXiO2gV4pyDuHm0QBANJFvUhThXL4mGvq3nE+AgxzJQ0JUYATyKWo44kw
+YEA
=Ca63
-----END PGP SIGNATURE-----

--j9jgMfF74rMkmYQ2--
