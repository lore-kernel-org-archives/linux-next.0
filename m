From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: build failure after merge of the final tree (block tree related)
Date: Fri, 9 Jul 2010 14:54:08 +0200
Message-ID: <201007091454.09011.arnd@arndb.de>
References: <20100709143940.f0f06690.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100709143940.f0f06690.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <axboe@kernel.dk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Friday 09 July 2010, Stephen Rothwell wrote:

> I applied the following patch for today:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 9 Jul 2010 14:24:38 +1000
> Subject: [PATCH] block: fix for block tracing build error
> 
> block/compat_ioctl.c: In function 'compat_blkdev_ioctl':
> block/compat_ioctl.c:754: error: 'BLKTRACESETUP32' undeclared (first use in this function)

Yes, the fix looks right, sorry about the breakage.
I only tested with CONFIG_BLOCK_TRACE enabled, so I did not
catch this.

Jens, please apply Stephen's patch.
 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
Acked-by: Arnd Bergmann <arnd@arndb.de>

	Arnd
