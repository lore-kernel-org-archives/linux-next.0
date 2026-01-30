Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1E923C4FD;
	Fri, 30 Jan 2026 18:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769797084; cv=none; b=Y7WPDVHL5G6UrzVciAurKP1aTmzFqtNHjdiwOBxMQEzAs60Dc4nulPNoKykqFM2EmVpU47+rwftPKxmXF8VZxC493ArAXoMvF0zOS0JqIwNDvBbuHNElGsa7MSEqPGZIVgkeiFMCvgeqwtuBCVXoPB3bgaB9anJkvUSMhQYV3qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769797084; c=relaxed/simple;
	bh=2lijtI4f4uaxFMgPoC/0oCBFPGLcnjCC6l0jkGvaXqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=POilbGoYHSaayj6kxhPHbL/SJ5PPasIs1QhqxkUusYR/azvwFj+kPwF5xNCRhJ7NN2TIlr6g95KCS4ho6+khD6eHgwPaDQFJy25NiGrI1oBc4rX2sWycLMwdniMLvDbZvn8qNy1Iv8KFncjiEpWqjDrTUlXA/nd2W8qCXGKT7zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cX2km7Tv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cX2km7Tv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F295C116D0;
	Fri, 30 Jan 2026 18:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769797084;
	bh=2lijtI4f4uaxFMgPoC/0oCBFPGLcnjCC6l0jkGvaXqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cX2km7Tv8uTj42vpuWYDLmIwyNdgjZoY9FCrMCoxYavo13dQdoWP/RoxENQAACMaH
	 BZKAAb1+gzRQdYe6zE7QzHJ99VNvoyL5QfUt2deVMzoJurcXWqg9AZIf8NVpbAdRxV
	 +uOis51fPVaZlWrp96W4DFC8m7J/vLvIPBJepFCCEyqL4SoEa68hB1OOWZC/zt3USq
	 hM1ivLRCcFyIf1skQKXyJGEdrH3XZCgJ0C0mjzdLYTu7HD1fOTlTjItmReIXPO6DhM
	 teDur/rHPpZPvn6LQjZ6AaM6IM4u3CbN2CJqkVxUPekC92LK7AG78fGRjwGFMnbWXX
	 4THDy4dnGybSQ==
Date: Fri, 30 Jan 2026 18:18:00 +0000
From: Mark Brown <broonie@kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: David Howells <dhowells@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>
Subject: Re: linux-next: manual merge of the keys-next tree with the modules
 tree
Message-ID: <f98a3717-59a4-45ba-946a-e051873d8d59@sirena.org.uk>
References: <aXzoSci8NPhIwDf-@sirena.org.uk>
 <c80f3db9-168f-4e05-b7a1-b1d4f702e9f0@sirena.org.uk>
 <CABCJKuckAwav8bg20mz+SwgGb==pX09G1dhGV_3_URyMCGGTQw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n9teSeZMpvwHNnaj"
Content-Disposition: inline
In-Reply-To: <CABCJKuckAwav8bg20mz+SwgGb==pX09G1dhGV_3_URyMCGGTQw@mail.gmail.com>
X-Cookie: War is an equal opportunity destroyer.


--n9teSeZMpvwHNnaj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 30, 2026 at 10:13:42AM -0800, Sami Tolvanen wrote:
> On Fri, Jan 30, 2026 at 10:12=E2=80=AFAM Mark Brown <broonie@kernel.org> =
wrote:

> > +       unsigned int use_signed_attrs =3D PKCS7_NOATTR;

> This should be initialized to CMS_NOATTR.

Bah, I'll fix the fixup - thanks.

--n9teSeZMpvwHNnaj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml89dcACgkQJNaLcl1U
h9BELAf+PzeEQiZ7BuZhdmtb8kwtQP23n7FkFRxct89H5OuP+y7fUucYiXCtERf8
GGBbTeKcvG4kJLuctemq242YEDJOGkOWXVXwFrDaa+eMren9t03cx/a/HM5Nuhef
IgKmsPIQmH20UOHTxYwgnRU+FyfJclRhnV+GBNbqgcyBcwMEt5E14O93NGircgoz
eoad+NkaI5rpAqHyZaJ/NHsAvKfaZ4CSWEH1vkF9K7CjzSfPET/eUK+kewUZWuxy
CUhkHLd862jbyYgiEwpIW0SFLZ2o0Z5n0FvQIQCINDarJDBXBdrwOmhLoBQb6yp5
btKCwRDWlrcsjjVAAYyDxliWREts+A==
=et0U
-----END PGP SIGNATURE-----

--n9teSeZMpvwHNnaj--
