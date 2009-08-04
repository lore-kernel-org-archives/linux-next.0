From: Steven Rostedt <srostedt@redhat.com>
Subject: Re: linux-next: tip tree build warning
Date: Tue, 04 Aug 2009 12:24:49 -0400
Message-ID: <1249403089.4634.139.camel@localhost.localdomain>
References: <20090804161640.70817ee6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:58302 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932971AbZHDQZY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 4 Aug 2009 12:25:24 -0400
In-Reply-To: <20090804161640.70817ee6.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 2009-08-04 at 16:16 +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next build (powerpc ppc64_defconfig) produced these warnings:
> 
> kernel/trace/ring_buffer.c: In function 'rb_head_page_set':
> kernel/trace/ring_buffer.c:704: warning: initialization makes pointer from integer without a cast
> kernel/trace/ring_buffer.c:704: warning: initialization makes pointer from integer without a cast
> kernel/trace/ring_buffer.c: In function 'rb_head_page_replace':
> kernel/trace/ring_buffer.c:797: warning: initialization makes integer from pointer without a cast
> 
> Introduced by commit 77ae365eca895061c8bf2b2e3ae1d9ea62869739
> ("ring-buffer: make lockless").
> 

Thanks, I'll take a look at it.

-- Steve
