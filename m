From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Fri, 17 Jul 2015 07:52:58 +1000
Message-ID: <20150717075258.77fc24ce@canb.auug.org.au>
References: <20150716152036.3551cef7@canb.auug.org.au>
	<55A7C18B.7030104@akamai.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33460 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751397AbbGPVxB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Jul 2015 17:53:01 -0400
In-Reply-To: <55A7C18B.7030104@akamai.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Eric B Munson <emunson@akamai.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Eric,

On Thu, 16 Jul 2015 10:36:59 -0400 Eric B Munson <emunson@akamai.com> wrote:
>
> > From: Stephen Rothwell <sfr@canb.auug.org.au> Date: Thu, 16 Jul
> > 2015 14:58:53 +1000 Subject: [PATCH] mm: mlock: fix for add new
> > mlock, munlock, and munlockall system calls
> > 
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au> --- 
> > arch/arm/include/asm/unistd.h | 2 +- arch/arm/kernel/calls.S
> > | 2 +- 2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm/include/asm/unistd.h
> > b/arch/arm/include/asm/unistd.h index 32640c431a08..2516c09d65d7
> > 100644 --- a/arch/arm/include/asm/unistd.h +++
> > b/arch/arm/include/asm/unistd.h @@ -19,7 +19,7 @@ * This may need
> > to be greater than __NR_last_syscall+1 in order to * account for
> > the padding in the syscall table */ -#define __NR_syscalls  (388) 
> > +#define __NR_syscalls  (392)
> 
> IIUC, this should be 391.

Read the comment above - it has to be 392 for padding.  (I actually
tried 391 and it fails to build.)

BTW, what mail client are you using - it really made a mess :-(

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
