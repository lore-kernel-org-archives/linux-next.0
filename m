From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Mon, 20 Nov 2017 15:32:30 +1100
Message-ID: <20171120153230.1738cc35@canb.auug.org.au>
References: <20171120125748.156fa18b@canb.auug.org.au>
        <CAPcyv4hvgxndkNeUxXEQUxysiRauFqoKYmBC5EXqrU2KhnESxg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37767 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750969AbdKTEcc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 19 Nov 2017 23:32:32 -0500
In-Reply-To: <CAPcyv4hvgxndkNeUxXEQUxysiRauFqoKYmBC5EXqrU2KhnESxg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Dan,

On Sun, 19 Nov 2017 20:25:18 -0800 Dan Williams <dan.j.williams@intel.com> wrote:
>
> Ugh, yes. Looks correct. I might have confused my build success
> notifications from 0day. I'll spin out a new branch to make sure this
> is the last of it.

Thanks.

While I have your attention ... did you consider using the other
paradigm:

In arch include files:
#define pud_write	pud_write
static inline int pud_write(pud_t pud)
 .....

Then in include/asm-generic/pgtable.h:

#ifndef pud_write
tatic inline int pud_write(pud_t pud)
{
	....
}
#endif

If you had, then the powerpc code would have worked ... ;-)
and many of the other interfaces in include/asm-generic/pgtable.h are
protected that way ...

-- 
Cheers,
Stephen Rothwell
