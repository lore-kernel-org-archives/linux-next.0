From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for September 17
Date: Sat, 18 Sep 2010 09:20:21 +1000
Message-ID: <20100918092021.1e6cdcec.sfr@canb.auug.org.au>
References: <20100917135832.ab83b7cf.sfr@canb.auug.org.au>
	<20100917094614.dc9a7c96.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sat__18_Sep_2010_09_20_21_+1000_+F5I2kaOsbWbDIrb"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42401 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752168Ab0IQXUa (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 17 Sep 2010 19:20:30 -0400
In-Reply-To: <20100917094614.dc9a7c96.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

--Signature=_Sat__18_Sep_2010_09_20_21_+1000_+F5I2kaOsbWbDIrb
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Randy,

On Fri, 17 Sep 2010 09:46:14 -0700 Randy Dunlap <randy.dunlap@oracle.com> w=
rote:
>
> btw, what is this file?
>=20
> -rw-r--r-- 	126 	t_first_entry(&list, struct net_device, todo_list); 	blo=
b | history | raw

Ah, that was generated from a bad cut-and-paste into the shell while I
was diagnosing a problem with the merge of the rcu tree.  It will not be
there next time.

Sorry about that.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sat__18_Sep_2010_09_20_21_+1000_+F5I2kaOsbWbDIrb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMk/e1AAoJEDMEi1NhKgbsuqkH/0ssTyF60bNYWdsVlW7HM5/k
btjZ0jC0Ah+dE6Gvel69ONFE04HVy45zd660p5XSpg6HRx7Nmu9pCX2DLeRGvyAW
SEyCXddjfkwqwjPo2XY8EYvagN3aXGzYQ1TAs5d/Ls+ueJJrCZxXx/cRDySVcEHU
1IRQ8BJkMJ4htUxp/7vzNA8+HqIywkuI+sxU8GytR2+u20Ty8bnRyOhT8aj1eAoJ
QIMCO0qjiBn1j00TGEXzo29EADUrWStXM/Zzjnbi9yxht25GBhfz6Rv6rVGoNZJa
xIpZndxyjPBX+5oMudyLwR9SqwnVrrrGkfkR3IClXvW5f7aJVGdAVorx9cvgRec=
=C2Ob
-----END PGP SIGNATURE-----

--Signature=_Sat__18_Sep_2010_09_20_21_+1000_+F5I2kaOsbWbDIrb--
