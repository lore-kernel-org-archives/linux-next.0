From: Arnaldo Carvalho de Melo <acme@redhat.com>
Subject: Re: linux-next: Signed-off-by missing from a commit in the tip tree
Date: Thu, 27 Jul 2017 14:56:07 -0300
Message-ID: <20170727175607.GF24815@redhat.com>
References: <20170727094834.371f005e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170727094834.371f005e@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Taeung Song <treeze.taeung@gmail.com>
List-Id: linux-next.vger.kernel.org

Em Thu, Jul 27, 2017 at 09:48:34AM +1000, Stephen Rothwell escreveu:
> Hi all,
> 
> Commit
> 
>   585d93c5ffcc ("perf annotate stdio: Fix --show-total-period")
> 
> has no Signed-off-by for its author.

Ouch, my bad, will have this added to my git hooks...

- Arnaldo
