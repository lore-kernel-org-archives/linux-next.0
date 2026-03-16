Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D4140DFAD;
	Mon, 16 Mar 2026 17:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773682713; cv=none; b=EnncuHU7InspgHbhGFl0GFksznJgjia03W+9/JGZLUg9qTuFkcC/NbHqlfQDQvxqdcTaZXZwZTFG7lGKW9V3pFzFaitYAfaKB2zQX6N/EfyHhdU+F4p5T3zHR3/ZPWVhgx7/APJwTIeRj01nGaXSxT9ZpqKRfYDcR/c7BvAcsHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773682713; c=relaxed/simple;
	bh=BLZOBv73kxuJSJpitvdtyxRGtQdDugV31VX0Z51bQ/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gpwebLjX4KMecs5wV9SnWTM0VD2s/NhcVsVaiJkmwHAzU3xj5HbLU2IFo1b7vmWko3WpPeEuJ90an0oIsAC3E7d1UtatPNL2aoL8TwiO+E59B66rhhDkdZxOqar2JUIa70hHqvfUILem4U542jEuvk4sW6QebKrwjcqr/Cukn7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mgD7mjqw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mgD7mjqw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B311C19421;
	Mon, 16 Mar 2026 17:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773682712;
	bh=BLZOBv73kxuJSJpitvdtyxRGtQdDugV31VX0Z51bQ/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mgD7mjqw2/AVnhs1axxNQfwCmqOlu7UaUew1y0i3FipPr0uwrxNUFLJkgPL/b230C
	 PgKoIUBS9FK+kVChPceh7b2vnZ7tFzaS05Ee1w5TVF9bNXVNrVWYRouZNbrOcu/RXC
	 dXQ0tionCBpkXxmKqnscynRBDm9y76xVaKMm60jceJnyjjdX7TyZpQpdyr9WM7OL9j
	 WCi5PndmSK8zXjnUEgj13/jfnx0eALVFX8GZmuk5Qh7zGZEtddhdCao5ECQZ+JchJB
	 LN1hZPJz9HKKEyQe5+sV3SQTIfDRlrBwd4Uu5EuyFRVTBF33sfr1b/u0EbPO9ol0c5
	 C3PDGtNXlHKRQ==
Date: Mon, 16 Mar 2026 17:38:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	"Souza, Jose" <jose.souza@intel.com>,
	"linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-xe tree
Message-ID: <0f8cfe1e-f444-49fa-b7c8-151cfa7c606c@sirena.org.uk>
References: <abFpM1FHgzgARB88@sirena.org.uk>
 <ae413dfe2aa2d18c0b4c44d4bdb15bb630db177d.camel@intel.com>
 <abGv-5kXSCtOTO8M@intel.com>
 <8ec7f38d87fd49a4c81a228b87b1ad244c9b9df8.camel@intel.com>
 <abHMaBe4Wo_PH4uR@intel.com>
 <7df1c2dd-1e62-4cc6-9fb8-9f4ac160077f@intel.com>
 <690dbd675c4b704844decd077a424de68099dee5@intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6LRU4truMa4ZD6bQ"
Content-Disposition: inline
In-Reply-To: <690dbd675c4b704844decd077a424de68099dee5@intel.com>
X-Cookie: Do you like "TENDER VITTLES"?


--6LRU4truMa4ZD6bQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 13, 2026 at 03:57:12PM +0200, Jani Nikula wrote:
> On Thu, 12 Mar 2026, Lionel Landwerlin <lionel.g.landwerlin@intel.com> wrote:
> > Is there no process to deal with kind of merge issues quickly?

> For us the main part of the process is: If the patch doesn't build after
> applying, talk to the maintainers to get the merges and backmerges going
> *before* pushing, *not* after.

> Similar to linux-next, drm-tip is the early signal there's a
> conflict. If you develop on top of drm-tip, you'll find out about the
> conflicts when applying to the individual branches.

> I'll try to get a drm-intel-next pull request going today, or Monday at
> the latest. Lots of changelog to write. Then it's drm-intel-next ->
> drm-next -> drm-xe-next merges/backmerges that need to happen.

Any news on this?  We now have issues with the main drm tree interacting
with drm-intel due to this change.

--6LRU4truMa4ZD6bQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm4QBMACgkQJNaLcl1U
h9Ategf9F6n/m1El7la3qfqI6IX4ljBorXU7s4uJ5leMMya5kUIinbdLfkNhcxy5
9Elqsf5QfsF3ik3OkL29Il8UxfchNISEKkFdI23w9LxaBz9s8LFmCu1IFfGRLvw+
5r7jCiLhen6YWb829SszL2VecVmbNSwRknJywErNcyF2EEbHoQHL5uLqLXqw1wCQ
2OCM7TubyQe2picZRNn9fPy0SHgTUarJOwegq6Gcu8i40kWFrMD479QeFjyVX67X
GjJuEzcDRfGuQBbEp1RvO4OOuoK5P7oFkT72dndu/EIV+VmYYUp0jBX/A6948O28
GFTmbYE9SNuJgKbM5cCORXubZEqZqQ==
=SvHg
-----END PGP SIGNATURE-----

--6LRU4truMa4ZD6bQ--
