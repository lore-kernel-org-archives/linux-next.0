From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next tree for s390 and cputime
Date: Mon, 19 Dec 2011 09:36:59 +1100
Message-ID: <20111219093659.104c96f11065a0d09eee4883@canb.auug.org.au>
References: <20111216133712.56957b33@de.ibm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Mon__19_Dec_2011_09_36_59_+1100_q9roVFCs.HERUTc9"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from calzone.tip.net.au ([203.10.76.15]:51083 "EHLO
	calzone.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751968Ab1LRWhI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 18 Dec 2011 17:37:08 -0500
In-Reply-To: <20111216133712.56957b33@de.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Martin Schwidefsky <schwidefsky@de.ibm.com>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>, linux-next@vger.kernel.org

--Signature=_Mon__19_Dec_2011_09_36_59_+1100_q9roVFCs.HERUTc9
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Martin,

On Fri, 16 Dec 2011 13:37:12 +0100 Martin Schwidefsky <schwidefsky@de.ibm.c=
om> wrote:
>
> we completed the move of the s390 tree from marist.edu to kernel.org.
> Please update the git pull for linux-next of the s390 and the cputime
> tree to use the following two new locations:
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git features
> git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git cputime

I have switched to using those now.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__19_Dec_2011_09_36_59_+1100_q9roVFCs.HERUTc9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBCAAGBQJO7msLAAoJEECxmPOUX5FEinwP/3HlGskQmsxzmb/qil98pj4t
ErFOL3Z2Mby1VLq1/hVciKzj3nM5P0aGlUrqJRBF8u/3KgruhrI3JqMLbdCj4Ezp
Bvte3ajUfrLG0HXo2I8qEE3vgX6bgKOC7XhGc8+TrYt3+Z+BcF7G9XI1mjvqpOvm
RIQbyHQZS93R3eis5CQQILHzXG+dzeYni+ZLonFVPKQkQfZCieiUMykFmiIjNXkT
G4TruhdQWlKq1f0LqDqpqpVts2smu/ZdvTeGh7zl2LoP1EAbeRkX9KKHq1njARAQ
hhsW0tlBTqY2ZJN3U7Nh0PgcPBPUhjNakywh6wa7SxRr4WykISNHXT79jbf8+zxQ
Xw1vH8RwwQdL37qcwW2e6t9mlvzjkx/dbDnCJ1lkpXYNxBGEFPPxG17QSxbHzfg+
uav4/SpzacS1zEpc7o8ljJ5UrAB3R00WMG7xH5jpB3/2QyGE9Xco1t4a4s4H7f08
hi4Si62od0u0ee870WZCsrIK+/frMKSUDFfOCpmEX2P+Yb6Al2ulTbqVXdBDxXUn
9uqwV/G1Jsgunrli881Jy4t2vy5DejYqiY0nxYTpv1qYyYkfv9XZ3F+5GpZIU8Rh
zaTO6IHmULvnAvSR+izYjljKEuWyaL60hEh5TjWE3YMhx+6Dae+hkuFFUkwdIHNk
9+ofjfptlFvtIC4k40Wr
=fDz7
-----END PGP SIGNATURE-----

--Signature=_Mon__19_Dec_2011_09_36_59_+1100_q9roVFCs.HERUTc9--
