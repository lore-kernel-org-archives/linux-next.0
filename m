Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879722D2382;
	Mon,  6 Apr 2026 16:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775492598; cv=none; b=T8TuOl7VwrfwuNut3xYN++TbdmxI9wIjf1KoQ/OxB9BM19GGrQSBA79Dm5ugFl0aKR21Ui2tnp7ih7z2n/uO4RnDSyAOSpS4dBGBIoeVYokw6PMFbb/h76uhGWHJ4M6qVOmsujaU0bovz7Q37DDEgU8dF+cbnYFYCEBWwKebQEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775492598; c=relaxed/simple;
	bh=4MG5XO2RhGYuxOTgguWn0YNhTt/ljXpME+E8GLHB+zM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m/cUDinSCS8M6E0pwxJ3HUS1nKPIk4vY0lGm4cxJu5kxCHBBH3CmFqzi2zSxFKoG3VCC35uCaqpiBjk/cefa0CeVl8XT/jZ1xu2MC73LvAJJ7fuGHIZ88CaskKY7hJ7XS7iz7JKeC/8s3DGKCxoxfCaxkJ3lOGF1WR0swDx5iks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AD6+HK89; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AD6+HK89"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E02FC4CEF7;
	Mon,  6 Apr 2026 16:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775492598;
	bh=4MG5XO2RhGYuxOTgguWn0YNhTt/ljXpME+E8GLHB+zM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AD6+HK89FUfPnLorU7d0YyKbU+6491TWtjKGU/iAS6d5K5n9uRzei7ilEyD0BlsfD
	 S+5nHZqCX+wDnuShFquWsGGME9iqH8qpeazdg+V/24KQxHnT/0WbaCvb+9l2AdZoJd
	 uUpfSi72QRZl0VYdMBR9Y/lcVTLYIAmlEdc+CFztj6bZJc+QG70EZJpsNG9o7NPN/E
	 /u1ZQP+rBgFuWZXPFHlND7GjpACKONUOyxFpQ97g6B4OloaJVZ86G+8fz/3JUgRfMx
	 8ibmfwlRlkbRvOJiQ4BC5413wU+1JLUVQUdR7i+hzfRmZnZ4eNVIvSg2FK87x89EsL
	 g3gAX8G3VYJBA==
Date: Mon, 6 Apr 2026 17:23:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the hid tree
Message-ID: <782cb718-33dd-47c3-b5a4-d95440c2d09b@sirena.org.uk>
References: <ab096wLbcpu0M-GF@sirena.org.uk>
 <fa4b8b25-8b34-4314-a7f3-ea7143ed9247@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="79ln5PD0sycMxYGI"
Content-Disposition: inline
In-Reply-To: <fa4b8b25-8b34-4314-a7f3-ea7143ed9247@sirena.org.uk>
X-Cookie: One FISHWICH coming up!!


--79ln5PD0sycMxYGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 11:12:37PM +0100, Mark Brown wrote:
> On Fri, Mar 20, 2026 at 12:30:35PM +0000, Mark Brown wrote:
> > Commit
> >=20
> >   142068281f513 ("HID: input: use __free(kfree) to clean up temporary b=
uffers")
> >=20
> > is missing a Signed-off-by from its committer
>=20
> This issue is still present today.

And today.

--79ln5PD0sycMxYGI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnT3fEACgkQJNaLcl1U
h9AP1wf/eoZajMy+vht8mwYEpN58B2/vt5VRER0NQ0jp+I7+vETgGAYaOE2PI5ZD
7PyaLn+aBwlvlNZyoSZk7XDC2fdMvXr/17SEn4c5C13kWBsIu8zYQjWmVfjpgv0V
S0AlQ93yL6JK/fMH9Cmgi+I8CeZmUGUvRxTTxttqlfrJDRJ8nSFbYtEMKjzU5JPu
q6BWXmAAetI4e2yD0KmFUJr8WeAW26QJCgn5LP8p/RsuP1LmEYgFMgMuXYqi+dtZ
P0JrcGEr8wK8jW7Y5OkNMNeC1BFGvAeBrEtjt68fgSSJ1Dlb35ge6TLxLbtBKli2
1tY4geZ9CNZMwrICAtB24qQJhQg4XA==
=937V
-----END PGP SIGNATURE-----

--79ln5PD0sycMxYGI--
