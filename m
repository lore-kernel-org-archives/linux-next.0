Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A313D3D01;
	Mon, 30 Mar 2026 13:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774876657; cv=none; b=s5+lf69ea7I9PsUr/qMD+e2DKw8Soi7Px4skAX5OZZ03qp6d6o9HPoz+5Bqtq3PRiKLnLOlHV9rpciLESCwWl/QFhre8EG+OmgnkzlLDAySfuFHodG1+Z//09fL45IkjElQGzWzkszKlXGZ/spOvemZpPTyI7U7OLLdI+pC2diw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774876657; c=relaxed/simple;
	bh=ssTsDtldSiXIb6ZLl7sQm6b8jCHSfqGCOIPdB24ZHjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=toEgp97m66YM4URrB6uRBVFgtYfLQl5BAqLNOXZAVTL9JUtsbzmAdObtbiIDC7BUXFrnhTUCZY0SdVxNT4OAufZTyaqj4AXjVxjxlIfhzfCdExfnvBdXrvhcmtq3cvu4yjOCOvbxCE1ikRHxPQPlTleh2aderHS8Jf5ps+1Smig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OB3lY35v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OB3lY35v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96324C4CEF7;
	Mon, 30 Mar 2026 13:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774876656;
	bh=ssTsDtldSiXIb6ZLl7sQm6b8jCHSfqGCOIPdB24ZHjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OB3lY35vI3UbyXsDmQ3lVGQILsrzz675WiP3r15ASTAnqLGU8XkJIq/VYopjJnWAx
	 JfStXcn5roIWQRCGp3ZXEB6UJds8U/dYg8cB0Sqrt8ha9lYEwtEntYXz0y23QM4y2C
	 yZGr38FDpAK7cIG14RHdE0YZZvTjrDGCWlHLPhNnlnn/8INXhQ4G7YrJWwMBGNXhKh
	 FuU2uF1+Q3OvsJhQWPfLhwU6tDzuf6/dZNDY+yO93ht07e+x8Rx8AVH4iZEVX17JMK
	 itta32afzeAD8QJ2fjOoFkH9BUNh3ITX06+49sjddG4uj5Nz7HJqO2M/lBlvvUd5ZV
	 En+Ov4W4SBCkw==
Date: Mon, 30 Mar 2026 14:17:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <bdfb46ce-1585-4c42-af55-a2202aa4ee9c@sirena.org.uk>
References: <acPV19IY3Gna6Ira@sirena.org.uk>
 <20260326-gefeiert-beschaffen-edf852a3aa71@brauner>
 <acbDBxR6tgO6WzCB@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NFhym8FIINf7fnmo"
Content-Disposition: inline
In-Reply-To: <acbDBxR6tgO6WzCB@sirena.co.uk>
X-Cookie: HUGH BEAUMONT died in 1982!!


--NFhym8FIINf7fnmo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 05:48:55PM +0000, Mark Brown wrote:
> On Thu, Mar 26, 2026 at 02:36:50PM +0100, Christian Brauner wrote:
> > On Wed, Mar 25, 2026 at 12:32:23PM +0000, Mark Brown wrote:
>=20
> > > In file included from listns_efault_test.c:23:
> > > ../pidfd/pidfd.h:229:19: error: static declaration of 'wait_for_pid' =
follows non-static declaration
> > >   229 | static inline int wait_for_pid(pid_t pid)
> > >       |                   ^~~~~~~~~~~~
>=20
> > > I am continuing to use the tree from next-20260312.
>=20
> > This should be fixed now. Sorry.
>=20
> I'm still seeing this today.  I have:
>=20
> 84f524dca4b8bc9e9aca8ea1dbbd2aa3a239d998 Merge branch 'namespaces-7.1.mis=
c' into vfs.all
>=20
> as the vfs-brauner tree, I'm not seeing any new patches to the test case
> there.

Still seeing this today.

--NFhym8FIINf7fnmo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnKd+wACgkQJNaLcl1U
h9A4IQf9FCy+TdMxLjzecYdmkTbVmnsX65Mkc3HnffIoHkhklTWyaDJz/tEYVrhr
B0LsgIN0/gbXoC5TlqWx5zAmoxjb/rXruy6p7WFwahNx8lNo7/HCFqT1coLtN7E0
wQY38DLVxCTCuOBHBIdhFUVgp+e6ZqxJfpNxwrt4Uonhy142+sCjfLcoVzq3X0S5
GFMcPwlPwryqkoV3I1GAxXvzYXjGgPKAAbOW/rzenFJVGIeO9BD2buvH4JirgVh1
FPLcnov/6IGJzPm6syQW9d9xLINPe6wLydZqW7YgrPeLQUcmBfYKYoOKKV3y34Qt
WHXH6FMYvIMzM4hFqFx0xAdBmfC5MQ==
=9fW8
-----END PGP SIGNATURE-----

--NFhym8FIINf7fnmo--
