From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the perfmon3 tree
Date: Wed, 26 Nov 2008 14:00:32 +1100
Message-ID: <20081126140032.72d86f17.sfr@canb.auug.org.au>
References: <20081125210319.35b2d189.sfr@canb.auug.org.au>
	<20081125102234.GA4281@elte.hu>
	<7c86c4470811250640v4417fa4fs196f0d0bea136a45@mail.gmail.com>
	<20081125153345.GA20733@elte.hu>
	<7c86c4470811250836k2f798c21pe4766a565a6231ab@mail.gmail.com>
	<20081125165118.GF22504@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__26_Nov_2008_14_00_32_+1100_A_EGmRXQYCVOhxL+"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51786 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752723AbYKZDAz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 25 Nov 2008 22:00:55 -0500
In-Reply-To: <20081125165118.GF22504@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: eranian@gmail.com, linux-next@vger.kernel.org, Alexander van Heukelum <heukelum@mailshack.com>, the arch/x86 maintainers <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Andrew Morton <akpm@linux-foundation.org>

--Signature=_Wed__26_Nov_2008_14_00_32_+1100_A_EGmRXQYCVOhxL+
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Tue, 25 Nov 2008 17:51:18 +0100 Ingo Molnar <mingo@elte.hu> wrote:
>
> There are a number of ways to do that - and we'll sure be able to work=20
> that out - but first please submit the full patchset (x86 and generic=20
> bits as well) to lkml with the x86 maintainers Cc:-ed.

Let see ... the permfmon patches have been submitted to LKML several
times over the past couple of years.  In their latest incarnation they
were posted to LKML on October 18 (lkml is, of course, also the mailing
list for x86 patches noted in MAINTAINERS - maybe you should submit a
patch noting that x86 code has to be submitted on x86@kernel.org as
well).  There has been ample time for the x86 maintainers to comment and
notice that their code is being modified.  I have seen no attempt at
review from them.

Also this code has been in linux-next since next-20081106 (i.e. November
6) and the only problem reports have been from the ia64 people.

> In any case, until that happens and until there's agreement with the=20
> x86 maintainers (there's none at the moment) the perfmon3 tree (or at=20
> least its x86 bits) needs to be removed from linux-next. I already see=20
> a number of problems with the patchset that we'll have to work out via=20
> an iterative review process.

That process has been happening except it seems that the x86 maintainers
haven't bothered to participate.  If, as you say, all the x86 parts have
to go via the x86 tree, then be aware that this woukd probably delay x86
perfmon integration until 2.6.30 or later (*cough* ftrace *cough*).  As
Andrew pointed out in another thread you seem to have missed, the
integration of perfmon (or something like it) is way over due.  The way
he suggested to go forward was to get it into linux-next and aim for
2.6.29 integration.

Several other architectures want this code in the kernel, so if they have
to wait for the x86 maintainers to decide what they want, then the only
way forward may be to separate the generic parts of the code and get that
integrated along with one of the other architectures.

/me dons flame-proof suite :-)
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__26_Nov_2008_14_00_32_+1100_A_EGmRXQYCVOhxL+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkksu9AACgkQjjKRsyhoI8yGfACeLFKqpsrXMZau1GuAR67rHgbr
FbYAoJNiaETjtpFbSz3sIfVmdyL9T7bN
=YNuI
-----END PGP SIGNATURE-----

--Signature=_Wed__26_Nov_2008_14_00_32_+1100_A_EGmRXQYCVOhxL+--
