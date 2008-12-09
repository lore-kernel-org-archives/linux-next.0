From: Alessandro Zummo <alessandro.zummo@towertech.it>
Subject: Re: [PATCH -next] rtc twl4030: rename ioctl function when
 RTC_INTF_DEV=n
Date: Tue, 9 Dec 2008 11:02:59 +0100
Message-ID: <20081209110259.5941ef1b@i1501.lan.towertech.it>
References: <20081203183602.c06f8c39.sfr@canb.auug.org.au>
	<493732D3.4020902@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753459AbYLIKD2@vger.kernel.org>
In-Reply-To: <493732D3.4020902@xenotime.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, sameo@openedhand.com, akpm <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

On Wed, 03 Dec 2008 17:30:59 -0800
Randy Dunlap <rdunlap@xenotime.net> wrote:

> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> Fix build error when RTC_INTF_DEV=n:
> 
> drivers/rtc/rtc-twl4030.c:402: error: 'twl4030_rtc_ioctl' undeclared here (not in a function)
> make[3]: *** [drivers/rtc/rtc-twl4030.o] Error 1
> 
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>


 Acked-by: Alessandro Zummo <a.zummo@towertech.it>

-- 

 Best regards,

 Alessandro Zummo,
  Tower Technologies - Torino, Italy

  http://www.towertech.it
