From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: linux-next: build warning after merge of the tty tree
Date: Mon, 23 Jul 2018 12:03:17 +0300
Message-ID: <769fd35a95a6918faaee8403510ff6aff59431e7.camel@linux.intel.com>
References: <20180723153914.563af11c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180723153914.563af11c@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, 2018-07-23 at 15:39 +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the tty tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> drivers/tty/serial/8250/8250_exar.c: In function 'pci_xr17v35x_setup':
> drivers/tty/serial/8250/8250_exar.c:380:31: warning: unused variable
> 'board' [-Wunused-variable]
>   const struct exar8250_board *board = priv->board;
>                                ^~~~~
> 
> Introduced by commit
> 
>   328c11f24b57 ("serial: 8250_exar: Remove useless has_slave member")

Oops, my fault. Usually I compile with W=1, but I somehow missed this
warning (Okay, found, I used to have it in another patch). Sorry, the
just sent patch should fix it.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
