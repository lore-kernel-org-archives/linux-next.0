From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: Re: linux-next: Tree for Sep 30
Date: Wed, 30 Sep 2015 13:41:16 +0530
Message-ID: <20150930081116.GA5406@sudip-pc>
References: <20150930161248.6deae391@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150930161248.6deae391@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, Brian Norris <computersforpeace@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Wed, Sep 30, 2015 at 04:12:48PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20150929:

i386 allmodconfig fails with:
ERROR: "__umoddi3" [drivers/mtd/devices/mtdram.ko] undefined!
ERROR: "__moddi3" [drivers/mtd/devices/mtdram.ko] undefined!

arm allmodconfig fails with:
ERROR: "__aeabi_uldivmod" [drivers/mtd/devices/mtdram.ko] undefined!
ERROR: "__aeabi_ldivmod" [drivers/mtd/devices/mtdram.ko] undefined!

Problem with:
7827e3acad2d ("mtd: mtdram: check offs and len in mtdram->erase")

regards
sudip
