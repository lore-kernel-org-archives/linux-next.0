From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 01/31] proc: switch /proc/loadavg to seq_file
Date: Tue, 21 Oct 2008 16:58:22 -0700
Message-ID: <20081021165822.8d574935.akpm@linux-foundation.org>
References: <20081017123958.GB22653@x200.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:57705 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752194AbYJUX6l (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 21 Oct 2008 19:58:41 -0400
In-Reply-To: <20081017123958.GB22653@x200.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org

On Fri, 17 Oct 2008 16:39:58 +0400
Alexey Dobriyan <adobriyan@gmail.com> wrote:

> and move it to fs/proc/loadavg.c while I'm at it.
> 
> Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> ---
>  fs/proc/Makefile    |    2 +-
>  fs/proc/loadavg.c   |   51 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  fs/proc/proc_misc.c |   26 --------------------------

While I think the patchset is a good thing, this is absolutely the worst
possible time to merge large code-motion changes into linux-next.  We
need to maintain this stuff for more than two months, and everyone and
his puppy is altering those files.  Today's linux-next already broke.

So I'd suggest that this all be deferred until the day before
2.6.29-rc1(!).


fs/proc/meminfo.c: In function 'meminfo_proc_show':
fs/proc/meminfo.c:90: error: 'NR_ACTIVE' undeclared (first use in this function)
fs/proc/meminfo.c:90: error: (Each undeclared identifier is reported only once
fs/proc/meminfo.c:90: error: for each function it appears in.)
fs/proc/meminfo.c:91: error: 'NR_INACTIVE' undeclared (first use in this function)
