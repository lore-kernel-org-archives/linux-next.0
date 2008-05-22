From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: bkl-removal/arm merge conflict
Date: Fri, 23 May 2008 09:35:59 +1000
Message-ID: <20080523093559.9f6cfa0e.sfr@canb.auug.org.au>
References: <20080522152157.57dac9f7.sfr@canb.auug.org.au>
	<10532.1211465785@vena.lwn.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__23_May_2008_09_35_59_+1000_b2FoIJzf4qQf8UTH"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46968 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755027AbYEVXgM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 22 May 2008 19:36:12 -0400
In-Reply-To: <10532.1211465785@vena.lwn.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-next@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Russell King <rmk@arm.linux.org.uk>

--Signature=_Fri__23_May_2008_09_35_59_+1000_b2FoIJzf4qQf8UTH
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jon,

On Thu, 22 May 2008 08:16:25 -0600 corbet@lwn.net (Jonathan Corbet) wrote:
>
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>=20
> > Today's linux-next merge of the bkl-removal tree got a conflict in
> > arch/arm/common/rtctime.c between commit
> > b204d462d7eae31413c5ac80ec3a32a89765fd46 ("[RTC] remove old ARM rtc
> > library code") from the arm tree and commit
> > f6f28a87d5f4ae2b101e64ab494267f6858631c4 ("arm-common-rtctime: BKL
> > pushdown") from the bkl-removal tree.
>=20
> OK, that commit has been removed.  Thanks, Stephen.

Thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__23_May_2008_09_35_59_+1000_b2FoIJzf4qQf8UTH
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFINgNpTgG2atn1QN8RAn34AJsGQAswuD1UgE1RessnHTZtGvgr+QCfXx/j
2/ikMOmQMYkRvC2AhgZZw0Y=
=JrGE
-----END PGP SIGNATURE-----

--Signature=_Fri__23_May_2008_09_35_59_+1000_b2FoIJzf4qQf8UTH--
