From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: linux-next: tip tree build warning
Date: Wed, 25 Nov 2009 13:28:44 +0100
Message-ID: <20091125122842.GB5010@nowhere>
References: <20091125215338.d07a95b9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ew0-f219.google.com ([209.85.219.219]:65384 "EHLO
	mail-ew0-f219.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752534AbZKYM2l (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 25 Nov 2009 07:28:41 -0500
Content-Disposition: inline
In-Reply-To: <20091125215338.d07a95b9.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Nov 25, 2009 at 09:53:38PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next build (powerpc ppc64_defconfig) produced this warning:
> 
> kernel/perf_event.c:4306: warning: 'bp_perf_event_destroy' defined but not used
> 
> Introduced by commit 24f1e32c60c45c89a997c73395b69c8af6f0a84e
> ("hw-breakpoints: Rewrite the hw-breakpoints layer on top of perf
> events").



Oh I see, it's not used in the off-case. I'll fix that soon.
Thanks for the report!
