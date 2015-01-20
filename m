From: Ross Zwisler <ross.zwisler@linux.intel.com>
Subject: Re: linux-next: Tree for Jan 20 -- Kernel panic - Unable to mount
 root fs
Date: Tue, 20 Jan 2015 12:00:21 -0700
Message-ID: <1421780421.32504.2.camel@theros.lm.intel.com>
References: <20150120185308.53f4af4e@canb.auug.org.au>
	 <20150120165655.GA10904@kria> <4237741.ePaG0Gba6D@sifl>
	 <CAOMZO5ASd2Z20NOwZaQDneZ=35jyVUG-ggpaxo4v8VSds7yuoA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOMZO5ASd2Z20NOwZaQDneZ=35jyVUG-ggpaxo4v8VSds7yuoA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>, Boaz Harrosh <openosd@gmail.com>, Jens Axboe <axboe@kernel.dk>
Cc: Paul Moore <pmoore@redhat.com>, Sabrina Dubroca <sd@queasysnail.net>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-fsdevel@vger.kernel.org, linux-audit@redhat.com, viro@zeniv.linux.org.uk, Richard Guy Briggs <rgb@redhat.com>
List-Id: linux-next.vger.kernel.org

On Tue, 2015-01-20 at 15:54 -0200, Fabio Estevam wrote:
> On Tue, Jan 20, 2015 at 3:39 PM, Paul Moore <pmoore@redhat.com> wrote:
> 
> > Thanks for testing this and reporting the problem, especially such a small
> > bisection.  Unfortunately nothing is immediately obvious to me, would you mind
> > sharing your kernel config so I can try to reproduce and debug the problem?
> 
> In case it helps, I also get the similar errors on a mx6 which is
> built with arch/arm/configs/imx_v6_v7_defconfig:
> 
> [    1.594196] imx-ipuv3 2800000.ipu: IPUv3H probed
> [    1.601836]  ram0: unknown partition table
> [    1.607247]  ram1: unknown partition table
> [    1.612617]  ram2: unknown partition table
> [    1.618010]  ram3: unknown partition table
> [    1.623359]  ram4: unknown partition table
> [    1.628761]  ram5: unknown partition table
> [    1.634065]  ram6: unknown partition table
> [    1.639436]  ram7: unknown partition table
> [    1.644749]  ram8: unknown partition table
> [    1.650132]  ram9: unknown partition table
> [    1.655447]  ram10: unknown partition table
> [    1.660911]  ram11: unknown partition table
> [    1.666268]  ram12: unknown partition table
> [    1.671778]  ram13: unknown partition table
> [    1.677154]  ram14: unknown partition table
> [    1.682593]  ram15: unknown partition table
> [    1.687165] brd: module loaded
> [    1.705148] loop: module loaded

This is probably related to the issue reported in this thread:

https://lkml.org/lkml/2015/1/16/563


These were just nuisance warnings, I believe, so my guess is that this
isn't related to your kernel panic.   Reverting Boaz's patches to make
these warnings go away would let you know for sure.

- Ross
