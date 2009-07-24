From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the sound tree with the davinci
 tree
Date: Fri, 24 Jul 2009 11:12:42 +1000
Message-ID: <20090724111242.4156c6f9.sfr@canb.auug.org.au>
References: <20090723112110.e42430e9.sfr@canb.auug.org.au>
	<s5hvdlkvsk6.wl%tiwai@suse.de>
	<873a8ni8t7.fsf@deeprootsystems.com>
	<s5h7hxzngg5.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__24_Jul_2009_11_12_42_+1000_9np3rPAK7dAgHe31"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55842 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751729AbZGXBMq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Jul 2009 21:12:46 -0400
In-Reply-To: <s5h7hxzngg5.wl%tiwai@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Kevin Hilman <khilman@deeprootsystems.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Chaithrika U S <chaithrika@ti.com>, Pavel Kiryukhin <pkiryukhin@ru.mvista.com>, Naresh Medisetty <naresh@ti.com>, Steve Chen <schen@mvista.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Sudhakar Rajashekhara <sudhakar.raj@ti.com>

--Signature=_Fri__24_Jul_2009_11_12_42_+1000_9np3rPAK7dAgHe31
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Takashi, Kevin,

On Fri, 24 Jul 2009 01:10:50 +0200 Takashi Iwai <tiwai@suse.de> wrote:
>
> At Thu, 23 Jul 2009 10:54:44 -0700,
> Kevin Hilman wrote:
> >=20
> > I've taken care of this in the DaVinci for-next branch.
> >=20
> > I dropped the davinci changes that change code that were then dropped
> > by the asoc changes.
>=20
> Ah, great.  Then I revert a fix merge in my for-next branch and keep
> only pure ASoC things.

Thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__24_Jul_2009_11_12_42_+1000_9np3rPAK7dAgHe31
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkppCooACgkQjjKRsyhoI8zlewCgjWKJ8COez0EMIqm9VMx+1hRa
U/QAoIydR+qbBZhG/92ZREQNR/f2XKnO
=UNQR
-----END PGP SIGNATURE-----

--Signature=_Fri__24_Jul_2009_11_12_42_+1000_9np3rPAK7dAgHe31--
