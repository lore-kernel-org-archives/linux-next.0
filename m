From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: boot-params tree build failure
Date: Wed, 17 Dec 2008 18:04:40 +1100
Message-ID: <20081217180440.d0256b69.sfr@canb.auug.org.au>
References: <20081217174035.58b79167.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__17_Dec_2008_18_04_40_+1100_W2PqFZ9x632xnn_c"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58563 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751005AbYLQHEt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 17 Dec 2008 02:04:49 -0500
In-Reply-To: <20081217174035.58b79167.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Chris Zankel <chris@zankel.net>

--Signature=_Wed__17_Dec_2008_18_04_40_+1100_W2PqFZ9x632xnn_c
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

On Wed, 17 Dec 2008 17:40:35 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> The build of next-20081216 (xtensa defconfig) failed like this:
>=20
> arch/xtensa/kernel/setup.c:284: error: 'cmdline_p' undeclared (first use =
in this function)
>=20
> Caused by commit 0de5c2d9f02d2018fd671ca1015432dffa5eb338 ("param:
> arch_get_boot_command_line()") from the boot-params tree.

I will drop the boot-params tree for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__17_Dec_2008_18_04_40_+1100_W2PqFZ9x632xnn_c
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklIpIgACgkQjjKRsyhoI8wv+wCfZBZhNSSGCFjjEtHjynazmMYE
82oAoKGfK90QGEJtg9FLD17M8gkUyvYg
=ub3y
-----END PGP SIGNATURE-----

--Signature=_Wed__17_Dec_2008_18_04_40_+1100_W2PqFZ9x632xnn_c--
