From: "J. Bruce Fields" <bfields@fieldses.org>
Subject: Re: linux-next: Tree for August 13 (nfsd)
Date: Thu, 14 Aug 2008 18:47:52 -0400
Message-ID: <20080814224752.GR23859@fieldses.org>
References: <20080813172452.14b0775c.sfr@canb.auug.org.au> <20080813104748.13848196.randy.dunlap@oracle.com> <20080813180931.GC26765@fieldses.org> <20080814111633.55f5f1e8@surf>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.fieldses.org ([66.93.2.214]:48936 "EHLO fieldses.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750958AbYHNWsG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 14 Aug 2008 18:48:06 -0400
Content-Disposition: inline
In-Reply-To: <20080814111633.55f5f1e8@surf>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, neilb@suse.de, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thu, Aug 14, 2008 at 11:16:33AM +0200, Thomas Petazzoni wrote:
> Le Wed, 13 Aug 2008 14:09:31 -0400,
> "J. Bruce Fields" <bfields@fieldses.org> a =C3=A9crit :
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

Thanks, I've updated the version in

        git://linux-nfs.org/~bfields/linux.git for-2.6.28

--b.


>=20
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
> Thomas Petazzoni, Free Electrons
> Kernel, drivers and embedded Linux development,
> consulting, training and support.
> http://free-electrons.com
