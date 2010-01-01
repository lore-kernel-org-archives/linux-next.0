From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for December 31 (kgdb)
Date: Fri, 1 Jan 2010 12:04:28 +1100
Message-ID: <20100101120428.68a99a16.sfr@canb.auug.org.au>
References: <20091231112314.a51e160b.sfr@canb.auug.org.au>
	<20091231110747.5efc1efa.randy.dunlap@oracle.com>
	<12c511ca0912311120i3f60fccas3487c1f47b5cf3c3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__1_Jan_2010_12_04_28_+1100__ioWbClYk8XuZvKI"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47377 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750911Ab0AABEi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 31 Dec 2009 20:04:38 -0500
In-Reply-To: <12c511ca0912311120i3f60fccas3487c1f47b5cf3c3@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, jbarnes@virtuousgeek.org, Tony Luck <tony.luck@gmail.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kgdb-bugreport@lists.sourceforge.net

--Signature=_Fri__1_Jan_2010_12_04_28_+1100__ioWbClYk8XuZvKI
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jason,

On Thu, 31 Dec 2009 11:20:02 -0800 Tony Luck <tony.luck@gmail.com> wrote:
>
> The kgdb bits break ia64 (and any other architecture without an
> <asm/kgdb.h> too):
>=20
> In file included from include/drm/drm_fb_helper.h:33,
>                  from include/drm/drm_crtc_helper.h:42,
>                  from drivers/gpu/drm/radeon/radeon_device.c:30:
> include/linux/kgdb.h:21:22: error: asm/kgdb.h: No such file or directory
> In file included from include/drm/drm_fb_helper.h:33,
>                  from include/drm/drm_crtc_helper.h:42,
>                  from drivers/gpu/drm/radeon/radeon_device.c:30:
> include/linux/kgdb.h:86: error: 'BREAK_INSTR_SIZE' undeclared here
> (not in a function)

I have used the version of the kgdb tree from next-20091230 for today
(effectively dropping it), sorry.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__1_Jan_2010_12_04_28_+1100__ioWbClYk8XuZvKI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAks9ShwACgkQjjKRsyhoI8yLbQCfZQfcnbHedi3qHaGTJaVLNJAy
DlQAniOSwKqTminfIkazJC6gwUPyk0IT
=wvre
-----END PGP SIGNATURE-----

--Signature=_Fri__1_Jan_2010_12_04_28_+1100__ioWbClYk8XuZvKI--
