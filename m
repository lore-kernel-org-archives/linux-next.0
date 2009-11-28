From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for November 27 (logfs: hash_index)
Date: Fri, 27 Nov 2009 20:00:10 -0800
Message-ID: <4B10A04A.7090703@oracle.com>
References: <20091127181915.a6af7ba3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet11.oracle.com ([141.146.126.233]:26352 "EHLO
	acsinet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754188AbZK1EBq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 27 Nov 2009 23:01:46 -0500
In-Reply-To: <20091127181915.a6af7ba3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Joern Engel <joern@logfs.org>

Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20091126:


on i386 (X86_32):

fs/built-in.o: In function `hash_index':
dir.c:(.text+0x6c1f2): undefined reference to `__umoddi3'

-- 
~Randy
