From: Christoph Lameter <cl@linux-foundation.org>
Subject: Re: linux-next: percpu tree build warning
Date: Thu, 12 Nov 2009 10:16:48 -0500 (EST)
Message-ID: <alpine.DEB.1.10.0911121016170.28271@V090114053VZO-1>
References: <20091112174558.128cea97.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753281AbZKLPTT@vger.kernel.org>
In-Reply-To: <20091112174558.128cea97.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Tejun Heo <tj@kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thu, 12 Nov 2009, Stephen Rothwell wrote:

> Hi all,
>
> Today's linux-next build (powerpc ppc64_defconfig) produced this warning:
>
> drivers/net/loopback.c: In function 'loopback_get_stats':
> drivers/net/loopback.c:109: warning: initialization discards qualifiers from pointer target type
>
> The line in question is:
>
> 	lb_stats = per_cpu_ptr(pcpu_lstats, i);
>
> Where "lb_stats" and "pcpu_lstats" are both "const struct pcpu_lstats
> *".  I guess this is because of __verify_pcpu_ptr().

hmm... pcpu_lstats needs to be correctly qualified I guess.
