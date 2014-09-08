From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Request to add linux-kselftest to linux-next
Date: Tue, 9 Sep 2014 09:23:27 +1000
Message-ID: <20140909092327.18363151@canb.auug.org.au>
References: <540DC2BD.7030506@osg.samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/RAFjUqHQm/Mxl0VVbVIOltr"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48274 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755213AbaIHXXf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 8 Sep 2014 19:23:35 -0400
In-Reply-To: <540DC2BD.7030506@osg.samsung.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Shuah Khan <shuahkh@osg.samsung.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, greg Kroah-Hartman <gregkh@linuxfoundation.org>, fengguang.wu@intel.com

--Sig_/RAFjUqHQm/Mxl0VVbVIOltr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Shuah,

On Mon, 08 Sep 2014 08:52:45 -0600 Shuah Khan <shuahkh@osg.samsung.com> wro=
te:
>
> Could you please add linux-kselftest tree to linux-next.
> I plan to maintain two branches:
>=20
> linux-kselftest for Kselftest Framework
>=20
> fixes - Contains changes intended for merging before the next major
>         release, including fixes for regressions introduced during
>         merge window.
> next  - Contains changes intended for merging during the next merge
>         window between a major release and -rc1.

I have added these branches at
git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git
from today with just you as the contact in case of conflicts or build
issues.  The trees are called kselftest-fixes and kselftest in
linux-next.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgment of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/RAFjUqHQm/Mxl0VVbVIOltr
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJUDjp0AAoJEMDTa8Ir7ZwVt9AP/0Cw9u7k7Zq3+pdlLZrwuOim
neTC7ci2LR7Pks206cIR/nU5e4ZJHVSZHss/V8mEma2lu6jO1BlnQmV1z6i7I18f
HMgzXzZVl+5JZ6N5r10hdlYcAe8vgI/aoAXcOtw2dxosAoSb6FUJ+6qPzVi+I2xu
h8qbrUBTVEklIwcCse/ITuH3+/Tge1hf1zzHgLxE21Sn5G3fqABeF+JwyEKxTrmh
/ebxU1wXVVpwiCjyVgfzySw6wb18Msdn9XKcUcr07N8XXMI0GyEGCYOUgoFyD891
Qa5ndW3Cl7nE8QVPt4i0DW7moYJcXqvqbPsSx+ZYfsN7tIUAMFJ9c9lSLJBxbOyH
I4bHfgkp/SxF13sIzPKqcqZN4Mz0yg91c0RUQtJfUDiF/Zu9hDkdXJ2E+BnJhpnI
rkxCqK17ahlyZFofE/J7+buI8zg3VTizhR2/jbEa8H2/Xi3cqXvccnLcIePBtLQx
mhPc9be2b8qYYdJb7DWDNp3N7qise5GSM1Pj+MTDxNfw9Oe/WFS60WidOFvBSHL3
sTPeLI0yIPTbYujjQCk5hY/mbHiOM2MAAnKhaG78SawJ34Y6/exKSIAdiwQbAz/D
ihFIMwa3MnBsmVj8bmt3zlIh3oBFxQl7ET+GV4NM9U6EbOcxnyMSkBOOO4Q0lxN/
vRSODII9N8BxW04tLT9O
=GhKl
-----END PGP SIGNATURE-----

--Sig_/RAFjUqHQm/Mxl0VVbVIOltr--
