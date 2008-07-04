From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the x86 tree
Date: Fri, 4 Jul 2008 11:41:46 +0200
Message-ID: <20080704094146.GA22658@elte.hu>
References: <20080704134111.4ad2d444.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:57032 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752505AbYGDJmF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 4 Jul 2008 05:42:05 -0400
Content-Disposition: inline
In-Reply-To: <20080704134111.4ad2d444.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the x86 tree got a conflict in 
> arch/x86/Kconfig between commit 
> efac41894df57d32b483ac622d03541b5b2692c0 ("x86: fix NODES_SHIFT 
> Kconfig range") from Linus' tree and commit 
> dfdf1d75efee39e9396f8384c6f3bf555349ed60 ("x86: modify Kconfig to 
> allow up to 4096 cpus") from the x86 tree.
> 
> I took the version from the x86 tree.

that's the correct resolution i took too - thanks Stephen.

	Ingo
