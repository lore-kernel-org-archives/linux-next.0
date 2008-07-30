From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure
Date: Thu, 31 Jul 2008 09:35:15 +1000
Message-ID: <20080731093515.4d2d3312.sfr@canb.auug.org.au>
References: <20080730153028.95226354.sfr@canb.auug.org.au>
	<20080730064146.GA1564@cs181140183.pp.htv.fi>
	<20080730070643.GA18347@in.ibm.com>
	<200807302116.55515.bzolnier@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__31_Jul_2008_09_35_15_+1000_fZuk0pun_EmAbhP5"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40922 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1760018AbYG3XfX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 30 Jul 2008 19:35:23 -0400
In-Reply-To: <200807302116.55515.bzolnier@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Cc: Ankita Garg <ankita@in.ibm.com>, Adrian Bunk <bunk@kernel.org>, Ananth N Mavinakayanahalli <ananth@in.ibm.com>, linux-next@vger.kernel.org, Vivek Goyal <vgoyal@redhat.com>, Haren Myneni <hbabu@us.ibm.com>, kexec@lists.infradead.org

--Signature=_Thu__31_Jul_2008_09_35_15_+1000_fZuk0pun_EmAbhP5
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bart,

On Wed, 30 Jul 2008 21:16:55 +0200 Bartlomiej Zolnierkiewicz <bzolnier@gmai=
l.com> wrote:
>
> On Wednesday 30 July 2008, Ankita Garg wrote:
> > On Wed, Jul 30, 2008 at 09:41:46AM +0300, Adrian Bunk wrote:
> > > On Wed, Jul 30, 2008 at 03:30:28PM +1000, Stephen Rothwell wrote:
> > > > Hi Ananth,
> > > >=20
> > > > Today's linux-next build (powerpc allyesconfig) failed like this:
> > > >=20
> > > > tests/lkdtm.c:182: error: expected ')' before '*' token
> > > >=20
> > > > I have no idea why this fails now when it did not before.
> > >=20
> > > Sorry, that's my fault.
> > > (I didn't notice since my allyes builds have CONFIG_MODULES=3Dn, and
> > >  no defconfig seems to have both LKDTM and IDE=3Dy.)
> > >=20
> > > Bart, can you either apply Stephen's patch or drop the lkdtm.c chunk=
=20
> > > from my patch?
> > >
> >=20
> > I suppose it would be better if the earlier changes are reverted, as
> > lkdtm already has bits to include ide.h depending on CONFIG_IDE being
> > y/n.
>=20
> I reverted lktdm.c change (sorry for not noticing it earlier).

Thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__31_Jul_2008_09_35_15_+1000_fZuk0pun_EmAbhP5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiQ+rMACgkQjjKRsyhoI8xtzgCbBr2QwBMjmOsBttD5cwQ6w5ZN
CjwAoJhnY3Na8a8aFVL87HC+SJhH+R0B
=1y6C
-----END PGP SIGNATURE-----

--Signature=_Thu__31_Jul_2008_09_35_15_+1000_fZuk0pun_EmAbhP5--
