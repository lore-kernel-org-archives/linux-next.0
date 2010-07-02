From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: linux-next: Tree for July 2 (touchscreen/ad7879)
Date: Fri, 2 Jul 2010 09:58:03 -0700
Message-ID: <201007020958.05448.dmitry.torokhov@gmail.com>
References: <20100702163505.272e6fca.sfr@canb.auug.org.au> <20100702093944.b0ebe49a.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100702093944.b0ebe49a.randy.dunlap@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Michael Hennerich <hennerich@blackfin.uclinux.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Friday, July 02, 2010 09:39:44 am Randy Dunlap wrote:
> On Fri, 2 Jul 2010 16:35:05 +1000 Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20100630:
> > 
> > The tip tree lost a conflict.
> > 
> > The driver-core tree gained a conflict agains the jdelvare-hwmon tree.
> > 
> > -------------------------------------------------------------------------
> > ---
> 
> drivers/input/touchscreen/ad7879.c: In function 'ad7879_probe':
> drivers/input/touchscreen/ad7879.c:487: error: 'struct ad7879' has no
> member named 'mutex' drivers/input/touchscreen/ad7879.c:578: warning:
> passing argument 1 of 'ad7879_gpio_add' from incompatible pointer type
> drivers/input/touchscreen/ad7879.c:444: note: expected 'struct device *'
> but argument is of type 'struct ad7879 *'
> drivers/input/touchscreen/ad7879.c:578: error: too many arguments to
> function 'ad7879_gpio_add' drivers/input/touchscreen/ad7879.c:589:
> warning: passing argument 1 of 'ad7879_gpio_remove' from incompatible
> pointer type drivers/input/touchscreen/ad7879.c:449: note: expected
> 'struct device *' but argument is of type 'struct ad7879 *'
> drivers/input/touchscreen/ad7879.c: In function 'ad7879_remove':
> drivers/input/touchscreen/ad7879.c:604: warning: passing argument 1 of
> 'ad7879_gpio_remove' from incompatible pointer type
> drivers/input/touchscreen/ad7879.c:449: note: expected 'struct device *'
> but argument is of type 'struct ad7879 *'
> 
> 
> config file is attached.
> 

Oops, I will fix that up.

Thanks for the report Randy.

-- 
Dmitry
