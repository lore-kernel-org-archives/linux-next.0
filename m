From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH linux-next] mm: fix rcu-lock/unlock balance in
 vm_is_stack()
Date: Tue, 20 Mar 2012 14:03:16 -0700
Message-ID: <20120320140316.f52388bd.akpm@linux-foundation.org>
References: <20120320205455.31285.23096.stgit@zurg>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:35245 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757255Ab2CTVDS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 20 Mar 2012 17:03:18 -0400
In-Reply-To: <20120320205455.31285.23096.stgit@zurg>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Konstantin Khlebnikov <khlebnikov@openvz.org>
Cc: Siddhesh Poyarekar <siddhesh.poyarekar@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 21 Mar 2012 00:54:55 +0400
Konstantin Khlebnikov <khlebnikov@openvz.org> wrote:

> Fix bug introduced in "procfs: mark thread stack correctly in proc/<pid>/maps"
> (patch in mm/linux-next)
> 
> Signed-off-by: Konstantin Khlebnikov <khlebnikov@openvz.org>
> ---
>  mm/memory.c |    5 ++---
>  1 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index ee85fc4..cc08b86 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -3932,13 +3932,12 @@ pid_t vm_is_stack(struct task_struct *task,
>  		while_each_thread(task, t) {
>  			if (vm_is_stack_for_task(t, vma)) {
>  				ret = t->pid;
> -				goto done;
> +				break;
>  			}
>  		}
> +		rcu_read_unlock();
>  	}
>  
> -done:
> -	rcu_read_unlock();
>  	return ret;
>  }
>  

Appears to have been fixed in v3:

pid_t vm_is_stack(struct task_struct *task,
		  struct vm_area_struct *vma, int in_group)
{
	pid_t ret = 0;

	if (vm_is_stack_for_task(task, vma))
		return task->pid;

	if (in_group) {
		struct task_struct *t;
		rcu_read_lock();
		if (!pid_alive(task))
			goto done;

		t = task;
		do {
			if (vm_is_stack_for_task(t, vma)) {
				ret = t->pid;
				goto done;
			}
		} while_each_thread(task, t);
done:
		rcu_read_unlock();
	}

	return ret;
}

I'm working on getting a -next update sent to Stephen today.
