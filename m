From: Avi Kivity <avi@redhat.com>
Subject: Re: linux-next: Tree for June 22 (x86/kvm)
Date: Thu, 25 Jun 2009 14:50:09 +0300
Message-ID: <4A436471.2070005@redhat.com>
References: <20090622181920.496d160e.sfr@canb.auug.org.au>	<4A3FAF09.6060304@oracle.com> <20090625140122.e75669e6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:40485 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751220AbZFYLtG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 25 Jun 2009 07:49:06 -0400
In-Reply-To: <20090625140122.e75669e6.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Marcelo Tosatti <mtosatti@redhat.com>

On 06/25/2009 07:01 AM, Stephen Rothwell wrote:
> (cc Avi)
>    

(cc Marcelo)

> On Mon, 22 Jun 2009 09:19:21 -0700 Randy Dunlap<randy.dunlap@oracle.com>  wrote:
>    
>> Stephen Rothwell wrote:
>>      
>>> Hi all,
>>>
>>> Changes since 20090619:
>>>
>>>
>>> The kvm tree lost its conflict and build failure.
>>>        
>> arch/x86/kvm/kvm-amd.o: In function `ftrace_raw_output_kvm_cr':
>> (.text+0x58ed): multiple definition of `ftrace_raw_output_kvm_cr'
>>      
(many more)

>> config attached.
>>      

This is due to CONFIG_KVM_AMD=y and CONFIG_KVM_INTEL=y.  I'm testing a 
patch now.

-- 
error compiling committee.c: too many arguments to function
