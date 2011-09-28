From: huang ying <huang.ying.caritas@gmail.com>
Subject: Re: linux-next: build failure after merge of the final tree
Date: Wed, 28 Sep 2011 20:02:20 +0800
Message-ID: <CAC=cRTMfLy-myM3YozuLfBc4xHb4HYPHOkKTPxAY_-fCMg14XQ@mail.gmail.com>
References: <20110928195601.9d0da0ea27186c4ce9349d94@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:49564 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752505Ab1I1MCV convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 28 Sep 2011 08:02:21 -0400
In-Reply-To: <20110928195601.9d0da0ea27186c4ce9349d94@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Miller <davem@davemloft.net>, Huang Ying <ying.huang@intel.com>

On Wed, Sep 28, 2011 at 5:56 PM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Hi all,
>
> After merging the final tree, today's linux-next build (sparc32 defco=
nfig)
> failed like this:
>
> In file included from include/linux/irq_work.h:4:0,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from include/=
linux/perf_event.h:510,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from arch/spa=
rc/mm/fault_32.c:21:
> include/linux/llist.h: In function 'llist_add':
> include/linux/llist.h:158:2: error: implicit declaration of function =
'in_nmi'
> In file included from include/linux/irq_work.h:4:0,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from include/=
linux/perf_event.h:510,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from arch/spa=
rc/kernel/unaligned_32.c:18:
> include/linux/llist.h: In function 'llist_add':
> include/linux/llist.h:158:2: error: implicit declaration of function =
'in_nmi'
> In file included from include/linux/irq_work.h:4:0,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from include/=
linux/perf_event.h:510,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from kernel/s=
ys.c:16:
> include/linux/llist.h: In function 'llist_add':
> include/linux/llist.h:158:2: error: implicit declaration of function =
'in_nmi'
>
> Caused by commit 510d7dc70eab ("llist: make all llist functions inlin=
e")
> from the akpm tree.

Sorry, should have done at least building test for sparc.  Will pay
more attention next time.

Best Regards,
Huang Ying
