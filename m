From: Anton Vorontsov <anton@enomsg.org>
Subject: Re: linux-next: Tree for May 7 (bq27x00_battery)
Date: Fri, 10 May 2013 11:46:25 -0700
Message-ID: <20130510184625.GA2602@teo>
References: <20130507134922.981483ab1e5cb09e5543a6cc@canb.auug.org.au>
 <51893811.8080102@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <51893811.8080102@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Rodolfo Giometti <giometti@linux.it>
List-Id: linux-next.vger.kernel.org

On Tue, May 07, 2013 at 10:21:21AM -0700, Randy Dunlap wrote:
> On 05/06/13 20:49, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Please do not add any v3.11 destined work to your linux-next included
> > branches until after v3.10-rc1 is released.
> > 
> > I am receiving a (un)reasonable number of conflicts from there being
> > multiple copies of some commits in various trees.   Please clean this up
> > and resist the temptataion to rebase your trees on the way to your
> > upstream ...
> > 
> > Changes since 20130506:
> > 
> 
> on x86_64:
> 
> drivers/built-in.o: In function `bq27x00_read_i2c':
> bq27x00_battery.c:(.text+0x169e20): undefined reference to `i2c_transfer'
> bq27x00_battery.c:(.text+0x169e44): undefined reference to `i2c_transfer'
> drivers/built-in.o: In function `bq27x00_battery_init':
> bq27x00_battery.c:(.init.text+0x82af): undefined reference to `i2c_register_driver'
> drivers/built-in.o: In function `bq27x00_battery_exit':
> bq27x00_battery.c:(.exit.text+0xd8f): undefined reference to `i2c_del_driver'
> 
> 
> when CONFIG_I2C=m and CONFIG_BATTERY_BQ27X00_I2C=y.

Thanks for the report! This should be fixed by this commit:

commit a2d0dbb4b55681874c5f288538ae55ae69baeaff
Author: Xiong Zhou <jencce.kernel@gmail.com>
Date:   Tue May 7 10:15:56 2013 +0800

    bq27x00: Fix I2C dependency in KConfig
