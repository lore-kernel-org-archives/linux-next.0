Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029593822BE;
	Mon, 18 May 2026 17:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779124396; cv=none; b=ZLnRrtBrShevtKhpXQp3FKkEbfhQtogxMJPpH+3NrA453xiDmrsAlIMIjEqmipl+K1v1FsFcA0+2X7+9tzEN/N1Z/kyY+LBSStX5UofOLXF3YX3lWMJzTt9U36j+7vhL05XJKyOpDu8ze/1weD9N1t/an4rd+zICgEdTGeN4v00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779124396; c=relaxed/simple;
	bh=Ha9NYG8GsdXVXtbnSnH4VVzUCys4eMTI4yhFXMFbfNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d6bXhZvGz2Ai+7bRantdNRptOLvs96alGpOvAMwsxTPspVFCe+bue/x+7S4KJLimYVCICMZpcDpjCEUuw0A5ri+lf9gSduLgPS2/4mkb8ujky8olTU2XMGDoz4DF3AqWlsWjdMevtkLfZaOBjG/BpNIGi4Q3MsXdE4Wb04ucj6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gA9IH+Hn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gA9IH+Hn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 346D7C2BCB7;
	Mon, 18 May 2026 17:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779124395;
	bh=Ha9NYG8GsdXVXtbnSnH4VVzUCys4eMTI4yhFXMFbfNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gA9IH+Hnb1L3Xz2Xo0VwA/3/hyGClhaVZk3cGrNYKZEBQbOtDg/P3x80zWt19ZXQ+
	 k6SLY99F02Hx67Q87ZVAzjeD+r6oClOwTICFlW4d7rHSjYkQFTFVHLZEa5d7bUBwT8
	 /tli31wwo8Jqwy5aven+XslC1URR+7DUdfxP3IgVnp0g2WfWkfyMihBOWPmiY5T30o
	 rbd++K3vXatRmg2UdMkhsHMbnPRYhvPyoUCK+f16QoJg8IfYpDCVDx/ZksGjuM7z78
	 2SI3srT32wLV4r6yjpp5qTgsdxULVyRtirH1JiXOHa8rDO7Lj17hkFOUtpSaQZIwIJ
	 J13V8K9CIxADg==
Date: Mon, 18 May 2026 18:13:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Dorjoy Chowdhury <dorjoychy111@gmail.com>
Cc: Christian Brauner <brauner@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Aleksa Sarai <aleksa@amutable.com>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <e221b631-00bf-44b5-865b-ac970e6cb11f@sirena.org.uk>
References: <agruPPybCx8q2XcJ@sirena.org.uk>
 <c34d1f0e-0707-40cc-b0c7-7b2648ec1863@sirena.org.uk>
 <CAFfO_h5QdRG2ptyuGRQtqxrpndwan98aOsX92bvN4hyvpgLPMA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NX1gsZxyPml4cQ31"
Content-Disposition: inline
In-Reply-To: <CAFfO_h5QdRG2ptyuGRQtqxrpndwan98aOsX92bvN4hyvpgLPMA@mail.gmail.com>
X-Cookie: She sells cshs by the cshore.


--NX1gsZxyPml4cQ31
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 11:06:05PM +0600, Dorjoy Chowdhury wrote:
> On Mon, May 18, 2026 at 10:32=E2=80=AFPM Mark Brown <broonie@kernel.org> =
wrote:

> > >   3adfed795a99d (openat2: new OPENAT2_REGULAR flag support)
> > >   6703991ad3a35 (vfs: add O_EMPTYPATH to openat(2)/openat2(2))

> > ...and my fixup fails to build on sparc64_defconfig :/

> (1 << 26) doesn't seem to be  0100000000 rather 0400000000 .

Yeah, like I said I renumbered due to the conflict with the asm-generic
OPENAT2_REGULAR.

> 0100000000 conflicts with O_PATH in
> arch/sparc/include/uapi/asm/fcntl.h

Figured it'd be an arch specific version of a similar thing - I didn't
audit them as you can see.

> I looked at the O_EMPTYPATH changes in git.kernel.org and it defines
> O_EMPTYPATH only in include/uapi/asm-generic/fcntl.h . That is why it
> was probably chosen to be (1 << 26) i.e., 0400000000  since at that
> time this value did not conflict with the other explicit values in
> architecture specific fcnl.h files. But as far as I see, I defined
> 0400000000 as OPENAT2_REGULAR in arch/sparc/include/uapi/asm/fcntl.h
> during my work. So this value probably needs to be something else, for
> example, (1 << 27) i.e., 01000000000 to avoid conflict after merging?

Yeah, just some value that isn't already in use - the compile assert is
doing it's job here.

--NX1gsZxyPml4cQ31
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoLSKYACgkQJNaLcl1U
h9BsDAf9HEYHjTq9vhZnDnL6IORz4YpM/LKkCJ5q2IqWkBFfswqaZlxBWX/Bik8Q
wlxEMnOY3wr9beJq0DjMbeNLgCQt4aJjkeoeySR8jG4HhRXGRH9FzmhhVZ6Co1YN
96Pu0FcR5zpLDUNWmd9rRIXyKZ/czVcsdDJcsA/75gsxjPKcBI4tHNHkqRU62RqZ
qRJvfN8uh2NBwdTgZGAFaYynv18tK6lXtfOjcePUslaOiwrjmREW/PYcq+TUICvE
xloHtho6vSCzPDRxNXkeg4CzomepBQ0PyXk5bPFS45qGcAN9xbBQnCDs62P+7kFk
nhSYCLjZg4F5iZ9RE0++bAjT4Qzi/Q==
=Q0f5
-----END PGP SIGNATURE-----

--NX1gsZxyPml4cQ31--
