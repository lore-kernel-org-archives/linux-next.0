From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: origin tree build failure
Date: Wed, 15 Oct 2008 11:33:19 +0200
Message-ID: <20081015093319.GA19403@elte.hu>
References: <20081015095916.f30c0979.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753019AbYJOJeT@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20081015095916.f30c0979.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-next@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, LKML <linux-kernel@vger.kernel.org>, Liam Girdwood <lrg@slimlogic.co.uk>
List-Id: linux-next.vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Linus, Mark,
> 
> Today's linux-next build (just Linus' tree) (x86_64 allmodconfig) failed
> like this:
> 
> drivers/mfd/wm8350-core.c: In function 'wm8350_device_init':
> drivers/mfd/wm8350-core.c:1220: error: 'NO_IRQ' undeclared (first use in this function)
> 
> Caused by commit ebccec0fa4e35dff0c18663a492a65f4dc6cad7a ("mfd: Add
> WM8350 interrupt support").

hm:

 Author:     Mark Brown <broonie@opensource.wolfsonmicro.com>
 AuthorDate: Fri Oct 10 15:58:14 2008 +0100
 Commit:     Liam Girdwood <lrg@slimlogic.co.uk>
 CommitDate: Mon Oct 13 21:51:56 2008 +0100

if a patch is merged as agressively as that, it should at minimum be 
tested a bit.

	Ingo
