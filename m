Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270E6410D39;
	Mon,  9 Mar 2026 19:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773085975; cv=none; b=M3VKNZ0AQlh8Que+Zy9KsKEeau6beUfiqkw6ILGidgaQVkgKA+qyMN8KkkhUDgbYbaEjje7KHyyJzSq674UB8MWNiDYAjk9Y51CmvFbx2OytrMcWZjDaZBt6TWgCAidL3NxR5YvZZ9xs/hL3uw+HwApQ5J61LD/sQBomxGPloD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773085975; c=relaxed/simple;
	bh=GVf5sOrlTZdPtTTlfa1C00VkXQ8wpoutSeVidUtHsGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GdV1J20QXqO5DnP8nLKXBJNOfgQsHuO7xTxq67mz2cJCOVQrWoDHbpKLf9aWg3EHh1E7WLWyhsCtUXyl3i6mQoLKsAKp/PtYW2KUpwkpun8CKlpGnj0XSMDBqtTq0FSlrxnUw6QAqq+1YUrKwCBxTC3wcdjbijsRR/VE6mbzOWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VC0iMzaP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VC0iMzaP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F4052C2BCAF;
	Mon,  9 Mar 2026 19:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773085974;
	bh=GVf5sOrlTZdPtTTlfa1C00VkXQ8wpoutSeVidUtHsGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VC0iMzaPMN9QAh4szURHHHkYM2Nsg8V+6Qlj1BLzXyXENSmS1JnWq/RNRbQLgBFKk
	 0YE2AIVDFpbxyVWkHvbgc1wm0m4RF+zzYs2JOBsqTjJH91XFjRGCTmCsH92A3v4kdO
	 JM+7nWfI0c/hxxfGwIRIdM/u8l49UuUlurBbwqNyZz+U4KDtjuF/+Rw7bl6mX+qicH
	 H0ElnEX1rWBq2bkVMA77+hNrFr4boPobPy8ngEp5W2Ar49vUV4pBGCOxMFcN4p0LsM
	 YBAmx9mFzExGVto4YuW+j5FMx3K6tI9YV9Qfe3emh7sXrRYZME10qUev03uDKUjYrw
	 RAvN5k27C/i7w==
Date: Mon, 9 Mar 2026 19:52:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Mar 9
Message-ID: <76203f3a-87d7-497c-a6aa-acd0aef036f7@sirena.org.uk>
References: <aa8WV_KvEV_TFPPZ@sirena.org.uk>
 <aa8kpRLIdvA98N-J@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z0beUxMklRrG4FyW"
Content-Disposition: inline
In-Reply-To: <aa8kpRLIdvA98N-J@black.igk.intel.com>
X-Cookie: Do not dry clean.


--z0beUxMklRrG4FyW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 09, 2026 at 08:51:01PM +0100, Andy Shevchenko wrote:
> On Mon, Mar 09, 2026 at 06:49:59PM +0000, Mark Brown wrote:
> > Hi all,
> >=20
> > Changes since 20260306:

> The 20260309 contains a file (some bug?) of more than 1GiB in size with i=
nteresting name:
> ": change inode->i_ino from unsigned long to u64" (without surrounding do=
uble quotes).

Yes, the scripting tripped over itself during a conflict resolution and
I didn't notice.  It'll be gone tomorrow.

--z0beUxMklRrG4FyW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmvJRIACgkQJNaLcl1U
h9DeYwf9Gv3ZJsI+/7LvCU3NSaQG69NrciqtVZcFZfSu1f3kiqoFaRfIoFvh45b/
MTdk9nQydQzAQDNVlNRYVemqZ0CC6uUu9UriQiDJ8KRqdunRRSdXFtRGVanIJnLC
kw+qv33sDy7amrH3Byf9txVQij1bAKxifvSiu4eTK3G+5B31oWtCv/EjODdruQ1V
+gtDEx/T0uykeJQ6jC6QuyfahYFVFkEHPQrn7Hvfc6JUXOucYpsno/exB1ZKQXsd
1tP880QdWHWDzFaW4zIUQ7zQ7BAwcHrDsuJPLiBETuYVPKKIvNJaaAXFQ9X4RPND
p/8Gfphpst2UrdZ1jRRDQeg4Ne5C7Q==
=FEIG
-----END PGP SIGNATURE-----

--z0beUxMklRrG4FyW--
