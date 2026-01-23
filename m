Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD00B356A2A;
	Fri, 23 Jan 2026 07:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769152292; cv=none; b=Qvdv/coUjSnAGJDi+2Zs5s4yguMmgxj415579mWdwuc6fAQEV3RbddCTgE/X11HcMkP+kgfiNBNOVYYa9Jg60oLeBvyU99BnBTzUdiTcwjTXqQRN18Fygje4ta/8/lZn7otl8y52yjkuqgR4NebUgs7pyru8P8POxAdvUfMsnn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769152292; c=relaxed/simple;
	bh=s4M2leZWH/U5yK03tjgOG6QY0S2hqOvOrEBaFT8+gVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tgVtIzYgFj2WThwfnBJhJnguvaCJe+yhk+1GtSHSGA+UfkPqZI3vvE0f2dK6LK2cHjokVPZKkBiIjho+RXkSOrbQmq8JnsiZJwsYG40gqr5HHs93Wqfnt/lVWAEVW00RFlZYkbioutMd6VSypFBRMAVPd6dIwWt2LCKeDEsiubQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bawmFSm4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bawmFSm4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEB5BC116D0;
	Fri, 23 Jan 2026 07:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769152292;
	bh=s4M2leZWH/U5yK03tjgOG6QY0S2hqOvOrEBaFT8+gVQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bawmFSm4FOJBELGRn81I/LTPHEz/i+JbdRSYAWTBlZ3Fdpf/7jQN0zKwXs0Lgkzzd
	 yxvlFRs/b068C9QdgnTqkjdjSiIgZSTr7yHfytqfcuI8UYvh/dI1D9boQ3O7yYt/0S
	 31Lk3/x6f7yCxJFdDxWWe+IYN6AEN8Ssp3tPn2X/q46dzDP3uSnfS0s02AOlTz8Uao
	 ITiPnoUk4sv0Z6/aGoUtAuo9e65CiE+hBzmqJiT2Pl+bOCYJ22XfqXNJEyDM0lixRj
	 a+Dr5MukzhQKmEunPvPHaeMI8r03v+izR1vyJMog1YliuyT99qCP1fkUhIDUZLas5v
	 TIQXrzuFYm5YA==
Date: Fri, 23 Jan 2026 08:11:26 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Stephen Rothwell
 <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
 <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Marco Elver
 <elver@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>, Jonathan Corbet
 <corbet@lwn.net>
Subject: Re: linux-next: [DOCS] build warning after merge of the tip tree
Message-ID: <20260123081126.3f0f152c@foz.lan>
In-Reply-To: <91c5386a-2c1b-476a-b189-86d80c0d9e96@infradead.org>
References: <20260107161548.45530e1c@canb.auug.org.au>
	<20260107215409.GB694817@noisy.programming.kicks-ass.net>
	<803d1946-6935-452d-953a-90f6e73d53a2@infradead.org>
	<91c5386a-2c1b-476a-b189-86d80c0d9e96@infradead.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 22 Jan 2026 17:06:28 -0800
Randy Dunlap <rdunlap@infradead.org> wrote:

> + linux-doc + Jon
> 
> On 1/7/26 2:10 PM, Randy Dunlap wrote:
> > 
> > 
> > On 1/7/26 1:54 PM, Peter Zijlstra wrote:  
> >> On Wed, Jan 07, 2026 at 04:15:48PM +1100, Stephen Rothwell wrote:  
> >>> Hi all,
> >>>
> >>> After merging the tip tree, today's linux-next build (htmldocs) produced
> >>> this warning:
> >>>
> >>> Documentation/core-api/kref:328: include/linux/kref.h:72: WARNING: Invalid C declaration: Expected end of definition. [error at 96]
> >>>   int kref_put_mutex (struct kref *kref, void (*release)(struct kref *kref), str
> >>> uct mutex *mutex) __cond_acquires(true# mutex)
> >>>   ------------------------------------------------------------------------------------------------^
> >>> Documentation/core-api/kref:328: include/linux/kref.h:94: WARNING: Invalid C declaration: Expected end of definition. [error at 92]
> >>>   int kref_put_lock (struct kref *kref, void (*release)(struct kref *kref), spinlock_t *lock) __cond_acquires(true# lock)
> >>>   --------------------------------------------------------------------------------------------^
> >>>
> >>> Introduced by commit
> >>>
> >>>   5e256db9325e ("kref: Add context-analysis annotations")  
> >>
> >> I really have no clue what that thing is on about. The code is fine and
> >> works as intended.
> >>
> >> My go-to fix for anything kdoc is to change '/**' into '/*' until it
> >> goes away.  
> > 
> > Yes, that works.
> > 
> > I think that kernel-doc is just confused by the trailing __cond_acquires(true# lock).
> > 
> > Mauro, would you take a look, please?  
> We can trivially ignore "__cond_acquires(.*)" in kernel-doc to
> eliminate such build warnings.
> 
> Is that sufficient? Sure.
> Is it the right thing to do? IDK.
> Comments?

This fix sounds right to me. If not there at the patch,
I would improve the include/linux/kref.h documentation to 
describe __cond_requires() inside the kernel-doc documentation
(or at kref.rst).

> 
> ~Randy
> ---
>  tools/lib/python/kdoc/kdoc_parser.py |    1 +
>  1 file changed, 1 insertion(+)
> 
> --- a/tools/lib/python/kdoc/kdoc_parser.py
> +++ b/tools/lib/python/kdoc/kdoc_parser.py
> @@ -186,6 +186,7 @@ function_xforms  = [
>      (KernRe(r"__sched +"), ""),
>      (KernRe(r"_noprof"), ""),
>      (KernRe(r"__always_unused *"), ""),
> +    (KernRe(r"__cond_acquires\s*\(.*\)"), ""),

Regex here is too broad, as it is greedy: it may drop more
than expected. Perhaps:

    (KernRe(r"__cond_acquires\s*\([^\)]*\)"), ""),

With that, feel free to add:

	Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

>      (KernRe(r"__printf\s*\(\s*\d*\s*,\s*\d*\s*\) +"), ""),
>      (KernRe(r"__(?:re)?alloc_size\s*\(\s*\d+\s*(?:,\s*\d+\s*)?\) +"), ""),
>      (KernRe(r"__diagnose_as\s*\(\s*\S+\s*(?:,\s*\d+\s*)*\) +"), ""),
> 


Thanks,
Mauro
