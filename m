From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the sched tree
Date: Mon, 7 Jul 2008 16:41:08 +1000
Message-ID: <20080707164108.250e9888.sfr@canb.auug.org.au>
References: <20080707142114.7985a9dd.sfr@canb.auug.org.au>
	<20080707060251.GA16144@elte.hu>
	<20080707061634.GA23191@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__7_Jul_2008_16_41_08_+1000_2FSg4bfZsTpU_dPn"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49630 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751584AbYGGGlP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Jul 2008 02:41:15 -0400
In-Reply-To: <20080707061634.GA23191@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Franck Bui-Huu <fbuihuu@gmail.com>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>

--Signature=_Mon__7_Jul_2008_16_41_08_+1000_2FSg4bfZsTpU_dPn
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Mon, 7 Jul 2008 08:16:34 +0200 Ingo Molnar <mingo@elte.hu> wrote:
>
> * Ingo Molnar <mingo@elte.hu> wrote:
>=20
> i.e. next time we see this pattern we should just do the header stub (or=
=20
> API stub) immediately, upstream.

Correct.  Though we should wait a little to make sure the API is
correct but once it hits -next is probably a good time.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__7_Jul_2008_16_41_08_+1000_2FSg4bfZsTpU_dPn
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhxuoQACgkQjjKRsyhoI8zDzQCfUB9kt3CC8yuM+UMxnCZegWrR
Ut4Anjlw/nd9OETBMPbkJobsi0hzsgW8
=qYgX
-----END PGP SIGNATURE-----

--Signature=_Mon__7_Jul_2008_16_41_08_+1000_2FSg4bfZsTpU_dPn--
