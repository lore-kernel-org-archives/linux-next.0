From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the ide tree
Date: Fri, 18 Jul 2008 10:42:17 +1000
Message-ID: <20080718104217.44b97e58.sfr@canb.auug.org.au>
References: <20080716150528.a350b196.sfr@canb.auug.org.au>
	<20080717134055.1d087d83.sfr@canb.auug.org.au>
	<200807171730.04634.bzolnier@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__18_Jul_2008_10_42_17_+1000_WAApuexVh9oqiC=U"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48506 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755286AbYGRAm3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 17 Jul 2008 20:42:29 -0400
In-Reply-To: <200807171730.04634.bzolnier@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Cc: linux-next@vger.kernel.org

--Signature=_Fri__18_Jul_2008_10_42_17_+1000_WAApuexVh9oqiC=U
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bart,

On Thu, 17 Jul 2008 17:30:04 +0200 Bartlomiej Zolnierkiewicz <bzolnier@gmai=
l.com> wrote:
>
> No wonder about that since there were another push to Linus
> (you were on cc: as usual). ;-)

Yep, I am not complaining, just noting.

> IIRC previously this shouldn't have been a problem, did something
> change (i.e. BASE tag) in linux-next w.r.t. handling quilt trees?

This causes conflicts not because the same patches appear in both trees,
but because the ide tree then goes on to further modify conflicting
sections of those files.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__18_Jul_2008_10_42_17_+1000_WAApuexVh9oqiC=U
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh/5ukACgkQjjKRsyhoI8zOTQCfdssdnnb1U98hAoVP77vHaG0H
CMQAniaIwH9IFLkxjcR8kgKWnR9Obxlz
=8QhF
-----END PGP SIGNATURE-----

--Signature=_Fri__18_Jul_2008_10_42_17_+1000_WAApuexVh9oqiC=U--
