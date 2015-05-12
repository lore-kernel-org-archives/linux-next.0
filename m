From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] spi: omap2-mcspi: Fix native cs with new set_cs
Date: Tue, 12 May 2015 20:17:58 +0100
Message-ID: <20150512191758.GX3066@sirena.org.uk>
References: <1431452337-19280-1-git-send-email-mwelling@ieee.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1RhGCd1AsoFHGRHc"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:34992 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753741AbbELTSK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 12 May 2015 15:18:10 -0400
Content-Disposition: inline
In-Reply-To: <1431452337-19280-1-git-send-email-mwelling@ieee.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Welling <mwelling@ieee.org>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org


--1RhGCd1AsoFHGRHc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 12, 2015 at 12:38:57PM -0500, Michael Welling wrote:
> GPIO chip select patch series appears to have broken the native chip select
> support. This patch pulls the manual native chip select toggling out of
> the transfer_one routine and adds a set_cs routine.

Applied, thanks

--1RhGCd1AsoFHGRHc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVUlHlAAoJECTWi3JdVIfQxnsH/3hFY7T+kyqnvQ/W2pTE6rcN
lpVGabF9BQgGT8I8yseWgKdF6msLHbMZJ9TWjhrEJ0EBYsSgCzUdDayGQEINiPe2
d2bkXr5qak5iDKYnXDYSwilSNTUzYGLR4OIDWY3g66SNNQSKXfzFf6xP+mp0hBPX
Plms1oSys392TRTQsR9YF9Rmns0IB8RrduLz+PLvDm1xiueW+lKiL1+6/vdHXBt9
woQ0CROrb+4oVk644E5bfb2uRyEXE0MVrD6f40B/wbBdo8RDG7/+3otBH0d31MHP
qLRzQAel+X3UAy/5A9dWqOF/8NickV1h/AOa/HVTmamy+y6LfJ6rCxTydtVSujI=
=EDJl
-----END PGP SIGNATURE-----

--1RhGCd1AsoFHGRHc--
