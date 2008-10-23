From: Mike Travis <travis@sgi.com>
Subject: Re: linux-next: manual merge of the rr tree
Date: Thu, 23 Oct 2008 05:50:20 -0700
Message-ID: <4900730C.8020607@sgi.com>
References: <20081023151241.d5ad0919.sfr@canb.auug.org.au> <200810231616.12076.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from relay1.sgi.com ([192.48.171.29]:42427 "EHLO relay.sgi.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751812AbYJWMtV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Oct 2008 08:49:21 -0400
In-Reply-To: <200810231616.12076.rusty@rustcorp.com.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Ingo Molnar <mingo@elte.hu>

Rusty Russell wrote:
> On Thursday 23 October 2008 15:12:41 Stephen Rothwell wrote:
>> Hi Rusty,
>>
>> Today's linux-next merge of the rr tree got a conflict in kernel/smp.c
>> between commit 562d8c23497402eb7eb9caf8dab84439a03a49ea ("smp: reduce
>> stack requirements for smp_call_function_mask") from the cpus4096 tree
>> and commit  ("1855648ee0b5ed8fe800edf401bbe25a3f2ed94a") from the rr tree.
>>
>> Overlapping changes.  I have used the version from the rr tree, but I am
>> not sure if that is the correct thing to do.
> 
> Mike?
> 
> Rusty.

Hi,

Yes, I just started looking at them... Did you push upstream the last
version I sent last night?  Or perhaps my view of the tip tree doesn't
include the cpus4096 tree?

I'll update my linux-next tree and examine the conflicts.

Thanks!

(And Thanks Stephen for dealing with these!  Sorry for the headaches.)

Mike
