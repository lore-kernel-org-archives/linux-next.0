From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: Tree for Jan 20 -- Kernel panic - Unable to mount
 root fs
Date: Wed, 21 Jan 2015 00:41:17 +0000
Message-ID: <20150121004117.GM29656@ZenIV.linux.org.uk>
References: <20150120165655.GA10904@kria>
 <20150120232726.GA16913@kria>
 <1517211.UYLV49hvpg@sifl>
 <1528536.jyty2pu4Mz@sifl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:41161 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751037AbbAUAl0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 20 Jan 2015 19:41:26 -0500
Content-Disposition: inline
In-Reply-To: <1528536.jyty2pu4Mz@sifl>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Moore <pmoore@redhat.com>
Cc: Sabrina Dubroca <sd@queasysnail.net>, Guenter Roeck <linux@roeck-us.net>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-audit@redhat.com, Richard Guy Briggs <rgb@redhat.com>

On Tue, Jan 20, 2015 at 07:14:46PM -0500, Paul Moore wrote:
> > > with the patch applied (+panic)
> > > 
> > > 
> > > and:
> > > 
> > > stat("/dev/root") -> 0
> > > stat("dev") -> 0
> > > with the old version of do_path_lookup.
> > 
> > Wait a minute ... at this early stage of boot, I'm pretty sure we don't have
> > a valid current->audit_context since we haven't fork'd anything.  If the
> > audit context was non-NULL garbage that might explain the panic ...

Not really - the panic is predicatable result of not finding /dev/root (hell,
not even /dev there!) in mount_block_root().
 
> Could you try initializing the init_task's audit_context to NULL in the 
> INIT_TASK macro in include/linux/init_task.h?

Missing fields in struct initializer are treated as zeroes.

The shit hits the fan earlier - when we end up missing /dev.  There are
two places where it could've been created (depending on CONFIG_BLK_DEV_INITRD);
	sys_mkdir(collected, mode);
in init/initramfs.c (line 353 in linux-next) and
        err = sys_mkdir((const char __user __force *) "/dev", 0755);
in init/noinitramfs.c (line 32).  The latter would've screamed on failure;
could you printk of collected (%s), mode (%o) and return value (%d) in the
former and see what happens?
