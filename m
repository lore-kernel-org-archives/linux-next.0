From: Avi Kivity <avi@redhat.com>
Subject: Re: linux-next: Tree for January 20 (kvm warnings)
Date: Wed, 20 Jan 2010 19:15:34 +0200
Message-ID: <4B573A36.9090308@redhat.com>
References: <20100120181016.6ba3e504.sfr@canb.auug.org.au> <20100120091241.3f10428d.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:40929 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752413Ab0ATRPm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 20 Jan 2010 12:15:42 -0500
In-Reply-To: <20100120091241.3f10428d.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Marcelo Tosatti <mtosatti@redhat.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org

On 01/20/2010 07:12 PM, Randy Dunlap wrote:
> On Wed, 20 Jan 2010 18:10:16 +1100 Stephen Rothwell wrote:
>
>    
>> Hi all,
>>
>> Changes since 20100119:
>>
>> The kvm tree lost its build failure.
>>      
>
> on i386/X86_32:
>
> arch/x86/kvm/x86.c:3810: warning: left shift count>= width of type
> arch/x86/kvm/x86.c:3812: warning: left shift count>= width of type
> arch/x86/kvm/x86.c:3814: warning: left shift count>= width of type
>
>    

Gleb already posted a patch to fix this.

-- 
error compiling committee.c: too many arguments to function
