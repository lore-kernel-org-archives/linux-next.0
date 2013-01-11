From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: linux-next: manual merge of the signal tree with the arm64 tree
Date: Fri, 11 Jan 2013 09:36:02 +0000
Message-ID: <20130111093602.GB13405@arm.com>
References: <20130111154617.cab6a8d1ff13a4f200969b9d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fw-tnat.cambridge.arm.com ([217.140.96.21]:49056 "EHLO
	cam-smtp0.cambridge.arm.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751591Ab3AKJgq (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 11 Jan 2013 04:36:46 -0500
Content-Disposition: inline
In-Reply-To: <20130111154617.cab6a8d1ff13a4f200969b9d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Will Deacon <Will.Deacon@arm.com>

Hi Stephen,

On Fri, Jan 11, 2013 at 04:46:17AM +0000, Stephen Rothwell wrote:
> Today's linux-next merge of the signal tree got a conflict in
> arch/arm64/kernel/signal32.c between commits 068f1bb36cf1 ("arm64:
> compat: include sa_restorer in old action from rt_sigaction") and
> efed4d52e39f ("arm64: compat: ensure access_ok checks are performed on
> user structures") from the arm64 tree and various commits from the signal
> tree.
> 
> The latter removes the code modified by the former, so I did that.

I think the fix is fine. I'll give Al's patches a test and I can
probably drop Will's patches.

Thanks.

-- 
Catalin
