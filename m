From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: manual merge of the akpm tree with the tip tree
Date: Mon, 16 Oct 2017 21:01:54 +0100
Message-ID: <20171016200154.kc2dbifa757jfzzr@sirena.co.uk>
References: <20171016184810.24tuzkualecniicu@sirena.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ou7xsjbjdzacdiow"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171016184810.24tuzkualecniicu@sirena.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org


--ou7xsjbjdzacdiow
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 16, 2017 at 07:48:10PM +0100, Mark Brown wrote:

> I don't feel confident fixing this up, I'm trying to figure out how to
> drop one of the commits but this script isn't the clearest in it's
> intent.

OK, I might've figured it out or I might've made a terrible mess.
Either way it seems to pass a basic smoke test.

Later on in the merge process I also found additional conflicts,
including extensive conflicts which look like reformatting issues in
btrfs.

--ou7xsjbjdzacdiow
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlnlEDEACgkQJNaLcl1U
h9AtRQf/agYYD/wiaBjND4bEjB9F6+LK0YTRsvM2MVMLTbWxbQLDkQHriY+rcHHI
5/Fcx7T6WzAQF5rADJ9LvQKThev28CUsyR+AKG1SRntpK1vBURKnLM5yHuQJfu6p
KodJcyl8gTYOg4B5bjjJITLVcK/9dBCiKMqfOwXwVTr3Br48D9rpiaGL931UURsO
nMPqMZI6BtXfGmNf6x6jUZwyvqcF6aWde+dTKx2WZeqy4deZ5NGmqWRM+4vpcytw
xRSO8W6qQRWW8V777oh+HH5LoCXJgKLXTrcahJsK98lCOwDbU8rT5uD03fKtYkSQ
ym4khzQQbDLeIZ+QJOKMu8ARiu+0MQ==
=vuD8
-----END PGP SIGNATURE-----

--ou7xsjbjdzacdiow--
