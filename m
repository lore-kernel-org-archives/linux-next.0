From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: Re: linux-next: Tree for Mar 3
Date: Thu, 3 Mar 2016 16:30:18 +0530
Message-ID: <20160303105910.GA2652@sudip-pc>
References: <20160303170926.05390033@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:34174 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754943AbcCCLAa (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 3 Mar 2016 06:00:30 -0500
Content-Disposition: inline
In-Reply-To: <20160303170926.05390033@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux@roeck-us.net

On Thu, Mar 03, 2016 at 05:09:26PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20160302:

With next-20160301 and next-20160302 I am having problem in allmodconfig
build of x86_64. The error being:

In file included from builtin-check.c:32:0:
elf.h:22:18: fatal error: gelf.h: No such file or directory
compilation terminated.
In file included from elf.c:30:0:
elf.h:22:18: fatal error: gelf.h: No such file or directoryIn file
included from special.h:22:0,
	                  from special.c:26:
elf.h:22:18: fatal error: gelf.h: No such file or directory
compilation terminated.

I have intsalled libelf-dev and now make allmodconfig && make -j8 works
but if I am trying make O=nextbuild allmodconfig && make O=nextbuild -j8
it again fails with the error:
scripts/Makefile.include:3: *** O=nextbuild does not exist.  Stop.

But this has been my normal workflow and I do have a valid directory
called nextbuild.

Am i the only one hitting this error? Do i need to bisect or it is a
known issue?

regards
sudip
