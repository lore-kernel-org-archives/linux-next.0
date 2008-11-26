From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: ftrace tree build failure
Date: Wed, 26 Nov 2008 11:08:47 +1100
Message-ID: <20081126110847.4d9cf9f2.sfr@canb.auug.org.au>
References: <20081125140719.03a8cdfb.sfr@canb.auug.org.au>
	<20081125072801.GA15592@elte.hu>
	<20081125184335.330cf28e.sfr@canb.auug.org.au>
	<20081125080410.GA28912@elte.hu>
	<20081125145701.GA25962@tuxdriver.com>
	<20081125184630.GA5950@tesla>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__26_Nov_2008_11_08_47_+1100_B3ODIKRt1oShY+HP"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42357 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752068AbYKZAJG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 25 Nov 2008 19:09:06 -0500
In-Reply-To: <20081125184630.GA5950@tesla>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Luis R. Rodriguez" <lrodriguez@atheros.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, Ingo Molnar <mingo@elte.hu>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Steven Rostedt <srostedt@redhat.com>, Luis Rodriguez <Luis.Rodriguez@Atheros.com>, "David S. Miller" <davem@davemloft.net>

--Signature=_Wed__26_Nov_2008_11_08_47_+1100_B3ODIKRt1oShY+HP
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, 25 Nov 2008 10:46:30 -0800 "Luis R. Rodriguez" <lrodriguez@atheros.=
com> wrote:
>
> On Tue, Nov 25, 2008 at 06:57:01AM -0800, John W. Linville wrote:
> > I have the patch now...thanks!
> >=20
> > Now, if I only knew why my build didn't fail with the original code...
>=20
> Same here I run tests with sparse too prior to sending patches.

It is valid C.

	if (a, b)

you evaluate a and discard it then evaluate b and that is the value of
the conditional expression.  In this case b is just a string which is
effectively a non NULL "const char *" which is just non zero as far as if
is concerned. So the conditional expression evaluates to (constant)
true.  So this was, in fact a bug ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__26_Nov_2008_11_08_47_+1100_B3ODIKRt1oShY+HP
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkksk48ACgkQjjKRsyhoI8yiHwCgr51J9Y8+2Ga++RfaHEYWpc2C
P78AmwdaKhkVcFIWGxvwzdW6stWGh/vy
=0qPV
-----END PGP SIGNATURE-----

--Signature=_Wed__26_Nov_2008_11_08_47_+1100_B3ODIKRt1oShY+HP--
