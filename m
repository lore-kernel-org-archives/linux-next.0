From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the net tree
Date: Wed, 12 May 2010 16:51:30 +1000
Message-ID: <20100512165130.f808f3d1.sfr@canb.auug.org.au>
References: <20100512125653.38f442c5.sfr@canb.auug.org.au>
	<20100511.231339.22535803.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__12_May_2010_16_51_30_+1000_coEJ9PXMt2d0oT7R"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40556 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750778Ab0ELGvg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 12 May 2010 02:51:36 -0400
In-Reply-To: <20100511.231339.22535803.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, kaber@trash.net, andreas.meissner@sphairon.com

--Signature=_Wed__12_May_2010_16_51_30_+1000_coEJ9PXMt2d0oT7R
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Tue, 11 May 2010 23:13:39 -0700 (PDT) David Miller <davem@davemloft.net>=
 wrote:
>
> Tricky merge :-)

Yeah, I got it right the second time :-)

> I'll clear all of these issues up for you tonight Stephen, thanks!

Thanks.

> There should have been a merge conflict in
> Documentation/feature-removal-schedule.txt due to some recent
> netfilter commits too, I'll take care of that too of course :)

Yeah, but I have stopped reporting those when they are just clashes
between people adding new entries at the end.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__12_May_2010_16_51_30_+1000_coEJ9PXMt2d0oT7R
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkvqT/IACgkQjjKRsyhoI8zWTgCgk88/Y4c//Moi9u67xWJO+u9l
tK8AoL0p2WQKHc1HXQ5cnVDIo0ZS7lHU
=0WTZ
-----END PGP SIGNATURE-----

--Signature=_Wed__12_May_2010_16_51_30_+1000_coEJ9PXMt2d0oT7R--
