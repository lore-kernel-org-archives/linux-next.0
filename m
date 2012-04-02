From: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH 06/11] parisc: fix missing cmpxchg file error from system.h split
Date: Mon, 02 Apr 2012 06:50:23 +0100
Message-ID: <30153.1333345823@redhat.com>
References: <1333312727-11428-7-git-send-email-paul.gortmaker@windriver.com> <1333312727-11428-1-git-send-email-paul.gortmaker@windriver.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:28742 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752183Ab2DBFuh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 Apr 2012 01:50:37 -0400
In-Reply-To: <1333312727-11428-7-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: dhowells@redhat.com, torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, "James E.J. Bottomley" <jejb@parisc-linux.org>, Helge Deller <deller@gmx.de>

Paul Gortmaker <paul.gortmaker@windriver.com> wrote:

> Commit b4816afa3986704d1404fc48e931da5135820472
> 
>     "Move the asm-generic/system.h xchg() implementation to asm-generic/cmpxchg.h"
> 
> introduced the concept of asm/cmpxchg.h but the parisc arch
> never got one.  Fork the cmpxchg content out of the asm/atomic.h
> file to create one.
> 
> Some minor whitespace fixups were done on the block of code that
> created the new file.
> 
> Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>
> Cc: Helge Deller <deller@gmx.de>
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Acked-by: David Howells <dhowells@redhat.com>
