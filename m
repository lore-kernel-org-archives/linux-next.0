From: Dave Jones <davej@redhat.com>
Subject: Re: linux-next: manual merge of the cpufreq tree with the cpus4096
	tree
Date: Tue, 20 Jan 2009 00:25:54 -0500
Message-ID: <20090120052554.GA31797@redhat.com>
References: <20090120134713.1fd5fd3a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:44200 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750819AbZATF03 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 20 Jan 2009 00:26:29 -0500
Content-Disposition: inline
In-Reply-To: <20090120134713.1fd5fd3a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Ingo Molnar <mingo@elte.hu>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>

On Tue, Jan 20, 2009 at 01:47:13PM +1100, Stephen Rothwell wrote:
 > Hi Dave,
 > 
 > Today's linux-next merge of the cpufreq tree got a conflict in
 > arch/x86/kernel/cpu/cpufreq/acpi-cpufreq.c between commit
 > 5cd7376200be7b8bab085557ff5876b04bd84191 ("fix: crash: IP:
 > __bitmap_intersects+0x48/0x73") from the cpus4096 tree and commit
 > 6fc619dc092a0a159cf5fb46afa52f2f8128b1d4 ("[CPUFREQ] checkpatch cleanups
 > for acpi-cpufreq") from the cpufreq tree.
 > 
 > Just changing context.  I fixed it up (see below) and can carry the fix
 > as necessary.
 
Yep, looks sane.
I can't wait for this cpumask stuff to be over with, it's been a
pain in the ass for merge collisions.

	Dave

-- 
http://www.codemonkey.org.uk
