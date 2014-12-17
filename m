From: Corey Minyard <minyard@acm.org>
Subject: Re: linux-next: build failure after merge of the ipmi tree
Date: Tue, 16 Dec 2014 22:22:13 -0600
Message-ID: <549104F5.30902@acm.org>
References: <20141217140353.04eebe5d@canb.auug.org.au>
Reply-To: minyard@acm.org
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141217140353.04eebe5d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Corey Minyard <cminyard@mvista.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 12/16/2014 09:03 PM, Stephen Rothwell wrote:
> Hi Corey,
>
> After merging the ipmi tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/char/ipmi/ipmi_ssif.c:55:26: fatal error: linux/ctypes.h: No such file or directory
>  #include <linux/ctypes.h>
>                           ^
>
> Caused by commit 707096b4dd41 ("ipmi: Fix compile issue with isspace()").
>
> I have used the ipmi tree from next-20141216 for today.
>
> Also, you seem to have rebased your tree and thus duplicated a whole
> series of commits that are now in Linus' tree :-(

These should be fixed now.  I'm still learning the finer points of git for
this type of work.

Thanks,

-corey
