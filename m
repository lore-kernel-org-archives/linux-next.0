From: Mark Brown <broonie@kernel.org>
Subject: Re: pending-fixes build: 1 failures 5 warnings
 (v4.20-rc2-261-g59a9ebee0952)
Date: Thu, 15 Nov 2018 11:11:47 -0800
Message-ID: <20181115191147.GK2089@sirena.org.uk>
References: <E1gNL0I-0001Co-1g@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fVx4YFaxe8of50Zh"
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <E1gNL0I-0001Co-1g@optimist>
Sender: netdev-owner@vger.kernel.org
To: Michal Kalderon <michal.kalderon@cavium.com>, Denis Bolotin <denis.bolotin@cavium.com>, "David S. Miller" <davem@davemloft.net>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, netdev@vger.kernel.org
List-Id: linux-next.vger.kernel.org


--fVx4YFaxe8of50Zh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 15, 2018 at 05:00:30PM +0000, Build bot for Mark Brown wrote:

Today's pending-fixes branch fails to build an arm allmodconfig due to:

> 	arm-allmodconfig
> ../drivers/net/ethernet/qlogic/qed/qed_rdma.h:186:79: error: expected ';' before '}' token
> ../drivers/net/ethernet/qlogic/qed/qed_rdma.h:186:79: error: expected ';' before '}' token
> ../drivers/net/ethernet/qlogic/qed/qed_rdma.h:186:79: error: expected ';' before '}' token
> ../drivers/net/ethernet/qlogic/qed/qed_rdma.h:186:79: error: expected ';' before '}' token
> ../drivers/net/ethernet/qlogic/qed/qed_rdma.h:186:79: error: expected ';' before '}' token

caused by 291d57f67d2449737 (qed: Fix rdma_info structure allocation) -
there's a simple typo in the !QED_RDMA stubs that were added.

--fVx4YFaxe8of50Zh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlvtxPIACgkQJNaLcl1U
h9BbpQf+NXMh9WP8ablVGBqvRhk0G1W+iyB4W0nVd1RbFpAllrKs96WBe3QfRX6j
CVaG2AP4m1gwQrPw0LsaYmjl26zGnvKBZvfNwrHErqP0ppau6Jg4uFDcw/EqL/en
vpH+4c9a8+dAcP6pTV10pKMigoQHfJKXbuuZvt29GRvJI+pDzZxiFVHzl+8svizp
qYTDA9XFjApQ8j7sIIxOVy5Xh7yklK73NB0fE4KArGEGS75lYkVXNHFOlplBTsTi
uLFPsxXwf9JNVnrxDpcgeTDpMeb9WFqA+6H0rtrePdyfNQNOsHA3vUtmMcpMAAG8
xI2LUYaNik6dFf1nSuX5oRWFnqK7ZA==
=zll/
-----END PGP SIGNATURE-----

--fVx4YFaxe8of50Zh--
