From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: build failure after merge of the final tree (pm
 tree related)
Date: Fri, 19 Aug 2011 13:33:45 -0700
Message-ID: <20110819133345.36349fc9.rdunlap@xenotime.net>
References: <20110819130328.ee5c4b7191db0ce2c8a02e39@canb.auug.org.au>
	<CAN5iSWpGKF4qu5yqeDk=nxvq0tVs6+mozAEJ+FLdh=Ryx-hsEA@mail.gmail.com>
	<20110819233950.e526ac71ca862f45538b8721@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy5-pub.bluehost.com ([67.222.38.55]:49894 "HELO
	oproxy5-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1754710Ab1HSUdr (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 19 Aug 2011 16:33:47 -0400
In-Reply-To: <20110819233950.e526ac71ca862f45538b8721@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Pihet-XID, Jean" <j-pihet@ti.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 19 Aug 2011 23:39:50 +1000 Stephen Rothwell wrote:

> Hi, 
> 
> On Fri, 19 Aug 2011 10:14:11 +0200 "Pihet-XID, Jean" <j-pihet@ti.com> wrote:
> >
> > Well, it is not as easy as it seems. As the patch set describes, I am
> > build testing for x86 and OMAP. At the moment due to config
> > dependencies it is _impossible_ to disable PM in the OMAP config.
> > 
> > Also I cannot build test every platform out there.
> > Do you have a procedure for build testing?
> 
> I do not expect developers (or even maintainers) to build for every
> architecture/platform  - that is partly what linux-next is for (see
> http://kisskb.ellerman.id.au/linux-next ).  It is good to see you at
> least thought about the !PM case.  Can't it be turned off in x86?

Sure it can.  For mainline -rc and 3.x releases, I am trying to build
an almost-allmodconfig kernel (x86_64 only) with one major option
disabled.  The $major option that is disabled is one of each of the
following:
  BLOCK HOTPLUG INET INPUT MAGIC_SYSRQ NET PCI PM PROC_FS SMP SYSCTL SYSFS

There used to be several build errors for HOTPLUG or MAGIC_SYSRQ disabled,
but those aren't finding problems lately like they used to.  I could probably
drop them.


> I am a bit sensitive about these sort of build errors as I see it happen
> way to often that a developer make a typo in the !CONFIG_XXX stubs.


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
