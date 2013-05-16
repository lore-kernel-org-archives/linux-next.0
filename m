From: Robert Love <rlove@google.com>
Subject: Re: [PATCH -next] ashmem: Fix ashmem_shrink deadlock.
Date: Thu, 16 May 2013 13:08:17 -0400
Message-ID: <CAG6tG3xLydqQTOHaXMpdCo8m+WkydAqgLvi5HW8_djoO-hcf9g@mail.gmail.com>
References: <1367416573-5430-1-git-send-email-rlove@google.com>
	<20130513214216.GA23743@kroah.com>
	<CA+2_TiZ3dECAW8LV-Es=BjHCwgWw69zbWkr73at+0_c-EaDHmA@mail.gmail.com>
	<CAG9bXvkH0L5FjkU3-=3X3zwp3vw8U7+jJRYp28GFXjLkQKBL5g@mail.gmail.com>
	<CAG9bXvkjV6-O3JZH6taVX-dZ1tzbSoqaC_sN00LRszsS4QAnrg@mail.gmail.com>
	<CAG6tG3zaU=gkJZzNezOX=s5WWDrc2x7SHiDy3UxVzDvKkw2foA@mail.gmail.com>
	<20130516094559.4d2c9212.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qc0-f181.google.com ([209.85.216.181]:52377 "EHLO
	mail-qc0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751766Ab3EPRIR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 16 May 2013 13:08:17 -0400
Received: by mail-qc0-f181.google.com with SMTP id s10so1172447qcv.40
        for <linux-next@vger.kernel.org>; Thu, 16 May 2013 10:08:17 -0700 (PDT)
In-Reply-To: <20130516094559.4d2c9212.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Raul Xiong <raulxiong@gmail.com>, Neil Zhang <glacier1980@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shankar Brahadeeswaran <shankoo77@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>, LKML <linux-kernel@vger.kernel.org>, Bjorn Bringert <bringert@google.com>, devel <devel@driverdev.osuosl.org>, Hugh Dickins <hughd@google.com>, Anjana V Kumar <anjanavk12@gmail.com>, linux-next <linux-next@vger.kernel.org>

On Thu, May 16, 2013 at 12:45 PM, Andrew Morton
<akpm@linux-foundation.org> wrote:
> A better approach would be to add a new __GFP_NOSHRINKERS, but it's all
> variations on a theme.

I don't like this proposal, either. Many of the existing GFP flags
already exist to prevent recurse into that flag's respective shrinker.

This problem seems a rare proper use of mutex_trylock.

> The mutex_trylock(ashmem_mutex) will actually have the best
> performance, because it skips the least amount of memory reclaim
> opportunities.

Right.

> But it still sucks!  The real problem is that there exists a lock
> called "ashmem_mutex", taken by both the high-level mmap() and by the
> low-level shrinker.  And taken by everything else too!  The ashmem
> locking is pretty crude...

The locking is "crude" because I optimized for space, not time, and
there was (and is) no indication we were suffering lock contention due
to the global lock. I haven't thought through the implications of
pushing locking into the ashmem_area and ashmem_range objects, but it
does look like we'd end up often grabbing all of the locks ...

> What is the mutex_lock() in ashmem_mmap() actually protecting?  I don't
> see much, apart from perhaps some incidental races around the contents
> of the file's ashmem_area, and those could/should be protected by a
> per-object lock, not a global one?

... but not, as you note, in ashmem_mmap. The main race there is
around the allocation of asma->file. That could definitely be a lock
local to ashmem_area. I'm OK if anyone wants to take that on but it
seems a lot of work for a driver with an unclear future.

        Robert
