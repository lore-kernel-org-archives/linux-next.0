From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Dec 21 (logfs)
Date: Mon, 21 Dec 2015 09:37:18 -0800
Message-ID: <567838CE.1050301@infradead.org>
References: <20151221190526.48a9ad86@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:53681 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751542AbbLURhZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 21 Dec 2015 12:37:25 -0500
In-Reply-To: <20151221190526.48a9ad86@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Joern Engel <joern@logfs.org>

On 12/21/15 00:05, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20151218:
> 

on i386 or x86_64:

when CONFIG_MTD=m and CONFIG_LOGFS=y:

fs/built-in.o: In function `logfs_mount':
super.c:(.text+0xb695e): undefined reference to `logfs_get_sb_mtd'
fs/built-in.o: In function `logfs_get_sb_bdev':
(.text+0xb764a): undefined reference to `logfs_get_sb_mtd'


-- 
~Randy
