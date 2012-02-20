From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH] params: Fix parse_args() use in PowerPC's reserve_hugetlb_gpages()
Date: Mon, 20 Feb 2012 11:56:13 +1030
Message-ID: <87aa4e8fd6.fsf@rustcorp.com.au>
References: <20120216111513.918494b07a5331eabe3d32ac@canb.auug.org.au> <1329494916-20575-1-git-send-email-pawel.moll@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:42990 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752325Ab2BTDsr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 19 Feb 2012 22:48:47 -0500
In-Reply-To: <1329494916-20575-1-git-send-email-pawel.moll@arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
Cc: Michael Neuling <mikey@neuling.org>, galak@kernel.crashing.org, Becky Bruce <beckyb@kernel.crashing.org>, linux-next@vger.kernel.org, linuxppc-dev@ozlabs.org, McClintock Matthew-B29882 <B29882@freescale.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Pawel Moll <pawel.moll@arm.com>

On Fri, 17 Feb 2012 16:08:36 +0000, Pawel Moll <pawel.moll@arm.com> wrote:
> Commit b8076966e8e1 ("params: <level>_initcall-like kernel parameters")
> changed the parse_args() API without fixing all the callers. Done now.
> 
> Signed-off-by: Pawel Moll <pawel.moll@arm.com>

Thanks Stephen, Pawel.

Applied,
Rusty.
