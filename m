From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for August 13 (nfsd)
Date: Thu, 14 Aug 2008 09:44:42 -0700
Message-ID: <20080814094442.5a68b2fa.randy.dunlap@oracle.com>
References: <20080813172452.14b0775c.sfr@canb.auug.org.au>
	<20080813104748.13848196.randy.dunlap@oracle.com>
	<20080813180931.GC26765@fieldses.org>
	<20080814111633.55f5f1e8@surf>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rgminet01.oracle.com ([148.87.113.118]:42566 "EHLO
	rgminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751152AbYHNQpR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 14 Aug 2008 12:45:17 -0400
In-Reply-To: <20080814111633.55f5f1e8@surf>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: "J. Bruce Fields" <bfields@fieldses.org>, Stephen Rothwell <sfr@canb.auug.org.au>, neilb@suse.de, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thu, 14 Aug 2008 11:16:33 +0200 Thomas Petazzoni wrote:

> Le Wed, 13 Aug 2008 14:09:31 -0400,
> "J. Bruce Fields" <bfields@fieldses.org> a =E9crit :
>=20
> > Looks like that's just two more functions that need to be stubbed o=
ut
> > in the case where CONFIG_FILE_LOCKING is undefined?--hopefully Thom=
as
> > Petazzoni (cc'd) could be talked into reproducing this and sending =
me
> > an incremental fix....
>=20
> Here is an incremental fix.

Acked-by: Randy Dunlap <randy.dunlap@oracle.com>

Thanks.

> ---
>=20
> Fixup configure out fs locks support
>=20
> This patch adds a few more stubs required to get NFS server to compil=
e
> properly with CONFIG_FILE_LOCKING=3Dn.
>=20
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>=20
> ---
>  include/linux/fs.h |    2 ++
>  1 file changed, 2 insertions(+)
>=20
> Index: linuxdev/include/linux/fs.h
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linuxdev.orig/include/linux/fs.h
> +++ linuxdev/include/linux/fs.h
> @@ -1050,6 +1050,8 @@
>  #define __break_lease(a, b) ({ 0; })
>  #define lease_get_mtime(a, b) ({ })
>  #define generic_setlease(a, b, c) ({ -EINVAL; })
> +#define vfs_setlease(a, b, c) ({ -EINVAL; })
> +#define lease_modify(a, b) ({ -EINVAL; })
>  #define lock_may_read(a, b, c) ({ 1; })
>  #define lock_may_write(a, b, c) ({ 1; })
>  #endif /* !CONFIG_FILE_LOCKING */
>=20
>=20
> --=20

---
~Randy
Linux Plumbers Conference, 17-19 September 2008, Portland, Oregon USA
http://linuxplumbersconf.org/
