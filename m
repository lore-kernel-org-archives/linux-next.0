From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Date: Fri, 8 Feb 2019 12:53:53 +0000
Message-ID: <20190208125353.GD6695@sirena.org.uk>
References: <20190208131823.0fd205b5@canb.auug.org.au>
 <s5hy36q91e2.wl-tiwai@suse.de>
 <s5htvhe8yic.wl-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0/kgSOzhNoDC5T3a"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <s5htvhe8yic.wl-tiwai@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Takashi Iwai <tiwai@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Liam Girdwood <lgirdwood@gmail.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Maruthi Srinivas Bayyavarapu <maruthi.srinivas.bayyavarapu@xilinx.com>
List-Id: linux-next.vger.kernel.org


--0/kgSOzhNoDC5T3a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 08, 2019 at 09:39:39AM +0100, Takashi Iwai wrote:

> > Mark, could you apply it on your tree?

> And I already took back the API change from for-next branch for
> avoiding the bisection breakage.

> > Or let me pull your tree into mine.

> ... so Mark, please send a pull request to me for ASoC merges, so that
> I can apply the API change.

Done.  This sort of thing is why I like having lots of topic branches :/

--0/kgSOzhNoDC5T3a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlxde+AACgkQJNaLcl1U
h9DH7wf/Uv7GKN1wnpS+irjMF6ZRcYl87X/066NhS7w9eJO4/I8cLX8h3DnYnRTO
RExacVMnwzIhxVWpdHTzj+2iW5nxAntxQUMfcw+lzMCpe8q3Lv1RCOpuVHAd5KPa
VybTUcXWDNLzufBsmzqTobm/yJUCdcvG8WgG0rKjojjUGDDf+WsP0Kjbei/cVocP
bsA2dulaIq5nhqDbVXaPlRFQOJ+q4bMbFsrn6Qzgif6dSIr39AsOIovYlXHIzKLt
jRmU5/GYRhmj57d8sp2Y8JZDB7w1gloJoI/hlDoudtkrynVKJugyDhy/ufDnj1rj
3TQ4KG21mf3aPd11oHVwoL/chmvwiA==
=+3WI
-----END PGP SIGNATURE-----

--0/kgSOzhNoDC5T3a--
