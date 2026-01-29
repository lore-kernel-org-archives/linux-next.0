Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E52387343;
	Thu, 29 Jan 2026 11:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769686010; cv=none; b=KHjO9O5QuNSCxkdoMynw4Q6BesMs6KjpctXbbZ4ch96X8AeMttzFl6t4daLYAYxkSeSHvyH+BWBjR4sh1Pxzhr2IE1ZzHal0vITJyLbMz9WF0iBcKVw8ewisQRQBFxjaljujF9MNFqxMzqChqK51SlUSAXM2vFOvh4H6d5wqno0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769686010; c=relaxed/simple;
	bh=g1WaKhx9mulq4XwrhgZsG6DmTyTR2Pb0D8ipHQCBdQc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uXSKfnaV5zipci4jyswoma9zCz0u+yGaNLabLLOKBsDKCPZr/YX+mBPJj1iRcXVxmhZKBiE5fg0bD48WHQunf+Ax81e7ECgPZJO1dcU2zorcq/Q3/i2RDtcP3ztBJXjQ3ogMDUnXozMDBIDSVyWhxdY2CKsWrstUYqYzJLcm+Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k3loC7nw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k3loC7nw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FE68C116D0;
	Thu, 29 Jan 2026 11:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769686010;
	bh=g1WaKhx9mulq4XwrhgZsG6DmTyTR2Pb0D8ipHQCBdQc=;
	h=Date:From:To:Cc:Subject:From;
	b=k3loC7nwNfMVhBzdlpALf9nkYJahCalJlHhpV57n9u9OPImAPcHdRjCHDwtrN1V6B
	 3xP5BX+w5LCUdY8zs4gbQT+o8QU4bRY/QIXo2jZFNGTzkWQh+cUs6bgZoGlk7p8t0v
	 P+Yczy/dS9wJBykxoRpaIrgJ1Kk2XubRqA3yrf2q+wYZuocEaWJEwJc/wfwH2qTt1t
	 oejYyo1EJhuQQ/JkgqFM8kGVGwnx5ZCzGoG3XjfMlr0IZZtmu8Xinz7T2O6ugz3JQm
	 9sSstjJ2bqbloau1wmiWviuCsBh1dxTaPs2cbmD9sSuFv/tJKByYhIRMEPdYomGxbC
	 IqQYPN3f80maw==
Date: Thu, 29 Jan 2026 11:26:46 +0000
From: Mark Brown <broonie@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the vhost tree
Message-ID: <aXtD9lwdROdWhyt6@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2LWeL45BwxmpH+ZM"
Content-Disposition: inline


--2LWeL45BwxmpH+ZM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  295f63d502b62 ("nvdimm: virtio_pmem: serialize flush requests")

is missing a Signed-off-by from its committer

--2LWeL45BwxmpH+ZM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml7Q/UACgkQJNaLcl1U
h9BI1gf+IerPWRfTrry4w/8O4OJ9y/UlasLP93VPrnWOXrdX5NALTCt+8k+emT05
pljgcQB8xqn0GwtEIkaD4fQoUlYQXlG9UecM7jPoLjjBwLaJuZMxJEy82/nGQS+G
OBE8lRRLFFEkIcSHuby15vH4VeTxAtydp3vBjMrZxisS4XEnA6gSUgbfO/Gnx8oC
B0Er2MIM/t4IAI4dnM1diORTsz3A9TturpPY2gHJW3MFJT3uawRanO9Pd8UsBbLk
2TS8Z+koZv3D0i15qa9QyzPailIKtoxviFcrpLOz5DtEcA/kjWAJrcSDaRBxcibY
PIFCBuERML+9Ngsj3B6OkPqeXqzUCQ==
=KMPi
-----END PGP SIGNATURE-----

--2LWeL45BwxmpH+ZM--
