From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: ftrace tree build failure
Date: Tue, 25 Nov 2008 16:09:35 +1100
Message-ID: <20081125160935.2bd3dcb2.sfr@canb.auug.org.au>
References: <20081125142105.2b6d464a.sfr@canb.auug.org.au>
	<1227584931.7622.11.camel@localhost.localdomain>
	<20081125151345.3f0ed493.sfr@canb.auug.org.au>
	<1227587493.7622.14.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__25_Nov_2008_16_09_35_+1100_Cf9=i0Bavx.fvfwB"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50767 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750724AbYKYFJw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 25 Nov 2008 00:09:52 -0500
In-Reply-To: <1227587493.7622.14.camel@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Rostedt <srostedt@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org

--Signature=_Tue__25_Nov_2008_16_09_35_+1100_Cf9=i0Bavx.fvfwB
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Steve,

On Mon, 24 Nov 2008 23:31:33 -0500 Steven Rostedt <srostedt@redhat.com> wro=
te:
>
> This may be a compiler bug, or something introduced by the compiler. I
> compiled it fine first with gcc 4.0.2, but then tried with the same
> compiler you used, and got the same error as you.

A quick bisect points to this commit:

commit 2bcd521a684cc94befbe2ce7d5b613c841b0d304
Author: Steven Rostedt <srostedt@redhat.com>
Date:   Fri Nov 21 01:30:54 2008 -0500

    trace: profile all if conditionals

I guess something in there is tickling the compiler ...
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__25_Nov_2008_16_09_35_+1100_Cf9=i0Bavx.fvfwB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkriI8ACgkQjjKRsyhoI8yMfACgqpkq5Euyy6uBAK7bsn4GLYeQ
wu0AoIFPeSQnO/8HhF9kVKcatCPwn3Yo
=ejOb
-----END PGP SIGNATURE-----

--Signature=_Tue__25_Nov_2008_16_09_35_+1100_Cf9=i0Bavx.fvfwB--
