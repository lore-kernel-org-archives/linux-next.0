From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: tree addition request
Date: Tue, 24 Nov 2009 18:41:28 +1100
Message-ID: <20091124184128.fe04cb08.sfr@canb.auug.org.au>
References: <20091123223044.GM23772@trinity.fluff.org>
	<20091124105114.2149e4a0.sfr@canb.auug.org.au>
	<20091124083947.0743c7d5@hyperion.delvare>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__24_Nov_2009_18_41_28_+1100_+JmycNT2zXNlRjj_"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54459 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757669AbZKXHl1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 24 Nov 2009 02:41:27 -0500
In-Reply-To: <20091124083947.0743c7d5@hyperion.delvare>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jean Delvare <khali@linux-fr.org>
Cc: Ben Dooks <ben-linux@fluff.org>, linux-next@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>

--Signature=_Tue__24_Nov_2009_18_41_28_+1100_+JmycNT2zXNlRjj_
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jean,

On Tue, 24 Nov 2009 08:39:47 +0100 Jean Delvare <khali@linux-fr.org> wrote:
>
> Ben and me co-maintain the i2c subsystem. I take care of i2c-core and
> PC driver, while Ben maintains the embedded platform drivers. There
> should be no overlapping in our trees.

OK, thanks.  That is the case today.

> Ideally my tree would be included first, in case Ben has changes which
> depend on i2c-core changes (which would belong to my tree). But I can't
> remember such a case in the past, so I don't expect it to be frequent.

I have done that as well.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__24_Nov_2009_18_41_28_+1100_+JmycNT2zXNlRjj_
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksLjigACgkQjjKRsyhoI8ydkgCfWFFUH0vo2VxhFycG0B6caDgS
LB8AnRfSRKmZWP1HT2EygjqnRheWve6i
=5joW
-----END PGP SIGNATURE-----

--Signature=_Tue__24_Nov_2009_18_41_28_+1100_+JmycNT2zXNlRjj_--
