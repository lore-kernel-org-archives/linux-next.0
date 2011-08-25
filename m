From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: build failure after merge of the final tree (akpm
 and moduleh trees related)
Date: Thu, 25 Aug 2011 14:10:08 -0400
Message-ID: <4E569000.302@windriver.com>
References: <20110825161750.45803be66cba17a6bd3906bc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:55076 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755104Ab1HYSKs (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 25 Aug 2011 14:10:48 -0400
In-Reply-To: <20110825161750.45803be66cba17a6bd3906bc@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Yanmin Zhang <yanmin_zhang@linux.intel.com>

On 11-08-25 02:17 AM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the final tree, today's linux-next build (sparc64 defconfig)
> failed like this:
> 
> kernel/printk.c:536:35: error: expected ')' before string constant
> kernel/printk.c:1116:35: error: expected ')' before string constant
> 
> Caused by commits 8a04dedc045d ("We are enabling some power features on
> medfield.  To test suspend-2-RAM") and d09d67ec904c (same - the following
> commit) from the akpm tree interacting with commit a25ffe9fafa1 ("kernel:
> Map most files to use export.h instead of module.h") from the moduleh
> tree.  This file now needs module.h, not just export.h since
> MODULE_PARM_DESC if defined there.
> 
> I have applied a merge fixup patch to change export.h back to module.h.

Thanks Stephen, I've excluded kernel/printk.c from the conversion to
export.h today.

Paul.

> 
> P.S. Andrew, these commits could do with better subject lines :-(
