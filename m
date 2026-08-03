Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AB740DB5B;
	Mon,  3 Aug 2026 17:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785777931; cv=none; b=eIlZbmwAx834wvkBe0MY6tXfNDfcwzBncYpIAJbbnbfyVLADvuSiGMA8rbkwy5Os61my9HVjgBEWQSjqqzfKite4NmA7uAknHCtKxVkL2uyJnCNp/dSkXqaIVUbOVIORye6leoK/k2oRhhboc7Ik7lXIKSMV98l2KPHwsnOiuCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785777931; c=relaxed/simple;
	bh=d5qTNiH1j00z+zHQ80LszKU6k+b7ML7fcVvm9vBjb8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B6E+Z0V1f9+Hvn2q5DVSIwyqJGFV6MLimoUOn6ZIAtj5Rn/bZtthYxxf9BjPSBiskTJLvuaZ7LkgqqVsLO7EWxDQj6RXNJVYMJx4vbOMWV9pYSbspqNNSUJ+GpTXmF7VE58GxNOivybFk6X6es38hXbGDM1aun1Q+KivNJV0KnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bbd42u7a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bbd42u7a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43D161F000E9;
	Mon,  3 Aug 2026 17:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785777930;
	bh=sU3H4UmFpmK2P3whf5PBKTIIUztml06lC7QKq8T5xVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bbd42u7agwP7ZKQKCNazzJhQTotY2ZiXjVoqTE9gGAvyPRAhPOFS5g9TkYgUFYqaK
	 341GsUnPO+qnyTMn0cs3G+QOWaMYA8MGftG5HSq+eg69jAhRY/CQIdk7220guDCJsY
	 3STQs33Aj+H8d8FoEB+efz5aKb/fpWHAJoP2gSERxmdlvIhTTvvNpxIcw9hbvbrBDo
	 +8xUyhtHutG6gcsUpcV6Twb8yuogCfDU0W/I2x/MDudMO5LDYzrYynD/L+aI8Z/6ig
	 RXMHjQJMZn+al3ITaoJn4rII6ltb76rd2dJ8qQmb3kOcAWYypO6tbq1oLdjkb4Cb3P
	 LJdlVm08oaayg==
Date: Mon, 3 Aug 2026 18:25:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>, Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the driver-core tree
Message-ID: <36b6f2b8-f5dd-4629-b3d8-17f1b884594c@sirena.org.uk>
References: <amZFO8eUhS9xhfCs@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9PaaEvVoGE34XCM6"
Content-Disposition: inline
In-Reply-To: <amZFO8eUhS9xhfCs@sirena.org.uk>
X-Cookie: We have DIFFERENT amounts of HAIR --


--9PaaEvVoGE34XCM6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 26, 2026 at 06:34:51PM +0100, Mark Brown wrote:
> Commits
>=20
>   4e63c0582e2ae ("base: Remove unused DMA_FENCE_TRACE Kconfig symbol")
>   45dfa004893df ("driver core: soc: Unregister bus on early device regist=
ration failure")
>   ba3dedcf3bd47 ("software node: Fix software_node_get_reference_args() w=
ith index -1")
>   c3a280ff728a9 ("debugfs: warn if file creation failed due to uninitiali=
zed debugfs")
>   06553566a841c ("kernfs: Replace strcpy(s, "../") with memcpy(s, "../", =
4)")
>   d996995a0ffb8 ("kernfs: simplify kernfs_name_hash()")
>   32e21e9509915 ("docs: ABI: sysfs-uevent: add missing bracket")
>   38f5745f49e44 ("arch_numa: remove redundant nodemask clears in numa_ini=
t()")
>   8cfe7ad274bb4 ("driver core: attribute_container: Unwind device_add() o=
n attr failure")
>   6e328b4a208f7 ("drivers: base: Remove statistics group if encryption gr=
oup not created")
>   c37ab60d55e34 ("device property: Refactor to use RAII approach")
>   1900692555826 ("device property: fix infinite loop in fwnode_for_each_c=
hild_node()")
>   10864921212fc ("driver core: avoid repeatedly printing the same 'Fixed =
dependency' log")
>=20
> are missing a Signed-off-by from their committers

This issue is still present today.

--9PaaEvVoGE34XCM6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpwzwYACgkQJNaLcl1U
h9BObggAg/EOFIq79LSBHinpRGlT2N3aLxA8rOdoiPsSJvNT4JyrzODhyF8qPp04
r5ABNHEhd3H+tZFFMg3dMC7D5oiZzShHax3qsfVKVey0S2ry79q2uWrqhKwB4dBh
OTaEZ7UqYsx58HfhoebvXqyfJf0knr5D3erJ3l6EJ7LdX7oe54c7VdPcAoE/LEFo
3AYD5dRFyNkK9Lx7V9O5qf46WPgcoljcuC973RFU9o2iXPsUshKNXezmYmNU7Ld3
RcQ9QW+w6KiQVscNHXdbVvwWJJ9SltS4uPbxCpol9it+l+hCqT/pzDj6L9z8ZT3p
DsOYlsSWdNWu1I2OkopNWf7D2XogaQ==
=UUgr
-----END PGP SIGNATURE-----

--9PaaEvVoGE34XCM6--
