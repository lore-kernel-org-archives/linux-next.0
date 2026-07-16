Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA99423794;
	Thu, 16 Jul 2026 13:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784208053; cv=none; b=dyau7+758b/VI059P7dk6lejjG6MEC/piFSlHoBkeLg2LXTszf/8K6cJpUOsTzNQBb1GHEV1L2eQqrn06OuiK9h6LiCNCDQOEq6SwPAKUfiGOQ0SD3ygtiiAtBgoTWbrrxbzdwEkFMkz8mSEBYzznehu0bGUQcp77dUqKfShIsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784208053; c=relaxed/simple;
	bh=8/T05Ai8QlCQi76UixBrC4mv4BdrvNjM5HS2NWmJHy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uqZjQiIF+r1HcUJ02pyXeaGQybjHoKzeYyEPUlbu1k+DAcLo1cMSeYODLcP1QBTMiVG1OQdxATjU4mVozkD5SxEwAgQR+xHVXtOIjXeDiTdIXokAulAwO1M/G4vSc0r0/vHXU4YILBjAyqaQ6kVDnDfXcu+4vemXsdFARj/OqfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ILR0y0xd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ILR0y0xd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 865F01F000E9;
	Thu, 16 Jul 2026 13:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784208050;
	bh=Ke4+yKuHFzx0C9zTD4gAvTcva6BFehzFRzCFbB9L61o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ILR0y0xdbMmHQ95IPwpyOzi4pn7O8X35vsUlt59sgFP6/c15MQqF/nsx+yvF8/4rA
	 oSIGsd25UjTxpNox0enIFbYnrxrosYpDx3MdrQ7pBgWNAHWyzWPiwhckIJNa8rKmhz
	 qHv6bfssDRSet8yxIGlCIGrNVaLPlO2gyRGB5vzK0EGzerqgeK/PfAh3GRsiKxj3fu
	 Kp1P1EYcD3qz2FG+6TRXlEDLWHooWlIrbVX98FQnXtXkH+wbd2sfUaMkrxlXINFyJ+
	 PrBN+1+oTbNQOnchl9gcSpLhFje/cV5pmglFhoQslO2SAPlAqqkybs89ahUkrxP6RL
	 ZK06l181GHKWQ==
Date: Thu, 16 Jul 2026 14:20:46 +0100
From: Mark Brown <broonie@kernel.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the scsi-mkp tree with the origin
 tree
Message-ID: <d44f2a18-9ed4-434a-9013-1cb2d7d84add@sirena.org.uk>
References: <alUAlBfA42zAOZ3c@sirena.org.uk>
 <alirExca4fzB-fr8@monoceros>
 <c3a949bf-4d78-402b-b474-db92f0613c6f@sirena.org.uk>
 <yq15x2f84ki.fsf@ca-mkp.ca.oracle.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="udP/t7NWrbR3Z3ei"
Content-Disposition: inline
In-Reply-To: <yq15x2f84ki.fsf@ca-mkp.ca.oracle.com>
X-Cookie: The more the merrier.


--udP/t7NWrbR3Z3ei
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2026 at 09:09:14AM -0400, Martin K. Petersen wrote:

> > It's also got an arm64 allyesconfig build failure which is what's
> > keeping it out of -next, the submitter of the offending patch asked for
> > their patches to be dropped but I've seen no response from Martin.

> I've been traveling for a couple of days. Will resolve this later today.

Ah, excellent - thanks!  That will also resolve the issue with the fixup
=66rom Uwe so we should be good.

--udP/t7NWrbR3Z3ei
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpY2q4ACgkQJNaLcl1U
h9DqPAf/SMwUSP/Pz0Qjc2vFyejlX3GkGkoa14ds8n45RWR6DQ50ftIy4/lfZqlI
vjlE3N6RP2T+81Ier3GJ1dwCEAT7NPecjlG3Uwd/fkHJSxkO2Ob19O3xILyQ/3V5
r3MgwSHXbNaS5Pm+j3DuJNpCQVRcrCVSEfFs72eMxLCROinfSe+b9loF7iZ63jzz
Hx3FODTa63VXqBewGDj7Fkg3MpfK+uWY5uUF/dlyw1670oiP9ITq20gx1vACZvRW
NFzHUI6JQHkceFn6gKx4b2triIEjylp1P2SJ/5fka8PCDKuAc6zVPQtu577qGhn7
+z1qxTvEZrJd7BWJDdvWcAjVXxMNcA==
=+9Y1
-----END PGP SIGNATURE-----

--udP/t7NWrbR3Z3ei--
