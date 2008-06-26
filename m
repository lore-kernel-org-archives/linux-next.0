From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree
Date: Thu, 26 Jun 2008 15:40:20 +1000
Message-ID: <20080626154020.b8979c6a.sfr@canb.auug.org.au>
References: <20080613215601.GA8345@tuxdriver.com>
	<20080625180430.GA13730@tuxdriver.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__26_Jun_2008_15_40_20_+1000_DxcNKsGyiHi4gCfu"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38453 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757474AbYFZFke (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Jun 2008 01:40:34 -0400
In-Reply-To: <20080625180430.GA13730@tuxdriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "John W. Linville" <linville@tuxdriver.com>
Cc: linux-next@vger.kernel.org, David Miller <davem@davemloft.net>

--Signature=_Thu__26_Jun_2008_15_40_20_+1000_DxcNKsGyiHi4gCfu
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi John, Dave,

On Wed, 25 Jun 2008 14:04:30 -0400 "John W. Linville" <linville@tuxdriver.c=
om> wrote:
>
> I just sent a pull request for Dave that will result in nasty-looking
> conflict in iwl4965-base.c.  I have a sample merge available here:
>=20
> 	git://git.kernel.org/pub/scm/linux/kernel/git/linville/wireless-next-2.6=
 merge-test
>=20
> The overview of the resolution is to ignore any changes in
> iwl4965-base.c and take drivers/net/wireless/iwlwifi/iwl-scan.c from
> the URL above.

I have done as instructed.  Thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__26_Jun_2008_15_40_20_+1000_DxcNKsGyiHi4gCfu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhjK8QACgkQTgG2atn1QN/zEwCgk+cXmR4s01VHycJcvY/ahHMj
rGYAn0TKb6J2Yeyu47wBJKpJg5ZDJTQw
=PCrS
-----END PGP SIGNATURE-----

--Signature=_Thu__26_Jun_2008_15_40_20_+1000_DxcNKsGyiHi4gCfu--
