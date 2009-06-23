From: Avi Kivity <avi@redhat.com>
Subject: Re: linux-next: kvm tree build failure
Date: Tue, 23 Jun 2009 13:23:54 +0300
Message-ID: <4A40AD3A.5000008@redhat.com>
References: <20090623155345.11219074.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:49748 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751608AbZFWKXE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 23 Jun 2009 06:23:04 -0400
In-Reply-To: <20090623155345.11219074.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Marcelo Tosatti <mtosatti@redhat.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, =?ISO-8859-1?Q?Christian_Borntr=E4ger?= <borntrae@de.ibm.com>

On 06/23/2009 08:53 AM, Stephen Rothwell wrote:
> Hi Avi,
>
> Today's linux-next build (s390 allmodconfig) failed like this:
>
> In file included from include/trace/ftrace.h:261,
>                   from include/trace/define_trace.h:56,
>                   from include/trace/events/kvm.h:55,
>                   from arch/s390/kvm/../../../virt/kvm/kvm_main.c:63:
> include/trace/events/kvm.h: In function 'ftrace_raw_output_kvm_ack_irq':
> include/trace/events/kvm.h:31: error: 'KVM_IRQCHIP_PIC_MASTER' undeclared (first use in this function)
> include/trace/events/kvm.h:31: error: (Each undeclared identifier is reported only once
> include/trace/events/kvm.h:31: error: for each function it appears in.)
> include/trace/events/kvm.h:31: error: 'KVM_IRQCHIP_PIC_SLAVE' undeclared (first use in this function)
> include/trace/events/kvm.h:31: error: 'KVM_IRQCHIP_IOAPIC' undeclared (first use in this function)
>
> Caused by commit acb57be20f6b600848a99796d8f115ec079b8b08 ("KVM: convert
> custom marker based tracing to event traces").
>
>    

I applied a patch from Christian Borntraeger addressing this.

-- 
error compiling committee.c: too many arguments to function
