Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795875450;
	b=ikKJLvbZ1qXDn0n1fgrTlgUKVlkvxTboDAirpTXL3qRAU+Ookpan8YWe3RZpfEPOhDmF
	 FkG7s78PCgdbJDr1M9dBPE4Khuk++8p2CQya5xxvnmQ4xkx0A3TzI0MnEE9Yys4bikRqh
	 ZzbZhSQUGcoI1GAUNhE+PzD01Yl+scq8/t2vvugnSdl8Ft2Q+H8u3bMhCfYbAJZIBA/Iy
	 RcjCKu68Zu6+sl/8HaE4787FbEYpXCZe54nJPIlAly071FUYAgEKR5njq+ZiQuxSAUvtL
	 pec0242iyKdZ7skVZko1v05wdJr/KFdaZ1O8YBgz9RQEInQcHeslSVbFexW4hoHyRrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795875450;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=2ilhmvCAVbp/eUrqzVbl3GUCjgPoYhCWQ1J7BbOXpiw=;
	b=JIWzAmUZygCKUDjcMwubYwKCBnrKpzO/abD8b7knRlEzSp2hiPeYEPUv3hRNJpEogqL4
	 nVb1zJYaCyuPL6QGanAptSwcgQ7k47XT0MX2KpYh1/yKDXP15vSIhkAK0nGfP9xuqstVs
	 SRazuUdOgFWlE+AhTM1KIHXKXhNmMzojTmPUtJWvjYIGB5h9S++ezwoLkquePiMBLnYcN
	 9BAnJHii96F75VPf5gIq0xzw+Q8GD3NXzgZ1Dd5k2uJdvKANAB0gNySFrmdHaioU8o638
	 MLs89qInrXYAg9uOfGHm2QyonUgmPWBKYiC7jDEIDPjLNy86ev8RAwxxgG6PBdgKc0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Z6/KP+IL";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18ABC606A324
	for <linux-next@vger.kernel.org>; Sat, 28 Nov 2026 14:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z6/KP+IL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AB811F000C1;
	Sat, 28 Nov 2026 14:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795875449;
	bh=2ilhmvCAVbp/eUrqzVbl3GUCjgPoYhCWQ1J7BbOXpiw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z6/KP+ILYSlsxoesOa6nrdnK/oLz4fEDZV1hg1k1frccuXB/RW+vMQMomBjiqACRL
	 h4K2yxfqtavLQvdk0vLa2uj1i0t4iToBHMXJBobTP/inruHZqwQ9OY93wXU+GK7OXT
	 DnIXGyELEzoRmkR4SCnPhMjwzofaLTNAgYSQyJACb4LOGZGVBVxbMbCzZxVkD6M6aL
	 lszpGUEc3RXrOdrRVyek10cQVN6CdGf7Q3MKG5J01MwrHa54xD1/vxEgxwvB/gIAxT
	 Ric4sc3Eos1FkVDgOtIxyH1pg0ScRLw6tnhI5M/lJSn4qxFUNi9rJOD+4D4DkFk22L
	 kuygJwZa5XdJQ==
Date: Sat, 28 Nov 2026 14:17:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-next@vger.kernel.org, Alexey Kardashevskiy <aik@amd.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Subject: Re: Please add tsm to linux-next
Message-ID: <e384bf61-6efe-41e5-aaea-7d0842e26017@sirena.org.uk>
References: <20261127172316.GP114472@nvidia.com>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LJ3q5nDWcSLwl7/X"
Content-Disposition: inline
In-Reply-To: <20261127172316.GP114472@nvidia.com>
X-Cookie: I'm a Lisp variable -- bind me!


--LJ3q5nDWcSLwl7/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2026 at 01:23:16PM -0400, Jason Gunthorpe wrote:
> Hi Mark,
>=20
> Can you add the two git branchs for the TSM tree from:
>=20
> TRUSTED EXECUTION ENVIRONMENT SECURITY MANAGER (TSM)
> T:      git git://git.kernel.org/pub/scm/linux/kernel/git/tsm/linux.git
>=20
> This would replace the tree that DanW had under
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/devsec/tsm.git/
>=20
> The two branches to pull are for-rc and for-next

Done, they should appear from Monday.  The existing trees have an
extensive list of contacts, I've added you so that's now:

Jason Gunthorpe <jgg@nvidia.com>, <sathyanarayanan.kuppuswamy@linux.intel.c=
om>, <yilun.xu@intel.com>, <sameo@rivosinc.com>, <aik@amd.com>, <suzuki.pou=
lose@arm.com>, <steven.price@arm.com>, <lukas@wunner.de>

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--LJ3q5nDWcSLwl7/X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsK4nEACgkQJNaLcl1U
h9B+bgf/dykxuBaROGvzP7P7+akfZWSnNswAgqdLPhq0ml6eJGHga3gic2R1PHk7
Wn78SrhuZTAz0M8mevnJUm2K9gPWmzvP1bltT8I0UBwSsPd7P9eq6ORZ/yGNF7GE
zrJPXm0J93NcTrt9/tAS33Z0/9MzRwEr+fJbVlPAXYfLSe1m1NIfkvtTiieRVuX+
tv0qFEPZd1sbYM4wP73HpmPnovGpTzxx7UjHFQ1rIJE1b7z6elPBD3CNKZ/cmZXG
j+Y885EOaxCHfAwJ+kg1tyU59IWQYpH3aEad/scZpeXwha/YX4vVcgkrjmgcdwd8
sGNv0jc8UVMoji+NusRLaAtt+veEaA==
=/w6n
-----END PGP SIGNATURE-----

--LJ3q5nDWcSLwl7/X--
