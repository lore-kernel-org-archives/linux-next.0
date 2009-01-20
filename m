From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the cpufreq tree with the cpus4096
	tree
Date: Tue, 20 Jan 2009 09:21:36 +0100
Message-ID: <20090120082136.GA31473@elte.hu>
References: <20090120134713.1fd5fd3a.sfr@canb.auug.org.au> <20090120052554.GA31797@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:36754 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752397AbZATIV5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 20 Jan 2009 03:21:57 -0500
Content-Disposition: inline
In-Reply-To: <20090120052554.GA31797@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Jones <davej@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>


* Dave Jones <davej@redhat.com> wrote:

> On Tue, Jan 20, 2009 at 01:47:13PM +1100, Stephen Rothwell wrote:
>  > Hi Dave,
>  > 
>  > Today's linux-next merge of the cpufreq tree got a conflict in
>  > arch/x86/kernel/cpu/cpufreq/acpi-cpufreq.c between commit
>  > 5cd7376200be7b8bab085557ff5876b04bd84191 ("fix: crash: IP:
>  > __bitmap_intersects+0x48/0x73") from the cpus4096 tree and commit
>  > 6fc619dc092a0a159cf5fb46afa52f2f8128b1d4 ("[CPUFREQ] checkpatch cleanups
>  > for acpi-cpufreq") from the cpufreq tree.
>  > 
>  > Just changing context.  I fixed it up (see below) and can carry the fix
>  > as necessary.
>  
> Yep, looks sane.
> I can't wait for this cpumask stuff to be over with, it's been a
> pain in the ass for merge collisions.

yeah, same here ... To resolve the conflicts you could merge the current 
x86 fixes tree:

 git pull git://git.kernel.org/pub/scm/linux/kernel/git/tip/linux-2.6-tip.git x86-fixes-for-linus

that's all the pending stuff we have.

	Ingo
