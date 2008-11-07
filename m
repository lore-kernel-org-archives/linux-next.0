From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: perfmon3 tree build failure
Date: Sat, 8 Nov 2008 09:30:51 +1100
Message-ID: <20081108093051.58d45a2a.sfr@canb.auug.org.au>
References: <20081107200336.57abfca7.sfr@canb.auug.org.au>
	<7c86c4470811070516x21e7f77fk1129db02e2237fc4@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sat__8_Nov_2008_09_30_51_+1100__yRA5uR.L6Q./UYi"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52027 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751415AbYKGWa7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 7 Nov 2008 17:30:59 -0500
In-Reply-To: <7c86c4470811070516x21e7f77fk1129db02e2237fc4@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: eranian@gmail.com
Cc: stephane eranian <eranian@googlemail.com>, linux-next@vger.kernel.org

--Signature=_Sat__8_Nov_2008_09_30_51_+1100__yRA5uR.L6Q./UYi
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephane,

On Fri, 7 Nov 2008 14:16:32 +0100 "stephane eranian" <eranian@googlemail.co=
m> wrote:
>
> All problems have been fixed in my linux-next tree.

Excellent.

> For sched.h, it is a bit more complicated because of Itanium.
> On Itanium, there is an older version of perfmon called v2.0. It used
> to use CONFIG_PERFMON but that clashed with new perfmon also
> using the same macro. So my first patch renamed CONFIG_PERFMON
> into CONFIG_PERFMON_V20 for Itanium. In sched.h however, the pfm_context
> field is used by both the legacy Itanium v2.0 and new perfmon. The fix is
> to add this field if either CONFIG_PERFMON or CONFIG_PERFMON_V20
> is set.

This is why I prefer to leave fixes to people who know the code :-)

> I also made the changes for fsuid and fsgid.

Great.

> Just pull from my linux-next tree again.

Will do.  I automatically refetch all the trees before each time I create
the linux-next tree.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sat__8_Nov_2008_09_30_51_+1100__yRA5uR.L6Q./UYi
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkUwZsACgkQjjKRsyhoI8xSSwCeM62vTcs6M0CB6ppR44+y9GmI
e/sAnR1l6gJzkyv+A3xUTPZ/7IVeCMAM
=axZl
-----END PGP SIGNATURE-----

--Signature=_Sat__8_Nov_2008_09_30_51_+1100__yRA5uR.L6Q./UYi--
