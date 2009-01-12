From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: origin tree build failure
Date: Mon, 12 Jan 2009 20:24:27 +1100
Message-ID: <20090112202427.3b918490.sfr@canb.auug.org.au>
References: <20090112104837.69feedec.sfr@canb.auug.org.au>
	<1231719015.22571.4.camel@pasglop>
	<20090112090552.GD26750@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__12_Jan_2009_20_24_27_+1100_/JyRDOi8rZBaYYJ."
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55827 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751066AbZALJYj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 12 Jan 2009 04:24:39 -0500
In-Reply-To: <20090112090552.GD26750@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Linus Torvalds <torvalds@linux-foundation.org>, linux-next@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>, Mike Travis <travis@sgi.com>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, LKML <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@ozlabs.org

--Signature=_Mon__12_Jan_2009_20_24_27_+1100_/JyRDOi8rZBaYYJ.
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Mon, 12 Jan 2009 10:05:52 +0100 Ingo Molnar <mingo@elte.hu> wrote:
>
> Yeah - and that build bug was stupid too - when touching a generic file=20
> that is called include/linux/cpufreq.h and changing a key data field one=
=20
> should at minimum get the idea that it's generic for a reason and should=
=20
> start grepping the tree ...
>=20
> It slipped through because it didnt get caught in build tests because=20
> cpufreq isnt enabled in the powerpc defconfig.

Which is one of the reasons we have linux-next: "integration testing".
This way not every developer/maintainer has to have/use cross compilers
for every (or even many) non-native (from their point of view)
architectures.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__12_Jan_2009_20_24_27_+1100_/JyRDOi8rZBaYYJ.
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklrDEsACgkQjjKRsyhoI8ymBACfbaSepcd6JqVSw4AK/Agw76h2
gMUAn16XM2ZKM6R55hjoGR98y8pX4zcx
=kXHG
-----END PGP SIGNATURE-----

--Signature=_Mon__12_Jan_2009_20_24_27_+1100_/JyRDOi8rZBaYYJ.--
