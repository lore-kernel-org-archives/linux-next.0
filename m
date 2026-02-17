Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CE1372B59;
	Tue, 17 Feb 2026 18:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771354516; cv=none; b=H/piExjWnMs9H8tDzbegnp0e4/CyBd8kGs0R/HoEeclNc17NQsA/TGyvwABxwPD2wmfedrWE0VlmupD1kelDNYOGGUEbcI0pJbb0upSzzxoNylt9pgqESGeCIpZUpYomwfikp0QN2EDiFIufOcIZh9d0A2J6UTU0xrwEvG7MNyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771354516; c=relaxed/simple;
	bh=rxF8ls6p1qS/G9K0KWfMa/Hl1ggbJQgI6zzACmwfaKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pqg2Vs53kTIxOR2vcF/KKhv0yOb+kMd00Y/NpfixOJNLdvD23CeJsrazuX0fGdf6Cig/fqcM0pr3mF67eYSPfA2xeaf7DznWNMKDVuMiW0mFK6fPHwE6rGqjmpp5xtsorpdcRHyy82To7T0SBKFcAaKSHWyfF6rRXeMzjtc/pws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lBRVY33F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lBRVY33F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1091DC4CEF7;
	Tue, 17 Feb 2026 18:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771354515;
	bh=rxF8ls6p1qS/G9K0KWfMa/Hl1ggbJQgI6zzACmwfaKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lBRVY33FGacMFC0BbURDnkAhZfStho1Tp51U7TjlyRY83UCcLDxfz1xSpXSTDRG1z
	 RzawxaIzR0Qg31d90ZMH+u9p9fvOThkcJ2+hvG2+Ip1/5X6adWnjyW7rvPU6rgvYfd
	 OSAyMj5bMUicwiFF4PEwnqVNrMzGAkcawzapFPIwKDom9V90VM9ax5xxcq6CjyCF4R
	 HBySPatUbzvBXt2mSBFdzCDcOxS2BXDo+7DiCOgZAPhlpGc4FBZqi7qEIQaNYaENQL
	 lZvaP++nX332NiuPpoFpdb3laJDZo7rQI5HlPQuJoVgqwUyBHUzfGJIkoavioQFbIy
	 GBGZdloeTU8tQ==
Date: Tue, 17 Feb 2026 18:55:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Steven French <Steven.French@microsoft.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Stefan Metzmacher <metze@samba.org>
Subject: Re: [EXTERNAL] Re: -next status as at week one of the v7.0 merge
 window
Message-ID: <7c64a423-4f2a-4f96-8416-2f42b262e185@sirena.org.uk>
References: <56867107-7db2-4c93-b8f4-f732fc780c35@sirena.org.uk>
 <9fd209e1-e9f7-446c-98cc-e8f3aa17077b@kernel.org>
 <LV9PR21MB47574A2FC9B8D1D4986C45A8E46DA@LV9PR21MB4757.namprd21.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2bZlOLuTkGfqRyur"
Content-Disposition: inline
In-Reply-To: <LV9PR21MB47574A2FC9B8D1D4986C45A8E46DA@LV9PR21MB4757.namprd21.prod.outlook.com>
X-Cookie: I'm into SOFTWARE!


--2bZlOLuTkGfqRyur
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 17, 2026 at 06:12:38PM +0000, Steven French wrote:

> This large series has been in ksmbd-for-next for about a week but had
> been going through testing for longer, and most of the changes are
> fairly narrowly scoped to the new smbdirect (rdma) module and much are
> small incremental patches for the moving to common code for smbdirect
> (from server and client).  There are at least three devs independently
> running (xfstests etc) tests against it and test results have looked
> good so far.  Most of this smbdirect work is being driven by Metze so
> adding him to cc:

Given that we're in the merge window now you should really only be
putting things in -next that are bugfixes or are otherwise intended to
go in during the merge window, when the merge window opened it looks
like the tip of tree for ksmbd was 164cacd0ba38 ("smb: server: correct
value for smb_direct_max_fragmented_recv_size") which has already been
merged so this is all new stuff.  New development should ideally wait
until -rc1, if it's going to be sent in the merge window the expectation
is that it should have been visible for testing in -next prior to the
merge window opening.

Now I look again the counts got confused by one of the intermediate
branches not being properly handled, the actual counts should
(hopefully) be:

120 amdgpu
143 phy-next
146 ksmbd
255 perf
297 char-misc

or excluding things that were already in -next when the merge window
opened:

39 drm-xe
42 net
63 mmc
69 amdgpu
146 ksmbd

(mmc had a build issue that had kept it out of -next and got the pull
dropped).  Sorry about the noise with the counts earlier.

--2bZlOLuTkGfqRyur
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmUuY4ACgkQJNaLcl1U
h9AoRgf/eoD5uaU0Nf9nDEWppca+sZPKy1Ad2yJ5m5H67/FFKxNHiaVvGfpKN2ao
hWIOfC/vZTKppzEhRg3j8tyQrujT/znIc+iDO16sTkSFF7rYKdS3r+mq1zkKW3PI
HwE7yqVOAPobrtgOP8EArQUl+zw35A73uKWBJj2v550Bn1K2JClaAaju6H5KXazN
Z0CRMQRc+fq6zdt6VvqlSvV4l40okWg6SlqQCffLlcW1nXfv7xOnkAuQBG1ydFy2
YImAJ1MwzOU+quW7sk76D8pnNf5zZQFGwUPBfaBa0tNzMl1lANrMRjIQkc9xe1jB
JrV7lBqbQcKpbhEGk2Xn2DAV+r29VQ==
=31De
-----END PGP SIGNATURE-----

--2bZlOLuTkGfqRyur--
