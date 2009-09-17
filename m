From: Dave Jones <davej@redhat.com>
Subject: Re: linux-next: cpufreq-current tree build warning
Date: Wed, 16 Sep 2009 22:27:26 -0400
Message-ID: <20090917022726.GA30706@redhat.com>
References: <20090917120651.f0cdf4c2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:32374 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755501AbZIQC1b (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Sep 2009 22:27:31 -0400
Content-Disposition: inline
In-Reply-To: <20090917120651.f0cdf4c2.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kurt Roeckx <kurt@roeckx.be>

On Thu, Sep 17, 2009 at 12:06:51PM +1000, Stephen Rothwell wrote:
 > Hi Dave,
 > 
 > Today's linux-next build (x86_64 allmodconfig) produced this warning:
 > 
 > arch/x86/kernel/cpu/cpufreq/powernow-k8.c: In function 'fill_powernow_table_fidvid':
 > arch/x86/kernel/cpu/cpufreq/powernow-k8.c:1001: warning: passing argument 1 of 'invalidate_entry' from incompatible pointer type
 > arch/x86/kernel/cpu/cpufreq/powernow-k8.c:608: note: expected 'struct cpufreq_frequency_table *' but argument is of type 'struct powernow_k8_data *'
 > 
 > Introduced by commit 7fc1b26613587ab4369615445b5485040c60fef1 ("[CPUFREQ]
 > Fix NULL ptr regression in powernow-k8").

Hi Stephen, 

I'm very confused. I don't see this..

(22:22:25:davej:cpufreq)$ make arch/x86/kernel/cpu/cpufreq/powernow-k8.o
  CHK     include/linux/version.h
  CHK     include/linux/utsrelease.h
  SYMLINK include/asm -> include/asm-x86
  CALL    scripts/checksyscalls.sh
  CC [M]  arch/x86/kernel/cpu/cpufreq/powernow-k8.o
(22:22:30:davej:cpufreq)$ 

Also, line 1001 is ..

	if (data->acpi_data.state_count)

So I'm not sure what your gcc is talking about.

Does next contain additional patches to this file from outside the cpufreq.git tree?

	Dave
