Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC43410D15;
	Wed, 25 Mar 2026 17:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774461310; cv=none; b=Y0FsJ71dmrwcAvvMCC6EB7F3Dp3kivqOcjaGJS1lR68Bf7PJnkI4d/KXd70EPOHTwYfrIb4ldcud0tDLwZTf6aqtyzA4B2mjEYIKS8/cmN3KDR5Rfb66k2yZ22NiLhM8S2YWTl4U6zgcidygWiblt7KymK1KJLtMnE4bm9DoNrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774461310; c=relaxed/simple;
	bh=5ngSF6vOlQKFSHrZgI7+1RnVHbhW0d+z28I6V9Hfq+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gqlXCn8jlt4V3H/xMye9QlMNSCyk2RI8d8Xk8C/L3usF5HviubdpjStXXw6B57fAWoHW0zaGcD4hHVAO4xa356wojZTT+r6FJpM9hBzgTtmpLwj5Dikl70uPgHoIYjf4v+DMTYMmsA8sL+UGbHxDqiIbbLjEOwYETM7HW90PPwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fiuSyQXb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fiuSyQXb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93EDBC2BCB1;
	Wed, 25 Mar 2026 17:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774461310;
	bh=5ngSF6vOlQKFSHrZgI7+1RnVHbhW0d+z28I6V9Hfq+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fiuSyQXbdwZe6KPwlPii4qJz2hjeYGrt6ci9L/qLYcUEbjjh7cx18BJu8MLD5OiA+
	 /ycQUULkqxY7kzotUvwFv5DEJNtHE5tGiKM+dfho/AZsmPPylhgiGGpzsCDGTfXEok
	 DP8O9eZpbt3HoOH6+wXGRX84iEIqpBWpmotV5LAw6ePuistJnFtUN4X1TIEwhOwYqe
	 UWTnRmdByeAEi+LxXjUO3sTnDMFpODh4vgLB9dghYKg6SvsHrZ0HqmPxBzRO4mL44v
	 ODLy6KekooFNswOVWfREG1Tq3daElKR58PmMZNNriZr7LPvzP2ZbLXzCYYvl865FEk
	 WzXd9PumRvyEw==
Date: Wed, 25 Mar 2026 17:55:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>
Cc: Jens Axboe <axboe@kernel.dk>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the block tree with the drbd tree
Message-ID: <0839b4f3-1acd-4c85-abf0-65dcc8647e69@sirena.org.uk>
References: <acQCDMhGqwhzLuzt@sirena.org.uk>
 <c9512d9a-e654-41ae-9d61-9e3af53f815e@linbit.com>
 <899e0337-9642-4ca6-9050-aeab14fa22ef@kernel.dk>
 <9e8b388d-ca6d-4e78-bbb8-3b6cdd731777@linbit.com>
 <be3cce14-c069-4325-b093-12dd26892119@sirena.org.uk>
 <ea26bf6b-ad04-4d7e-9f6a-bdbbc8acf594@linbit.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lUyzxImJEUfqjzXw"
Content-Disposition: inline
In-Reply-To: <ea26bf6b-ad04-4d7e-9f6a-bdbbc8acf594@linbit.com>
X-Cookie: -- I have seen the FUN --


--lUyzxImJEUfqjzXw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 06:33:09PM +0100, Christoph B=F6hmwalder wrote:
> Am 25.03.26 um 17:57 schrieb Mark Brown:

> > So I should just drop the drbd tree entirely from tomorrow?

> I guess that would actually be the easiest path then, yes.

OK, I'll do that.

> Sorry for the churn on your side.

No problem.

--lUyzxImJEUfqjzXw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnEIXgACgkQJNaLcl1U
h9DnfQf7B9l3/smCxn8sOSTOEoklPW4TceqYOAyvZ9HKJLQUCz340v6vArOG5e/s
H1Vfx/obaLNBjVnhoiyuuyZ2Ihb8mOaRBwyh2tHruEtyskCwHMUvz/XQ83LMqNsE
5XK5HFDOyNdIrsMG/zwjKigK5oNV8A0w8skPefe6LSkxyM8PBmNLFKlizXBcAmCj
Q86ZlYQhodLpivSFJByWXr22+YouWoH8bEZTEYKd/aXKGtmOwq1yNf6qw129srsj
3prgatjjLnZTsKpArFa05wE4RTn84mkU7EgbJ/gjsWZvDUkVp1io30gGo1jAeYzv
R/Xajki7G3t/naSbZbv7OtDIY47TGA==
=kZQr
-----END PGP SIGNATURE-----

--lUyzxImJEUfqjzXw--
