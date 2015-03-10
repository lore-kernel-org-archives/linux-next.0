From: Minchan Kim <minchan@kernel.org>
Subject: Re: [PATCH] zsmalloc: Add missing #include <linux/sched.h>
Date: Wed, 11 Mar 2015 08:15:57 +0900
Message-ID: <20150310231557.GA4794@blaptop>
References: <1426023991-30407-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pd0-f178.google.com ([209.85.192.178]:43588 "EHLO
	mail-pd0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751096AbbCJXQG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 10 Mar 2015 19:16:06 -0400
Received: by pdjp10 with SMTP id p10so5935685pdj.10
        for <linux-next@vger.kernel.org>; Tue, 10 Mar 2015 16:16:06 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1426023991-30407-1-git-send-email-geert@linux-m68k.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Nitin Gupta <ngupta@vflare.org>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, linux-next@vger.kernel.org

On Tue, Mar 10, 2015 at 10:46:31PM +0100, Geert Uytterhoeven wrote:
> mips/allmodconfig:
> 
> mm/zsmalloc.c: In function '__zs_compact':
> mm/zsmalloc.c:1747:2: error: implicit declaration of function
> 'cond_resched' [-Werror=implicit-function-declaration]
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Minchan Kim <minchan@kernel.org>

Thanks!

-- 
Kind regards,
Minchan Kim
