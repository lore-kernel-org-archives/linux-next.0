From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Warning from ring buffer code (Was: Re: linux-next: tip tree
 build warning)
Date: Tue, 15 Sep 2009 08:36:01 +1000
Message-ID: <20090915083601.41bf16e1.sfr@canb.auug.org.au>
References: <20090804161640.70817ee6.sfr@canb.auug.org.au>
	<1249403089.4634.139.camel@localhost.localdomain>
	<20090912165300.9d257283.sfr@canb.auug.org.au>
	<20090912073906.GA3972@elte.hu>
	<1252936201.2964.59.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__15_Sep_2009_08_36_01_+1000_icbpFa729/f1lXND"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40491 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757457AbZINWgH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 14 Sep 2009 18:36:07 -0400
In-Reply-To: <1252936201.2964.59.camel@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Rostedt <srostedt@redhat.com>
Cc: Ingo Molnar <mingo@elte.hu>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Tue__15_Sep_2009_08_36_01_+1000_icbpFa729/f1lXND
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Steve,

On Mon, 14 Sep 2009 09:50:01 -0400 Steven Rostedt <srostedt@redhat.com> wro=
te:
>
> On Sat, 2009-09-12 at 09:39 +0200, Ingo Molnar wrote:
> > * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>=20
> > > Now that this is in Linus' tree, can we have a fix for the waning,=20
> > > please?
> >=20
> > The first warning got fixed 1.5 months ago - the second one at line=20
> > 797 is still there but harmless - you can ignore it for now, it will=20
> > be fixed.
>=20
> The first warning never got fixed. The typecast was placed in the wrong
> spot (my fault). I sent another patch that fixes both warnings.

Thanks for that.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__15_Sep_2009_08_36_01_+1000_icbpFa729/f1lXND
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkquxVEACgkQjjKRsyhoI8wHFwCaAqaPkFm9aq3oOUc1i0OH52Vy
29kAn2isI+Mtp/4iVipP4u0JYDu8rThJ
=gFS3
-----END PGP SIGNATURE-----

--Signature=_Tue__15_Sep_2009_08_36_01_+1000_icbpFa729/f1lXND--
