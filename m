From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next blackfin builds
Date: Wed, 17 Aug 2011 16:22:48 +1000
Message-ID: <20110817162248.6e2af136fe580e5ab4994b0b@canb.auug.org.au>
References: <CAMjpGUe_zTuXMNNQfnpg3Tueijr=CCXpPG7JOP9tqNNtC2wsrw@mail.gmail.com>
	<20110812131750.73f1257494fd7dad45c96131@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__17_Aug_2011_16_22_48_+1000_LFsPYrzF5suLW70x"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53089 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751399Ab1HQGW6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 17 Aug 2011 02:22:58 -0400
In-Reply-To: <20110812131750.73f1257494fd7dad45c96131@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: linux-next@vger.kernel.org, uclinux-dist-devel@blackfin.uclinux.org

--Signature=_Wed__17_Aug_2011_16_22_48_+1000_LFsPYrzF5suLW70x
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike,

On Fri, 12 Aug 2011 13:17:50 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Thu, 11 Aug 2011 21:50:09 -0400 Mike Frysinger <vapier.adi@gmail.com> =
wrote:
> >
> > the linux-next website doesnt seem to cover the build system other
> > than to link to it.  all Blackfin defconfigs should be buildable, and
> > are in fact being built right now on a nightly basis on ADI systems.
> > is there a way to plug those results into the site ?
>=20
> For a long time we didn't have a blackfin cross compiler that worked.  We
> are working on building one and when that is done, I will add the
> blackfin configs the our build set (and the results will be on the kisskb
> site).

I have found a compiler (gcc 4.4.0, no libc) that seem to work.  You can
see the results here: http://kisskb.ellerman.id.au/kisskb/branch/9/ .
Of course, some of the build errors may be due to the tool chain, I guess.

I have also added a BF537-STAMP_defconfig build for Linus' tree
(http://kisskb.ellerman.id.au/kisskb/branch/3/).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__17_Aug_2011_16_22_48_+1000_LFsPYrzF5suLW70x
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOS144AAoJEDMEi1NhKgbs8XIH/3NKGId1jc1HSB8vry6RZ15R
LU8aJEb2mts29HYkRLuq+AdnQPHOo7kZ5J1qFA/nnIjKB94qJuT7s1RAeC9AnvLO
XqHPaVo4F2KFH/nXDoXH/oVD/yu5GHW2dryxdFs6IJHF2dih1ycjJko/zXE8e5us
1q96QPloia+vchfM5UYlj8ECZ8QMtjwoaq/cY56eDSAG4sgC7CASSWy9iF6o6b2/
jtg0VWaknpKc8uIKQdpctSPL6tL+QwxUux24cNb7eut78/BC7ENxTAlFoj63ntJn
rgyrwaRtqWDdlZntu37X0DetZ705KQulvC28OYh6XM7iB4CCfWqWrXXfD13wTy4=
=WNh0
-----END PGP SIGNATURE-----

--Signature=_Wed__17_Aug_2011_16_22_48_+1000_LFsPYrzF5suLW70x--
