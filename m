Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301693B8937;
	Wed, 25 Mar 2026 15:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774453265; cv=none; b=XuafP86elEvsXRBOi0VKkPLdZsyM7qwHgdXBFACBlbk4t9rFAavkMWVx+NnC4RVJqYzrctMC1Yr1vusvhX8QBwPVXRF55zprjS8w3Uz8TPL7TOS/lv9ZU2aof9Aw61SIWf0G1/9sshEvUc3b2r01ZyoSJi7D42ufl1Q1gwIKB5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774453265; c=relaxed/simple;
	bh=A6ab3pRvBalvgbFlRqbaE8xEnPPteSM0bnbNVDFsr2s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cgdhw8UHY8ouHU0z1ihcg0Vu25AhitdgRGoAedavYUY/qI1JihmB1g2jz9i4tJvvpte6oKrk88XsPp5AvwIRJ6H+KeECEUW7x0VB4u+Mbc8jf8W5oAhJDCDFBQU6PIcPM4nwyX2aDRtpslfGI/9xV23wiAgdzijpW1mOGjgwHlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pr6ukqIo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pr6ukqIo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B67F6C4CEF7;
	Wed, 25 Mar 2026 15:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774453265;
	bh=A6ab3pRvBalvgbFlRqbaE8xEnPPteSM0bnbNVDFsr2s=;
	h=Date:From:To:Cc:Subject:From;
	b=pr6ukqIoJfs/cxvgTbnBC3s5R6wRHDgadPB4AvD/12N3wAVbCWYF34aHpvuRI550I
	 1IcqaHsIlxCpySxFbkdp4QOuQvetZ3Gahqm0oMdr/U8T/iY/5an/js4S2m4V227maa
	 MWBJjV5TfEri6IRCQKt3lWoRO0Z9LZq7cfmjdKO0WaCe8ZNZDkkVexpQ2pJrzyvq/p
	 Lu9mDEohsPwuy5Hc+n3UGoS10RzYer36SHHVuERCuSD9o76NV8VRR2Z4OeeEvDlQmh
	 uNVHN9glSPSOPimoRdEE4Gg/q4C8JRLBCcIbLLReImhxAylBcMcIDVc6rgfZ41G0OA
	 4f306qMdCF6KA==
Date: Wed, 25 Mar 2026 15:41:00 +0000
From: Mark Brown <broonie@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the block tree with the drbd tree
Message-ID: <acQCDMhGqwhzLuzt@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YORGhTlP2PIJbNt6"
Content-Disposition: inline


--YORGhTlP2PIJbNt6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  drivers/block/drbd/drbd_nl.c

between commit:

  ffa847f8ff11d ("drbd: rework netlink interface for DRBD 9 multi-peer conf=
ig")

=66rom the drbd tree and commit:

  630bbba45cfd3 ("drbd: use genl pre_doit/post_doit")

=66rom the block tree.

These changes are both quite large and the conflicts substantial,
ffa847f8ff11d ("drbd: rework netlink interface for DRBD 9 multi-peer
config") in particular has a diffstat of:

 drivers/block/drbd/drbd_nl.c | 7260 ++++++++++++++++++++++++++++++--------=
----
 1 file changed, 5167 insertions(+), 2093 deletions(-)

which would be enormous even for a non-mechanical change, based on the
size and a glance over the changelog it seems clear to me that it should
be split up into a series of patches.  This would make resolving the
conflicts much more tractable as it would be clearer what each change is
trying to accomplish.

630bbba45cfd3 ("drbd: use genl pre_doit/post_doit") is much less of a
concern as while it's fairly large it is mostly mechanical.

Since I've got no confidence in my ability to do so rather than
resolving this I have marked the DRBD driver as BROKEN for today
(there's a half completed merge in the tree which shows how far I got)
and I will reorder the drbd tree after the block tree going forward
since it seems to feed into there.

--YORGhTlP2PIJbNt6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnEAgwACgkQJNaLcl1U
h9DWywf/UYIdQakbUAXOWXgaeVchXI8lUkp6h2hTsyFkkW7m/gN4RNgYcmzrsu4N
mUeoFJfEsT5hRD0N8uh2lECTIZ79lD9n37gZqDjdQ/2JN7DIqp1IIKWQnW1EUCyb
80Vac36qZUH4yeGrEEWQJU2J21hpd2TurAiWY98S6GbH1is9I7Oh+Glj3kFkiX2q
jAIixv5ayWqeBoWzecZVe47vXkI1UxQGNVN17hi8igGaJInrJhsGm7cyq2L7d5UI
Rd3u1H/AdIu3nL5pyvH+M+1hr4FqGmJUriznMAIntrkBamT4NmZoyiZpbT/PCynA
2wbiln+Z6niInzjEW0ggYg8hDPrGlA==
=sSTD
-----END PGP SIGNATURE-----

--YORGhTlP2PIJbNt6--
