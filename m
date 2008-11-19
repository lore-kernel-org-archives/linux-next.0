From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: next-20081119: general protection fault:
 get_next_timer_interrupt()
Date: Wed, 19 Nov 2008 13:14:37 -0800 (PST)
Message-ID: <alpine.LFD.2.00.0811191308030.3119@localhost.localdomain>
References: <a4423d670811190714k13721ae8s125e63d520892440@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754213AbYKSVPU@vger.kernel.org>
In-Reply-To: <a4423d670811190714k13721ae8s125e63d520892440@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, mingo@elte.hu
List-Id: linux-next.vger.kernel.org

Alexander,

On Wed, 19 Nov 2008, Alexander Beregalov wrote:
> 
> It is 4way X86_64
> The kernel does not boot.
 
> RIP: 0010:[<ffffffff80240061>]  [<ffffffff80240061>]
> get_next_timer_interrupt+0x11b/0x1f0

Can you please enable:

CONFIG_DEBUG_OBJECTS=y
CONFIG_DEBUG_OBJECTS_FREE=y
CONFIG_DEBUG_OBJECTS_TIMERS=Y

and add "debug_objects" to the kernel command line ?

Thanks,

	tglx
