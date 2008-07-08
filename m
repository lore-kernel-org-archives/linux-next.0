From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the x86 tree
Date: Tue, 8 Jul 2008 15:01:03 +1000
Message-ID: <20080708150103.3d52c0d0.sfr@canb.auug.org.au>
References: <20080708105658.1a9deedc.sfr@canb.auug.org.au>
	<4872DD62.1060708@goop.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__8_Jul_2008_15_01_03_+1000_X9QAbRbnY.KU7q/0"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33219 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750717AbYGHFBL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Jul 2008 01:01:11 -0400
In-Reply-To: <4872DD62.1060708@goop.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jeremy Fitzhardinge <jeremy@goop.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Steven Rostedt <srostedt@redhat.com>

--Signature=_Tue__8_Jul_2008_15_01_03_+1000_X9QAbRbnY.KU7q/0
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jeremy,

On Mon, 07 Jul 2008 20:22:10 -0700 Jeremy Fitzhardinge <jeremy@goop.org> wr=
ote:
>
> I must be missing something.  Don't all those already come from tip.git=20
> pre-merged?  Or are you merging various tip.git topic branches=20
> yourself?  Or are some of these coming from elsewhere?

I merge a set of branches that are specially maintained for linux-next
(see the Next/Trees file in the linux-next tree). I assume that Linus is
probably not going to just merge in tip.get in one enormous merge ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__8_Jul_2008_15_01_03_+1000_X9QAbRbnY.KU7q/0
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhy9I8ACgkQjjKRsyhoI8zJkwCfdnLMul67viRRLkZdhaZZUraG
tgYAnR73tWyhhdXHGGgmkEOeuhcVjBos
=6ULl
-----END PGP SIGNATURE-----

--Signature=_Tue__8_Jul_2008_15_01_03_+1000_X9QAbRbnY.KU7q/0--
