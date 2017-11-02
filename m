From: Ingo Molnar <mingo@kernel.org>
Subject: Re: linux-next: build warning in Linus' tree
Date: Thu, 2 Nov 2017 22:08:19 +0100
Message-ID: <20171102210819.iegvbqfrl3qyk7y2@gmail.com>
References: <20171103072948.5003f4dc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:46213 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934374AbdKBVIX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 2 Nov 2017 17:08:23 -0400
Content-Disposition: inline
In-Reply-To: <20171103072948.5003f4dc@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@infradead.org>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Linus,
> 
> Just building Linus' tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
> 
> warning: objtool: x86 instruction decoder differs from kernel
> 
> This is a change since yesterday.  Linus' tree has been updated with
> these commits since then:
> 
>   4f2ba5dc183b7..ead751507de8
> 
> so, I assume this is just due to the SPDX ids being added to files that
> objtool cares about.
> 
> The perf build also produced lots of Warnings about differences in
> include files.

The warnings are harmless, I'll take care of them tomorrow.

Thanks,

	Ingo
