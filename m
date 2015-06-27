From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: Build errors due to 64 bit xchg/cmpxchg operations in fs/nfs/flexfilelayout
Date: Fri, 26 Jun 2015 22:39:06 -0700
Message-ID: <558E36FA.7050803@roeck-us.net>
References: <558E2201.1040003@roeck-us.net> <CAHQdGtRURfhjoY0EMGMWQR=Yw-tiKr3PWWZ1YVCu9+u8ff9xFw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:55143 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752122AbbF0FjK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 27 Jun 2015 01:39:10 -0400
In-Reply-To: <CAHQdGtRURfhjoY0EMGMWQR=Yw-tiKr3PWWZ1YVCu9+u8ff9xFw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@primarydata.com>
Cc: Tao Peng <tao.peng@primarydata.com>, Linux NFS Mailing List <linux-nfs@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On 06/26/2015 09:15 PM, Trond Myklebust wrote:
>
> On Jun 27, 2015 12:09 AM, "Guenter Roeck" <linux@roeck-us.net <mailto:linux@roeck-us.net>> wrote:
>  >
>  > Hi,
>  >
>  > commits 'pNFS/flexfiles: add layoutstats tracking' and 'pnfs/flexfiles: report layoutstat
>  > regularly' in -next introduce 64 bit xchg and cmpxchg operations. This causes compile
>  > errors with 32 bit builds on architectures which do not support those operations.
>  >
>  > arm:shmobile_defconfig:
>  >
>  > fs/built-in.o: In function `nfs4_ff_end_busy_timer':
>  > :(.text+0xa7110): undefined reference to `__bad_xchg'
>  > fs/built-in.o: In function `nfs4_ff_layoutstat_start_io':
>  > :(.text+0xa7304): undefined reference to `__bad_cmpxchg'
>  > :(.text+0xa731c): undefined reference to `__bad_cmpxchg'
>  > :(.text+0xa73d8): undefined reference to `__bad_cmpxchg'
>  >
>  > xtensa:allmodconfig:
>  >
>  > ERROR: "__xchg_called_with_bad_pointer" [fs/nfs/flexfilelayout/nfs_layout_flexfiles.ko] undefined!
>  > ERROR: "__cmpxchg_called_with_bad_pointer" [fs/nfs/flexfilelayout/nfs_layout_flexfiles.ko] undefined!
>  >
>  > Guenter
>
> Hi Guenter
>
> Is this still the case with today's update? The latest patch from Tao was intended to remove those calls.
>

Hi Trond,

This is with next-20150626. I'll let you know if it still happens with the next build.

Guenter
