From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the acpi tree
Date: Fri, 18 Jul 2008 10:37:49 +1000
Message-ID: <20080718103749.becd13bd.sfr@canb.auug.org.au>
References: <20080717142205.064285ad.sfr@canb.auug.org.au>
	<20080717072449.GN17329@cs181140183.pp.htv.fi>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__18_Jul_2008_10_37_49_+1000_xyignH3WVn0kHFO7"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38192 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754405AbYGRAh5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 17 Jul 2008 20:37:57 -0400
In-Reply-To: <20080717072449.GN17329@cs181140183.pp.htv.fi>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Adrian Bunk <bunk@kernel.org>
Cc: Len Brown <lenb@kernel.org>, linux-next@vger.kernel.org, Andi Kleen <andi@firstfloor.org>

--Signature=_Fri__18_Jul_2008_10_37_49_+1000_xyignH3WVn0kHFO7
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Adrian, Andi,

On Thu, 17 Jul 2008 10:24:49 +0300 Adrian Bunk <bunk@kernel.org> wrote:
>
> On Thu, Jul 17, 2008 at 02:22:05PM +1000, Stephen Rothwell wrote:
> > Hi Len,
> >=20
> > Today's linux-next merge of the acpi tree got a conflict in
> > arch/x86/mm/srat_32.c against Linus' tree.
> >=20
> > I used the version in Linus' tree.  Could you do a merge with Linus' tr=
ee
> > for tomorrow?
>=20
> You seem to still pull Len's tree?

Until I am told otherwise ...

Last I had was this (on July 7):

-----------------------------------------------------------------------
sfr wrote:
> Andi Kleen wrote:
>
> > >> git://git.kernel.org/pub/scm/git/linux/kernel/ak/linux-acpi-2.6.git =
test
> > >=20
> > > Then why is linux-next tracking that?
> >=20
> > It is tracking Len's tree not mine, right?
>=20
> /me hits himself in the head :-)
>=20
> Sorry about that.
>=20
> > Or did you switch already to mine?
>=20
> No, I only do what is asked of me :-)
-----------------------------------------------------------------------

And so since I have no idea what tree to track and it seems to have
been merged to Linus anyway. I have dropped the ACPI tree until someone
straigtens me out.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__18_Jul_2008_10_37_49_+1000_xyignH3WVn0kHFO7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh/5d0ACgkQjjKRsyhoI8zL+ACcDA3IVrecVJPCLUvvtXjpLfvi
bMsAn2oWAMe24fFil8nxUBNvnFDu35T6
=ORov
-----END PGP SIGNATURE-----

--Signature=_Fri__18_Jul_2008_10_37_49_+1000_xyignH3WVn0kHFO7--
