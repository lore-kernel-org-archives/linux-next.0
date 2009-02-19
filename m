From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: coming conflicts between wireless-2.6 and wireless-next-2.6
Date: Thu, 19 Feb 2009 16:01:16 +1100
Message-ID: <20090219160116.22acc43c.sfr@canb.auug.org.au>
References: <20090218030246.GA551@tuxdriver.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__19_Feb_2009_16_01_16_+1100_0Xd6GDZhI6suJlqn"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47660 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752660AbZBSFBW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 19 Feb 2009 00:01:22 -0500
In-Reply-To: <20090218030246.GA551@tuxdriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "John W. Linville" <linville@tuxdriver.com>
Cc: linux-next@vger.kernel.org

--Signature=_Thu__19_Feb_2009_16_01_16_+1100_0Xd6GDZhI6suJlqn
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi John,

On Tue, 17 Feb 2009 22:02:46 -0500 "John W. Linville" <linville@tuxdriver.c=
om> wrote:
>
> There are several conflicts in the latest rounds of the wireless trees.
> Most of them are simple.  One of them involves transporting some
> changes from "orinoco: do not resgister NULL pm_notifier function"
> between drivers/net/orinoco/orinoco.c (which no longer exists in -next)
> over to drivers/net/orinoco/main.c.
>=20
> I have an example 'merge-test' branch in wireless-next-2.6 to show
> how I think the conflicts should be resolved -- enjoy! :-)

Thanks for the heads up and your merge-test branch.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__19_Feb_2009_16_01_16_+1100_0Xd6GDZhI6suJlqn
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmc55wACgkQjjKRsyhoI8w0zQCeLq4NCohBk1DeHavEyDsyEWUA
opkAnAkB5oLvXbuaTWnJf0kAStxdruBp
=aLvV
-----END PGP SIGNATURE-----

--Signature=_Thu__19_Feb_2009_16_01_16_+1100_0Xd6GDZhI6suJlqn--
