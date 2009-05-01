From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for May 1 (tmpfs)
Date: Fri, 01 May 2009 08:18:40 -0700
Message-ID: <49FB12D0.5030809@oracle.com>
References: <20090501163405.973f9088.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:62894 "EHLO
	rgminet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756028AbZEAPRW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 1 May 2009 11:17:22 -0400
In-Reply-To: <20090501163405.973f9088.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20090430:


When CONFIG_SHMEM=n:

init/built-in.o: In function `kernel_init':
main.c:(.init.text+0x8be): undefined reference to `init_tmpfs'



-- 
~Randy
