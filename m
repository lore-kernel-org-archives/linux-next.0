From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: manual merge of the tip tree with the cputime tree
Date: Mon, 19 Dec 2011 15:08:43 +0100
Message-ID: <1324303723.24621.1.camel@twins>
References: <20111219154010.c2044c038a6174dd8fb6f477@canb.auug.org.au>
	 <20111219080813.GB30432@elte.hu> <20111219101134.3c2c0db5@de.ibm.com>
	 <20111219103513.GA17928@elte.hu> <20111219133151.4d14af80@de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20111219133151.4d14af80@de.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Schwidefsky <schwidefsky@de.ibm.com>
Cc: Ingo Molnar <mingo@elte.hu>, Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Glauber Costa <glommer@parallels.com>
List-Id: linux-next.vger.kernel.org

On Mon, 2011-12-19 at 13:31 +0100, Martin Schwidefsky wrote:
> Just one question: are you sure that you want the cpustat array
> to be u64 instead of cputime64_t? The content of the cpustat array is defined
> by the architecture semantics of cputime64_t, for CONFIG_VIRT_CPU_ACCOUNTING=y
> this is not a jiffy counter. If the array is u64 we won't get the sparse
> checking when reading from cpustat. 

So as Glauber said the reason was that we wanted to use simply
operators, and IIRC he wanted to add a few fields that had to be u64.

I'm not sure what the current plans are wrt adding more fields, but with
your work cputime_t should again be a simple type and thus regular math
operators should work again, right?

Glauber, do you still need to add fields?
