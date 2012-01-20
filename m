From: KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>
Subject: Re: linux-next: Tree for Jan 19 (mm/memcontrol.c)
Date: Fri, 20 Jan 2012 09:00:37 +0900
Message-ID: <20120120090037.e32a119f.kamezawa.hiroyu@jp.fujitsu.com>
References: <20120119125932.a4c67005cf6a0938558e8b36@canb.auug.org.au>
	<4F189A97.5080007@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fgwmail5.fujitsu.co.jp ([192.51.44.35]:53375 "EHLO
	fgwmail5.fujitsu.co.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753943Ab2ATABz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 19 Jan 2012 19:01:55 -0500
In-Reply-To: <4F189A97.5080007@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: glommer@parallels.com, Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>

On Thu, 19 Jan 2012 14:35:03 -0800
Randy Dunlap <rdunlap@xenotime.net> wrote:

> On 01/18/2012 05:59 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20120118:
> 
> 
> on i386:
> 
> mm/built-in.o:(__jump_table+0x8): undefined reference to `memcg_socket_limit_enabled'
> mm/built-in.o:(__jump_table+0x14): undefined reference to `memcg_socket_limit_enabled'
> 
> 
> Full randconfig file is attached.
> 

Thank you. Forwarding this to Costa.

Thanks,
-Kame
