From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Feb 19 (rapidio: rio_mport_cdev.c)
Date: Fri, 19 Feb 2016 11:07:00 -0800
Message-ID: <56C767D4.1010003@infradead.org>
References: <20160219154952.1bb036cd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160219154952.1bb036cd@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Matt Porter <mporter@kernel.crashing.org>, Alexandre Bounine <alexandre.bounine@idt.com>
List-Id: linux-next.vger.kernel.org

On 02/18/16 20:49, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20160218:
> 

on x86_64 (for the past 3 days or so):
when CONFIG_DMA_ENGINE is not enabled:


../drivers/rapidio/devices/rio_mport_cdev.c: In function 'mport_cdev_open':
../drivers/rapidio/devices/rio_mport_cdev.c:1938:22: error: 'struct mport_cdev_priv' has no member named 'async_list'
  INIT_LIST_HEAD(&priv->async_list);
                      ^
../drivers/rapidio/devices/rio_mport_cdev.c:1939:22: error: 'struct mport_cdev_priv' has no member named 'pend_list'
  INIT_LIST_HEAD(&priv->pend_list);
                      ^
In file included from ../include/linux/seqlock.h:35:0,
                 from ../include/linux/time.h:5,
                 from ../include/linux/stat.h:18,
                 from ../include/linux/module.h:10,
                 from ../drivers/rapidio/devices/rio_mport_cdev.c:17:
../drivers/rapidio/devices/rio_mport_cdev.c:1941:22: error: 'struct mport_cdev_priv' has no member named 'req_lock'
  spin_lock_init(&priv->req_lock);
                      ^
../include/linux/spinlock.h:296:17: note: in definition of macro 'spin_lock_init'
  spinlock_check(_lock);    \
                 ^
In file included from ../include/linux/seqlock.h:35:0,
                 from ../include/linux/time.h:5,
                 from ../include/linux/stat.h:18,
                 from ../include/linux/module.h:10,
                 from ../drivers/rapidio/devices/rio_mport_cdev.c:17:
../drivers/rapidio/devices/rio_mport_cdev.c:1941:22: error: 'struct mport_cdev_priv' has no member named 'req_lock'
  spin_lock_init(&priv->req_lock);
                      ^
../include/linux/spinlock.h:99:24: note: in definition of macro 'raw_spin_lock_init'
  __raw_spin_lock_init((lock), #lock, &__key);  \
                        ^
../drivers/rapidio/devices/rio_mport_cdev.c:1941:2: note: in expansion of macro 'spin_lock_init'
  spin_lock_init(&priv->req_lock);
  ^
../drivers/rapidio/devices/rio_mport_cdev.c: In function 'mport_cdev_ioctl':
../drivers/rapidio/devices/rio_mport_cdev.c:2172:3: error: implicit declaration of function 'rio_mport_alloc_dma' [-Werror=implicit-function-declaration]
   return rio_mport_alloc_dma(filp, (void __user *)arg);
   ^
../drivers/rapidio/devices/rio_mport_cdev.c:2174:3: error: implicit declaration of function 'rio_mport_free_dma' [-Werror=implicit-function-declaration]
   return rio_mport_free_dma(filp, (void __user *)arg);
   ^
../drivers/rapidio/devices/rio_mport_cdev.c:2176:3: warning: passing argument 2 of 'rio_mport_wait_for_async_dma' makes integer from pointer without a cast [enabled by default]
   return rio_mport_wait_for_async_dma(filp, (void __user *)arg);
   ^
../drivers/rapidio/devices/rio_mport_cdev.c:1136:12: note: expected 'int32_t' but argument is of type 'void *'
 static int rio_mport_wait_for_async_dma(struct file *filp, int32_t arg)
            ^




-- 
~Randy
