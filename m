From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: Re: linux-next: Tree for August 29
Date: Mon, 1 Sep 2008 18:33:02 +0200
Message-ID: <200809011833.02570.bzolnier@gmail.com>
References: <1488691311.5043621220261605940.JavaMail.root@zmail02.collab.prod.int.phx2.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mu-out-0910.google.com ([209.85.134.191]:51198 "EHLO
	mu-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751627AbYIAQgw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 1 Sep 2008 12:36:52 -0400
Received: by mu-out-0910.google.com with SMTP id g7so2026707muf.1
        for <linux-next@vger.kernel.org>; Mon, 01 Sep 2008 09:36:50 -0700 (PDT)
In-Reply-To: <1488691311.5043621220261605940.JavaMail.root@zmail02.collab.prod.int.phx2.redhat.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@redhat.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>

On Monday 01 September 2008, Alan Cox wrote:
> > Unfortunately it cannot be simply reverted so it seems
> > like WTF part will need some work after all... ;)
> 
> Tis already fixed ...

Still happens with next-20080901, also upon closer look it is not
just an innocent trace dump as /proc/sys/kernel/pty/ dir and its
content are gone.

Care to send a link to a patch and the patch itself to Stephen so
we can have it fixed also in linux-next?

sysctl table check failed: /kernel/pty/nr .1.62.2 No data
Pid: 1, comm: swapper Tainted: G        W 2.6.27-rc5-next-20080901 #197
 [<c012f45c>] set_fail+0x30/0x39
 [<c012f88e>] sysctl_check_table+0x429/0x467
 [<c012f8a5>] sysctl_check_table+0x440/0x467
 [<c012f8a5>] sysctl_check_table+0x440/0x467
 [<c0121b17>] __register_sysctl_paths+0xab/0x23c
 [<c02ff281>] mutex_lock+0x15/0x23
 [<c0160b49>] exact_lock+0x0/0xd
 [<c0121cc2>] register_sysctl_paths+0x1a/0x1c
 [<c03edd7c>] pty_init+0x215/0x293
 [<c0101122>] _stext+0x3a/0x12a
 [<c03edb67>] pty_init+0x0/0x293
 [<c0117300>] __enqueue_entity+0xcc/0xe2
 [<c0128baf>] __create_workqueue_key+0x14d/0x162
 [<c03d94ba>] kernel_init+0xec/0x150
 [<c03d93ce>] kernel_init+0x0/0x150
 [<c0103a47>] kernel_thread_helper+0x7/0x10
 =======================
