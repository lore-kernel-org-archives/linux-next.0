From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: sound tree build failure
Date: Tue, 2 Feb 2010 22:17:43 +1100
Message-ID: <20100202221743.1dbcad11.sfr@canb.auug.org.au>
References: <20100202124711.d8cdc220.sfr@canb.auug.org.au>
	<20100202102609.GA6566@rakim.wolfsonmicro.main>
	<20100202213732.586a3566.sfr@canb.auug.org.au>
	<20100202105800.GE6566@rakim.wolfsonmicro.main>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__2_Feb_2010_22_17_43_+1100_q+Q=mcBMsHWewPGe"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56434 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755185Ab0BBLRw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 2 Feb 2010 06:17:52 -0500
In-Reply-To: <20100202105800.GE6566@rakim.wolfsonmicro.main>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Takashi Iwai <tiwai@suse.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>

--Signature=_Tue__2_Feb_2010_22_17_43_+1100_q+Q=mcBMsHWewPGe
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Tue, 2 Feb 2010 10:58:00 +0000 Mark Brown <broonie@opensource.wolfsonmic=
ro.com> wrote:
>
> On Tue, Feb 02, 2010 at 09:37:32PM +1100, Stephen Rothwell wrote:
>=20
> > The sound tree is merged before the mfd tree, and the commit that adds
> > those is only in the mfd tree.  So the sound tree, on its own, is
> > broken.  This driver will only build if you merge the mfd tree as well.
>=20
> Ah, you're doing builds after each individual merge.  It might help to

Always have ...

> change the form you're using when reporting problems with partially
> constructed -next - at the minute you say "Today's linux-next build
> (x86_64 allmodconfig) failed like this:" which makes it look like you're
> testing the result of the full -next merge.

I was hoping that the subject of the email would help with that
impression.

> > Kconfig has nothing to do with it, sorry.
>=20
> No, it does really fix the problem.  As I said the driver should build
> depend on a Kconfig symbol which is introduced in the MFD tree.  This
> means that the driver will not be built at all until MFD has been merged
> since the dependencies required to select the driver will not be
> satisfied unless the commits it depends on are present in the tree.

Yeah, OK, I guess you could do that.

> I'll push a patch for this shortly.

Thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__2_Feb_2010_22_17_43_+1100_q+Q=mcBMsHWewPGe
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktoCdcACgkQjjKRsyhoI8wkPgCeNoX5Kt/pR/oxnM3YTwkGX9TI
XTwAoK2AVDDREFNGB9pED7kVyCWtXvLo
=jvsA
-----END PGP SIGNATURE-----

--Signature=_Tue__2_Feb_2010_22_17_43_+1100_q+Q=mcBMsHWewPGe--
