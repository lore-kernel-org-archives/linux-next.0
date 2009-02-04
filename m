From: Avi Kivity <avi@redhat.com>
Subject: Re: linux-next: Tree for January 23 (kvm)
Date: Wed, 04 Feb 2009 15:55:00 +0200
Message-ID: <49899E34.5040404@redhat.com>
References: <20090123184826.f2c91472.sfr@canb.auug.org.au> <497A29D0.2010307@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:55127 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751958AbZBDNzL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 4 Feb 2009 08:55:11 -0500
In-Reply-To: <497A29D0.2010307@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Randy Dunlap wrote:
> Stephen Rothwell wrote:
>   
>> Hi all,
>>
>> News:  I will be on leave next week, so there will probably be no
>> linux-next release until Feb 2.
>>
>> Changes since 20090122:
>>     
>
>
> kvm changes cause this build error on i386:
>
> when kvm is built as module:
> ERROR: "__moddi3" [arch/x86/kvm/kvm.ko] undefined!
>
> or when kvm is built into the kernel image:
> lapic.c:(.text+0x19276): undefined reference to `__moddi3'
>
>
> I guess it's this line:
> 	ns = ktime_to_ns(remaining) % apic->timer.period;
>   

Now fixed.  Sorry about the delay - was on vacation.

-- 
error compiling committee.c: too many arguments to function
