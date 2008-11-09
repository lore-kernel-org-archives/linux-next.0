From: Avi Kivity <avi@redhat.com>
Subject: Re: next-20081107: ia64 vs kvm
Date: Sun, 09 Nov 2008 12:00:14 +0200
Message-ID: <4916B4AE.50101@redhat.com>
References: <20081107205457.f64dea59.sfr@canb.auug.org.au> <20081107223001.GA16733@x200.localdomain> <706158FABBBA044BAD4FE898A02E4BC21983F9EB@pdsmsx503.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:38814 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753098AbYKIKAZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 9 Nov 2008 05:00:25 -0500
In-Reply-To: <706158FABBBA044BAD4FE898A02E4BC21983F9EB@pdsmsx503.ccr.corp.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Zhang, Xiantao" <xiantao.zhang@intel.com>
Cc: Alexey Dobriyan <adobriyan@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "avi@qumranet.com" <avi@qumranet.com>

Zhang, Xiantao wrote:
> Alexey Dobriyan wrote:
>   
>> On ia64-smp-n-debug-n-preempt-n:
>>
>> arch/ia64/kvm/vmm.c:63: error: 'raw_spinlock_t' has no member named
>> 'lock' 
>>
>>     
> Hi, Avi
> 	This patch should fix the issue Alex met, please apply to kvm.git and queue it for 2.6.28 fixes. Thanks!
> Xiantao
>
> From fae5782b369f4bd6e8edecad5912fea7624f0374 Mon Sep 17 00:00:00 2001
> From: Xiantao Zhang <xiantao.zhang@intel.com>
> Date: Sat, 8 Nov 2008 15:46:59 +0800
> Subject: [PATCH] KVM: IA64: Fix vmm_spin_{un}lock for !CONFIG_SMP.
>
> In the case of !CONFIG_SMP, raw_spinlock_t has no any member
> so vmm_spin_lock should also defines the version for !CONFIG_SMP.
>
>   

Thanks, applied.

-- 
error compiling committee.c: too many arguments to function
