From: Oleg Nesterov <oleg@redhat.com>
Subject: Re: [PATCH 2/2] mm/linux-next: Fix rcu locking in vm_is_stack
Date: Thu, 8 Mar 2012 18:40:23 +0100
Message-ID: <20120308174023.GA13424@redhat.com>
References: <1331045377.17099.2.camel@deneb.redhat.com> <1331064994-6693-1-git-send-email-siddhesh.poyarekar@gmail.com> <1331064994-6693-2-git-send-email-siddhesh.poyarekar@gmail.com> <20120307153849.GA18879@redhat.com> <CAAHN_R3JW=7VUSOEkiZMctz8zq_njAdJgngMoRF_EDZ4krVbTg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:63879 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751027Ab2CHRrc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 8 Mar 2012 12:47:32 -0500
Content-Disposition: inline
In-Reply-To: <CAAHN_R3JW=7VUSOEkiZMctz8zq_njAdJgngMoRF_EDZ4krVbTg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Siddhesh Poyarekar <siddhesh.poyarekar@gmail.com>
Cc: Mark Salter <msalter@redhat.com>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Paul Gortmaker <paul.gortmaker@windriver.com>

On 03/08, Siddhesh Poyarekar wrote:
>
> On Wed, Mar 7, 2012 at 9:08 PM, Oleg Nesterov <oleg@redhat.com> wrote:
> > rcu_read_lock() can not help without the additional checks. By the
> > time you take it, task->thread_group->next can point to nowhere.
>
> I thought I understood this the second time, but I think I haven't.
>
> > Once again. You have the task_struct *task. It exits,
> > but task->thread_group->next still points to another thread T. Now suppose
> > that T exits too. But task->thread_group->next was not changed, it still
> > points to T. RCU grace period passes, T is freed.
>
> This is the point I haven't understood. From what I understand about
> rcu, the rcu update will first update task->thread_group->next

Not in this case. see __unhash_process(p)->list_del_rcu(p->thread_group).

You missed the fact that ->thread_group differs from the "usual" rcu
protected list. The _head_ of the list can be list_del_rcu'd. Not the
first/last/any entry, even the head.

Or IOW, we do not really have the head. Every task is the list entry,
but it also can be be used as a head by while_each_thread().

> and
> then reclaim the struct it pointed to and not the other way around. So
> with:
>
> >>               rcu_read_lock();
> >> -             while_each_thread(task, t) {
> >> +             t = list_first_entry_rcu(&task->thread_group,
> >> +                                      struct task_struct, thread_group);
>
> since I have the rcu_read_lock when I'm touching the rcu protected
> list,

It is not rcu-protected if this task has already exited, that is why
you need (say) pid_alive() check.

> I guess there is a corner case where the current task is released and
> thread_group is rcu_list_del()'d.

Yes, assuming that "current" means this "task",

> In that case too, before this
> happens, the proc entry is removed

I guess you meant proc_flush_task()... Not sure I really understand,
it can't "remove" the opened entry. This is just optimization which
tries to shrink the cache.

But this doesn't matter, it can exit right after get_pid_task() succeeds.
(OK, and after mm_for_maps() in this particular case, otherwise m_start()
fails).

> and the task namespace is unmounted
> from /proc.

Again, this doesn't matter, but note the nr == 1 check. This is only
called when init exits and this simply does kern_unmount().

> Also, the thread_group being deleted from list is merely
> an update of references and we should get the next element

Yes, yes, yes, but this "next element" can exit too before you take
rcu_read_lock, and in this case the deleted entry won't be updated.
That is the problem.

Oleg.
