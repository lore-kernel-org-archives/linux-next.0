Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF24A422E1C;
	Thu, 16 Jul 2026 13:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784207033; cv=none; b=CuzjdpXvU8UYRCqFQNDHthQeuWMGkCbNU2VYcyt/LOVe46yua6WxhuBk9m737GOkKe8Ew5wd4t+jaSL9yT8tyPR2z2I//ZXIruh2/Ukya5ceeeOTZiYay1NTBglwADI/xB6MYzR4DJA5SuDGanqycOGS0A8Yk22Gl8KM2Zp/iVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784207033; c=relaxed/simple;
	bh=wIq1B69s9t+ykERRfXGHYSkcDk2XUsW+vjz9isEOQ9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d3q8XfT4xOvOY+Mg/aJ4TT2I4RMp9TIZbmSyEg7nO8kDpZ3PJ6nUtbshrXcWCF3wEeLB4UfKKR7I1lKEcM1Cybi/H4jvSNbvppEfE0t153wf4qG483cRna2rgmpjT+CDVBPJ24ZWMZ4N3EWLwDo8JaQOGxAB6MFkLQRaceuz1IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fLaUXiaz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fLaUXiaz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A922F1F00A3A;
	Thu, 16 Jul 2026 13:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784207032;
	bh=DC5B3Uyi5MUpFz+7Zbij5XCEQEbOJF8hS2wD1PV9i7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fLaUXiazvolMTIaItgib3JVoULKZoO+WRl2lwKhvkoecwpnTXfHi8DgdJ14oTjaPG
	 10iQp3LFk91z2qNXZIIwkztuMoZ9VpQOjUqC3LHTsO1Qb5H4gRAAoJmC4O7QrpvpgY
	 +FfZUuKSzag1c6dqzB6NhJTF4roJFKxk18ICoeHr/rZu/R9g4RRpPxB7ULmJgr0NsQ
	 x650infG/eI2f03K3CLdP+VdZi3PFHyAe9tyPoT7TIAlg4vOP06kFvyHkFrxxgDQYQ
	 95r2MJNlqduLTLUYe8UPBRKi+g6nmz47DLk65qZV2coIRtNCM3alzg7p+HPzcWoT1a
	 9z+yYkIk7P28w==
Date: Thu, 16 Jul 2026 14:03:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the scsi-mkp tree with the origin
 tree
Message-ID: <c3a949bf-4d78-402b-b474-db92f0613c6f@sirena.org.uk>
References: <alUAlBfA42zAOZ3c@sirena.org.uk>
 <alirExca4fzB-fr8@monoceros>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NGCtaSzg0xytAqbK"
Content-Disposition: inline
In-Reply-To: <alirExca4fzB-fr8@monoceros>
X-Cookie: The more the merrier.


--NGCtaSzg0xytAqbK
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2026 at 12:13:59PM +0200, Uwe Kleine-K=F6nig wrote:

> So the fixup is applied to the merge of the scsi tree and not the
> scsi-mkp tree. The latter wasn't pulled into next-20260715 at all. Given
> that e73ba3d6ed03b isn't in next, the fixup shouldn't be there either.

> Looking at merge.log I see merging scsi-mkp is tried, the fixup is
> applied, yielding 0fd66dadace89 and then `git reset --hard HEAD^`
> follows throwing away that commit to replace it by
> next-20260714/scsi-mkp which is already included and thus the
> patches/device-id-zorro fixup is applied to the wrong commit.

Right, the fixups don't differentiate between versions of the tree and
the fact that scsi-mkp is broken and never had a version that was merged
this cycle means that the tooling gets confused about the fixup.  We
need the fixup to try the build on the off chance that there's a fix,
but then it's not needed if the fix failed and since it's not dependent
on any context added by the merge it doesn't get skipped.

> Having said that e73ba3d6ed03b is still in
> https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
> without the patch preparing drivers/ata/pata_buddha.c for that change
> and thus resulting in a build failure on m68k.

It's also got an arm64 allyesconfig build failure which is what's
keeping it out of -next, the submitter of the offending patch asked for
their patches to be dropped but I've seen no response from Martin.

Hopefully at some point the various build failures will be addressed and
this will all get sorted.

--NGCtaSzg0xytAqbK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpY1rQACgkQJNaLcl1U
h9DM2Af/Q0jMVXf1l7U4arfX3Q7/sIPeMU3C6COFcRFuBC/T6RkOsCqEoCIJMo9Z
F0+iTTKvJr9KnTSewb1Mf4X4cUMpAwSlyRv5C7uzUJL6Dl8kJNoPKPLLP+UlrjFU
bLsoNvsa5JxNlz/xTxNOfPJE5JXZHDzQOthwzq/xfIOr5nEMfVmqYM7fHgDVQ18X
QY9JSjCJHrW8kb7JbD0Q7Wym/huRRfkMnrBQoECbn+KiQx7nYCY6pBdkI3aD8TFP
Ow1i+ZLoY6htadpE5vy3Krshq0ptmE3JfEgFlzjGTJtADJjSokKCRu+bhDJZ6/mY
d2e6UUVOcj2N5G2MDNvgngJqREdxxQ==
=6h6w
-----END PGP SIGNATURE-----

--NGCtaSzg0xytAqbK--
