From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Feb 4 (media/radio/si4713/radio-usb-si4713.c)
Date: Tue, 04 Feb 2014 08:52:53 -0800
Message-ID: <52F11AE5.9000502@infradead.org>
References: <20140204160704.0cf4cb0ccf45f413056e7f34@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140204160704.0cf4cb0ccf45f413056e7f34@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-media <linux-media@vger.kernel.org>, Eduardo Valentin <edubezval@gmail.com>, Hans Verkuil <hverkuil@xs4all.nl>
List-Id: linux-next.vger.kernel.org

On 02/03/2014 09:07 PM, Stephen Rothwell wrote:
> Hi all,
> 
> This tree fails (more than usual) the powerpc allyesconfig build.
> 
> Changes since 20140203:
> 

on i386:

# CONFIG_I2C is not set

  CC [M]  drivers/media/radio/si4713/radio-usb-si4713.o
drivers/media/radio/si4713/radio-usb-si4713.c: In function 'usb_si4713_video_device_release':
drivers/media/radio/si4713/radio-usb-si4713.c:147:2: error: implicit declaration of function 'i2c_del_adapter' [-Werror=implicit-function-declaration]
drivers/media/radio/si4713/radio-usb-si4713.c: In function 'si4713_register_i2c_adapter':
drivers/media/radio/si4713/radio-usb-si4713.c:424:2: error: implicit declaration of function 'i2c_add_adapter' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
make[5]: *** [drivers/media/radio/si4713/radio-usb-si4713.o] Error 1



-- 
~Randy
