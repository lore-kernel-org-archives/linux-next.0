From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the tests tree
Date: Tue, 17 Jun 2008 08:26:02 +0200
Message-ID: <20080617062602.GA17203@elte.hu>
References: <20080617162256.4a17529b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:36289 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755015AbYFQG0Y (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Jun 2008 02:26:24 -0400
Content-Disposition: inline
In-Reply-To: <20080617162256.4a17529b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ananth N Mavinakayanahalli <ananth@in.ibm.com>, linux-next@vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Ananth,
> 
> Today's linux-next merge of the tests tree got a new conflict in 
> lib/Kconfig.debug between commit 
> 1462a200057df08be12f3719e1f37adbd2c6e4d0 ("Revert "prohibit rcutorture 
> from being compiled into the kernel"") from the sched tree and commit 
> db00d6090740863199393461c8332812986ce4ad ("Move rcutorture to 
> tests/").
> 
> It is trivial and I did the obvious fixup and will carry that.

thanks.

	Ingo
