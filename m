From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] powerpc: mman.h export fixups
Date: Mon, 14 Jul 2008 16:02:15 +0200
Message-ID: <200807141602.15619.arnd@arndb.de>
References: <20080714170301.93f940fd.sfr@canb.auug.org.au> <20080714192557.331a50f5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.183]:64944 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753611AbYGNOC2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 14 Jul 2008 10:02:28 -0400
In-Reply-To: <20080714192557.331a50f5.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linuxppc-dev@ozlabs.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-next@vger.kernel.org, Dave Kleikamp <shaggy@linux.vnet.ibm.com>

On Monday 14 July 2008, Stephen Rothwell wrote:
> index 34a0a8d..329ecfd 100644
> --- a/include/asm-powerpc/Kbuild
> +++ b/include/asm-powerpc/Kbuild
> @@ -2,7 +2,6 @@ include include/asm-generic/Kbuild.asm
> =A0
> =A0header-y +=3D auxvec.h
> =A0header-y +=3D ioctls.h
> -header-y +=3D mman.h
> =A0header-y +=3D sembuf.h
> =A0header-y +=3D siginfo.h
> =A0header-y +=3D stat.h
> @@ -28,6 +27,7 @@ unifdef-y +=3D byteorder.h
> =A0unifdef-y +=3D cputable.h
> =A0unifdef-y +=3D elf.h
> =A0unifdef-y +=3D nvram.h
> +unifdef-y +=3D mman.h
> =A0unifdef-y +=3D param.h
> =A0unifdef-y +=3D posix_types.h
> =A0unifdef-y +=3D ptrace.h

mman.h is already listed as unifdef-y in include/asm-generic/Kbuild.asm=
,
so you can probably just drop it here.

	Arnd <><
