From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: security-testing/net tree build failure
Date: Mon, 14 Sep 2009 14:56:23 +1000
Message-ID: <20090914145623.6cf45f8e.sfr@canb.auug.org.au>
References: <20090903161432.44af630d.sfr@canb.auug.org.au>
	<20090914130154.8b6df8f9.sfr@canb.auug.org.au>
	<20090913.214644.164044855.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__14_Sep_2009_14_56_23_+1000_H7f0ue38xXNCfr1b"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37561 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750696AbZINE42 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 14 Sep 2009 00:56:28 -0400
In-Reply-To: <20090913.214644.164044855.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, paul.moore@hp.com, jmorris@namei.org, mst@redhat.com

--Signature=_Mon__14_Sep_2009_14_56_23_+1000_H7f0ue38xXNCfr1b
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Sun, 13 Sep 2009 21:46:44 -0700 (PDT) David Miller <davem@davemloft.net>=
 wrote:
>
> Ok, since I already sent a merge request to Linus I'll submit this
> as soon as he does that pull.
>=20
> I don't like "slipping" in things to a tree I've already asked
> him to pull from, and in this case especially since I'd have
> to merge his tree in to keep net-next-2.6 itself building.
> :-)

You might like to send him an email pointing out this merge fix, as when
he merges your tree, it will fail to build tun ... and, if he is told, he
can put this fix in the merge commit so there is no bisection breakage.
This is all presuming that commit
89f56d1e91cfa535ccc6cc60e9e12e02682fd972 ("tun: reuse struct sock
fields") is in the tree you asked him to pull.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__14_Sep_2009_14_56_23_+1000_H7f0ue38xXNCfr1b
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkqtzPcACgkQjjKRsyhoI8wNiwCghX3tLzr3v3wA7b73RSzvqbTZ
UQUAoKFKFSH5IogKIbRo7TC67DC98661
=h+zC
-----END PGP SIGNATURE-----

--Signature=_Mon__14_Sep_2009_14_56_23_+1000_H7f0ue38xXNCfr1b--
