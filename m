From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: tip-core build failure
Date: Mon, 15 Sep 2008 04:01:00 +1000
Message-ID: <20080915040100.5a6f634f.sfr@canb.auug.org.au>
References: <20080913111423.981554c3.sfr@canb.auug.org.au>
	<200809131144.36507.rui.p.m.sousa@gmail.com>
	<20080914124320.GG16097@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__15_Sep_2008_04_01_00_+1000_8J9dEXF2tWH_Y_fn"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43121 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753213AbYINSBN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 14 Sep 2008 14:01:13 -0400
In-Reply-To: <20080914124320.GG16097@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Rui Sousa <rui.p.m.sousa@gmail.com>, linux-next@vger.kernel.org

--Signature=_Mon__15_Sep_2008_04_01_00_+1000_8J9dEXF2tWH_Y_fn
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Sun, 14 Sep 2008 14:43:20 +0200 Ingo Molnar <mingo@elte.hu> wrote:
>
> yes, i agree with that direction. But it's difficult: the non-x86=20
> architectures do not get much testing in practice at the development=20
> stage so trivial build bugs like this get only found at the latest=20
> stage. That's not actually bad in itself - stuff that is not used does=20
> not matter nearly as much as stuff that does get used.

Well, its not really that difficult, you just have to remember that x86
is not the whole world and touching generic code just might affect the
other architectures - especially when the code you are touching is using
stuff that is clearly implemented by the architectures. Posting stuff
like this to linux-arch usually gets some attention (my apologies if you
did so, I don't remember seeing it).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__15_Sep_2008_04_01_00_+1000_8J9dEXF2tWH_Y_fn
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkjNUVwACgkQjjKRsyhoI8zglwCcDmCMdvXc0KY1zvyDh9snVlDJ
FuMAoKr8LD3cBV2FCRY5480DrDN8eamc
=ku8J
-----END PGP SIGNATURE-----

--Signature=_Mon__15_Sep_2008_04_01_00_+1000_8J9dEXF2tWH_Y_fn--
