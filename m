From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: [PATCH] kernel/panic.c: reduce 1 byte usage for print tainted
 buffer.
Date: Tue, 8 Oct 2013 01:32:19 +0100
Message-ID: <20131008003219.GC13318@ZenIV.linux.org.uk>
References: <5250354F.4020506@asianux.com>
 <20131007172745.4f023e312df95bd94f078ca8@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:57786 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751706Ab3JHAcf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 7 Oct 2013 20:32:35 -0400
Content-Disposition: inline
In-Reply-To: <20131007172745.4f023e312df95bd94f078ca8@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Chen Gang <gang.chen@asianux.com>, Peter Zijlstra <peterz@infradead.org>, Rusty Russell <rusty@rustcorp.com.au>, Robin Holt <holt@sgi.com>, athorlton@sgi.com, linux-next@vger.kernel.org

On Mon, Oct 07, 2013 at 05:27:45PM -0700, Andrew Morton wrote:

> hm, that code is a bit crufty.
> 
>  - Why is `buf' static?  It could be on-stack.

No, it couldn't - check the callers...
