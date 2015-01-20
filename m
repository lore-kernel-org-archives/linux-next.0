From: Fabio Estevam <festevam@gmail.com>
Subject: Re: linux-next: Tree for Jan 20 -- Kernel panic - Unable to mount
 root fs
Date: Tue, 20 Jan 2015 17:16:45 -0200
Message-ID: <CAOMZO5A0fjtzX+Gp8pWz=NawY1qEKK10BEgb7BMxTi_634qFYA@mail.gmail.com>
References: <20150120185308.53f4af4e@canb.auug.org.au>
	<20150120165655.GA10904@kria>
	<4237741.ePaG0Gba6D@sifl>
	<CAOMZO5ASd2Z20NOwZaQDneZ=35jyVUG-ggpaxo4v8VSds7yuoA@mail.gmail.com>
	<1421780421.32504.2.camel@theros.lm.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1421780421.32504.2.camel@theros.lm.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ross Zwisler <ross.zwisler@linux.intel.com>
Cc: Boaz Harrosh <openosd@gmail.com>, Jens Axboe <axboe@kernel.dk>, Paul Moore <pmoore@redhat.com>, Sabrina Dubroca <sd@queasysnail.net>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-fsdevel@vger.kernel.org, linux-audit@redhat.com, viro@zeniv.linux.org.uk, Richard Guy Briggs <rgb@redhat.com>
List-Id: linux-next.vger.kernel.org

On Tue, Jan 20, 2015 at 5:00 PM, Ross Zwisler
<ross.zwisler@linux.intel.com> wrote:

> These were just nuisance warnings, I believe, so my guess is that this
> isn't related to your kernel panic.   Reverting Boaz's patches to make
> these warnings go away would let you know for sure.

You are right. Reverting 937af5ecd0591e makes such warnings disappear.
