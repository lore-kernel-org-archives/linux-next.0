From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: Re: linux-next: Tree for August 29
Date: Tue, 2 Sep 2008 19:13:57 +0200
Message-ID: <200809021913.58543.bzolnier@gmail.com>
References: <503446464.5113091220307879885.JavaMail.root@zmail02.collab.prod.int.phx2.redhat.com> <200809021241.33007.bzolnier@gmail.com> <s5h63peraz1.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ug-out-1314.google.com ([66.249.92.172]:59196 "EHLO
	ug-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751607AbYIBRQa (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 2 Sep 2008 13:16:30 -0400
Received: by ug-out-1314.google.com with SMTP id c2so1720044ugf.37
        for <linux-next@vger.kernel.org>; Tue, 02 Sep 2008 10:16:29 -0700 (PDT)
In-Reply-To: <s5h63peraz1.wl%tiwai@suse.de>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Alan Cox <alan@redhat.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>

On Tuesday 02 September 2008, Takashi Iwai wrote:
> At Tue, 2 Sep 2008 12:41:32 +0200,
> Bartlomiej Zolnierkiewicz wrote:
> > 
> > On Tuesday 02 September 2008, Alan Cox wrote:
> > > > Still happens with next-20080901, also upon closer look it is not
> > > > just an innocent trace dump as /proc/sys/kernel/pty/ dir and its
> > > > content are gone.
> > > 
> > > That would not surprise me. The 0901 tree would have been built at the end of the weekend. I don't actually work 7 days a week, but 5.
> > > 
> > > I've pushed that (including a new implementation of the needed field) tonight.
> > 
> > Thanks, the trace dump is no longer there in next-20080902.
> > 
> > However now I'm getting the fully-fledged kernel panic...
> > 
> > BUG: unable to handle kernel NULL pointer dereference at 0000000c
> > IP: [<c0219cc6>] n_tty_set_termios+0x12/0x2de
> > *pde = 00000000
> > Oops: 0000 [#1] PREEMPT
> > last sysfs file:
> > Modules linked in:
> > 
> > Pid: 1, comm: swapper Tainted: G        W (2.6.27-rc5-next-20080902 #198)
> > EIP: 0060:[<c0219cc6>] EFLAGS: 00000286 CPU: 0
> > EIP is at n_tty_set_termios+0x12/0x2de
> > EAX: 00008a3b EBX: c78ce800 ECX: c78ce800 EDX: 00000000
> > ESI: 00000000 EDI: c7904000 EBP: 00000000 ESP: c7820e48
> >  DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068
> > Process swapper (pid: 1, ti=c7820000 task=c781fcc0 task.ti=c7820000)
> > Stack: c78ce800 c7904000 c021bb80 c78ce800 c78ce800 c021cd3f c78ce800 fffffff4
> >        c785a520 c021980a 00000000 00000000 c785a520 00000000 c78313a0 c0219a22
> >        c74098dc 00000002 00500001 00000001 00000000 00000000 c0459e5c 00000000
> > Call Trace:
> >  [<c021bb80>] n_tty_open+0x71/0x89
> >  [<c021cd3f>] tty_ldisc_setup+0x15/0x59
> >  [<c021980a>] tty_init_dev+0xf2/0x135
> >  [<c0219a22>] tty_open+0x1d5/0x343
> >  [<c0160db0>] chrdev_open+0x147/0x15d
> >  [<c0160c69>] chrdev_open+0x0/0x15d
> >  [<c015d757>] __dentry_open+0x11c/0x204
> >  [<c015d8cf>] nameidata_to_filp+0x28/0x3b
> >  [<c0167a14>] do_filp_open+0x35e/0x692
> >  [<c011cac6>] release_console_sem+0x188/0x1ac
> >  [<c011cedb>] vprintk+0x23f/0x249
> >  [<c0117019>] __dequeue_entity+0x1f/0x71
> >  [<c016e7b6>] alloc_fd+0x5a/0xd6
> >  [<c015d564>] do_sys_open+0x3f/0xb7
> >  [<c02fed27>] schedule+0x27e/0x2d9
> >  [<c015d620>] sys_open+0x1e/0x23
> >  [<c010123f>] init_post+0x2d/0x16a
> >  [<c0103a47>] kernel_thread_helper+0x7/0x10
> >  =======================
> > Code: e0 25 00 f0 ff ff ff 48 14 f6 40 08 08 74 05 e8 a5 51 0e 00 89 d8 5b 5e c3 57 85 c0 53 89 c3 75 04 0f 0b eb fe 8b 40 28 8b 40 0c <33> 42 0c a8 02 74 56 8d bb 60 01 00 00 b9 80 00 00 00 31 c0 f3
> > EIP: [<c0219cc6>] n_tty_set_termios+0x12/0x2de SS:ESP 0068:c7820e48
> > ---[ end trace 4eaa2a86a8e2da22 ]---
> > Kernel panic - not syncing: Attempted to kill init!
> 
> The patch below fixes the Oops, at least.

Confirmed, thanks!
