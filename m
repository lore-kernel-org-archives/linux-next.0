From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] perf: Also export the weak version of
 perf_arch_fetch_caller_regs
Date: Fri, 12 Mar 2010 17:26:41 +1100
Message-ID: <20100312172641.f683dfd9.sfr@canb.auug.org.au>
References: <20100312150003.afd9b59a.sfr@canb.auug.org.au>
	<20100312055043.GB5014@nowhere>
	<20100312172043.aa034ede.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__12_Mar_2010_17_26_41_+1100_clI+DkXczeCeZVfQ"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100312172043.aa034ede.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Frederic Weisbecker <fweisbec@gmail.com>
Cc: Ingo Molnar <mingo@elte.hu>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Signature=_Fri__12_Mar_2010_17_26_41_+1100_clI+DkXczeCeZVfQ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Frederic,

On Fri, 12 Mar 2010 17:20:43 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Fri, 12 Mar 2010 06:50:44 +0100 Frederic Weisbecker <fweisbec@gmail.co=
m> wrote:
> >
> > Does that fixes the issue? Sorry I can not test for now...
>=20
> I can't test it right now, sorry, but I have heard that EXPORT_SYMBOL's
> for weak symbols must be in a different file from the actual symbol
> definition.

See http://lkml.org/lkml/2010/2/17/467
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__12_Mar_2010_17_26_41_+1100_clI+DkXczeCeZVfQ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkuZ3qEACgkQjjKRsyhoI8yvwACgiy7RL0e7Sqa/la1JrlrnX/A6
GO8An1YsXOuMikjUoc/oYbMPcqsi3s8M
=I07O
-----END PGP SIGNATURE-----

--Signature=_Fri__12_Mar_2010_17_26_41_+1100_clI+DkXczeCeZVfQ--
