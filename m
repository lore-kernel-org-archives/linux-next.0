From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: build warning in Linus'  tree
Date: Mon, 25 Oct 2010 08:36:05 +0200
Message-ID: <20101025063605.GA4040@elte.hu>
References: <20101025115736.41d51abe.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20101025115736.41d51abe.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus <torvalds@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Robert Richter <robert.richter@amd.com>
List-Id: linux-next.vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> In building Linus' tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
> 
> arch/x86/oprofile/op_model_amd.c: In function 'ibs_eilvt_valid':
> arch/x86/oprofile/op_model_amd.c:289: warning: 'offset' may be used uninitialized in this function
> 
> .. and indeed it may be.

Yep, that looks bogus. I've queued up the fix.

Thanks,

	Ingo
