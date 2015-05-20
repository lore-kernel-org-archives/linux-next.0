From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: linux-next: Tree for May 19 (arm:vexpress qemu failure due to FB
 patch)
Date: Wed, 20 May 2015 00:12:04 -0700
Message-ID: <20150520071204.GB4026@kroah.com>
References: <20150519173001.129513d7@canb.auug.org.au>
 <20150520060236.GA28644@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150520060236.GA28644@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Scot Doyle <lkml14@scotdoyle.com>, Pavel Machek <pavel@ucw.cz>
List-Id: linux-next.vger.kernel.org

On Tue, May 19, 2015 at 11:02:36PM -0700, Guenter Roeck wrote:
> On Tue, May 19, 2015 at 05:30:01PM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20150518:
> > 
> > The akpm-current tree gained a conflict against Linus' tree.
> > 
> > Non-merge commits (relative to Linus' tree): 4713
> >  4246 files changed, 207445 insertions(+), 103657 deletions(-)
> > 
> > ----------------------------------------------------------------------------
> > 
> I get an arm qemu runtime failure with this kernel when testing
> a vexpress configuration. Kernel log output is
> 
> Freeing unused kernel memory: 264K (80618000 - 8065a000)
> random: nonblocking pool is initialized
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 661 at kernel/time/timer.c:1098 del_timer_sync+0x4c/0x54()
> ** 20 printk messages dropped ** [<80059184>] (handle_irq_event_percpu) from [<8005928c>] (handle_irq_event+0x44/0x64)
> ** 127 printk messages dropped ** [<80059184>] (handle_irq_event_percpu) from [<8005928c>] (handle_irq_event+0x44/0x64)
> ** 128 printk messages dropped ** [<8005928c>] (handle_irq_event) from [<8005becc>] (handle_fasteoi_irq+0xa8/0x180)
> ** 127 printk messages dropped ** [<8005928c>] (handle_irq_event) from [<8005becc>] (handle_fasteoi_irq+0xa8/0x180)
> ** 127 printk messages dropped ** [<8005928c>] (handle_irq_event) from [<8005becc>] (handle_fasteoi_irq+0xa8/0x180)
> 
> and many more of those until the qemu session is aborted. The complete log
> is at
> http://server.roeck-us.net:8010/builders/qemu-arm-next/builds/165/steps/qemubuildcommand/logs/stdio
> 
> In some of the bisect builds I also noticed lots of
> 
> ** 167 printk messages dropped ** [<80055c00>] (call_console_drivers.constprop.25) from [<80057144>] (console_unlock+0x4c8/0x51c)
> 
> ---
> Bisect log:
> 
> # bad: [47cb9006f5fc8568ff5f9359d8b05e8f5fc91f12] Add linux-next specific files for 20150519
> # good: [e26081808edadfd257c6c9d81014e3b25e9a6118] Linux 4.1-rc4
> git bisect start 'HEAD' 'v4.1-rc4'
> # good: [6835509ff89e1da06d5c017c962aa00f06fd554a] Merge remote-tracking branch 'drm-panel/drm/panel/for-next'
> git bisect good 6835509ff89e1da06d5c017c962aa00f06fd554a
> # good: [689fbd5603000238443bf1d91277c36962374b27] Merge remote-tracking branch 'rcu/rcu/next'
> git bisect good 689fbd5603000238443bf1d91277c36962374b27
> # bad: [dc5f097e91455245a9ddbff7e9cbb475fd89745c] Merge remote-tracking branch 'staging/staging-next'
> git bisect bad dc5f097e91455245a9ddbff7e9cbb475fd89745c
> # good: [a4f18b1c40875d199a1f7a77f08642d38c4e6b21] staging: comedi: ni_stc.h: tidy up RTSI_Trig_Direction_Register and bits
> git bisect good a4f18b1c40875d199a1f7a77f08642d38c4e6b21
> # bad: [99bd60ce3d5dca9a87c615805947001b5b864102] Merge remote-tracking branch 'tty/tty-next'
> git bisect bad 99bd60ce3d5dca9a87c615805947001b5b864102
> # bad: [77232f791e0605521a978cbe7f79a93df24df374] vt: Don't check KD_GRAPHICS when binding/unbinding
> git bisect bad 77232f791e0605521a978cbe7f79a93df24df374
> # good: [b8dccc1b2e178c4d9702c30fadbadff0c093e3d7] tty: hvc_console.c: move assignment out of if () block
> git bisect good b8dccc1b2e178c4d9702c30fadbadff0c093e3d7
> # good: [31ada047681834d0d6f04adfb305ff26b52d2823] serial: imx: Constify platform_device_id
> git bisect good 31ada047681834d0d6f04adfb305ff26b52d2823
> # good: [853a699739fede12a5465be685f0f366276cb507] serial: tegra: handle race condition on uart rx side
> git bisect good 853a699739fede12a5465be685f0f366276cb507
> # good: [bd63364caa8df38bad2b25b11b2a1b849475cce5] vt: add cursor blink interval escape sequence
> git bisect good bd63364caa8df38bad2b25b11b2a1b849475cce5
> # bad: [03ac6b3499c8a0b1fbb5c33ad6234a9e860f2614] drivers/tty/nozomi.c: rename CONFIG_MAGIC
> git bisect bad 03ac6b3499c8a0b1fbb5c33ad6234a9e860f2614
> # bad: [360ee94b47a80b0e986c9e890f1862d29edf2c45] TTY: msm_smd_tty: Remove unused driver
> git bisect bad 360ee94b47a80b0e986c9e890f1862d29edf2c45
> # bad: [27a4c827c34ac4256a190cc9d24607f953c1c459] fbcon: use the cursor blink interval provided by vt
> git bisect bad 27a4c827c34ac4256a190cc9d24607f953c1c459
> # first bad commit: [27a4c827c34ac4256a190cc9d24607f953c1c459] fbcon: use the cursor blink interval provided by vt
> 
> This seems unlikely, and I don't immediately see what is wrong, but reverting
> the bad commit fixes the problem.

No, that's correct, I have a fix coming soon to resolve this issue.

thanks,

greg k-h
