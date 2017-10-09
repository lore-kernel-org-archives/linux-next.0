From: Mark Brown <broonie@kernel.org>
Subject: build failure after merge of the rcu tree
Date: Mon, 9 Oct 2017 18:05:40 +0100
Message-ID: <20171009170540.45xwjhyvdwiwxcxe@sirena.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kck7zgpq4q565o3s"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:46422 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754018AbdJIRFm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 9 Oct 2017 13:05:42 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: linux-next@vger.kernel.org


--kck7zgpq4q565o3s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

After merging the rcu tree an arm64 defconfig fails to build with:

/home/broonie/tmpfs/next/drivers/firmware/tegra/ivc.c: In function 'tegra_ivc_ad
vance_tx':
/home/broonie/tmpfs/next/drivers/firmware/tegra/ivc.c:154:39: error: lvalue required as left operand of assignment
  READ_ONCE(ivc->tx.channel->tx.count) =
                                       ^
/home/broonie/tmpfs/next/drivers/firmware/tegra/ivc.c: In function 'tegra_ivc_advance_rx':
/home/broonie/tmpfs/next/drivers/firmware/tegra/ivc.c:165:39: error: lvalue required as left operand of assignment
  READ_ONCE(ivc->rx.channel->rx.count) =
                                       ^
/home/broonie/tmpfs/next/scripts/Makefile.build:313: recipe for target 'drivers/firmware/tegra/ivc.o' failed

caused by 669f98e232aa6f77bd60 ("drivers/firmware/tegra: Convert
ACCESS_ONCE() to READ_ONCE()") in the rcu tree.  I've reverted to the
RCU version from September 28th (which is already in Linus' tree).

--kck7zgpq4q565o3s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlnbrGMACgkQJNaLcl1U
h9BZ/wf/cC11clEXQw7IAyIvtKElGKN2qUVHvxa9MlfnNjocN5jUR2jVMwO7eLW/
3oEMcoYeMg9kqq8llpr53TGGWGWExym1UWdoHTwC/j4GSmfRg8GUud0DuQ/gpxD8
5FxqAJw7r3RfejpxSifP/CsTv5+nkk3d80UWBISTp7fd+ckZZ/t1ImGElXe6Fb25
sLJ8Cwt5p9c9He+vXufX8j1Va7bbN3OUQBUEy913mGs1yWwVhIRGEy7qklBTcdrE
JznqFtHErXn26GjaDphZl5XvhvJYZOWyB5EajfZ5rjHb7PFmzZwyRsnllUu3MbmN
m+ZYSyRP/xhB0Ske5QhXBVtWUk4Z9w==
=xHrp
-----END PGP SIGNATURE-----

--kck7zgpq4q565o3s--
