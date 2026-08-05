Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9BE3E717C;
	Wed,  5 Aug 2026 08:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785917205; cv=none; b=VOLJnul8JEsRFA+dqbtbsL421nBhHBA8FbMHId78hJuHJNn9vSQvrUFAFv+otlbbI62mxlgV4UWEo7/BwIcIK3Eh1EWvQhw3Lf6op49EyqvudrRl6BHngxzc5/TvFgqNUJFnfAPwGbD1KWYGR8yAbkhZpJs0T7XpJ+z4kW8AKps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785917205; c=relaxed/simple;
	bh=NLnACpYsxPC35J9eAv1FyaEAqGsV/NHTe0JAwQtgidE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VInGlG98Imgv+/e9UeaQZSimCdHZ2ND9qbhfRzNrNY5JI6SgpbY/iDgF/mMYVPB9dQy+jWJ4fJUYcqrJzGJmES4Z7Cr20uq8WbiGSVk+2n+U5K/iegMCcSxHPvGlY/ce4kWN4S3jxcg6XvMly/crMU+zuu8+yIHrEsRD3sB08g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nn2JDMHg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nn2JDMHg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 774CE1F00A3A;
	Wed,  5 Aug 2026 08:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785917192;
	bh=gRATPsMNH1AiUqjM76s42NFCeCbjOs7f5VFxaSlgaCU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nn2JDMHgCjx4/xNXN2XNY2PD1Kg0GygYbSJtKBsze5KDej4OuwH+lGYA3BTJCd1X9
	 WAgW7T4jB3Pl5xbTjbpAAmUiAqTBNZ//X/oSqWyqO7JJKuuXGfFrZB4cIAJuw28eKj
	 qVykz63CtZIia5hv3lpfjuytD0IzE1QAY48RbQ3kk6hFOT7unNgEy4edV9CBjrRLef
	 A4YbPDu8SGEIf5OXKxlyspJDlXF5JQc4wcMINQxxf6jzq8OidKWI2LDN7ddYgltR0j
	 SIiswlxuJEotzYks4FLFRLBT9nwIDOMjKgL1T8qG7lXD8VuFBn2R6oelsgzaFJWz5Q
	 qk5/aCI7FCpdg==
Date: Wed, 5 Aug 2026 10:06:26 +0200
From: Joel Granados <joel.granados@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Kees Cook <kees@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Oleg Nesterov <oleg@redhat.com>
Subject: Re: linux-next: manual merge of the sysctl tree with the
 mm-nonmm-unstable tree
Message-ID: <kmpimojpjnn53b3mlezkmokoxk5ugtikrupxtobnsl25uhg7kl@xjwnvn577wsa>
References: <amjpZ1aYsps44ExZ@sirena.org.uk>
 <20260728134755.501c6ac650c7a3868ae00614@linux-foundation.org>
 <ntrhorleb6tok47d6nr2k7xrpqwkwwfk5cie4v7pc3feia6tmd@hxxgjkkcc2vu>
 <ckrmakyl5pqqdileg6cuusekutpeuz5mtcpic64ml3zzgolwvj@2hnt7zcwqpvu>
 <20260804131407.40a4c72c38c482718894dd9a@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hyycitdvwjuthg52"
Content-Disposition: inline
In-Reply-To: <20260804131407.40a4c72c38c482718894dd9a@linux-foundation.org>


--hyycitdvwjuthg52
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 04, 2026 at 01:14:07PM -0700, Andrew Morton wrote:
> On Tue, 4 Aug 2026 09:54:04 +0200 Joel Granados <joel.granados@kernel.org=
> wrote:
>=20
> > > >=20
> > > > and
> > > >=20
> > > > 	sysctl: remove CONFIG_PROC_SYSCTL, it just mirrors CONFIG_SYSCTL
> > > > 	https://lore.kernel.org/amdveg1m4E4uQlGv@redhat.com
> > > I see that this one is already in next-20260803. probably went in
> > > through mm tree.
> > >=20
> > >   23a24c8a95c5 sysctl: remove CONFIG_PROC_SYSCTL, it just mirrors CON=
FIG_SYSCTL  [Oleg Nesterov]
> >=20
> > To avoid further conflicts in next I can also take this one into
> > sysctl-next and handle every thing in my PR to Linus.
> >=20
> > Let me know what you decide.
>=20
> How about I remove
>=20
> 	sysctl: move the "cad_pid" entry from pid_table[] to kern_reboot_table[]
> 	https://lore.kernel.org/al4C572uhLdBvyzH@redhat.com
>=20
> and
>=20
> 	sysctl: remove CONFIG_PROC_SYSCTL, it just mirrors CONFIG_SYSCTL
> 	https://lore.kernel.org/amdveg1m4E4uQlGv@redhat.com
>=20
> from mm.git then forget all about them ;)

Works for me. I had already picked up the first, I'll add the second to
sysctl-next and they will go upstream through the sysctl tree.

Best

Joel

--hyycitdvwjuthg52
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmpy7vkACgkQupfNUreW
QU8iBAwAjF/wKdE3yxEuoLr+ZR2svPMn0VWukufQC2ME3oEwv0ItjxE0fVyKoo41
bhs9UHiA/sgTN6qvf2hPHMg7XNKe4DClXvKx3Vhi/XSn2cOs0hHyeF5Sf2qxRnFf
3mKjGhSlY1/piu3/2VUFx66nIopE8CY80qdjcI7IRU+DF64s1gmv3ICzhN5JFmok
ol5xpmPc8L6w3ybAtIqOF0Rbzg4NTkSK7ts43QoJ16INAr0xuD+YEkVqxkcgC+sY
KEfwlEIxDlwGglHsAndImb5AALeY5yXeROhl4SJLEarHJF6lvQy1MOWolEzSkYlj
9p8pD8pVqPfPpaSv99vdFYcRN9jwDbOAqoXS2cGd5ciO1vvqvcSJZzu9pXTEm0VK
xF/BZ/n0DGrX6R7NEQqVKf/rRQcimzxGGjTTLL+TxARyArGVHQmYdfsYhFpSJz9o
FqMG6MiCByJI08zvuyZcPvrkYLbprmwm05d8r61DDOhWPziXR7KCSdFLHS2REoAL
2IFlnKA4
=gaMf
-----END PGP SIGNATURE-----

--hyycitdvwjuthg52--
