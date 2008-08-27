From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: linux-next: manual merge of the crypto tree
Date: Wed, 27 Aug 2008 16:47:26 -0700
Message-ID: <48B5E78E.9010007@zytor.com>
References: <20080807133525.8901e2ef.sfr@canb.auug.org.au> <20080825164418.3e74cad0.sfr@canb.auug.org.au> <20080825065525.GA23089@gondor.apana.org.au> <20080825073926.GA9147@elte.hu> <9D7649D18729DE4BB2BD7B494F7FEDC201B96C98@pdsmsx415.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:40848 "EHLO
	terminus.zytor.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753980AbYH0Xsl (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 27 Aug 2008 19:48:41 -0400
In-Reply-To: <9D7649D18729DE4BB2BD7B494F7FEDC201B96C98@pdsmsx415.ccr.corp.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Zhang, Austin" <austin.zhang@intel.com>
Cc: Ingo Molnar <mingo@elte.hu>, Herbert Xu <herbert@gondor.apana.org.au>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, "Siddha, Suresh B" <suresh.b.siddha@intel.com>, Thomas Gleixner <tglx@linutronix.de>

Zhang, Austin wrote:
>>> new x86 feature bits should definitely show up in the x86 tree too
> So can we add sse4.1 into this patch also as: 
> #define X86_FEATURE_XMM4_1	(4*32+19)
> even though now no obvious user is asking it in kernel. 

The best would be to:

1. rename all the feature bits which have inconsistent names in their
    #defines and in /proc/cpuinfo;
2. generate the /proc/cpuinfo table
    (arch/x86/kernel/cpu/feature_names.c) automatically from
    cpufeature.h.

2. is quite trivial, and 1. can be done largely automatically.  I will 
experiment with this.

	-hpa
