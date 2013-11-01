From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] scripts/kallsyms: filter symbols not in kernel address
 space
Date: Fri, 1 Nov 2013 15:38:33 +1100
Message-ID: <20131101153833.bbf03337eaf943052dae662b@canb.auug.org.au>
References: <1382975339-25831-1-git-send-email-tom.leiming@gmail.com>
	<20131031154311.e65d16d79ba540ced736413b@linux-foundation.org>
	<CACVXFVMJmQJd0cFaZcmZZvFpUQUmTPJRj87QBVr0kbgZxjq8dw@mail.gmail.com>
	<87d2mkc0gk.fsf@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Fri__1_Nov_2013_15_38_33_+1100_RC_UZZaYZDPCdw3A"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:60215 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751682Ab3KAGVx (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 1 Nov 2013 02:21:53 -0400
In-Reply-To: <87d2mkc0gk.fsf@rustcorp.com.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Ming Lei <tom.leiming@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Michal Marek <mmarek@suse.cz>, linux-next@vger.kernel.org

--Signature=_Fri__1_Nov_2013_15_38_33_+1100_RC_UZZaYZDPCdw3A
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

On Fri, 01 Nov 2013 13:06:27 +1030 Rusty Russell <rusty@rustcorp.com.au> wr=
ote:
>
> Stephen, please run this on todays' linux-next, so I can push to Linus
> asap.  Thanks...

OK, I will apply this near the end of linux-next today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Fri__1_Nov_2013_15_38_33_+1100_RC_UZZaYZDPCdw3A
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCAAGBQJSczBJAAoJEMDTa8Ir7ZwVfB4P/jspCBjug90gO00RyJe6iUd9
oXi/kO+66I/DEfUA27fjOTN73A+EZ93C7uGW8Ow/euPti7pRzjCTc594/49NWoC9
kEeX3blXnOD/DJg0jB7ZRD+k4Nj6WpH29Kg8oUMXWVHO1ab1rHsF2x2wGgdwVL2X
BIhZYlv8f5c8m7Hcg1AaaNBulseE8AGxo71q3/8eqeNhukcgFyzAxagnrgBT0nBQ
MbEq1cuPk1Be/kBrTzwHU/WAIVMB841L/s8BHaliJg0JbPa8SVXjX3mra3NswVeJ
1gqnQ2I6KXpedWvbqcJMhPIxs1a0N358gOqvZ+Z/g1wAov7GGIULht/soFkVbnY1
7eldeOAaKd5VlDYuQT/qOlZg2yMec7/RH47t5eQvrEFazacN06tYDoiePu79eYAk
hrBfQpVfE/LKNR39YnIi2sff/Zxy5PiiUpYeCWT7IgR9UhJ7ud/+nhzqEBiie8Rv
lPLFAasqlk5lbTFDPlS8nKg0/ZQHqLjjq6RWqdVjqJzLtjM1fkrD01NV/xThW+IQ
NdOVCzv+AhNXxi0TcRQPlxojVQxeKGL6gztTb+RWYGlVJsJuVeqk1BJXYCUdUObL
w6mU8dowyFB/4yQtI0OCVttY87X2oLfvKi2UMLXF3ANkc09oueFpjUR5xoHqn2aV
YCH021PGiSem1OGScxsn
=gQCg
-----END PGP SIGNATURE-----

--Signature=_Fri__1_Nov_2013_15_38_33_+1100_RC_UZZaYZDPCdw3A--
