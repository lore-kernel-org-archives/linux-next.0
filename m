From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Mar 15 (staging/android/ram_console.c)
Date: Thu, 15 Mar 2012 08:58:02 -0700
Message-ID: <4F62118A.2070403@xenotime.net>
References: <20120315185935.a0c475a30b2836765273a1e5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy8-pub.bluehost.com ([69.89.22.20]:39653 "HELO
	oproxy8-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S965268Ab2COP6I (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 15 Mar 2012 11:58:08 -0400
In-Reply-To: <20120315185935.a0c475a30b2836765273a1e5@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Brian Swetland <swetland@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org

On 03/15/2012 12:59 AM, Stephen Rothwell wrote:

> Hi all,
> 
> News: the build system (see below) has had its toolchains for most
> architectures updated to gcc 4.6.3.  People might like to check the build
> results and consider if this change has caused any problems.  There are
> also a number of architectures that are building today for the first
> time.  Thanks to Tony Breeds for his efforts in providing toolchains.
> 
> Changes since 20120314:



on x86_64 when CONFIG_PRINTK is not enabled:


drivers/staging/android/ram_console.c:99:6: error: 'dmesg_restrict' undeclared (first use in this function)


---
~Randy
