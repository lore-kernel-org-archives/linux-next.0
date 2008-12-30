From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the sched tree
Date: Wed, 31 Dec 2008 10:45:48 +1100
Message-ID: <20081231104548.000c5729.sfr@canb.auug.org.au>
References: <20081222120543.92004d90.sfr@canb.auug.org.au>
	<20081222063501.GA29160@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__31_Dec_2008_10_45_48_+1100_U.tdTSVKX_1UDopQ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35289 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752241AbYL3Xp4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 30 Dec 2008 18:45:56 -0500
In-Reply-To: <20081222063501.GA29160@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Steven Rostedt <rostedt@goodmis.org>

--Signature=_Wed__31_Dec_2008_10_45_48_+1100_U.tdTSVKX_1UDopQ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Mon, 22 Dec 2008 07:35:02 +0100 Ingo Molnar <mingo@elte.hu> wrote:
>
>=20
> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>=20
> >  +#define nmi_enter()				\
> >  +	do {					\
> >  +		ftrace_nmi_enter();		\
> >  +		lockdep_off();			\
> > ++		rcu_nmi_enter();		\
> >  +		__irq_enter();			\
> >  +	} while (0)
> >  +#define nmi_exit()				\
> >  +	do {					\
> >  +		__irq_exit();			\
> > ++		rcu_nmi_exit();			\
> >  +		lockdep_on();			\
> >  +		ftrace_nmi_exit();		\
> >  +	} while (0)
>=20
> yes, that's the same resolution i did for this conflict three days ago in=
=20
> tip/master. Thanks,

This conflict is now the sched tree and Linus' tree.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__31_Dec_2008_10_45_48_+1100_U.tdTSVKX_1UDopQ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklasqwACgkQjjKRsyhoI8w0TQCePNEKDYuBHuW2r3IhtysKZEJ5
GjcAn2mQEU57HXru5AoLpmYtDeMy3Q2f
=MzPE
-----END PGP SIGNATURE-----

--Signature=_Wed__31_Dec_2008_10_45_48_+1100_U.tdTSVKX_1UDopQ--
