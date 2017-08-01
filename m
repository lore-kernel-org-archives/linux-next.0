From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: build warning after merge of the akpm tree
Date: Tue, 1 Aug 2017 23:15:48 +0200
Message-ID: <CAK8P3a3z+uExeNefcv8S4D00Z7PLM9t2v2NeA=QNF8DO82VSFg@mail.gmail.com>
References: <20170801160257.0b1306b2@canb.auug.org.au> <87bmnzizjy.fsf@yhuang-dev.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:35856 "EHLO
        mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751912AbdHAVPt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Aug 2017 17:15:49 -0400
In-Reply-To: <87bmnzizjy.fsf@yhuang-dev.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Huang, Ying" <ying.huang@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Aug 1, 2017 at 8:15 AM, Huang, Ying <ying.huang@intel.com> wrote:
> From 7a7ff76d7bcbd7affda169b29abcf3dafa38052e Mon Sep 17 00:00:00 2001
> From: Huang Ying <ying.huang@intel.com>
> Date: Tue, 1 Aug 2017 14:12:21 +0800
> Subject: [PATCH] mm, THP, swap: Silence a compiler warning
>
> To fix the following compiler warning,
>
> mm/swapfile.c: In function 'reuse_swap_page':
> mm/swapfile.c:1429:16: warning: 'offset' may be used uninitialized in this function [-Wmaybe-uninitialized]
>   unsigned long offset;
>                 ^
>
> This is a false positive report, but we should silence it anyway.

Looks ok, I ran into this too, and came to the same conclusion.
I normally try to find a way to reorganize the code without adding
a bogus initialization, but here I could not find come up with anything
better than what you did.

        Arnd
