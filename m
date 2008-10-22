From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: stackprotector tree build failure
Date: Thu, 23 Oct 2008 10:54:54 +1100
Message-ID: <20081023105454.880e13e2.sfr@canb.auug.org.au>
References: <20081022131124.a572b11f.sfr@canb.auug.org.au>
	<20081022043227.GA31413@elte.hu>
	<20081022182149.f89fe88d.sfr@canb.auug.org.au>
	<20081022072923.GC27637@elte.hu>
	<20081022192725.5f5de711.sfr@canb.auug.org.au>
	<20081022083139.GA4369@elte.hu>
	<alpine.DEB.1.00.0810221908100.22125@pacific.mpi-cbg.de.mpi-cbg.de>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__23_Oct_2008_10_54_54_+1100_8MVWjtOBShGGYB7M"
Return-path: <git-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.1.00.0810221908100.22125@pacific.mpi-cbg.de.mpi-cbg.de>
Sender: git-owner@vger.kernel.org
To: Johannes Schindelin <Johannes.Schindelin@gmx.de>
Cc: Ingo Molnar <mingo@elte.hu>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Junio C Hamano <gitster@pobox.com>, git@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Signature=_Thu__23_Oct_2008_10_54_54_+1100_8MVWjtOBShGGYB7M
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Johannes,

On Wed, 22 Oct 2008 19:41:18 +0200 (CEST) Johannes Schindelin <Johannes.Sch=
indelin@gmx.de> wrote:
>
> I think it might be in order to explain how git-rerere works internally:

Thanks for the explanation.

> So I think that you might hit the unfortunate case where two files=20
> happened to have the same conflicts, but you needed to resolve them one=20
> way for one file, and another way for the other file.

Which makes perfect sense, unfortunately.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__23_Oct_2008_10_54_54_+1100_8MVWjtOBShGGYB7M
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj/vU4ACgkQjjKRsyhoI8zKYgCggqSrqEKLzEeIpuKwhFNwDqX7
UBgAn27NQwN703trPMgve8PNFvXAC0ND
=7mrv
-----END PGP SIGNATURE-----

--Signature=_Thu__23_Oct_2008_10_54_54_+1100_8MVWjtOBShGGYB7M--
