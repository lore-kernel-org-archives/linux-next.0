From: Avi Kivity <avi@redhat.com>
Subject: Re: [PATCH] kvm: fix irqfd build failure discovered in linux-next
Date: Thu, 21 May 2009 16:29:04 +0300
Message-ID: <4A155720.7050907@redhat.com>
References: <20090521172122.bb12027c.sfr@canb.auug.org.au> <20090521130426.22997.77787.stgit@dev.haskins.net> <4A1552B1.3040502@redhat.com> <4A155669.4010506@novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:39462 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752829AbZEUN3K (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 21 May 2009 09:29:10 -0400
In-Reply-To: <4A155669.4010506@novell.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Gregory Haskins <ghaskins@novell.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, sfr@canb.auug.org.au, kvm@vger.kernel.org

Gregory Haskins wrote:
>>>  EXTRA_CFLAGS += -Ivirt/kvm -Iarch/x86/kvm
>>> +EXTRA_CFLAGS += -DKVM_HAVE_EVENTFD
>>>  
>>>   
>>>       
>> The standard idiom for this is to use a Kconfig symbol; see for
>> example HAVE_KVM_IRQCHIP in arch/*/kvm/Kconfig.
>>     
>
> Ah, I didn't realize I could do this in such a contained manner.  I was
> afraid of polluting the top level arch/Kconfig, which is why I went this
> other route.   But I see from your example that this is not the case.  I
> will make a v2 with this change.
>   

Note the situation is not as good as it could be, as you have to 
replicate the Kconfig for each arch.  One day I'll set up 
virt/kvm/Kconfig which will set up defaults, so archs can override them.

-- 
error compiling committee.c: too many arguments to function
