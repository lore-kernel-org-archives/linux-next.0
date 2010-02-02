From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: sound tree build failure
Date: Tue, 2 Feb 2010 23:01:23 +1100
Message-ID: <20100202230123.64bee219.sfr@canb.auug.org.au>
References: <20100202124711.d8cdc220.sfr@canb.auug.org.au>
	<20100202102609.GA6566@rakim.wolfsonmicro.main>
	<20100202213732.586a3566.sfr@canb.auug.org.au>
	<20100202105800.GE6566@rakim.wolfsonmicro.main>
	<20100202221743.1dbcad11.sfr@canb.auug.org.au>
	<1265111430.4194.144.camel@odin>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__2_Feb_2010_23_01_23_+1100_=FdViIj/=Jd8xmUf"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58013 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751046Ab0BBMBa (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 2 Feb 2010 07:01:30 -0500
In-Reply-To: <1265111430.4194.144.camel@odin>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Liam Girdwood <lrg@slimlogic.co.uk>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, Takashi Iwai <tiwai@suse.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>

--Signature=_Tue__2_Feb_2010_23_01_23_+1100_=FdViIj/=Jd8xmUf
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Liam,

On Tue, 02 Feb 2010 11:50:30 +0000 Liam Girdwood <lrg@slimlogic.co.uk> wrot=
e:
>
> I wonder if it would be possible to re-order the merge sequence so that
> similar inter tree dependencies are less likely to cause -next build

Anything is possible with software :-)

> failures in the future.  I guess atm lots of driver trees can depend on
> MFD (e.g. regulator, sound, rtc, backlight, led, watchdog, etc) so it
> may be good to move it up the order.

In this case it would just have masked the dependency and we may not have
found it until the sound tree was merged into Linus' tree and builds
started failing.  (I now Mark already knew about this one.)  We actually
have very few build dependencies between trees and in most cases I would
prefer that they were exposed in linux-next than in Linus' tree (with the
ensuing bisection problems).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__2_Feb_2010_23_01_23_+1100_=FdViIj/=Jd8xmUf
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktoFBMACgkQjjKRsyhoI8yw/wCgogRxJSOKrtCgV0up+g6gWhhg
TWwAoIkxsU3e+3pu4XqyHwBFLuEbgChi
=j9Jx
-----END PGP SIGNATURE-----

--Signature=_Tue__2_Feb_2010_23_01_23_+1100_=FdViIj/=Jd8xmUf--
