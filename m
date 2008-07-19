From: James Morris <jmorris@namei.org>
Subject: Re: linux-next: Tree for July 17: early crash on x86-64
Date: Sun, 20 Jul 2008 05:54:52 +1000 (EST)
Message-ID: <Xine.LNX.4.64.0807200553380.22632@us.intercode.com.au>
References: <20080718012842.690b8346.sfr@canb.auug.org.au>
 <a4423d670807180652y352e66lfe04d2b33d2ed176@mail.gmail.com>
 <20080719035231.GU28946@ZenIV.linux.org.uk> <200807192042.06988.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from namei.org ([69.55.235.186]:54189 "EHLO us.intercode.com.au"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752198AbYGSTzi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 19 Jul 2008 15:55:38 -0400
In-Reply-To: <200807192042.06988.rjw@sisk.pl>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Alexander Beregalov <a.beregalov@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, Kernel Testers List <kernel-testers@vger.kernel.org>, Stephen Smalley <sds@tycho.nsa.gov>, Eric Paris <eparis@parisplace.org>

On Sat, 19 Jul 2008, Rafael J. Wysocki wrote:

> > vfs-next/net-next conflict; apply the patch below on top of the merge.
> 
> That helped, thanks.
> 
> But next it ran into the BUG_ON() in line 883 of security/selinux/avc.c .
> Disabling selinux made the kernel boot, finally.

Ugh, that's not supposed to happen.  Where was this in the boot?  Do you 
have a console log?


- James
-- 
James Morris
<jmorris@namei.org>
