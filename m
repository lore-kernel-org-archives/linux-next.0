From: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH 11/11] asm-generic: add linux/types.h to cmpxchg.h
Date: Mon, 02 Apr 2012 06:53:45 +0100
Message-ID: <30225.1333346025@redhat.com>
References: <1333312727-11428-12-git-send-email-paul.gortmaker@windriver.com> <1333312727-11428-1-git-send-email-paul.gortmaker@windriver.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:1025 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752183Ab2DBFyG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 Apr 2012 01:54:06 -0400
In-Reply-To: <1333312727-11428-12-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: dhowells@redhat.com, torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Jonas Bonn <jonas@southpole.se>

Paul Gortmaker <paul.gortmaker@windriver.com> wrote:

> Builds of the openrisc or1ksim_defconfig show the following:
> 
>   In file included from arch/openrisc/include/generated/asm/cmpxchg.h:1:0,
>                    from include/asm-generic/atomic.h:18,
>                    from arch/openrisc/include/generated/asm/atomic.h:1,
>                    from include/linux/atomic.h:4,
>                    from include/linux/dcache.h:4,
>                    from fs/notify/fsnotify.c:19:
>   include/asm-generic/cmpxchg.h: In function '__xchg':
>   include/asm-generic/cmpxchg.h:34:20: error: expected ')' before 'u8'
>   include/asm-generic/cmpxchg.h:34:20: warning: type defaults to 'int' in type name
> 
> and many more lines of similar errors.  It seems specific to the or32
> because most other platforms have an arch specific component that would
> have already included types.h ahead of time, but the o32 does not.
> 
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Jonas Bonn <jonas@southpole.se>
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Acked-by: David Howells <dhowells@redhat.com
