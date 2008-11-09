From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: arm build failure
Date: Sun, 9 Nov 2008 21:45:11 +1100
Message-ID: <20081109214511.10930570.sfr@canb.auug.org.au>
References: <20081107131128.1cf9feb2.sfr@canb.auug.org.au>
	<20081109102612.GA1288@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sun__9_Nov_2008_21_45_11_+1100__58xv6Eus7tV199d"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39573 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753849AbYKIKpV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 9 Nov 2008 05:45:21 -0500
In-Reply-To: <20081109102612.GA1288@flint.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org

--Signature=_Sun__9_Nov_2008_21_45_11_+1100__58xv6Eus7tV199d
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Russell,

On Sun, 9 Nov 2008 10:26:12 +0000 Russell King <rmk@arm.linux.org.uk> wrote:
>
> On Fri, Nov 07, 2008 at 01:11:28PM +1100, Stephen Rothwell wrote:
> > An arm rpc_defconfig build of next-20081106 produced these errors:
> >=20
> > arch/arm/mm/copypage-v3.c:37: error: 'from' undeclared (first use in th=
is function)
> > arch/arm/mm/copypage-v3.c:37: error: 'to' undeclared (first use in this=
 function)
> >=20
> > Caused by commit dbe92c825b7b9be950135da97f6f293caaeaa083 ("[ARM]
> > copypage: convert assembly files to C").
>=20
> Should now be fixed.

Thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sun__9_Nov_2008_21_45_11_+1100__58xv6Eus7tV199d
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkWvzcACgkQjjKRsyhoI8yfbQCfTchyE8KQukKM3lGvFx6VZiW3
BywAn3LgZ4OhPVPLDS+V++tg7T0P1DMe
=DP/O
-----END PGP SIGNATURE-----

--Signature=_Sun__9_Nov_2008_21_45_11_+1100__58xv6Eus7tV199d--
