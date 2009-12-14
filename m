From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the limits tree with Linus' tree
Date: Mon, 14 Dec 2009 11:04:04 +0100
Message-ID: <200912141104.04738.arnd@arndb.de>
References: <20091214143917.f5b90e15.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.187]:51238 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755469AbZLNKEX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 14 Dec 2009 05:04:23 -0500
In-Reply-To: <20091214143917.f5b90e15.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jiri Slaby <jirislaby@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Neil Horman <nhorman@tuxdriver.com>

On Monday 14 December 2009, Stephen Rothwell wrote:
> @@@ -622,13 -622,13 +622,17 @@@ __SYSCALL(__NR_move_pages, sys_move_pag
>   __SYSCALL(__NR_rt_tgsigqueueinfo, sys_rt_tgsigqueueinfo)
>   #define __NR_perf_event_open 241
>   __SYSCALL(__NR_perf_event_open, sys_perf_event_open)
>  -#define __NR_getprlimit 242
>  +#define __NR_accept4 242
>  +__SYSCALL(__NR_accept4, sys_accept4)
>  +#define __NR_recvmmsg 243
>  +__SYSCALL(__NR_recvmmsg, sys_recvmmsg)
> ++#define __NR_getprlimit 244
> + __SYSCALL(__NR_getprlimit, sys_getprlimit)
>  -#define __NR_setprlimit 243
> ++#define __NR_setprlimit 245
> + __SYSCALL(__NR_setprlimit, sys_setprlimit)
>   
>   #undef __NR_syscalls
> --#define __NR_syscalls 244
> ++#define __NR_syscalls 246

Looks good.

	Arnd
