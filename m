Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228E331E106;
	Tue, 26 May 2026 21:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779830166; cv=none; b=c4zw4sTiC8i9LjmB0TV7W4YsRI9cqxk4xJcn7WVEjfvO2HhQzw4fLkCXEsUe0RN18WQNnnhCGrc7bL8QoYLq6iigIb3CryJwAkpPxwkoFnXVBtK2zFLbXD0vwNMFvZdEly9RI2MVBUnGNNopL2i6urYXIf6DpmCoOroiFclqrMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779830166; c=relaxed/simple;
	bh=WLmUvCV7gkj+o9L8i6KcBU7UCnGDzqEtk10BjNaRqw0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pTGiTrgRoTdevecAsRRRufTAfSeA4TMpbp96KZMbCZQBJGcBBWX/wNc/EJ1d3xQ3IhefJL2cGBe1wk2e5Sk1aZGs1kn+yyopSqFGZ4zJR2PmjvvoxhJm40vf6fELHt8TVFQNhSFhjfgl3/u2p9TORyPerTwNQUs+8D8Z3TtsVzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d7WjJ1Cq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d7WjJ1Cq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC35F1F000E9;
	Tue, 26 May 2026 21:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779830164;
	bh=hh9iL3V76uCN1cXs73L+lc9EDKueT8tTKefR3/6sl2A=;
	h=Date:From:To:Cc:Subject;
	b=d7WjJ1CqbMxSbe2rd6JYo/aCTAEr7EWLY7u7S2ZyX07Rv4MAEcKxIKD7c/Yy1wjmL
	 MuQfkzw/fFb5w9CG6A8n+LDl6YJvC/lGdQYTbv42GIqMkshlIOg5y3TAqTm1dwhR5L
	 JtnH6zjTN6+iybQJ4JtbuNPDTXglcj9+D+DlWY4PY5hDS5a4BmCmo4CeHKrHwAelPU
	 0EF0bvnD55shU0ir5Ui+0mmIFC710crGOoyDZ2CJkLxIdzKdyiY5e6Y77UMEXQYa71
	 7ej3njmiHFDT8fBsL3xCkT/d3gsRKZnZfrfDjVzl9jI0Hh0Y1iibMbeL4wPcckdzqg
	 St/xVM8CGGbcw==
Date: Tue, 26 May 2026 22:16:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the bluetooth tree
Message-ID: <ahYNkRsSvi8IGb2M@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="udMWgjXCLs4yAMFj"
Content-Disposition: inline


--udMWgjXCLs4yAMFj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  3149687089e0e ("Bluetooth: l2cap: clear chan->ident on ECRED reconfiguration success")

is missing a Signed-off-by from its committer

--udMWgjXCLs4yAMFj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoWDZAACgkQJNaLcl1U
h9BRlwf/S1sZ1r/w8zv7bKiZj9OddjO1AJc4C6Jhrr+ENCg3vO7CA4wRXxC9LD5n
fvjtihX+b8HkDrMIN9ACvmYCfMipstpZq8LS1bVmjU6TI47/mcaMWXXmAHAwom4V
DOKDRfetIeM3Me6A+vF62dbr+FUqpe9WeZOTeNOS12nqrDktFbfsm1tuvhVKbOt6
kCTp9lU7TwiWuOxc74nAqD0IbNKSsEsKWO5TVozlQqvTj9UFIOxzsztwnjTnfz11
mq5+MWEVZ7XGI/HNTFjs7MfaT/i1l4BQXc1iaXPKON18r6zXEvN1stheVs+eT+M/
RJe3bA0PiY297j3UDCoivDv3tdv/og==
=Evrm
-----END PGP SIGNATURE-----

--udMWgjXCLs4yAMFj--
