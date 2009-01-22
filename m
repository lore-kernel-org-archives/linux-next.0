From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: ide tree build failure
Date: Fri, 23 Jan 2009 09:14:57 +1100
Message-ID: <20090123091457.ba39e548.sfr@canb.auug.org.au>
References: <20090122125700.bde1fabe.sfr@canb.auug.org.au>
	<200901221422.34187.bzolnier@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__23_Jan_2009_09_14_57_+1100_sZlkKP4d9zxgcl4w"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58839 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752676AbZAVWPD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 22 Jan 2009 17:15:03 -0500
In-Reply-To: <200901221422.34187.bzolnier@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Cc: linux-next@vger.kernel.org

--Signature=_Fri__23_Jan_2009_09_14_57_+1100_sZlkKP4d9zxgcl4w
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bart,

On Thu, 22 Jan 2009 14:22:34 +0100 Bartlomiej Zolnierkiewicz <bzolnier@gmai=
l.com> wrote:
>
> Yeah, ide-eh.c should explicitly include <linux/delay.h>
> (on x86 it gets pulled indirectly so I haven't noticed it).

Indeed.

> Should be fixed now.

Thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__23_Jan_2009_09_14_57_+1100_sZlkKP4d9zxgcl4w
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkl47+EACgkQjjKRsyhoI8wgwgCgpodEqYSb02CIsdWQy0ADT5yJ
pC8AoId5s1pueAeGdl7fR34YI9VfMUmO
=WpkG
-----END PGP SIGNATURE-----

--Signature=_Fri__23_Jan_2009_09_14_57_+1100_sZlkKP4d9zxgcl4w--
