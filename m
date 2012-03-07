From: Siddhesh Poyarekar <siddhesh.poyarekar@gmail.com>
Subject: Re: [PATCH 2/2] mm/linux-next: Fix rcu locking in vm_is_stack
Date: Wed, 7 Mar 2012 21:35:29 +0530
Message-ID: <CAAHN_R1dLONPzzD7bMGV5wMiKzeY3K=u_q6qinpKG-N7gKdssg@mail.gmail.com>
References: <1331045377.17099.2.camel@deneb.redhat.com>
	<1331064994-6693-1-git-send-email-siddhesh.poyarekar@gmail.com>
	<1331064994-6693-2-git-send-email-siddhesh.poyarekar@gmail.com>
	<20120307153849.GA18879@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:41091 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751092Ab2CGQF3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 7 Mar 2012 11:05:29 -0500
In-Reply-To: <20120307153849.GA18879@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Mark Salter <msalter@redhat.com>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Paul Gortmaker <paul.gortmaker@windriver.com>

On Wed, Mar 7, 2012 at 9:08 PM, Oleg Nesterov <oleg@redhat.com> wrote:
> Once again. You have the task_struct *task. It exits,
> but task->thread_group->next still points to another thread T. Now suppose
> that T exits too. But task->thread_group->next was not changed, it still
> points to T. RCU grace period passes, T is freed.
>
> After that you take rcu_read_lock(), but it is too late! >next points to
> the already freed/reused memory. How can list_first_entry_rcu() help?

Ahh, I completely misunderstood your point. Thanks for the detailed explanation.

> And. Imho it is not good to have the (afaics exactly?) same code in
> mm/nommu.c, even with the same names. Why it is not possible to make
> a single definition?

Yes it is the same code. I put the code in both memory.c and nommu.c
because I thought they fit in there logically. I can find a common
place for it.



-- 
Siddhesh Poyarekar
http://siddhesh.in
