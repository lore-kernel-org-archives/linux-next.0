From: Manfred Spraul <manfred@colorfullife.com>
Subject: Re: linux-next: manual merge of the akpm tree with the  tree
Date: Mon, 06 May 2013 20:59:18 +0200
Message-ID: <5187FD86.9000005@colorfullife.com>
References: <20130506135109.9c0b24ea1e22784fb28ae6b9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bk0-f54.google.com ([209.85.214.54]:45341 "EHLO
	mail-bk0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755334Ab3EFS7X (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 6 May 2013 14:59:23 -0400
Received: by mail-bk0-f54.google.com with SMTP id y8so1740675bkt.41
        for <linux-next@vger.kernel.org>; Mon, 06 May 2013 11:59:22 -0700 (PDT)
In-Reply-To: <20130506135109.9c0b24ea1e22784fb28ae6b9@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Steven Rostedt <rostedt@goodmis.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus <torvalds@linux-foundation.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>

Hi,

On 05/06/2013 05:51 AM, Stephen Rothwell wrote:
> Hi Andrew,
>
> Today's linux-next merge of the akpm tree got a conflict in ipc/sem.c
> between commit 321310ced2d6 ("ipc: move sem_obtain_lock() rcu locking
> into the only caller") from Linus' tree and commit "ipc/sem.c:
> alternatives to preempt_disable()" from the akpm tree.
I would propose that 'ipc/sem.c: alternatives to preempt_disable()' is 
dropped.

As explained in the commit:
That patch is for CONFIG_PREEMPT_RT, it should go into their tree.

--
     Manfred
