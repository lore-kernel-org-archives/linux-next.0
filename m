From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: linux-next: manual merge of the arm-lpae tree with the arm tree
Date: Tue, 22 Nov 2011 11:05:25 +0000
Message-ID: <20111122110525.GA32577@arm.com>
References: <20111122120358.aa2cefdcdace9a98acafd4b9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:47809 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753859Ab1KVLFx (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 22 Nov 2011 06:05:53 -0500
Content-Disposition: inline
In-Reply-To: <20111122120358.aa2cefdcdace9a98acafd4b9@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, Russell King <rmk@arm.linux.org.uk>

Stephen,

On Tue, Nov 22, 2011 at 01:03:58AM +0000, Stephen Rothwell wrote:
> Today's linux-next merge of the arm-lpae tree got a conflict in
> arch/arm/mm/ioremap.c between commit 3afb51f744b6 ("ARM: add generic
> ioremap optimization by reusing static mappings") from the arm tree and
> commit ec93d80c4b07 ("ARM: LPAE: Page table maintenance for the 3-level
> format") from the arm-lpae tree.
> 
> I guessed (probably incorrectly) about the fix up (see below).  Please
> supply a better fix if necessary.

The fix-up looks correct from an LPAE perspective. I cannot comment on
the correctness of Nicolas' patch, that's to be discussed on the ARM
Linux list.

Thanks.

-- 
Catalin
