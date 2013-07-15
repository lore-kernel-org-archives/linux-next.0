From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: randconfig build error with next-20130715, in drivers/net/ethernet/mellanox/mlx5/core
Date: Mon, 15 Jul 2013 10:32:42 -0700
Message-ID: <51E4323A.3010903@infradead.org>
References: <20130715172614.GA4656@krebstar.arl.arizona.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130715172614.GA4656@krebstar.arl.arizona.edu>
Sender: linux-kernel-owner@vger.kernel.org
To: Jim Davis <jim.epost@gmail.com>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, eli@mellanox.com
List-Id: linux-next.vger.kernel.org

On 07/15/13 10:26, Jim Davis wrote:
> Building with the attached randcom configuration file, which sets
> CONFIG_X86_32=Y
> 
> drivers/built-in.o: In function `average_read':
> debugfs.c:(.text+0x448e91): undefined reference to `__udivdi3'
> make: *** [vmlinux] Error 1
> 

Hi,
You are the third person to report this.

Eli says that he has already fixed it, but a patch was just posted for
it earlier today.

thanks,
-- 
~Randy
