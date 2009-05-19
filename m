From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for May 19 (devtmpfs build error)
Date: Tue, 19 May 2009 08:58:51 -0700
Message-ID: <20090519085851.3b8386ed.rdunlap@xenotime.net>
References: <20090519183044.a910aa7a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.64.118]:46135 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1752545AbZESP41 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 19 May 2009 11:56:27 -0400
Received: from chimera.site ([71.182.83.218]) by xenotime.net for <linux-next@vger.kernel.org>; Tue, 19 May 2009 08:56:26 -0700
In-Reply-To: <20090519183044.a910aa7a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Kay Sievers <kay.sievers@vrfy.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, 19 May 2009 18:30:44 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20090518:


when CONFIG_SHMEM=n:

drivers/built-in.o: In function `dev_get_sb':
devtmpfs.c:(.text+0x13263b): undefined reference to `shmem_fill_super'


---
~Randy
LPC 2009, Sept. 23-25, Portland, Oregon
http://linuxplumbersconf.org/2009/
