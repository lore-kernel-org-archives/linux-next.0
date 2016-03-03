From: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: linux-next: Tree for Mar 3
Date: Thu, 3 Mar 2016 08:35:27 -0600
Message-ID: <20160303143527.GA2348@treble.redhat.com>
References: <20160303170926.05390033@canb.auug.org.au>
 <20160303105910.GA2652@sudip-pc>
 <20160303111801.GA20230@sudip-pc>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:41613 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756644AbcCCOf3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 3 Mar 2016 09:35:29 -0500
Content-Disposition: inline
In-Reply-To: <20160303111801.GA20230@sudip-pc>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux@roeck-us.net, Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>, live-patching@vger.kernel.org

On Thu, Mar 03, 2016 at 04:48:01PM +0530, Sudip Mukherjee wrote:
> On Thu, Mar 03, 2016 at 04:30:18PM +0530, Sudip Mukherjee wrote:
> > On Thu, Mar 03, 2016 at 05:09:26PM +1100, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > Changes since 20160302:
> > 
> > With next-20160301 and next-20160302 I am having problem in allmodconfig
> > build of x86_64. The error being:
> > 
> > In file included from builtin-check.c:32:0:
> > elf.h:22:18: fatal error: gelf.h: No such file or directory
> > compilation terminated.
> > In file included from elf.c:30:0:
> > elf.h:22:18: fatal error: gelf.h: No such file or directoryIn file
> > included from special.h:22:0,
> > 	                  from special.c:26:
> > elf.h:22:18: fatal error: gelf.h: No such file or directory
> > compilation terminated.
> > 
> > I have intsalled libelf-dev and now make allmodconfig && make -j8 works
> > but if I am trying make O=nextbuild allmodconfig && make O=nextbuild -j8
> > it again fails with the error:
> > scripts/Makefile.include:3: *** O=nextbuild does not exist.  Stop.
> > 
> > But this has been my normal workflow and I do have a valid directory
> > called nextbuild.
> > 
> > Am i the only one hitting this error? Do i need to bisect or it is a
> > known issue?
> 
> Well, the fastest bisect I have ever done. :)
> bisect shows the first bad commit as:
> d4883d5d6b14 ("objtool: Enable stack metadata validation on 64-bit x86")
> 
> After reverting it the issue I am facing is fixed.
> 
> Adding Cc to:  Josh Poimboeuf, Ingo Molnar and Andrew Morton

Hi Sudip,

It looks like setting 'O=' with a relative path is broken.  I'll have a
patch to fix it shortly.

I'll also try to improve the error message for when libelf-dev isn't
installed.

-- 
Josh
