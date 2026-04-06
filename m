Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462D138F62F;
	Mon,  6 Apr 2026 17:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775495163; cv=none; b=sE1xi1/RwNzVFusolwbAKuz9J4pNDad6Y8MquuroDiQtM0JAgRzAKI+NAgc5XOB7ifWpjNOYW0YWtT3sbPVFm7YxOia/zYuwIPvE8my1SuxoMB6QCiayV6fXM3Dv4t8FxeZRNgrgvY+IeNkjlukDCRZnif7ndsma8VpVyCqxwNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775495163; c=relaxed/simple;
	bh=O7TGyR11nhmJBXsCNKeRlrQTEhWru66mvSNab6SxSI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WQkZc5RHcAK0/9Sfi21pbcDElodi8YYksXOxLNFN2lQfFoOF8Z0NebIejdfs6zHxsGmg6lH9MOiA3+84ol6yIBy+KRGrOjWiR5B14y9lRQobsDeXRsggx36dC/Wj6zHbo10A1bhIZJjQpBHLkb5HgUWUTfth2JKLcZFk0KAFoHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oh/Y855+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oh/Y855+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC670C4CEF7;
	Mon,  6 Apr 2026 17:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775495162;
	bh=O7TGyR11nhmJBXsCNKeRlrQTEhWru66mvSNab6SxSI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oh/Y855+GMsiImIdLq52HHzHjwbMKTiSDWLrn+MFN3kifklQtScQnT+2VIUimy/1d
	 5whZtHhOncMswCxe97I+lPrphmWFp5iRYKq2qvoZ+kYweBNBNTrBAPxroWygAm3B5d
	 0Lthj0m501b/1Q2DfyJ0hRYcnpBfj2cSgsIGVUfGEDGJRT5GKgZ53WI1O5Zk1phMBT
	 bTPsKJwkN+W0oGHS8bK42hIvxTDLIBSUalm4pfLS7tcxANFR7REvhK0hW26lDUN5gQ
	 inHCRUAdFasU86PnILl+tb8YwRX5D+guTYt28UT/vDDwmo/DtbFXaNw9rD/CcB8Ude
	 QlnhNilR4Ezmw==
Date: Mon, 6 Apr 2026 18:05:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: -next status as at v7.0-rc6
Message-ID: <ef6aa13d-fb7a-4831-bca7-6c825f83cdd3@sirena.org.uk>
References: <c6bfc4bc-ba8b-4402-be9a-518091c91237@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yH7xGkiWX3ffryIZ"
Content-Disposition: inline
In-Reply-To: <c6bfc4bc-ba8b-4402-be9a-518091c91237@sirena.org.uk>
X-Cookie: Offer void where prohibited by law.


--yH7xGkiWX3ffryIZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

No trees are held at old versions

Trees with signoff problems:

  hid			(missing committer)
  rdma			(missing committer)
  rpmsg			(missing committer)
  vfs-brauner-fixes	(missing committer)

The hid and rdma ones are comaintainers rebasing things without adding
their own signoffs.

Non-merge commits relative to Linus' tree: 11181
 10381 files changed, 612553 insertions(+), 205276 deletions(-)

Top trees adding commits to -next:

  1732	drm
  1084	net-next
  948	arm-soc
  370	tip
  369	mm-stable
  348	char-misc
  251	v4l-dvb
  233	sound-asoc
  184	kvm-arm
  176	vfs-brauner

Thanks,
Mark

--yH7xGkiWX3ffryIZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnT5/YACgkQJNaLcl1U
h9ADpgf/Sc2ZdeA2nu36X6xze6Rt2vHWW6PHKeXkeYXAMI+lhJhNB0wVicPOjjky
vy/8OKVPMXipwXTEj2nRpiCsDVhS/89lcODrxEti0jibzWSFGqYoTNNu6VZ+fZEB
TmEuA9gQJ8rhtkm/G8SVboVvgV9ESFrVA+a1f1LNE5JmxRu/Rg1HRl9k1vkEe0ro
k2tPMPPtfmCOydTn41mRiW23SC3KVakzfVbxx+89dNHBj2+xDo1tN0i7zgQEtMPx
MqPU3LulSNDOxQihqsIxlC8XgaZKT4vPiwvWNKCIz364EErnirKJXmmjyFUbl6sX
EhjzuTcLvnqEuADHN1eCdXX989fwPg==
=lunn
-----END PGP SIGNATURE-----

--yH7xGkiWX3ffryIZ--
