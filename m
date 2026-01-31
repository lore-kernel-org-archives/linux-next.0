Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9D21F8691;
	Sat, 31 Jan 2026 13:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769866449; cv=none; b=q3cYVxDPYO/PEDgJBwKttA88GPn6vx5zLYVjgSoYmC2cxzLoleoWsvJ1VW4xNuHZ/5KYKYblhL0273InycPKnGBAQsi+VtJ5ZQBqJSDMKziaTgWfyYMbfoORacyYnhVFIdfzXitW4QVNeROBSD9q5zfanhejxA7hRgjpjYgwWzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769866449; c=relaxed/simple;
	bh=RGFEMU0LG4xy48Jxq6GrnScr/vmQ2M670mf2Z3cXPMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Aj/5bUYC53E6ylG5x1udcXr8Y41ovVZwhSa6KdrnE04WjMyFOWUfX1ZYw1dFMBXH2I4wTIeS6LIH31rJyfsl2wJF1ln+rIYF1wzRSUsiTDCvJNxhP4T7V5J5TgCozAcky3+6Y2+njzZC8n/4LQGUszDyhgv7ojgDzdZaQyrq3MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CAlewn4Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CAlewn4Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42B80C16AAE;
	Sat, 31 Jan 2026 13:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769866449;
	bh=RGFEMU0LG4xy48Jxq6GrnScr/vmQ2M670mf2Z3cXPMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CAlewn4QLEbRoynJzN/+OvvuhWwD4nmQ9h0h8A+uX0iBk1+2J1169kdzMZKX23mj6
	 cZ8Izo85PIbxsEBkLGw96wmI2wtytV5T28Jye2ltvpzX2f8bUqwAaEz4+lo9aCT4cd
	 w3Br2qe0O4pvHe91XrSrCqyuGan8f/bPVijDwhhRU9ppDuJBSiCp5R0roIsJCeI4o8
	 E2wpRLDkSboZmHoNkbuo4SNsmOr5mGgEfbx/Qe+gkkDXI8EGbqxA+4j8WFTUC0cUsx
	 6SRE7FIFw8SgH+iC9KrPVbD06tGKwtzvLfjbnqlQsn0YP+8Ugj1X0iwfpjUl/Z3Arh
	 pPf5W6rAfQ/RA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id BAC111AC56A2; Sat, 31 Jan 2026 22:34:06 +0900 (JST)
Date: Sat, 31 Jan 2026 13:34:06 +0000
From: Mark Brown <broonie@kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Sami Tolvanen <samitolvanen@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>
Subject: Re: linux-next: manual merge of the keys-next tree with the modules
 tree
Message-ID: <aX4EzlBYkA8yDvq8@sirena.co.uk>
References: <33417587-10b3-4cea-ad5f-595af16174fb@sirena.org.uk>
 <aXzoSci8NPhIwDf-@sirena.org.uk>
 <CABCJKueCeHDpu+KMTT9z_iNP2Ljipt6r4KkJ-8h4ysoTRoCW4A@mail.gmail.com>
 <2280990.1769809836@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gvNmvXVyS+Qr3BlB"
Content-Disposition: inline
In-Reply-To: <2280990.1769809836@warthog.procyon.org.uk>
X-Cookie: Think big.  Pollute the Mississippi.


--gvNmvXVyS+Qr3BlB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 30, 2026 at 09:50:36PM +0000, David Howells wrote:
> Mark Brown <broonie@kernel.org> wrote:

> > > Thanks, Mark. David, I see the patches in keys-next were updated just
> > > a few hours ago. Would it make sense for you to rebase them on top of
> > > next-20260129? Petr's patch removed the use_signed_attrs variable, so
> > > we should ensure it's still initialized correctly. Otherwise the
> > > resolution looks trivial.

> > Please don't base anything on -next itself, that causes all kinds of
> > problems and clearly isn't what you should be sending to Linus.

> I was wondering if I should rebase on a merge between Eric's branch and Sami's
> branch and "pre-handle" the conflict.

That's not a problem for -next so long as neither of their branches get
rebased and they're OK with that.

Generally Linus prefers to do merges himself, though it's always a taste
thing what makes most sense and in this case it's more that your new
work is based on the merge of the two branches - they don't actually
conflict at all IIRC.

--gvNmvXVyS+Qr3BlB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml+BM0ACgkQJNaLcl1U
h9BxUgf/flOW5A4n5IOARDWBfOOERZooF2KKIVY+V48P5rGw8qybfK+d+w4ytHPS
vNx2gCAyIsMBMNFNBSAukHJ7ukdMZrDUGJvGC7y8tIOjh6KpJYNuy5JfDvajE7GM
vI81Lwn+vAKGW/5s/sJRerakzNucTRhgbxKKQqxNoIX03/KVIiFwjGzxx+r7WhLp
HMHlwtn0N9y7etlFPe6Wa6Db5mIy5tQt4Gvjs64o/165MXC35FvM8WzsQyCKn0hj
bbI7vGnqjqH3cT+Rdqm+NTo5QJBNWr/Egi2XLPfyJh/vKRFp1lUk2xQyb+uGPFzV
RFB+16Dcb5DzVd2wUUtYSwh8R/BzIg==
=nN5C
-----END PGP SIGNATURE-----

--gvNmvXVyS+Qr3BlB--
