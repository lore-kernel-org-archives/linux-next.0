From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Mon, 10 Apr 2017 14:06:06 -0700
Message-ID: <20170410140606.cf357748173361bceb5b10ef@linux-foundation.org>
References: <20170410164557.4a7880b4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:55002 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751434AbdDJVGI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 10 Apr 2017 17:06:08 -0400
In-Reply-To: <20170410164557.4a7880b4@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Huang Ying <ying.huang@intel.com>

On Mon, 10 Apr 2017 16:45:57 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Andrew,
> 
> After merging the akpm-current tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> mm/swap_slots.c: In function 'alloc_swap_slot_cache':
> mm/swap_slots.c:126:10: error: implicit declaration of function 'kvzalloc' [-Werror=implicit-function-declaration]
>   slots = kvzalloc(sizeof(swp_entry_t) * SWAP_SLOTS_CACHE_SIZE,
>           ^
> mm/swap_slots.c:126:8: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
>   slots = kvzalloc(sizeof(swp_entry_t) * SWAP_SLOTS_CACHE_SIZE,
>         ^
> mm/swap_slots.c:131:12: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
>   slots_ret = kvzalloc(sizeof(swp_entry_t) * SWAP_SLOTS_CACHE_SIZE,
>             ^
> 
> Caused by commit
> 
>   22cf2f4616c6 ("mm, swap: U=use kvzalloc to allocate some swap data structure")
> 
> The patches adding kvzalloc seem to have vanished :-(
> 
> I have reverted that commit for today.
> 

No, mm-introduce-kvalloc-helpers.patch is still in there but I had it
staged after
mm-swap-use-kvzalloc-to-allocate-some-swap-data-structure.patch.  ANd
after linux-next.patch which is presumably what tricked you.
