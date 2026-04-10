Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF283C2782;
	Fri, 10 Apr 2026 13:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775828580; cv=none; b=JT//jevRwm/oh1jgOA+TBLHozLmqQ5lJKnZId/SxvWlOodWXY54S0I1JvEI5blYDmkpoJB397D0TYejN34LUagm0XupD6+vQMEG0sIFl6/8IvX9L6FJ1ULnbfB0cBPUSZcF9FEwPoTlBXqH3u0St4mGu1XLQ5pzDEx8cxvBOa+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775828580; c=relaxed/simple;
	bh=akoPEL6rJG1OuaY8oi8DpE4ZXqnfe5/Nd2o4x640aEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n5uFUDqzQcYuvEzpzJwNsqelpKsTIhY9i1HHQlD8WgVN+TRMPVk3CcPetsHJXaIhD6JbpQ00FLESQCyDUFJNbU2EgN4j+x6bMvHQPbwfQFFIL+S4wYQhUPloSzGjdATn8HCOFmwbH9xdQl/vOkmIOmnMoAk0xW4xYQ7OwGc4W6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F3Lt0+9T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F3Lt0+9T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DE0EC2BC87;
	Fri, 10 Apr 2026 13:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775828579;
	bh=akoPEL6rJG1OuaY8oi8DpE4ZXqnfe5/Nd2o4x640aEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F3Lt0+9Tt6wlwEvaasi6DOCWdBJ4UekkTUGuWddb7zjsr6seVo6ahk1todS6pxgBF
	 ADeOtgSO94N4R6Ys1aOAv0pe/fQ/0R4gOQaqcmNRLzSkEiWbBi9CmWbC2j3Ia1gtu3
	 yuD2UGvDPDja1CDzJpLrFP5B4wzd6fyB/3be1WXY0jPCh9P80TCx0ayY/xL7rpPKXR
	 Z38arth7EAkZNstTifBrUVqS7jqw6M/E+iXijtyg5XNIakMiMmZVIYmmfggZQqovyY
	 gbmtZ8guWQDy7mg3g5JREU7Z4uGJ/09xVo8YCl0ZvEE99dEBHhM6g1FErru9KJFdXV
	 TO2e0pqr6wH+Q==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 33F0F1AC58B5; Fri, 10 Apr 2026 14:42:57 +0100 (BST)
Date: Fri, 10 Apr 2026 14:42:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Linus Walleij <linusw@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Ulf Hansson <ulfh@kernel.org>
Subject: Re: linux-next: manual merge of the pinctrl tree with the mmc tree
Message-ID: <adj-YUqjWqfbr8Li@sirena.co.uk>
References: <adj61MnOca5D8-rA@sirena.co.uk>
 <adj7sSzHRAPGlVpT@sirena.co.uk>
 <CAPDyKFq_0+5gu3OEuvXSxnkVVxY4wKd6iHTFHMHJrXJaRkjfmQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H1wkKvEmjnGSP8Et"
Content-Disposition: inline
In-Reply-To: <CAPDyKFq_0+5gu3OEuvXSxnkVVxY4wKd6iHTFHMHJrXJaRkjfmQ@mail.gmail.com>
X-Cookie: You will be divorced within a year.


--H1wkKvEmjnGSP8Et
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 10, 2026 at 03:36:48PM +0200, Ulf Hansson wrote:
> On Fri, 10 Apr 2026 at 15:31, Mark Brown <broonie@kernel.org> wrote:

> > > Indeed since making it I see more failures due to devm_mux_control_get()
> > > not being exported, I have a hard time seeing how exactly
> > > devm_get_mux_control_from_np() is intended to work given that it ignores
> > > the np parameter and is just a straight rename/reprototype of that
> > > function.

> Linus, if possible, I suggest you drop the patch from your pinctrl tree.

> If it's urgent to get this into v7.1 for pinctrl, you may pull my
> immutable mux branch from my mmc tree and let the author of the patch
> base the mux change on that.

It turns out there's also a build failure resulting from another commit
in that series so I really think it needs a bit more time.

--H1wkKvEmjnGSP8Et
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnY/mAACgkQJNaLcl1U
h9AuNAf/V8yjXiDfuXWN0EjXpr7j2Tb2IsnbNOYzvMktMP+8MwV06cZ8J4lf7t9F
zxx25HtMyUcaab26L5N5l06LZDT3VwB0n52axRTFwJrf2/HbWJ4JFuD5D7ykNqM/
3tVRkBtjJATC3TAgspXNleaPQsdtKz95oUyQ6rHc+1VjuTbZwTo6e+kSGBg3In98
Q97hGCWFWeIWOzZD2/uaePuezXfi4jO3N6V2IJZjmEN1+KMJNXiPkwRangnRjvPe
+45E8R3TMzN4fp2piv6uYtlm9VYPSIQqLYFnZnj8njIIDsDRgoIsY6Rd93GApROT
YvER2vZGVEogBW5tr1Ub6oH0fpQ3fg==
=M8zt
-----END PGP SIGNATURE-----

--H1wkKvEmjnGSP8Et--
