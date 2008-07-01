From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the sched tree
Date: Tue, 1 Jul 2008 16:00:16 +1000
Message-ID: <20080701160016.0fa899e4.sfr@canb.auug.org.au>
References: <20080701124206.77ff77cd.sfr@canb.auug.org.au>
	<20080701055402.GA14658@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__1_Jul_2008_16_00_16_+1000_0I/iA73cmfdr=j3F"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37639 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751117AbYGAGAY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Jul 2008 02:00:24 -0400
In-Reply-To: <20080701055402.GA14658@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org

--Signature=_Tue__1_Jul_2008_16_00_16_+1000_0I/iA73cmfdr=j3F
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Tue, 1 Jul 2008 07:54:02 +0200 Ingo Molnar <mingo@elte.hu> wrote:
>
> You should be able to check whether we both integrated the conflict the=20
> same way via checking tip/auto-latest, which is the integration of all=20
> the auto branches that come from -tip.
>=20
> All the integration branches of -tip are pushed out at once so=20
> tip/auto-latest always gives a hint about how to integrate two -tip=20
> derived topic branches, tip/auto-latest always gives an answer. [ which=20
> might at times be wrong so it never hurts to double check :-) Note:=20
> auto-latest also includes some non-linux-next topics - but they dont=20
> affect the scheduler usually. ]

Good to know, I will fetch it when necessary to check my work.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__1_Jul_2008_16_00_16_+1000_0I/iA73cmfdr=j3F
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhpx/AACgkQjjKRsyhoI8x9ewCcDE7YKOMNGeHKBIy4WTGiIn56
3A0AnRHF2oTPhNpi2UvHTyTIgir9Vrx2
=VtAC
-----END PGP SIGNATURE-----

--Signature=_Tue__1_Jul_2008_16_00_16_+1000_0I/iA73cmfdr=j3F--
