From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for November 28 (misc/tc1100)
Date: Fri, 28 Nov 2008 09:55:08 -0800
Message-ID: <4930307C.30106@oracle.com>
References: <20081128213620.2ec593d4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet12.oracle.com ([148.87.113.124]:57800 "EHLO
	rgminet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751491AbYK1RzV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 28 Nov 2008 12:55:21 -0500
In-Reply-To: <20081128213620.2ec593d4.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20081127:
> 
> Today's tree fails the powerpc allyesconfig build.
> 
> New tree:
> 	trivial
> 
> Undropped trees:
> 
> Dropped trees (temporarily):
> 	v4l-dvb (build problem)
> 	kbuild (build problem)
> 	semaphore-removal (due to unfixed conflicts against Linus' tree)
> 	cpu_alloc (build problem)
> 	perfmon3 (concerns from the x86 team)

make[2]: *** No rule to make target `drivers/misc/tc1100-wmi.o', needed by `drivers/misc/built-in.o'.

on allmodconfig & allyesconfig for i386.

On, moved to drivers/x86/.  Someone needs to clean up drivers/misc/Makefile.

-- 
~Randy
