From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Date: Wed, 9 Nov 2016 14:41:42 +0000
Message-ID: <20161109144142.4errxbxp3cisvupt@sirena.org.uk>
References: <20161108134723.3b4fc5d5@canb.auug.org.au>
 <CAGb2v64S_YzHDOeRfHKRTrti8jZThuxfexRApjDAqzmJYR_N7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ezijb4lthp2eydee"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v64S_YzHDOeRfHKRTrti8jZThuxfexRApjDAqzmJYR_N7Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Liam Girdwood <lgirdwood@gmail.com>, linux-next@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org


--ezijb4lthp2eydee
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 08, 2016 at 11:18:29AM +0800, Chen-Yu Tsai wrote:

> sound-asoc is missing patch

>     ASoC: sun4i-codec: Add support for optional reset control to quirks
>     http://www.spinics.net/lists/alsa-devel/msg56289.html

> which commit 8d9e4c9e993f ("ASoC: sun4i-codec: Add support for A31 playback
> through headphone output") depends on. This was part of the same series that
> I posted:

I don't have that...

> A new version of the remaining patches was posted yesterday:

>     http://www.spinics.net/lists/alsa-devel/msg56443.html

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

--ezijb4lthp2eydee
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAABCAAGBQJYIzWlAAoJECTWi3JdVIfQWZ4H/0En6b9TIdG03+xWLYQwj7b1
e4uyIjc1qMGhgVhcg7zsB0vVq6EK9A6KOsk4rAQV1Tg4uJf8jbsWQeH9Vy39cxMM
AztuB/TStRfjh0zVmMu5l3Qkn0VT64Ext2AEKxbyNVKUF7hLWjTTU497PBRIpUFi
To7MJS7ihQI4kkuDhtdms41PbmhdRBpP3A9qQPaicOoVetcDqFz8pFouWTFQKsrs
Ddi5SdYd7p5gfjkNbCuBbBwvh2A0VYKtfHCbm4TOw9NPXOxzj5R09KniveRs3CwY
nMd2ZohnRPzWCK8deYiL4eFz8e11NpicI+wqQSlOuKg2G8cqQZ/gQZQhM3xC5k8=
=u1w7
-----END PGP SIGNATURE-----

--ezijb4lthp2eydee--
