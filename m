From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: fate of the kvmtool tree
Date: Wed, 3 Oct 2012 15:29:21 +1000
Message-ID: <20121003152921.c08e7019d2ada843888a2570@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__3_Oct_2012_15_29_21_+1000_l/Yo5gZlC4nyfE6h"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:47459 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755691Ab2JCF3e (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 3 Oct 2012 01:29:34 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sasha Levin <levinsasha928@gmail.com>, Pekka Enberg <penberg@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Linus <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>

--Signature=_Wed__3_Oct_2012_15_29_21_+1000_l/Yo5gZlC4nyfE6h
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Well, here we are at another merge window and the kvmtool tree is still
not merged.  So, is it likely that it will be merged in this merge
window?  or the next?  If not, can I please remove it from linux-next
(and have it removed from the auto-latest branch of the tip tree) as it
just adds weight to the patches and the tree that people have to fetch to
work with.

It has been in linux-next since before v3.2 ...

 224 files changed, 25539 insertions(+), 1 deletion(-)
1266 commits

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Wed__3_Oct_2012_15_29_21_+1000_l/Yo5gZlC4nyfE6h
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJQa80xAAoJEECxmPOUX5FE83IQAI24btYrfcduB0Ht+4hwUxl1
bODjwar+z//SQC4TqnrkLjFfwK7JHS3wtW4MjpaNlmnOce1uuDbh19V/ZnRxRIrl
43yI21P/leTE2tA11nqRExRInOGnhorWcJEFbBPiEHcFJaD/23BHuefbdx9Ou0f8
kEPtuPZ4tu6JiRVUu8uZQKzX6BBct02v2Vv1+KautDRBE6/Kx4jxz7pNRMivcd7H
pLTXzTGyMKlxTM6XceELi552k1hCFeoo8xvognNeNKoT/FUe7kFB89EWn3QoerJ9
6FXIr4iD7bdYHjc/JZv5s+Rc1kGyzGrgq23QH8pTClUXVkKUfkuHzJsuwqKcwRKY
HA1x9NG5P5432EpH50O/T1zkqJYnogETcYcOqQu1LGYm1+1au7blcgAd1fTvTLJ2
pubYUNrISdtZmSeMkt+4Fr3S5oelwo7g0rbj5BK8mU3G/4O9ALLtbWV3BznispP4
9MgZ7/PprmRtAZlk1iICuzcbohDWETIztJtT3nxLsfBVexn85zLcjhUNtbGpGwPi
8elGiRO10MAzc9LoZqwCUrDObrflGBp2GliPVr832mOgJ/dpi9rSsBn4Fvk5Vjpi
zA39f1sDyU+LZ3ldk1iPDJSzLbAsUTUtZtZpn64JcBqp9gM2HK8m1lhH2iKTREWU
Bw89RXfmUaVyVkTumOkf
=w4gH
-----END PGP SIGNATURE-----

--Signature=_Wed__3_Oct_2012_15_29_21_+1000_l/Yo5gZlC4nyfE6h--
