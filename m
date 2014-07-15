From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: build failure after merge of the v4l-dvb tree
Date: Mon, 14 Jul 2014 22:43:42 -0700
Message-ID: <53C4BF8E.4010509@roeck-us.net>
References: <20140715132946.771def89@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.active-venture.com ([67.228.131.205]:57679 "EHLO
	mail.active-venture.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752047AbaGOFnn (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 15 Jul 2014 01:43:43 -0400
In-Reply-To: <20140715132946.771def89@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 07/14/2014 08:29 PM, Stephen Rothwell wrote:
> Hi Mauro,
>
> After merging the v4l-dvb tree, today's linux-next build (powerpc ppc64_defconfig)
> failed like this:
>
> arch/powerpc/kernel/smp.c:764:2: error: initialization from incompatible pointer type [-Werror]
>    { cpu_smt_mask, powerpc_smt_flags, SD_INIT_NAME(SMT) },
>    ^
> arch/powerpc/kernel/smp.c:764:2: error: (near initialization for 'powerpc_topology[0].sd_flags') [-Werror]
>
> Caused by commit 6a0b50087a89 ("Merge branch 'patchwork' into
> to_next").  The change to include/linux/sched.h in this merge commit
> does not seem to appear in either of the parents of the merge.
>
> Its also a change that (when suggested) was shown to cause more
> problems than it was worth and dropped.  I can't imagine how it ended
> up in the merge commit.
>

Do you mean b6220ad66 (sched: Fix compiler warnings) ? I thought that was accepted
a week or so ago.

Guenter
