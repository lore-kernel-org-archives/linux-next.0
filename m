From: Gleb Natapov <gleb@redhat.com>
Subject: Re: [RFC PATCH] Fix abnormal rcu dynticks_nesting values related to
 async page fault
Date: Tue, 27 Nov 2012 18:39:10 +0200
Message-ID: <20121127163910.GL12969@redhat.com>
References: <1353993325.14050.49.camel@ThinkPad-T5421.cn.ibm.com>
 <CAFTL4hzzumANj7hF5hJPZ5pKPhz4YWC-Ukb3yUKdy_DO+vb3wg@mail.gmail.com>
 <20121127154455.GK12969@redhat.com>
 <CAFTL4hyfCt2imzBYW+Sn5QUAwham=ZQ2nNER5Np7Hq4yg1LzxA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:58755 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755861Ab2K0Qj3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 27 Nov 2012 11:39:29 -0500
Content-Disposition: inline
In-Reply-To: <CAFTL4hyfCt2imzBYW+Sn5QUAwham=ZQ2nNER5Np7Hq4yg1LzxA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Frederic Weisbecker <fweisbec@gmail.com>
Cc: Li Zhong <zhong@linux.vnet.ibm.com>, linux-next list <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, paulmck@linux.vnet.ibm.com, sasha.levin@oracle.com, avi@redhat.com

On Tue, Nov 27, 2012 at 04:56:30PM +0100, Frederic Weisbecker wrote:
> 2012/11/27 Gleb Natapov <gleb@redhat.com>:
> > For KVM_PV_REASON_PAGE_NOT_PRESENT it behaves like an exception.
> 
> Ok.
> There seem to be a bug in kvm_async_pf_task_wait(). Using
> idle_cpu(cpu) to find out if the current task is the idle task may not
> work if there is pending wake up. Me may schedule another task but
> when that other task sleeps later we can't schedule back to idle until
> the fault is completed.
> 
> The right way is to use is_idle_task(current)
But if there is pending wake up then scheduling to the waked up task is
exactly what we want.

--
			Gleb.
