From: Eric Paris <eparis@redhat.com>
Subject: Re: linux-next: security-testing tree build failure
Date: Wed, 12 Nov 2008 09:05:06 -0500
Message-ID: <1226498706.3353.11.camel@localhost.localdomain>
References: <20081112160553.33ad43df.sfr@canb.auug.org.au>
	 <alpine.LRH.1.10.0811122155510.12886@tundra.namei.org>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:52640 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750763AbYKLOFZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 12 Nov 2008 09:05:25 -0500
In-Reply-To: <alpine.LRH.1.10.0811122155510.12886@tundra.namei.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Morris <jmorris@namei.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Stephen Smalley <sds@tycho.nsa.gov>

On Wed, 2008-11-12 at 21:56 +1100, James Morris wrote:
> On Wed, 12 Nov 2008, Stephen Rothwell wrote:
> 
> > Hi James,
> > 
> > Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> > 
> > In file included from init/main.c:35:
> > include/linux/security.h:1788: error: static declaration of 'security_capable' follows non-static declaration
> > include/linux/capability.h:524: error: previous declaration of 'security_capable' was here
> > include/linux/security.h:1793: error: static declaration of 'security_capable_noaudit' follows non-static declaration
> > include/linux/capability.h:525: error: previous declaration of 'security_capable_noaudit' was here
> > 
> > Caused by commit 06112163f5fd9e491a7f810443d81efa9d88e247 ("Add a new
> > capable interface that will be used by systems that use audit to").
> > 
> > Please compile test with and without CONFIG_SECURITY.
> 
> Done, with the patch below (now pushed to the tree).

Only works in the config security case because every function that calls
has_capability() also includes security.h

Since these are inlined the original caller needs to have the
security_capable and security_capable_noaudit prototype.  The filesystem
changes to use this new interface often do not already #include
security.h.  I'll look at it and wrap them in CONFIG_SECURITY rather
than include security.h in all the filesystem changes.....

-Eric
