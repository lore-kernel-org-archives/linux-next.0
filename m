From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Oct 29 (tty->raw)
Date: Sun, 28 Oct 2012 21:17:09 -0700
Message-ID: <508E0345.1010600@xenotime.net>
References: <20121029144655.4a3d916780e0246f1f007c3e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121029144655.4a3d916780e0246f1f007c3e@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: linux-next.vger.kernel.org

On 10/28/2012 08:46 PM, Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20121026:
> 


Who made some changes that remove tty->raw ?

There is still one occurrence in arch/um that is causing
a build error (on x86_64 defconfig):

arch/um/drivers/chan_kern.c: In function 'tty_receive_char':
arch/um/drivers/chan_kern.c:89:42: error: 'struct tty_struct' has no member named 'raw'


-- 
~Randy
