From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the net tree with the net-current
 tree
Date: Mon, 23 Nov 2009 13:04:41 +1100
Message-ID: <20091123130441.b450278d.sfr@canb.auug.org.au>
References: <20091123120052.dd388203.sfr@canb.auug.org.au>
	<20091122.171932.74107512.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__23_Nov_2009_13_04_41_+1100_YRVRs5JiLpi/dfRe"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49649 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756068AbZKWCEp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 22 Nov 2009 21:04:45 -0500
In-Reply-To: <20091122.171932.74107512.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, eric.dumazet@gmail.com

--Signature=_Mon__23_Nov_2009_13_04_41_+1100_YRVRs5JiLpi/dfRe
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Sun, 22 Nov 2009 17:19:32 -0800 (PST) David Miller <davem@davemloft.net>=
 wrote:
>
> Hmmm... I specifically remember taking core of this conflict when I
> merged net-next-2.6 into net-2.6 yesterday or the day before.

These are the trees I picked up from master.kernel.org this morning:

$ git branch -r -v | grep '^ *net'
  net-current/master                                  5d09e53 netxen : fix =
BOND_MODE_TLB/ALB mode.
  net/master                                          e994b7c tcp: Don't ma=
ke syn cookies initial setting depend on CONFIG_SYSCTL

commit e994b7c901ded7200b525a707c6da71f2cf6d4bb
Author: David S. Miller <davem@davemloft.net>
Date:   Sat Nov 21 11:22:25 2009 -0800

Did you push them out?  master was down for a while yesterday ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__23_Nov_2009_13_04_41_+1100_YRVRs5JiLpi/dfRe
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksJ7bkACgkQjjKRsyhoI8ycdACgu/KOfCYZ65uD4isonVtvfuEQ
viMAoIE1mCzL/HiqTmttUkNHH6thboxW
=Hrz+
-----END PGP SIGNATURE-----

--Signature=_Mon__23_Nov_2009_13_04_41_+1100_YRVRs5JiLpi/dfRe--
