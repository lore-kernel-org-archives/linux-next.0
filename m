From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: linux-next: build failure after merge of the pm tree
Date: Mon, 13 Apr 2015 14:06:40 +0200
Message-ID: <1444563.l1DQrQGkC9@vostro.rjw.lan>
References: <20150413142442.2f7107e5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from v094114.home.net.pl ([79.96.170.134]:62745 "HELO
	v094114.home.net.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1750894AbbDMLmK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 13 Apr 2015 07:42:10 -0400
In-Reply-To: <20150413142442.2f7107e5@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Len Brown <len.brown@intel.com>, Dasaratharaman Chandramouli <dasaratharaman.chandramouli@intel.com>

On Monday, April 13, 2015 02:24:42 PM Stephen Rothwell wrote:
> 
> --Sig_/wQd_Ak5TvD_LSZFUNsW5WJr
> Content-Type: text/plain; charset=US-ASCII
> Content-Transfer-Encoding: quoted-printable
> 
> Hi Rafael,
> 
> After merging the pm tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> In file included from arch/x86/include/asm/msr.h:131:0,
>                  from arch/x86/include/asm/processor.h:20,
>                  from arch/x86/include/asm/thread_info.h:23,
>                  from include/linux/thread_info.h:54,
>                  from arch/x86/include/asm/preempt.h:6,
>                  from include/linux/preempt.h:18,
>                  from include/linux/smp.h:55,
>                  from include/linux/kernel_stat.h:4,
>                  from drivers/cpufreq/intel_pstate.c:14:
> drivers/cpufreq/intel_pstate.c: In function 'knl_get_turbo_pstate':
> drivers/cpufreq/intel_pstate.c:622:9: error: 'MSR_NHM_TURBO_RATIO_LIMIT' un=
> declared (first use in this function)
>   rdmsrl(MSR_NHM_TURBO_RATIO_LIMIT, value);
>          ^
> arch/x86/include/asm/paravirt.h:153:26: note: in definition of macro 'rdmsr=
> l'
>   val =3D paravirt_read_msr(msr, &_err); \
>                           ^
> drivers/cpufreq/intel_pstate.c:622:9: note: each undeclared identifier is r=
> eported only once for each function it appears in
>   rdmsrl(MSR_NHM_TURBO_RATIO_LIMIT, value);
>          ^
> arch/x86/include/asm/paravirt.h:153:26: note: in definition of macro 'rdmsr=
> l'
>   val =3D paravirt_read_msr(msr, &_err); \
>                           ^
> 
> Caused by commit 6acfd09a439a ("tools/power turbostat: define and dump
> MSR_TURBO_RATIO_LIMIT2") interacting with commit b34ef932d79a
> ("intel_pstate: Knights Landing support").  This should have been
> resolved in commit 08fb40f3fbeb ("Merge branches 'powercap' and
> 'pm-tools'").

Right, will fix.

Thanks and sorry for the breakage.


-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
