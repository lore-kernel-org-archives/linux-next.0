Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F2626B2D3;
	Wed, 11 Mar 2026 00:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773188185; cv=none; b=oq7tZnWCu8m2r9P3Z6tGkCH3z3YIL0+awj7HkR2S+QOMeLLnn7PJ03FBP7tXGjq9BFu/C1rqEEB9v3vEr9jJc4Y/cmt6LaoJGyzDtQMPSSUy5SuJLFbPz2X8vPuHiJxS4nhyUOqbgcqmkD1HjTAy/KpAEa8rPDdbG4+8ZBBqLI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773188185; c=relaxed/simple;
	bh=ioeGHlzBn/sdtF0nMT1dz8D5ahLO/TZm4JblJemkiW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fxCjlZO/hNhLWHCI5JQ6iwzORF/chOqkM/GL+y+xorY3El6Xsmy+hopEvmFgrRVzAc2hVaVBozmvIlLpyzqt+xnv5FLgrs2lVtA5GkLu3rHmQGzEw9tQMEk3hHJHYCHH+67KtDG10Iu4WjdLXYTNyqIvNSO1qco3gOAbbiSuI5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TA4rF/mU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TA4rF/mU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E6CCC19423;
	Wed, 11 Mar 2026 00:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773188185;
	bh=ioeGHlzBn/sdtF0nMT1dz8D5ahLO/TZm4JblJemkiW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TA4rF/mUkvpmg7QEupj4mX9AX1Oo0HXtAmr19M3nm8kBpbt0vNdWf0CycMjMrdh7D
	 FkKvq2mPWZv5P46OK94A4N9AFI0sEuA3R4g2tZAqvfSvE/ycV/WsIh37LyVI5pXuKr
	 liBnK8eYcrNAE9A9AdOqAp7mdCxyHGeZhU8UarPQcEgthKghPiUahgmy12n/axVDPc
	 W6aNCjTispWOlyhpXxpGfKiwt5Q5GrDHvnLJBVnaXT4e2bbddTucOpgWYsKDk1mI0n
	 8+0Sv4x/hRAipCI/w4hJtJAtUMYmtvOIIkXLvY7riM4nsLt08e26js8obkjPEb+YuK
	 +qYgx1KVRfdfg==
Date: Wed, 11 Mar 2026 00:16:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Drew Fustini <fustini@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: Add tenstorrent clk to linux-next
Message-ID: <aeac2a6e-4314-4564-a90f-f94463a12ab1@sirena.org.uk>
References: <abCmoGc4DiVE4KpK@x1>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u1wvihTHO4ShaDXp"
Content-Disposition: inline
In-Reply-To: <abCmoGc4DiVE4KpK@x1>
X-Cookie: A fool and his honey are soon parted.


--u1wvihTHO4ShaDXp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 10, 2026 at 04:17:52PM -0700, Drew Fustini wrote:

> I have setup clk branches in the Tenstorrent repo on kernel.org as we
> will now maintain drivers for the clock controllers in our new Atlantis
> SoC. Please add them to linux-next:

> tenstorrent-clk https://git.kernel.org/pub/scm/linux/kernel/git/tenstorrent/linux.git#tenstorrent-clk-for-next
> tenstorrent-clk-fixes https://git.kernel.org/pub/scm/linux/kernel/git/tenstorrent/linux.git#tenstorrent-clk-fixes

These will appear from tomorrow all being well.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

> Also, please update the existing tenstorrent-dt entries to use the
> kernel.org repo instead of github:

> tenstorrent-dt https://git.kernel.org/pub/scm/linux/kernel/git/tenstorrent/linux.git#tenstorrent-dt-for-next
> tenstorrent-dt-fixes https://git.kernel.org/pub/scm/linux/kernel/git/tenstorrent/linux.git#tenstorrent-dt-fixes

Done..

--u1wvihTHO4ShaDXp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmwtFQACgkQJNaLcl1U
h9DiDAf7BCPz/b2D/1XJYYW/ODH6jj9z9FAc5VOOR+BsH/7p6tRKWkMP3TXi67u6
ku9q4N0BPAf/qmIOh+ZlQPSaX23ehw+1+ljGFdmwCaqdvexgDhyACFR+FC2vW7O+
/RDD1optWzcePuLSG/UppaX7PK3Up5XOaTGbTs7OCebGYVvPtPGYkWtCN8noe4Iv
aPZworjgsFLyktzFLw+iquvKY8pJhe7iKr4iE5E87l2h2bQdHg+FH6SAP5xO4nNp
bEInZr4pyR0YrPZIPfh0hituvSfv+BIzWqQseKi9VyCEuWQ88kB52HLdwDz08/aP
KNRcPwByVyM756OfRes72ELona7hLA==
=1+x1
-----END PGP SIGNATURE-----

--u1wvihTHO4ShaDXp--
