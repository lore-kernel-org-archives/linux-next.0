From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: build failure after merge of the bkl-config tree
Date: Tue, 16 Nov 2010 10:21:57 +0100
Message-ID: <201011161021.57734.arnd@arndb.de>
References: <20101116130853.a3c66c4b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.171]:64286 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934055Ab0KPJWT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 16 Nov 2010 04:22:19 -0500
In-Reply-To: <20101116130853.a3c66c4b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tuesday 16 November 2010 03:08:53 Stephen Rothwell wrote:
> After merging the bkl-config tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> kernel/sched.c: In function 'schedule':
> kernel/sched.c:3896: error: implicit declaration of function 'release_kernel_lock'
> kernel/sched.c:3960: error: implicit declaration of function 'reacquire_kernel_lock'
> 
> Caused by commit 8bbc75c71b8a821edd8abb43452c78fbfd4789dc ("BKL: remove
> extraneous #include <smp_lock.h>").  Not well build tested :-(

Yes, and bad timing. I noticed this in a build test after uploading it,
and uploaded the fixed tree half an hour later, just after you pulleed it :(
Sorry about this, next time I'll do it in the right order.

	Arnd
