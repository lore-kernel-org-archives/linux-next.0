From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the regulator tree
Date: Tue, 14 Apr 2015 11:22:41 +1000
Message-ID: <20150414112241.3dbad71a@canb.auug.org.au>
References: <20150409143309.3a1fac67@canb.auug.org.au>
	<20150409093556.GP6023@sirena.org.uk>
	<20150414094403.30126f2d@canb.auug.org.au>
	<20150414010706.GB29061@sonymobile.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/1VyuuduqjTJt6HUY70K85NM"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56772 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753243AbbDNBWs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Apr 2015 21:22:48 -0400
In-Reply-To: <20150414010706.GB29061@sonymobile.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hai Li <hali@codeaurora.org>, Rob Clark <robdclark@gmail.com>, Dave Airlie <airlied@linux.ie>

--Sig_/1VyuuduqjTJt6HUY70K85NM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Bjorn,

On Mon, 13 Apr 2015 18:07:06 -0700 Bjorn Andersson <bjorn.andersson@sonymob=
ile.com> wrote:
>
> What Mark mean is basically that there shouldn't be any users of
> regulator_set_optimum_mode() for various reasons and we introduced
> regulator_set_load() to solve these, before any users popped up.
>=20
> Unfortunately we weren't fast enough and people got some code in that
> uses the API that isn't implemented for any Qualcomm platform today...

Ah, OK.

> Your patch looks correct and should preferrably be added to the drm
> tree, or the last patch in my series that drops the API wrapper should
> be held back until rc1(?)

It needs to be sent to Linus as a merge fix when the drm tree is merged.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/1VyuuduqjTJt6HUY70K85NM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVLGvlAAoJEMDTa8Ir7ZwVfDsP/ReoNKGtUMuIQKdWLZI/hHqH
gD5e+qe+3el4aX0bGsaag/7RXVGYXwrCGOr08SMeBMTUDKce6fSFF6n6r/KY/dw2
pGSm0ewayYJdY6u9zoRrfV8s/QJBs78eyelAVolGOEOqRC+dtbsz0O2rx3j4twXa
aj6uJKcN6IHIWoez65qyNq0TK6wiYgM4HMrT3f9BNQjXCCgn16E/SY26Wo5sT6wq
Bi66F+q52N2U1C25JDwkYZUY6Asi+t/GQ1fOF7F+BOmpZ35w+Fkhewn2canYM7qr
E4TP6yZSf9btDITDRIMy3znrF8kKJEZ+H57UsbuxssI3maiWX59zVPMBIHbC0ygC
li3sYs8yYnfKSCbD1opyxXzsxa/HXdxX8Xl4K3i7Qv9sbU9B5VH0x+g77dcD5yqa
sHC1bJfPiKH1MOzLEgRNwf4Ufwr171NHwMmYci0a6GWiXsUSe2xOaGs0TFsikOax
QrtzA14OrKJQZkHVsVyQgC6ZygZwpqGYwsa0fVsHT0epSXVK2d75DjGQrL/39Fmz
K3sjN0XFCFemzoAH7rWGjjnZCYdZuht9EsGH5HhMcxJh3v/qY0AfTb05rulVxoXZ
CgZlN0cRjkQg9esS9yDQLatR5THgItE+euZHkfanFZVIGz7h/FrFWxkXKUSPAP+G
ICPpOcW5PF8SDMsY8jOA
=jE40
-----END PGP SIGNATURE-----

--Sig_/1VyuuduqjTJt6HUY70K85NM--
