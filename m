Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED603C1418;
	Mon,  1 Jun 2026 18:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780337684; cv=none; b=c7Kin1BpKPTQm9XWH4WMuxwyCRzhIe+yoD57s3gbyLgF+uIprP0d3Qkw/808veq+bM57pTSu5S5zNr7jHzJx5ftM4D5R8iONeh/ygbtbW85CRy4U+qIL44a233XFpcaz7CCqkBuSDsGJa1uYxLf65YhTw2K/AFuJpxVp3C2HEAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780337684; c=relaxed/simple;
	bh=W5UIQXs6/eY6x44KBqxTry2KB0r0q2Wu5TqZA96Gu2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CY8pQmMtoKEy/XwnycShE6+sUGQBtUcwvXl+IARS5SUm1PJUA4wsDrWmEjEWB0jYe3DfKQe/WSWDggk82dr+KZaY5klbOWCcTN/wCHb/VJkpAmd79R445D7lC5DTFtl8JoO+OvdY/1v1VMV8OSZb7bslxd+tJfy7H5if7ezFTeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AuM5G70c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AuM5G70c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 049B51F00898;
	Mon,  1 Jun 2026 18:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780337683;
	bh=F9rCcKMx9qPPdeL5cP6UDKRaEQ+9OpZjzEmOli6iFUM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AuM5G70c2qJGZBLO3heSjL14viELfzsitlp3OC+cxAhAomq4rA4tjicveDVuV5sXy
	 3lr4zAHOrUmk8OEseRZwvYTCNhSngxGCi981E94xg81jSdjge9qf8hh4mGxV+sdP5p
	 4CYQMaz63hWOPi8y76pnFSX7mmuBRuTfuo+nXbLHVLebe5sZjVu7hTfvUXCK62XWq/
	 C13NIiE9c6pbT2i3yc7psyvFLMJbW75NCu2HvJeBxNQUqQDd90d9vN4o3y+85YdKNw
	 1J4S/QhilSJTgqJJPIPUEnJV9BsXI2v7eyCFcwpWyFUgT9QIOtuPtiEVwAEBPbCcC8
	 c0LhMiMZF6sZQ==
Date: Mon, 1 Jun 2026 19:14:39 +0100
From: Mark Brown <broonie@kernel.org>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Subject: Re: Missing signoff in the edac tree
Message-ID: <daedb22c-da5e-4949-8990-eaedba0c2725@sirena.org.uk>
References: <ahoL3l2gWBBS_e0_@sirena.org.uk>
 <SJ1PR11MB6083ECFA7AEBFC7D8EE11D59FC162@SJ1PR11MB6083.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bachZM7sIpE++COp"
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB6083ECFA7AEBFC7D8EE11D59FC162@SJ1PR11MB6083.namprd11.prod.outlook.com>
X-Cookie: Filmed before a live audience.


--bachZM7sIpE++COp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 29, 2026 at 10:07:35PM +0000, Luck, Tony wrote:
> > Commit

> >  3b48fd01d94cd ("EDAC: Consistently define pci_device_ids using named initializers")

> > is missing a Signed-off-by from its committer

> Boris pointed this out to me earlier today.  Updated that commit (top one in edac-drivers branch)

> New SHA1:

> 78d86a71de6e ("EDAC: Consistently define pci_device_ids using named initializers")

I'm still seeing the old merge in the history (8b3604b9e3eb47df), the
new one is there too.  Probably fine but that's up to Linus.

--bachZM7sIpE++COp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmodzA4ACgkQJNaLcl1U
h9B86wf9FmgfLLn7Q2DyzxeUfzHgk2JmlTT6OsiADRsIcoideGpM5ah+Ui4U2UaL
Ptcz5bI8y1lDYkLSMmDRoPlcRPxryu6x7LhZ+Xnp7ygY6tjNgGRH8zQBkdT5Yy6x
GXDon/hxIV/OgJq/bNJkpv8BlHoBKKZqB02InSoDFyuc8rqgUoFMqizAuF0+ok10
4H7YGfmMTvpE3HscqoQSvrHjSP5A8ir5HSafT53wRqmGoPy7LqGorJzwk1aGIRgK
Z3lPMDx917JajIZEa1WRQ7kl9t1QyZ87fFbg51YXXyB1ZULTdcmRXxfG2RjaJm9L
CluR1qo5Vl5QuhbHHzu6Ryk5uSZ2pw==
=8Ftk
-----END PGP SIGNATURE-----

--bachZM7sIpE++COp--
