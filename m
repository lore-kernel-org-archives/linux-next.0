From: Sasha Levin <sasha.levin@oracle.com>
Subject: Re: [RFC PATCH] Fix abnormal rcu dynticks_nesting values related
 to async page fault
Date: Tue, 27 Nov 2012 09:01:33 -0500
Message-ID: <50B4C7BD.90807@oracle.com>
References: <1353993325.14050.49.camel@ThinkPad-T5421.cn.ibm.com> <20121127130703.GW25516@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:45818 "EHLO
	userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752561Ab2K0OCV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 27 Nov 2012 09:02:21 -0500
In-Reply-To: <20121127130703.GW25516@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Gleb Natapov <gleb@redhat.com>
Cc: Li Zhong <zhong@linux.vnet.ibm.com>, linux-next list <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, paulmck@linux.vnet.ibm.com, avi@redhat.com, fweisbec@gmail.com

On 11/27/2012 08:07 AM, Gleb Natapov wrote:
> Those rcu_irq_enter()/rcu_irq_exit() were introduced by commit
> c5e015d4949aa665 "KVM guest: exit idleness when handling
> KVM_PV_REASON_PAGE_NOT_PRESENT", but now I am starting to question this
> commit. KVM_PV_REASON_PAGE_NOT_PRESENT should not kick cpu out of
> idleness. kvm_async_pf_task_wait() checks that cpu is idle and calls
> halt if it is. After that commit schedule() may be called between
> rcu_irq_enter()/rcu_irq_exit() which is probably illegal. Paul?

otoh, calling schedule() apparently kicks cpu out of idleness now.


Thanks,
Sasha
