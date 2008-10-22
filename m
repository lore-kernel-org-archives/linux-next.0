From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: stackprotector tree build failure
Date: Wed, 22 Oct 2008 19:31:13 +1100
Message-ID: <20081022193113.20369b63.sfr@canb.auug.org.au>
References: <20081022131124.a572b11f.sfr@canb.auug.org.au>
	<20081022043227.GA31413@elte.hu>
	<20081022182149.f89fe88d.sfr@canb.auug.org.au>
	<20081022072923.GC27637@elte.hu>
	<20081022192725.5f5de711.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__22_Oct_2008_19_31_13_+1100_qRdyS5fFH.BClgg."
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48622 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752188AbYJVIbh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 22 Oct 2008 04:31:37 -0400
In-Reply-To: <20081022192725.5f5de711.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Junio C Hamano <gitster@pobox.com>, git@vger.kernel.org

--Signature=_Wed__22_Oct_2008_19_31_13_+1100_qRdyS5fFH.BClgg.
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 22 Oct 2008 19:27:25 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> I think rerere matches preimages on the SHA1 of the conflict (or its
> reverse), so sufficiently similar pieces of code will match.  I would
> expect things like ext2/3/4 to be candidates.  Did the traps_32.c one
> match one for traps_64.c?

Or, of course similar conflicts in different merges in different branches
of the same tree are really asking for it ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__22_Oct_2008_19_31_13_+1100_qRdyS5fFH.BClgg.
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj+5NEACgkQjjKRsyhoI8xDIwCgvnY69BAbEXGhG2d1xSSucB0G
E9kAoLtLZk0boQE5oH3UZRR2QMNEDHty
=RwGG
-----END PGP SIGNATURE-----

--Signature=_Wed__22_Oct_2008_19_31_13_+1100_qRdyS5fFH.BClgg.--
