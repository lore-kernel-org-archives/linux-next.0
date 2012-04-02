From: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH 01/11] irq_work: fix compile failure on MIPS from system.h split
Date: Mon, 02 Apr 2012 06:45:51 +0100
Message-ID: <29947.1333345551@redhat.com>
References: <1333312727-11428-2-git-send-email-paul.gortmaker@windriver.com> <1333312727-11428-1-git-send-email-paul.gortmaker@windriver.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:40021 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752183Ab2DBFp6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 Apr 2012 01:45:58 -0400
In-Reply-To: <1333312727-11428-2-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: dhowells@redhat.com, torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org

Paul Gortmaker <paul.gortmaker@windriver.com> wrote:

> Builds of the MIPS platform ip32_defconfig fails as of
> commit 0195c00244dc2e9f522475868fa278c473ba7339
> 
>     "Merge tag 'split-asm_system_h-for-linus-20120328' ..."
> 
> because MIPS xchg() macro uses BUILD_BUG_ON and it was moved
> in commit b81947c646bfefdf98e2fde5d7d39cbbda8525d4
> 
>     "Disintegrate asm/system.h for MIPS"
> 
> The root cause is that the system.h split wasn't tested on
> a baseline with commit 6c03438edeb5c359af35f060ea016ca65671c269
> 
>     "kernel.h: doesn't explicitly use bug.h, so don't include it."
> 
> Since this file uses BUG code in several other places besides
> the xchg call, simply make the inclusion explicit.
> 
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Acked-by: David Howells <dhowells@redhat.com>
