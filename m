From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the kvm tree
Date: Mon, 15 Sep 2008 08:53:16 +0200
Message-ID: <20080915065316.GF15680@elte.hu>
References: <20080915101407.2e45a509.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:34558 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751257AbYIOGxh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Sep 2008 02:53:37 -0400
Content-Disposition: inline
In-Reply-To: <20080915101407.2e45a509.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Avi Kivity <avi@qumranet.com>, linux-next@vger.kernel.org, Sheng Yang <sheng.yang@intel.com>, Vegard Nossum <vegard.nossum@gmail.com>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Avi,
> 
> Today's linux-next merge of the kvm tree got a trivial conflict in
> include/asm-x86/msr-index.h between commit
> 77ef50a522717fa040636ee1017179ceba12ff62 ("x86: consolidate header
> guards") from the x86 tree and commit
> 370ad813e210ac91935c6b5fa2e9cf80a0305fad ("x86: Move VMX MSRs to
> msr-index.h") from the kvm tree.

these changes will likely be driven from the KVM tree, so it should not 
go beyond this initial conflict. (commit 77ef50a is already interwoven)

> I fixed it up (see below) and can carry the fixup.

thanks!

	Ingo
