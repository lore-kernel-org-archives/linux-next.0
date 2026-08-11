Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32104519A2;
	Tue, 11 Aug 2026 17:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786467756; cv=none; b=M4n8nhr06UeTlVobtIkFIWQRsoVS45T9uvK8J1O3v65jQsNEUD7hZAygDwL37FyFQvGa5ILz/4VMRmFpddInbNmZKUIeCGAzUOXoGFFCkIAbJNsgZNo2SSAdJ69zL644NQVHDpW+DCNlbhgPe4hQJooC13QNb4AgD4fr9ctoF6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786467756; c=relaxed/simple;
	bh=EkC6DlMaLWqbfYRNRqxoiUEVFLnvTbEz2gcuAtXJZzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A/iateePk2IkvtghbWArB+8UDmu5Kf/HW/GzsLvZQs/46E31pUTAbKcPFEJTfI6LkSrYKOjH/XTsmXBUwbd2wtsO6TvGPEpbjJ6RQfXBGss+ttDlfTvaUSPoTeGmVnkORQQCTvgB7hL2mLd0Arahyvpk27R0aZ23CQ0WNf+OPJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Be985GjU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Be985GjU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AE281F000E9;
	Tue, 11 Aug 2026 17:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786467755;
	bh=S8LrRBOTWnsAN4Z+6WstUlY5qQAkDBcpTGYcjqhknD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Be985GjUFiC8yQ1nhUZ6x6iW0ZjnW9Mc34kICTBwqvB0gZ7VyKQ3Lfs8vYm7tmmEU
	 ttcssRN1/t1e0DQp5KUKwOzQjD3iE+2fKBcRz1O7SWFDsNhcQmgRSpMwnHwqGY3E1z
	 Zno5XLygUa7kaKB0cFUlLI2meqMm/OUqWb4jC127tJjhYQdOh20CIEuTLkBkSNZ1ts
	 5uMoLPOq2rLkMfqaP9eNa9WnrXcDYyq87JmHvH6xuyd04joDXTfOXPp9XXnWI7BjCX
	 7yDAP+ENY1dzscTxoCPjgiBt7j0gNxZn9tUqXCr2y2J6roSZR5Ooyx4lYSe0/izfSw
	 k88NnWmUTyCNw==
Date: Tue, 11 Aug 2026 18:02:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Carlos Llamas <cmllamas@google.com>
Cc: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>,
	Alice Ryhl <aliceryhl@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Subject: Re: linux-next: manual merge of the char-misc tree with the rust tree
Message-ID: <d59a2bca-883d-4e0b-8880-e2a887a411f8@sirena.org.uk>
References: <ans8lsGbkro4pO6N@sirena.org.uk>
 <antMNVcZNPw4ojxI@google.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HcChSQEllQ889xVH"
Content-Disposition: inline
In-Reply-To: <antMNVcZNPw4ojxI@google.com>
X-Cookie: Take me drunk, I'm home again!


--HcChSQEllQ889xVH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 04:22:13PM +0000, Carlos Llamas wrote:
> On Tue, Aug 11, 2026 at 04:15:34PM +0100, Mark Brown wrote:

> > Today's linux-next merge of the char-misc tree got a conflict in:
> >=20
> >   rust/uapi/uapi_helper.h

=2E..

> > from the rust tree and commit:

> >   f14e0c8183bc7 ("rust_binder: report netlink transactions")

> I don't think this commit touches the file mentioned below. Maybe the
> conflict was in rust/uapi/uapi_helper.h with the header includes?

Yes, sorry, forgot to update the diff before sending.

--HcChSQEllQ889xVH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp7VaYACgkQJNaLcl1U
h9BjRwf/egrSviSQDl5fYHrXXP40uO70MEwNrWrb/MypuRhTZbpwgj/oavB+ciNc
oxMHZrf+74ck6Xui0E+I4j2pXL736PXbFtPzSg4DMtDGj9SVSeVrfF87yD97QWi4
qRtPCkgUA7f7HlcNFGUZ7PZyl0I7PK6h8mPtwfkT+XvFO3OP+mNtseVEEr3FtUiC
5a1QOVmgy1HyI/j6gqR40Kjb55I84bNpm9qs5Tq++7N/QInbHN8He/ieZVK4hMQL
ZR+0IAiEKhM7ZJOHBzJvIMuAbJ7yRKet+lVWzXwQwitF+avOXzxXuBfIcUii8WEa
mGAg3tsNE2L7ZRsEvBspcjO3AjLNOw==
=nX9d
-----END PGP SIGNATURE-----

--HcChSQEllQ889xVH--
