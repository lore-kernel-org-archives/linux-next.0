From: Avi Kivity <avi@redhat.com>
Subject: Re: linux-next: build failure
Date: Sun, 09 Nov 2008 17:50:24 +0200
Message-ID: <491706C0.8090102@redhat.com>
References: <20081107202541.85d6a823.sfr@canb.auug.org.au>	<1226076005.9309.9.camel@localhost.localdomain> <20081108095429.1ade66c9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:60895 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755168AbYKIPue (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 9 Nov 2008 10:50:34 -0500
In-Reply-To: <20081108095429.1ade66c9.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Hollis Blanchard <hollisb@us.ibm.com>, Avi Kivity <avi@qumranet.com>, linux-next@vger.kernel.org, Josh Boyer <jwboyer@linux.vnet.ibm.com>

Stephen Rothwell wrote:
> Hi Hollis,
>
> On Fri, 07 Nov 2008 10:40:05 -0600 Hollis Blanchard <hollisb@us.ibm.com> wrote:
>   
>> Hi Stephen, it looks like Josh accidentally set the following options in
>> ppc44x_defconfig:
>> +CONFIG_VIRTUALIZATION=y
>> +CONFIG_KVM=y
>> +CONFIG_KVM_BOOKE_HOST=y
>>
>> http://git.kernel.org/?p=linux/kernel/git/jwboyer/powerpc-4xx.git;a=commitdiff;h=8531b7a805833649591fa324cadbab7d6b667f4b
>>
>> Since then, CONFIG_KVM_BOOKE_HOST was renamed to CONFIG_KVM_440.
>> Unfortunately I don't have the right Kconfig constraint in place to
>> catch that, leading to this problem. I will submit a patch for this
>> today.
>>     
>
> OK, thanks.
>   

I've merged and pushed this patch, so this should be fixed.

-- 
error compiling committee.c: too many arguments to function
