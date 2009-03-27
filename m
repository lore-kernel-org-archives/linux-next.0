From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: tracing/powerpc tree build failure
Date: Sat, 28 Mar 2009 01:21:17 +1100
Message-ID: <20090328012117.4669e153.sfr@canb.auug.org.au>
References: <20090327230834.93d0221d.sfr@canb.auug.org.au>
	<1238158131.22033.10.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sat__28_Mar_2009_01_21_17_+1100_cZk=LqB1Ghvdy/83"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39506 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752811AbZC0OV2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 27 Mar 2009 10:21:28 -0400
In-Reply-To: <1238158131.22033.10.camel@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Rostedt <srostedt@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@ozlabs.org

--Signature=_Sat__28_Mar_2009_01_21_17_+1100_cZk=LqB1Ghvdy/83
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Steve,

On Fri, 27 Mar 2009 08:48:51 -0400 Steven Rostedt <srostedt@redhat.com> wro=
te:
>
> I knew this was going to break, but I needed to wait till powerpc merged
> with tip before I could make the change.

Yeah, a bit of a pain but we can live with it for a while.

> This is exactly what I would have done.

Thanks for the confirmation.  I guess I will keep applying this until one
tree or the other hits mainline at which point it can be fixed in the
other tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sat__28_Mar_2009_01_21_17_+1100_cZk=LqB1Ghvdy/83
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknM4N4ACgkQjjKRsyhoI8zyXwCgt0zjiyV2mtMCeoFDhoCxnz2t
oIwAnRz2e3ORvJleGZStSfpIDUecj6EQ
=l+wa
-----END PGP SIGNATURE-----

--Signature=_Sat__28_Mar_2009_01_21_17_+1100_cZk=LqB1Ghvdy/83--
