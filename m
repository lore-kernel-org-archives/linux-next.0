From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH -next] fs: fix fs/fs-writeback.c build error
Date: Sat, 07 Jan 2012 10:17:05 -0800
Message-ID: <4F088C21.2080501@xenotime.net>
References: <20120105191218.42825638a431bc1aba4879de@canb.auug.org.au> <4F063DD6.5050403@xenotime.net> <CA+55aFx7vzez6C5M6EmZPDmkHig-mY=p64vZWWmWWe-nmxH4=w@mail.gmail.com> <20120107133008.GA21128@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy4-pub.bluehost.com ([69.89.21.11]:33851 "HELO
	oproxy4-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1750795Ab2AGRSo (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 7 Jan 2012 12:18:44 -0500
In-Reply-To: <20120107133008.GA21128@localhost>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Wu Fengguang <fengguang.wu@intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>

On 01/07/2012 05:30 AM, Wu Fengguang wrote:
> On Fri, Jan 06, 2012 at 03:01:09PM -0800, Linus Torvalds wrote:
>> On Thu, Jan 5, 2012 at 4:18 PM, Randy Dunlap <rdunlap@xenotime.net> =
wrote:
>>>
>>> In linux-next, fs/fs-writeback.c no longer #includes <linux/buffer_=
head.h>,
>>> which #included <linux/pagemap.h>, so add that latter header file t=
o
>>> <linux/writeback.h> to fix the build error:
>>>
>>> fs/fs-writeback.c:510:11: error: 'PAGE_CACHE_SHIFT' undeclared (fir=
st use in this function)
>>
>> I would actually suggest:
>>
>>  - move the whole MIN_WRITEBACK_PAGES #define from the header file t=
o
>> fs/writeback.c
>=20
> Done.
>=20
>> (why expose such a random #define to outside users that
>> have nothing to do with it?)
> =20
> Yeah, there were some early patches that reference MIN_WRITEBACK_PAGE=
S
> from other files, which are dropped later..
>=20
>>  - make sure that fs/fs-writeback.c has that pagemap.h #include.
>=20
> Done. (otherwise it won't compile)
>=20
>> There's no reason why <linux/writeback.h> should include filemap.h p=
er
>> se, and there is no reason why it should expose some internal chunki=
ng
>> #define to anybody else.
>=20
> Good point. I'll queue this patch to writeback-for-next:
>=20
> Subject: writeback: move MIN_WRITEBACK_PAGES to fs-writeback.c
> Date: Sat Jan 07 20:41:55 CST 2012
>=20
> Fix compile error
>=20
>  fs/fs-writeback.c:515:33: error: =E2=80=98PAGE_CACHE_SHIFT=E2=80=99 =
undeclared (first use in this function)
>=20
> Reported-by: Randy Dunlap <rdunlap@xenotime.net>
> Signed-off-by: Wu Fengguang <fengguang.wu@intel.com>

Acked-by: Randy Dunlap <rdunlap@xenotime.net>

Thanks.

> ---
>  fs/fs-writeback.c         |    6 ++++++
>  include/linux/writeback.h |    5 -----
>  2 files changed, 6 insertions(+), 5 deletions(-)
>=20
> --- next.orig/fs/fs-writeback.c	2012-01-07 21:01:34.552000061 +0800
> +++ next/fs/fs-writeback.c	2012-01-07 21:22:45.504000051 +0800
> @@ -20,6 +20,7 @@
>  #include <linux/sched.h>
>  #include <linux/fs.h>
>  #include <linux/mm.h>
> +#include <linux/pagemap.h>
>  #include <linux/kthread.h>
>  #include <linux/freezer.h>
>  #include <linux/writeback.h>
> @@ -29,6 +30,11 @@
>  #include "internal.h"
> =20
>  /*
> + * 4MB minimal write chunk size
> + */
> +#define MIN_WRITEBACK_PAGES	(4096UL >> (PAGE_CACHE_SHIFT - 10))
> +
> +/*
>   * Passed into wb_writeback(), essentially a subset of writeback_con=
trol
>   */
>  struct wb_writeback_work {
> --- next.orig/include/linux/writeback.h	2012-01-07 21:01:34.544000059=
 +0800
> +++ next/include/linux/writeback.h	2012-01-07 21:13:09.008000026 +080=
0
> @@ -25,11 +25,6 @@ DECLARE_PER_CPU(int, dirty_throttle_leak
>  #define DIRTY_SCOPE		8
>  #define DIRTY_FULL_SCOPE	(DIRTY_SCOPE / 2)
> =20
> -/*
> - * 4MB minimal write chunk size
> - */
> -#define MIN_WRITEBACK_PAGES	(4096UL >> (PAGE_CACHE_SHIFT - 10))
> -
>  struct backing_dev_info;
> =20
>  /*


--=20
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your cod=
e ***
