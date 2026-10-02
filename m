Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECEC480DD4
	for <linux-next@vger.kernel.org>; Fri,  2 Oct 2026 10:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790938313; cv=none; b=gbDq3Cmjq1qsY+pObX6Z/gXXYtVzgk8CnZtdD9RXxFNpsWRdktcIjZ54MZ7ENGEMHE6K10Iq+3KCLgQxc1dIW3ePEuR5HNJzC7sF3TwCqIgqkSbdbjbb0UjeWngcxPKTXi3dY+Y78javvrhFpBEi+QUHs2K6PeJ9NOk2oiDzDaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790938313; c=relaxed/simple;
	bh=IdiDV2teKyKvxBT9lfil7LD2I+AMLYDHV69XskaWBvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CilZ0bwL4A1YUw2g35q3t2efXV8zR1rkr+oWkrA3BYplmuuCIl0AeY0QoihWvuZxTo5Tvdgk8wJCUfE8t8J4GdjDvcCfMSIusKZ9kMPB/opi9X67l7xrkhs/OchdfxfwPv3aQ3WHU8DsROLAuOb0whhVfsWTYLOEi25cooTfeLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F6411F000FF;
	Fri,  2 Oct 2026 10:51:50 +0000 (UTC)
Date: Fri, 2 Oct 2026 11:51:47 +0100
From: Mark Brown <broonie@debian.org>
To: Breno Leitao <leitao@debian.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-next@vger.kernel.org
Subject: Re: [PATCH] merge_msg: Gather the email addresses for the
 conflicting tree
Message-ID: <d3292265-67f5-4103-8f46-a1b8359a7348@sirena.org.uk>
References: <20261001204935.635681-1-broonie@kernel.org>
 <ar-HExtECa8SRtMc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ePRisk3aeB1/G93c"
Content-Disposition: inline
In-Reply-To: <ar-HExtECa8SRtMc@gmail.com>
X-Cookie: Expedience is the best teacher.


--ePRisk3aeB1/G93c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 02, 2026 at 03:28:24AM -0700, Breno Leitao wrote:
> On Thu, Oct 01, 2026 at 09:49:35PM +0100, Mark Brown wrote:
> > +# Rely on the sending MUA to dedupe
> > +for b in "${hb[@]}"; do
> > +	if [ "${b}" = "origin" ]; done

> I am confused about this 'done' here. Shouldn't it be 'then' ?

Yes, it should be a then - that was a last minute fixup before sending
that I obviously garbled.

--ePRisk3aeB1/G93c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq/jMIACgkQJNaLcl1U
h9AjJAf/bPyWJ37rb4XWWW/+ZBYFezBiX4w1/tCjr/2MHqms5FPPkk/rwCjXwCQl
f3Kdq3rTbc2tOtkfELuDWTAEIltq5YBriQNUqMCMbhbwMdCt/205XfCQJ+6KZdUv
WGX6rYTVgxzIOpuASIiLFKhhTs7/m0rWGmNxCr4dK1NvpAFvefct7gPVlYX4Fn4x
2IXLd5mAp1EwAnfBNzX8KMfUqjkfIqlUDCrM+qgmpjI5kZIAC/kYXnyrlQwzEUjk
ifdtaK1CnLpGBBUJWTAtUbKij8t4bdjqI2YIZGaT6s+mV8PYcF+JabIv6Nk2oPfQ
lJOM8y9KpBQMAN+QW9uvk9Cf5BGiKA==
=t59k
-----END PGP SIGNATURE-----

--ePRisk3aeB1/G93c--
