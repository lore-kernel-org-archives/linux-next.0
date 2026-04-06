Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE330371D1D;
	Mon,  6 Apr 2026 13:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775481302; cv=none; b=nVh1wKlqQk7TRuI/MLpp1xAuxlnUQpGiiHdU6oEL0M6aFJRVbXYDq9a4uEpFnI2L1IXlxHnnpwZnp56lRz7myhuxxCRvAykHZ7lv298GyAS3U2Wd4dmTCMLLoQ/tZnLwPBB+p7R8ep1fiERX5r7cYj0H48PlsKzP4sY4gBAs56M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775481302; c=relaxed/simple;
	bh=Fzs5tIRVR+sDPbS1WA7Cg9dw+peSSJk2pUdyMdBQIDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AFvNyHc7ZU+lDcwjpLIctJ1TOOdAl/TR7Pl0Xo8Sx3PZKDEXDLH5snIY/J9xINRtNc1pfxr5LwK1+5prKhQXjxEIQJObekcduulA4XIEVCYjvCN3vPVfkWUEHdPzbpN9UXqSuCMB6buol4DomGKgqhdVxYRzZw71gpooYJ0ricU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tS6kLM0f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tS6kLM0f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7B16C4CEF7;
	Mon,  6 Apr 2026 13:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775481302;
	bh=Fzs5tIRVR+sDPbS1WA7Cg9dw+peSSJk2pUdyMdBQIDc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tS6kLM0fMKlnsVbk/KEvm2WOMfqf1QmQM0Uw9oB2WN3W8oNaJkh89Js4NwxmrxgMa
	 K0kZEgQ8zH9OFAaOz8yDyAW8HFxvhqAlk2vcvvXgpbFXwci3bW6Wgndx8SJS10n2uj
	 amTENwAdI9tMp/U+UwR77boFuNKOn1oJFuUxHWB36UpWzAqh4mUQivU5bOcO2PMwI+
	 EIyMX0NWi+0AQpq9fqftAUnAKnlrED5B1wW6CjzACmp1zEvMQSApX6sZS1usb6Jeos
	 VRiBmaebrRNLVdiq5hlLiL8pqEiglOYNDnejqMZJLjYG4Sfwzy+NjVtwi2TYRqkGcA
	 El3g/+Uojk4IQ==
Date: Mon, 6 Apr 2026 14:14:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rust tree with the origin tree
Message-ID: <85d22f65-aeb7-4152-9d19-3e68f291372d@sirena.org.uk>
References: <adOu7wNEgMY9CGo-@sirena.org.uk>
 <CANiq72n-FHNbRK2-N0dJ4DiYvKZ2oifuhOn-e7zvHAJjwQykKg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+XtFgitKkEtWbdIF"
Content-Disposition: inline
In-Reply-To: <CANiq72n-FHNbRK2-N0dJ4DiYvKZ2oifuhOn-e7zvHAJjwQykKg@mail.gmail.com>
X-Cookie: Does not include installation.


--+XtFgitKkEtWbdIF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 06, 2026 at 03:11:57PM +0200, Miguel Ojeda wrote:
> On Mon, Apr 6, 2026 at 3:02=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
> >
> >  +// Stable since Rust 1.84.0.
> >  +#![feature(strict_provenance)]
> >  +//
>=20
> This one can (should) be removed, since it is < 1.85.0 which is the
> new minimum (i.e. already by the time that commits happens) -- please
> see my resolution at:

I'll update that if I get another conflict.

--+XtFgitKkEtWbdIF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnTsdEACgkQJNaLcl1U
h9A5Kgf/VgKOBOfEQ0nDsEdEBcPtoiKP+Boh68Kn4LO9fjm/duFPfpoBW3vtNGBB
J0ttfLwIk5sG0h0BvpfLlQtS4kuPm+pHehDnjcdbB+k3Mgr1jKdkCjBJ+c9d4WqS
dXBMAEVKAdmCsSUxOqcPU3fgzMQMFWemGeeEcZ8M7seu3zVpiQEGCmtdtPYDPTW1
lbnE0e9UCl2og0tF76bhg3FCeBlS+ibMcK3feLIFZCDbG54SljJBwMFmjfmsZeCo
7mFXQUkNoXEuSn4ZEfgMfL3PqkZlQXOnD2j5w9DDt7Km3drmNisluGIW9j1lc+iX
5zW6+iFUeWxK61Yr7l4t/5N2qDGFZg==
=Ymq3
-----END PGP SIGNATURE-----

--+XtFgitKkEtWbdIF--
