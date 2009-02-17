From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the stackprotector tree with the
	x86 tree
Date: Tue, 17 Feb 2009 11:58:39 +0100
Message-ID: <20090217105839.GE6602@elte.hu>
References: <20090217123435.8929e3dd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:51496 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750886AbZBQK6r (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Feb 2009 05:58:47 -0500
Content-Disposition: inline
In-Reply-To: <20090217123435.8929e3dd.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the stackprotector tree got a conflict in
> arch/x86/kernel/setup_percpu.c between various commits from the x86 tree
> and commit 18e7651254221ad0d3cf993cce742858c4521c55 ("manual merge of
> stackprotector") from the stackprotector tree.
> 
> I just used the version of this file from tip/master.

ok - i also eliminated the conflict so interaction should go 
away in the next integration.

	Ingo
