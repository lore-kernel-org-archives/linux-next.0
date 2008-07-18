From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the vfs tree
Date: Fri, 18 Jul 2008 19:06:25 +1000
Message-ID: <20080718190625.ff774854.sfr@canb.auug.org.au>
References: <20080718153629.93410869.sfr@canb.auug.org.au>
	<20080718083341.GD21656@linux-mips.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__18_Jul_2008_19_06_25_+1000_b75czd174OtPF0bu"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34890 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755733AbYGRJGb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 18 Jul 2008 05:06:31 -0400
In-Reply-To: <20080718083341.GD21656@linux-mips.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, linux-next@vger.kernel.org

--Signature=_Fri__18_Jul_2008_19_06_25_+1000_b75czd174OtPF0bu
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ralf,

On Fri, 18 Jul 2008 09:33:41 +0100 Ralf Baechle <ralf@linux-mips.org> wrote:
>
> On Fri, Jul 18, 2008 at 03:36:29PM +1000, Stephen Rothwell wrote:
>=20
> > Today's linux-next merge of the vfs tree got conflicts in
> > arch/mips/kernel/irixelf.c and include/asm-mips/namei.h between commit
> > 2957c9e61ee9c37e7ebf2c8acab03e073fe942fd ("[MIPS] IRIX: Goodbye and
> > thanks for all the fish") from the mips tree and commit
> > 2d810d154f1ffc5c637acdb067693773efb09540 ("[PATCH] kill altroot") from
> > the vfs tree.
> >=20
> > I removed both files.
>=20
> Removing arch/mips/kernel/irixelf.c is fine but removing <asm/namei.h>
> will break the build of fs/namei.c.

The vfs tree patch killed all references to asm/namei.h

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__18_Jul_2008_19_06_25_+1000_b75czd174OtPF0bu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiAXREACgkQjjKRsyhoI8znowCggU52Z7Xsv2E57rIJIi3SEUpk
cK4Anj1EHZpVBL++i8PiXoBi4IfTEXIa
=/wkT
-----END PGP SIGNATURE-----

--Signature=_Fri__18_Jul_2008_19_06_25_+1000_b75czd174OtPF0bu--
