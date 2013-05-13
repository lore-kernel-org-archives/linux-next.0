From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH -next] ashmem: Fix ashmem_shrink deadlock.
Date: Mon, 13 May 2013 17:42:16 -0400
Message-ID: <20130513214216.GA23743@kroah.com>
References: <1367416573-5430-1-git-send-email-rlove@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pb0-f42.google.com ([209.85.160.42]:55232 "EHLO
	mail-pb0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754448Ab3EMXqW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 13 May 2013 19:46:22 -0400
Received: by mail-pb0-f42.google.com with SMTP id up7so4854884pbc.1
        for <linux-next@vger.kernel.org>; Mon, 13 May 2013 16:46:22 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1367416573-5430-1-git-send-email-rlove@google.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Robert Love <rlove@google.com>
Cc: Shankar Brahadeeswaran <shankoo77@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>, LKML <linux-kernel@vger.kernel.org>, Bjorn Bringert <bringert@google.com>, devel <devel@driverdev.osuosl.org>, Hugh Dickins <hughd@google.com>, Anjana V Kumar <anjanavk12@gmail.com>, Dad <akpm@linux-foundation.org>, linux-next <linux-next@vger.kernel.org>

On Wed, May 01, 2013 at 09:56:13AM -0400, Robert Love wrote:
> Don't acquire ashmem_mutex in ashmem_shrink if we've somehow recursed into the
> shrinker code from within ashmem. Just bail out, avoiding a deadlock. This is
> fine, as ashmem cache pruning is advisory anyhow.
> 
> Signed-off-by: Robert Love <rlove@google.com>
> ---
>  drivers/staging/android/ashmem.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Based on Andrew's review comments, I'll drop this from my queue and wait
for a "better" fix for this.

thanks,

greg k-h
