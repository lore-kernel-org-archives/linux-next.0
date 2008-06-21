From: Greg KH <greg@kroah.com>
Subject: Re: linux-staging/linux-next merge/build errors
Date: Sat, 21 Jun 2008 00:10:23 -0700
Message-ID: <20080621071023.GA2765@kroah.com>
References: <20080621124017.ec3b0a51.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:36000 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750791AbYFUHVO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 21 Jun 2008 03:21:14 -0400
Content-Disposition: inline
In-Reply-To: <20080621124017.ec3b0a51.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Sat, Jun 21, 2008 at 12:40:17PM +1000, Stephen Rothwell wrote:
> Hi Greg,
>=20
> Today I have done a test merge of linux-staging into linux-next.  I g=
ot
> merge conflicts in drivers/char/agp/via-agp.c and drivers/misc/Makefi=
le -
> neither of which is really surprising and both tivial to fix up.
>=20
> I then did an x86 allmodconfig build with these errors:
>=20
> In file included from /home/sfr/kernels/next/src/drivers/char/drm/via=
_chrome9_drm.c:32:
> /home/sfr/kernels/next/src/drivers/char/drm/via_chrome9_3d_reg.h: In =
function =E2=80=98IS_AGPHEADER_INV=E2=80=99:
> /home/sfr/kernels/next/src/drivers/char/drm/via_chrome9_3d_reg.h:230:=
 error: =E2=80=98TRUE=E2=80=99 undeclared (first use in this function)
> /home/sfr/kernels/next/src/drivers/char/drm/via_chrome9_3d_reg.h:230:=
 error: (Each undeclared identifier is reported only once
> /home/sfr/kernels/next/src/drivers/char/drm/via_chrome9_3d_reg.h:230:=
 error: for each function it appears in.)
> /home/sfr/kernels/next/src/drivers/char/drm/via_chrome9_3d_reg.h:232:=
 error: =E2=80=98FALSE=E2=80=99 undeclared (first use in this function)

Wierd, this passes allmodconfig on i386, something else must be
declaring TRUE and FALSE :)

I'll just go remove them entirely.

> And several new warnings (these may not be all):
>=20
> /home/sfr/kernels/next/src/fs/novfs/inode.c:265: warning: initializat=
ion from incompatible pointer type
> /home/sfr/kernels/next/src/fs/novfs/inode.c:267: warning: initializat=
ion from incompatible pointer type
> /home/sfr/kernels/next/src/fs/novfs/inode.c:273: warning: initializat=
ion from incompatible pointer type
> /home/sfr/kernels/next/src/fs/novfs/inode.c:275: warning: initializat=
ion from incompatible pointer type
> In file included from /home/sfr/kernels/next/src/fs/novfs/daemon.c:24=
:
> include2/asm/semaphore.h:1:2: warning: #warning Use linux/semaphore.h=
, not asm/semaphore.h
> In file included from /home/sfr/kernels/next/src/fs/novfs/scope.c:26:
> include2/asm/semaphore.h:1:2: warning: #warning Use linux/semaphore.h=
, not asm/semaphore.h
> In file included from /home/sfr/kernels/next/src/fs/novfs/nwcapi.c:22=
:
> include2/asm/semaphore.h:1:2: warning: #warning Use linux/semaphore.h=
, not asm/semaphore.h

Yeah, we took a major update of novfs and some of my previous fixes lik=
e
this got lost.

I'll go resolve them now.

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-next" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
