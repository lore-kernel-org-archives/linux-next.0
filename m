From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: linux-next: tip-core merge conflict
Date: Tue, 10 Jun 2008 21:04:34 +0200
Message-ID: <20080610190434.GC15983@uranus.ravnborg.org>
References: <20080610120857.042ea0f1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:35935 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758268AbYFJTDw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 10 Jun 2008 15:03:52 -0400
Content-Disposition: inline
In-Reply-To: <20080610120857.042ea0f1.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org

On Tue, Jun 10, 2008 at 12:08:57PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's merge of the tip-core tree got a trivial conflict in
> include/asm-generic/vmlinux.lds.h between commit
> f1cb2ba8ca4a8b4b76bbf0b795375af52442501b ("generic: add
> OUTPUT_DATA_SECTION to vmlinux.lds.h") from the kbuild-current tree and
> commit 6360b1fbb4a939efd34fc770c2ebd927c55506e0 ("move BUG_TABLE into
> RODATA") from the tip-core tree.

I have dropped the offending commit from kbuild.git for now.
It will be applied late in the merge window.

	Sam
