From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the ftrace tree
Date: Tue, 14 Oct 2008 08:26:52 +0200
Message-ID: <20081014062652.GA24978@elte.hu>
References: <20081014160311.c5f0ccdf.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:34882 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752753AbYJNG1J (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Oct 2008 02:27:09 -0400
Content-Disposition: inline
In-Reply-To: <20081014160311.c5f0ccdf.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org

* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the ftrace tree got a conflict in 
> arch/x86/kernel/traps.c between various commits now in Linus' tree and 
> various commits from the ftrace tree.
> 
> The result is a bit of a mess and really needs to be resolved by 
> someone who understands the changes involved.  So I have dropped the 
> ftrace tree for today.

yes - it's quite complex to merge it in its current state, i'll resolve 
that and reintegrate.

	Ingo
