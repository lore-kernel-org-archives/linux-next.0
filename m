From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: linux-next: manual merge of the crypto tree
Date: Thu, 28 Aug 2008 10:52:41 -0700
Message-ID: <48B6E5E9.5040106@zytor.com>
References: <20080807133525.8901e2ef.sfr@canb.auug.org.au> <20080825164418.3e74cad0.sfr@canb.auug.org.au> <20080825065525.GA23089@gondor.apana.org.au> <20080825073926.GA9147@elte.hu> <9D7649D18729DE4BB2BD7B494F7FEDC201B96C98@pdsmsx415.ccr.corp.intel.com> <48B5E78E.9010007@zytor.com> <20080828072733.GE21875@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:39951 "EHLO
	terminus.zytor.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751805AbYH1Rxa (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 28 Aug 2008 13:53:30 -0400
In-Reply-To: <20080828072733.GE21875@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: "Zhang, Austin" <austin.zhang@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, "Siddha, Suresh B" <suresh.b.siddha@intel.com>, Thomas Gleixner <tglx@linutronix.de>

Ingo Molnar wrote:
>>
>> 1. rename all the feature bits which have inconsistent names in their
>>    #defines and in /proc/cpuinfo;
>> 2. generate the /proc/cpuinfo table
>>    (arch/x86/kernel/cpu/feature_names.c) automatically from
>>    cpufeature.h.
>>
>> 2. is quite trivial, and 1. can be done largely automatically.  I will  
>> experiment with this.
> 
> i see you committed that into tip/x86/cpu - i just integrated that into 
> tip/master and pushed out the result. This way starting at v2.6.28 we'll 
> have only a single, non-redundant definition for CPU feature 
> information, from which we auto-generate the rest.
> 

I did #2; I haven't done #1, since that's an all-sourcebase change; it 
would probably make most sense to do at (approximately) the same time we 
do the include/asm-x86 -> arch/x86/include change.

	-hpa
