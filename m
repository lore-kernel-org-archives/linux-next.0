From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Oct 22 (media/usb/dvb-usb/az6027)
Date: Wed, 22 Oct 2014 09:08:43 -0700
Message-ID: <5447D68B.6020807@infradead.org>
References: <20141022144243.6ecb1063@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141022144243.6ecb1063@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-media <linux-media@vger.kernel.org>, Adams Xu <Adams.xu@azwave.com.cn>, Mauro Carvalho Chehab <m.chehab@samsung.com>
List-Id: linux-next.vger.kernel.org

On 10/21/14 20:42, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20141021:
> 

on x86_64:

when MEDIA_SUBDRV_AUTOSELECT is not enabled:

when DVB_USB_AZ6027=y and DVB_STB0899=m and DVB_STB6100=m:

drivers/built-in.o: In function `az6027_frontend_attach':
az6027.c:(.text+0x18c50d): undefined reference to `stb0899_attach'
az6027.c:(.text+0x18c536): undefined reference to `stb6100_attach'



-- 
~Randy
