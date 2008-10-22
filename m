From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: stackprotector tree build failure
Date: Wed, 22 Oct 2008 19:27:25 +1100
Message-ID: <20081022192725.5f5de711.sfr@canb.auug.org.au>
References: <20081022131124.a572b11f.sfr@canb.auug.org.au>
	<20081022043227.GA31413@elte.hu>
	<20081022182149.f89fe88d.sfr@canb.auug.org.au>
	<20081022072923.GC27637@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__22_Oct_2008_19_27_25_+1100_d0tfyYBqz66O1XNr"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57541 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753132AbYJVI1f (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 22 Oct 2008 04:27:35 -0400
In-Reply-To: <20081022072923.GC27637@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Junio C Hamano <gitster@pobox.com>, git@vger.kernel.org

--Signature=_Wed__22_Oct_2008_19_27_25_+1100_d0tfyYBqz66O1XNr
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 22 Oct 2008 09:29:23 +0200 Ingo Molnar <mingo@elte.hu> wrote:
>
> I've Cc:-ed Junio and the Git list as a general FYI - but it must be=20
> frustrating to get such a bugreport, because i have no reproducer.
>=20
> git-rerere sometimes seems to be picking up the wrong resolution. VERY=20
> rarely.
>=20
> It seems random and content dependent. Once it happened to=20
> arch/x86/kernel/traps_32.c and now to kernel/fork.c. Along the ~170=20
> successful resolutions i have in my tree right now. And i do many=20
> conflict resolutions every day - and it happened only once every 6=20
> months or so.
>=20
> (the arch/x86/kernel/traps_32.c one happened regularly, that's why i=20
> thought it's content sha1 dependent, and not some corruption.)
>=20
> Next time it happens i'll be on the watchout and will save the complete=20
> tree.

I think rerere matches preimages on the SHA1 of the conflict (or its
reverse), so sufficiently similar pieces of code will match.  I would
expect things like ext2/3/4 to be candidates.  Did the traps_32.c one
match one for traps_64.c?

I may be mistaken, but I once followed the code in rerere to try to
figure out how to fix a resolution.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__22_Oct_2008_19_27_25_+1100_d0tfyYBqz66O1XNr
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj+4+0ACgkQjjKRsyhoI8yt7QCeM9KWBNKY6deAOeaOxhDp7vUH
Y8UAn24XKT8hLfB9jmuSXHZSpC7y/ka8
=7TrS
-----END PGP SIGNATURE-----

--Signature=_Wed__22_Oct_2008_19_27_25_+1100_d0tfyYBqz66O1XNr--
