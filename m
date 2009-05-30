From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: 20090529: sysfs/reiserfs: possible circular locking dependency
Date: Sat, 30 May 2009 21:45:04 +0200
Message-ID: <20090530194502.GB8739@nowhere>
References: <a4423d670905300833v7ed43bd1p22de438bbc4e69ac@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ew0-f176.google.com ([209.85.219.176]:51952 "EHLO
	mail-ew0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757964AbZE3TpH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 30 May 2009 15:45:07 -0400
Received: by ewy24 with SMTP id 24so6984055ewy.37
        for <linux-next@vger.kernel.org>; Sat, 30 May 2009 12:45:07 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <a4423d670905300833v7ed43bd1p22de438bbc4e69ac@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: linux-next <linux-next@vger.kernel.org>, Greg Kroah-Hartman <gregkh@suse.de>

On Sat, May 30, 2009 at 07:33:03PM +0400, Alexander Beregalov wrote:
> Hi
> 
> Here is a boot process.
> 
> udev: starting version 141
> [ INFO: possible circular locking dependency detected ]
> 2.6.30-rc7-next-20090529-06589-g7701864 #6
> -------------------------------------------------------
> udevadm/708 is trying to acquire lock:
>  (&mm->mmap_sem){++++++}, at: [<c0175962>] might_fault+0x52/0xa0
> 
> but task is already holding lock:
>  (sysfs_mutex){+.+.+.}, at: [<c01d05e6>] sysfs_readdir+0x56/0x200
> 
> which lock already depends on the new lock.
> 
> 
> the existing dependency chain (in reverse order) is:
> 
> -> #3 (sysfs_mutex){+.+.+.}:
> 
> -> #2 (&bdev->bd_mutex){+.+.+.}:
> 
> -> #1 (&REISERFS_SB(s)->lock){+.+.+.}:
> 
> -> #0 (&mm->mmap_sem){++++++}:


I don't understand how it is possible to get the sysfs_mutex
from reiserfs code...
And lockdep backtraces are not very clear...


 
> other info that might help us debug this:
> 
> 2 locks held by udevadm/708:
>  #0:  (&type->i_mutex_dir_key){+.+.+.}, at: [<c0199c7f>] vfs_readdir+0x4f/0xa0
>  #1:  (sysfs_mutex){+.+.+.}, at: [<c01d05e6>] sysfs_readdir+0x56/0x200
> 
> stack backtrace:
> Pid: 708, comm: udevadm Not tainted 2.6.30-rc7-next-20090529-06589-g7701864 #6
> Call Trace:
>  [<c044e812>] ? printk+0x18/0x1e
>  [<c014e53c>] print_circular_bug_tail+0x8c/0xe0
>  [<c014ce8b>] ? print_circular_bug_entry+0x4b/0x50
>  [<c015048e>] __lock_acquire+0xd7e/0x10b0
>  [<c0175962>] ? might_fault+0x52/0xa0
>  [<c0150834>] lock_acquire+0x74/0x90
>  [<c0175962>] ? might_fault+0x52/0xa0
>  [<c0175993>] might_fault+0x83/0xa0
>  [<c0175962>] ? might_fault+0x52/0xa0
>  [<c02cef26>] copy_to_user+0x36/0x130
>  [<c0199a34>] filldir64+0xa4/0xf0
>  [<c01d06a6>] sysfs_readdir+0x116/0x200
>  [<c0199990>] ? filldir64+0x0/0xf0
>  [<c0199cae>] vfs_readdir+0x7e/0xa0
>  [<c0199990>] ? filldir64+0x0/0xf0
>  [<c0199d39>] sys_getdents64+0x69/0xb0
>  [<c0102e48>] sysenter_do_call+0x12/0x36
