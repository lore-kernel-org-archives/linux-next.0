Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F7238F932
	for <linux-next@vger.kernel.org>; Mon, 16 Mar 2026 12:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773665812; cv=none; b=LNVpuYakvfZcyXHoIddCr9DfWNEL9Uw/PcD5rYZLOhWf7Rz8NNES/XTQtkL8GYjM6mIDvTQtaPuHVpww/eq66eELgY5GfdpZRUzTWA+G5ZO6vuRFZSr2l4LIgFi61B6Xt85WXrxFgHf47bQIvnHL8S3a9tTpiZcpQIKtlM1cqfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773665812; c=relaxed/simple;
	bh=NYLV1a5Abv4MXq+yg8ePcsdYCzLWxHz3JmVAr3AAlrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eKL1m7o2pRKcyvNPbjA2uUpfwdV7EtioXW2Y+k7/K8ZFDTkKrJvgdM/CTIPMC1OBOt3cjwb3OsvpkgmHlnjVis+rbs0O1Wm/5DMp4/JZ21z2+9y9YBULOmHA0yWUXl5hEuFvvh9qnINpkoAcA8vTpROivK3AqVDMhMEVvK/upb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bctn5RZk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bctn5RZk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10645C19421;
	Mon, 16 Mar 2026 12:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773665811;
	bh=NYLV1a5Abv4MXq+yg8ePcsdYCzLWxHz3JmVAr3AAlrU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bctn5RZkLjMxL5DMq7ZSRG9XMohaXfuNG64Y7AwRC2naQT8ZFJ1LPbJtHieG4QnRF
	 KIA2omeP+gHhae+TYeP0D5bu4vTZXfYhN15u1rQxy76McCwtb+FKGRup4PDf8XSH/1
	 ZYOas+S7YUL4pot2EyiuDSdqrlUoDbcMnTzmj9xrBLMF/2XXbCOy7VVJR51Y2tk/lj
	 E4PpnV48NFKpFRarSHdcb1P7YHmnp+uztL6APBkAKDDAo7Ef5gTT1XntEG1iWYxrN5
	 YpbpR4X8iyOV7hS7X0mQsQPGdLA0qx+puEDaG4hBnkfd6oUKGwisqTFZyTlxqOxVKd
	 k2Ir9wZe4fYJA==
Date: Mon, 16 Mar 2026 12:56:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>
Cc: linux-next@vger.kernel.org
Subject: Re: linux-next inclusion request for DRBD
Message-ID: <425ab0e1-d160-493b-8a0e-f395540452fb@sirena.org.uk>
References: <0b11c582-ef6d-4998-94fb-3ff606903481@linbit.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vT+J72wS31K/C5wt"
Content-Disposition: inline
In-Reply-To: <0b11c582-ef6d-4998-94fb-3ff606903481@linbit.com>
X-Cookie: Not a flying toy.


--vT+J72wS31K/C5wt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 15, 2026 at 10:28:38PM +0100, Christoph B=F6hmwalder wrote:

> we are currently in the process of getting version 9 of the DRBD driver
> upstream. As this is rather complex and requires some large changes, we
> would like to have the tree added to linux-next first. The tree is
> available at:

> https://github.com/LINBIT/linux-drbd drbd-next

> We will keep this branch updated during the next few release cycles
> until the patches actually land.

> Please add the DRBD maintainers as contacts.
> M:	Philipp Reisner <philipp.reisner@linbit.com>
> M:	Lars Ellenberg <lars.ellenberg@linbit.com>
> M:	Christoph B=F6hmwalder <christoph.boehmwalder@linbit.com>

I've added this, it should appear from today all being well.

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

--vT+J72wS31K/C5wt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm3/g8ACgkQJNaLcl1U
h9BOWgf/SLWTfxOyyU7zRib4GxVV2XV1QEnYtkVbPYlyEuv9P660kId71QIkvXMS
AGu/VqZkEFhp7MRmSiCSFZZb1Eu81KB1tIui15QpVycJidEwB2WIpiiroEPzLGuq
X+L/heJHnkC48IF/evqTD4JhikD+jGF2s+1P/py4aH3LutfQNSQpSl86tacSnHza
ygE764yWWOp4SscMU4H/STmsVV2r0Q0cfYNONvpJNqgdaPj9Bxzofn2QEtCHMmFj
TcQM5KvEakKXLviVzTUADsQjGiS2BQVL2x6jJo1oUguE06ZsaW0X1sfxJ1XK4QID
viPnrIIHeq3atXhBFJGeImk1apUqAA==
=q3CP
-----END PGP SIGNATURE-----

--vT+J72wS31K/C5wt--
