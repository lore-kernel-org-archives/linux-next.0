From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the mfd tree
Date: Mon, 20 Sep 2010 00:27:48 +0200
Message-ID: <20100919222747.GA4235@sortiz-mobl>
References: <20100916125447.08698025.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20100916125447.08698025.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Gary King <gking@nvidia.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Thu, Sep 16, 2010 at 12:54:47PM +1000, Stephen Rothwell wrote:
> Hi Samuel,
> 
> After merging the mfd tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> drivers/built-in.o: In function `__tps6586x_read':
> tps6586x.c:(.text+0xe4151): undefined reference to `i2c_smbus_read_byte_data'
> drivers/built-in.o: In function `__tps6586x_write':
> tps6586x.c:(.text+0xe4345): undefined reference to `i2c_smbus_write_byte_data'
> drivers/built-in.o: In function `tps6586x_reads':
> (.text+0xe4762): undefined reference to `i2c_smbus_read_i2c_block_data'
> drivers/built-in.o: In function `tps6586x_writes':
> (.text+0xe4894): undefined reference to `i2c_smbus_write_i2c_block_data'
> drivers/built-in.o: In function `tps6586x_init':
> tps6586x.c:(.init.text+0xc511): undefined reference to `i2c_register_driver'
> drivers/built-in.o: In function `tps6586x_i2c_probe':
> tps6586x.c:(.devinit.text+0x4ae6): undefined reference to `i2c_smbus_read_byte_data'
> drivers/built-in.o: In function `tps6586x_exit':
> tps6586x.c:(.exit.text+0x574): undefined reference to `i2c_del_driver'
> 
> Caused by commit 2d0a9a6d922712267ef62a5e8b38ed2b37cf45cc ("mfd: Add
> basic tps6586x interrupt support").  Presumably a missing dependency.
> 
> I have used the mfd tree from next-20100915 for today.
Sorry about that, this is fixed now.

Cheers,
Samuel.

> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/



-- 
Intel Open Source Technology Centre
http://oss.intel.com/
