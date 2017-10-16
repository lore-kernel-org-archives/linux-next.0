From: Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the akpm tree with the tip tree
Date: Mon, 16 Oct 2017 19:48:10 +0100
Message-ID: <20171016184810.24tuzkualecniicu@sirena.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2g34chkxpwc75gow"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org


--2g34chkxpwc75gow
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of (well, import of) the akpm tree got a
conflict in:

  include/linux/sched/mm.h

between commit:

  68e21be2916b35 ("sched/headers: Move task->mm handling methods to <linux/=
sched/mm.h>")

=66rom the tip tree and commit:

  d3a5cfa169959b ("include/linux/sched/mm.h: uninline mmdrop_async(), etc")

=66rom the akpm tree.

I don't feel confident fixing this up, I'm trying to figure out how to
drop one of the commits but this script isn't the clearest in it's
intent.

--2g34chkxpwc75gow
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlnk/ukACgkQJNaLcl1U
h9CYAgf+M1TDdUUhGKNZU/UPQxVfTPXfqqEldy8FKvsMh//a/9a+veJk8BQUeP36
yEEubgpTqLRC2/kbAx7CazwN/OUjlckfdTW0O1/sVrzLLLFkxbjb7iG30G+qIS9u
Qf+inZo5li9ETKoAvh2idyoD5MBnzf0O7/bRJK8d2h5J2aZR6A1wRfMQPFWczmXU
Gx2P7QnzatbqUYOfmU49qjb2Exh1/C9ytZ1OXGoii9Kn8ap1UcoYj9lLv6f1cwk3
x5oO4zq6n6uFfpztvoI3jlPBhdzsxAMorFND18XBkCgYNgFY33cUVq+rGZnTorkL
v1wa/mtTNpLWS+eJxzwuKhH8wlm00A==
=ITcN
-----END PGP SIGNATURE-----

--2g34chkxpwc75gow--
