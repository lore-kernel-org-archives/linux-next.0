From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: driver-core tree build failure
Date: Wed, 19 Nov 2008 13:22:14 +1100
Message-ID: <20081119132214.681066b4.sfr@canb.auug.org.au>
References: <20081119113031.28e2ae68.sfr@canb.auug.org.au>
	<ac3eb2510811181640r6c864c7en28a097d3e7c1ab75@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__19_Nov_2008_13_22_14_+1100_8Rb6TbXtFkKf+hov"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40530 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751926AbYKSCW0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 18 Nov 2008 21:22:26 -0500
In-Reply-To: <ac3eb2510811181640r6c864c7en28a097d3e7c1ab75@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kay Sievers <kay.sievers@vrfy.org>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org

--Signature=_Wed__19_Nov_2008_13_22_14_+1100_8Rb6TbXtFkKf+hov
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Kay,

[Firstly, let me say that I appreciate all the work you are doing ...]

On Wed, 19 Nov 2008 01:40:42 +0100 "Kay Sievers" <kay.sievers@vrfy.org> wro=
te:
>
> Is this the only one, or only the first failure you've seen with the
> driver-core tree? Some of the patches we've been unable to test, and
> unfortunately the maintainers didn't respond for weeks now.

It is the first since that series of patches was added to the
driver-core tree yesterday, but I have only built for powerpc and x86_64
so far.

The patch had a CC for Paul Mackerras but not for the list associated
with the PowerPC archiecture (in MAINTAINERS - linuxppc-dev@ozlabs.org).
Some maintainers are very busy and cannot (or don't) test every single
patch sent to them but the patches would probably would receive more
attention if CC'd to the associated list.  [I am on the particular list
and didn't see that patch posted.]

[And the Acked-by: Geoff Levand would really only cover the ps3 part of
the patch.]

In any case, I assume it will be fixed tomorrow in Greg's tree.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__19_Nov_2008_13_22_14_+1100_8Rb6TbXtFkKf+hov
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkjeFYACgkQjjKRsyhoI8wK5gCeMOQ+Vj0QWaRO5XevUVx/t7n2
ZNEAoJKjIMGCI6A51JcH3gSaOqoUggZ4
=8uS0
-----END PGP SIGNATURE-----

--Signature=_Wed__19_Nov_2008_13_22_14_+1100_8Rb6TbXtFkKf+hov--
