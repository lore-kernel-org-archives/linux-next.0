From: Mark Brown <broonie@kernel.org>
Subject: Re: build failure after merge of the rcu tree
Date: Mon, 9 Oct 2017 18:17:24 +0100
Message-ID: <20171009171724.frgul6w6ggbirgns@sirena.co.uk>
References: <20171009170540.45xwjhyvdwiwxcxe@sirena.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="u2nlerjgppdrtjg2"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:37850 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754789AbdJIRR0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 9 Oct 2017 13:17:26 -0400
Content-Disposition: inline
In-Reply-To: <20171009170540.45xwjhyvdwiwxcxe@sirena.co.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: linux-next@vger.kernel.org


--u2nlerjgppdrtjg2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 09, 2017 at 06:05:40PM +0100, Mark Brown wrote:

> caused by 669f98e232aa6f77bd60 ("drivers/firmware/tegra: Convert
> ACCESS_ONCE() to READ_ONCE()") in the rcu tree.  I've reverted to the
> RCU version from September 28th (which is already in Linus' tree).

BTW there were also a bunch of merge issues that I sent out mails for
but they seem to have gone AWOL somewhere, don't know if you got them :/

--u2nlerjgppdrtjg2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlnbryMACgkQJNaLcl1U
h9D10gf/fstc/xyQOUeFZqSphv6vActxqW+xp3vuPTtPbBgTPuaX2neAD+UHsKOS
awlfryvXTaXNv10jqXG7sFZsK3UZg7kctalI+ix+T8Ifab40IBB8hhf7Re4NMxKm
WjKEnBMgMqrDQcqr/zVwY4DfOxSPhLXfbyh/C5U6Fedr1uI65NstIU9kwtJSKg2B
Wu37enm5+FZBURZEhZXvBXjlXLAHvLDJkoTgE8k3fqzR3RgN5jKzbWj0lOzFO9/q
plN3So6lx2mkV8DSo8XtbwdCZPJe88qKdOLee6d5ZTlpaWJY0CLM6Dw29GwQQaqX
BqFwyLlEtX/k9rC8WSYbOlAuIgPuYA==
=UzNt
-----END PGP SIGNATURE-----

--u2nlerjgppdrtjg2--
