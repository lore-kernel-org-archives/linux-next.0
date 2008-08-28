From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the crypto tree
Date: Thu, 28 Aug 2008 09:27:33 +0200
Message-ID: <20080828072733.GE21875@elte.hu>
References: <20080807133525.8901e2ef.sfr@canb.auug.org.au> <20080825164418.3e74cad0.sfr@canb.auug.org.au> <20080825065525.GA23089@gondor.apana.org.au> <20080825073926.GA9147@elte.hu> <9D7649D18729DE4BB2BD7B494F7FEDC201B96C98@pdsmsx415.ccr.corp.intel.com> <48B5E78E.9010007@zytor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:43307 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752959AbYH1H1w (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 28 Aug 2008 03:27:52 -0400
Content-Disposition: inline
In-Reply-To: <48B5E78E.9010007@zytor.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: "Zhang, Austin" <austin.zhang@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, "Siddha, Suresh B" <suresh.b.siddha@intel.com>, Thomas Gleixner <tglx@linutronix.de>


* H. Peter Anvin <hpa@zytor.com> wrote:

> Zhang, Austin wrote:
>>>> new x86 feature bits should definitely show up in the x86 tree too
>> So can we add sse4.1 into this patch also as: #define 
>> X86_FEATURE_XMM4_1	(4*32+19)
>> even though now no obvious user is asking it in kernel. 
>
> The best would be to:
>
> 1. rename all the feature bits which have inconsistent names in their
>    #defines and in /proc/cpuinfo;
> 2. generate the /proc/cpuinfo table
>    (arch/x86/kernel/cpu/feature_names.c) automatically from
>    cpufeature.h.
>
> 2. is quite trivial, and 1. can be done largely automatically.  I will  
> experiment with this.

i see you committed that into tip/x86/cpu - i just integrated that into 
tip/master and pushed out the result. This way starting at v2.6.28 we'll 
have only a single, non-redundant definition for CPU feature 
information, from which we auto-generate the rest.

	Ingo
