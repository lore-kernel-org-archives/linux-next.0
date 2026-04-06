Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B454351C13;
	Mon,  6 Apr 2026 16:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775492494; cv=none; b=Td7FxPhk21W35fxRzd/QiukD51j37j2skUwFE++8CODOizp3oLsBybwUq/NyEZNuTalf7blxIuWjeFxISbycbsqnT1pFEh06aw8pib1+In6rniluNcMFL8LFKLlL7hl/Lr6jh1UvI27FfT7QPGvqlmzWZsTKd1qZjCS88Syr4zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775492494; c=relaxed/simple;
	bh=o2m2Zg8RjvNqM2KJ0XIBG9IPHvPxQsxFARbTO9/6ywg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SVX8EXLzOXB2h3PwCZ1RtDxJfRe2/b4RrrzxfBZcGjvQeuwFvMKpN58OoQUiiwG+uCTTL560jaAQZy6zmqD+heCGQnIpFeifleieVfESZ27KXq9i6Pf2MZDTFw8WmRJU0OW7ZAXCT1ZKjgzw8nAMtKG1fX9VcJtIzusLiwGLeqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rR3Z+abb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rR3Z+abb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB09DC4CEF7;
	Mon,  6 Apr 2026 16:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775492493;
	bh=o2m2Zg8RjvNqM2KJ0XIBG9IPHvPxQsxFARbTO9/6ywg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rR3Z+abbMmqBPga4PQzbRXoFAFpwPuCpUsIWjdw1TuKJCN8ZUrcPf9Fk4u4yWCeMi
	 pjn87MItTAlsK4r+NsFcpCGa0e0zJc7qnAOW0J7zPp7FHm2rNoivQ4U9XainBCPtrP
	 K25nsI6M5J/RJK+uEAiqSlVtO5tPxAs+fRDpEgEDLUv/sSZRbCE0gGAwJZvHu74nHF
	 lKxPuANPUoOWsxVWqawpcUfjIlShpLS00A9DeSR1htIaUTM50VKz3ElyIEqrnrCMsE
	 V1QbW4pBLWQ7XwN5m3V/+zvIbqJGOe/89HjZ9v1P3/KG5Oc9MgRrytxt8y/uvI2V0A
	 lHZv8Aw7GioDg==
Date: Mon, 6 Apr 2026 17:21:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the vfs-brauner-fixes tree
Message-ID: <9af71475-ec7b-4267-97dd-a35a1c56238e@sirena.org.uk>
References: <ac5NL-ClYJZWAGJO@sirena.org.uk>
 <20260402-festrede-bussard-dd3e564414cb@brauner>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="17rzFB5+immilgnE"
Content-Disposition: inline
In-Reply-To: <20260402-festrede-bussard-dd3e564414cb@brauner>
X-Cookie: One FISHWICH coming up!!


--17rzFB5+immilgnE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 02, 2026 at 09:45:46PM +0200, Christian Brauner wrote:
> On Thu, Apr 02, 2026 at 12:04:15PM +0100, Mark Brown wrote:
> > Commit
> >=20
> >   fa430096c7100 ("eventpoll: defer struct eventpoll free to RCU grace p=
eriod")
> >=20
> > is missing a Signed-off-by from its committer

> Fixed, thank you!

Did this get pushed out?

--17rzFB5+immilgnE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnT3YkACgkQJNaLcl1U
h9BGkQf/RfW1Lf/1Jxq+rT/xCh+YYpWOhBPbZ0WpZuuNo05OaTHX7QzmbAv9f4cH
Uljfcx2BP/ZoDAm/iEkV3nibAO5VOGoqqesGl+0272oXdtPApcWZCDn4Rf4h2c6A
Ds6GTYMYfA4+bYgQdZzZgZqxlkP6bN4tTbk5PEnHsp30NsUTzPAKpE/fbRGMd+gu
/dIXTOg7Dj73k3UNwqIMdVz7YAYz9+nRTTWTf0O+hhlbRho33BPxQ5TkaoqsGKCD
uzsOsF8Exp7ZN9y/iuU2GW6w4/2dtvte/JP9iRnJF9AJWfePzWVw5G0AvpIgyjdt
rhBfOX/Sn0aYVTtx73vw5uPxc1mIoA==
=Dosi
-----END PGP SIGNATURE-----

--17rzFB5+immilgnE--
