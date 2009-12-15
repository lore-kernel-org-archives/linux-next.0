From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: rr tree build failure
Date: Tue, 15 Dec 2009 14:22:29 +1030
Message-ID: <200912151422.29906.rusty@rustcorp.com.au>
References: <20091211122648.8b305b52.sfr@canb.auug.org.au> <20091214153528.e29f33a6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:41705 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758022AbZLODwd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 14 Dec 2009 22:52:33 -0500
In-Reply-To: <20091214153528.e29f33a6.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dave Jones <davej@redhat.com>

On Mon, 14 Dec 2009 03:05:28 pm Stephen Rothwell wrote:
> Hi Rusty,
> 
> On Fri, 11 Dec 2009 12:26:48 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next build (x86_64 allmodconfig) failed like this:
> > 
> > arch/x86/kernel/cpu/cpufreq/powernow-k8.c: In function 'powernowk8_target':
> > arch/x86/kernel/cpu/cpufreq/powernow-k8.c:1139: error: implicit declaration of function 'tsk_cpumask'
> > arch/x86/kernel/cpu/cpufreq/powernow-k8.c:1139: warning: passing argument 2 of 'cpumask_copy' makes pointer from integer without a cast
> > include/linux/cpumask.h:466: note: expected 'const struct cpumask *' but argument is of type 'int'
> > 
> > Caused by commit 9dd4c5ab546fcac98cfb9ca24ed5cc1bf7f08334
> > ("cpumask:tsk_cpus_allowed-not-tsk_cpumask") from the rr tree interacting
> > with commit b8cbe7e82ec8b55d7bbdde66fc69e788fde00dc6 ("[CPUFREQ] cpumask:
> > don't put a cpumask on the stack in x86...cpufreq/powernow-k8.c") from
> > the cpufreq tree.
> 
> The cpufreq patch above is now in Linus' tree, so You should add the
> patch below to your tree (or squash it into the affected patch).

Thanks, done and rebased.

Cheers,
Rusty.
