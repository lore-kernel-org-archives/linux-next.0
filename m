From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for May 19
Date: Tue, 20 May 2008 14:19:01 +1000
Message-ID: <20080520141901.6395a2a1.sfr@canb.auug.org.au>
References: <20080519174120.2083ea57.sfr@canb.auug.org.au>
	<1211222520.30161.3.camel@dhcppc1>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__20_May_2008_14_19_01_+1000_EvQ5ZPP63iJl/jjc"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33705 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750899AbYETETJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 20 May 2008 00:19:09 -0400
In-Reply-To: <1211222520.30161.3.camel@dhcppc1>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Meyer <thomas@m3y3r.de>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

--Signature=_Tue__20_May_2008_14_19_01_+1000_EvQ5ZPP63iJl/jjc
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Mon, 19 May 2008 20:42:00 +0200 Thomas Meyer <thomas@m3y3r.de> wrote:
>
> Is it intentional that kernel.release is:
>=20
> $ cat include/config/kernel.release=20
> 2.6.26-rc3-next-20080519-sched-devel.git
>=20
> all predecessors have had names like:
> =EF=BB=BF2.6.26-rc2-next-20080516

It was not intentional, I missed it sneaking in.  It seems to be gone
again today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__20_May_2008_14_19_01_+1000_EvQ5ZPP63iJl/jjc
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIMlE5TgG2atn1QN8RAtrKAJ0eozOwI60iRtYIGMcm6kz9ptBjrwCeOHK9
NRPBTe0eATOS4G+GVQa3/zI=
=rfqt
-----END PGP SIGNATURE-----

--Signature=_Tue__20_May_2008_14_19_01_+1000_EvQ5ZPP63iJl/jjc--
