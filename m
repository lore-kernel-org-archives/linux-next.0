From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Jul 2 (media/pci/meye/)
Date: Mon, 2 Jul 2018 09:39:02 -0700
Message-ID: <c38838a6-5582-6b33-5b6b-8938cfdce571@infradead.org>
References: <20180702145158.10190101@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180702145158.10190101@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-media <linux-media@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@s-opensource.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
List-Id: linux-next.vger.kernel.org

On 07/01/18 21:51, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20180629:
> 

on x86_64:

drivers/media/pci/meye/meye.o: In function `meye_s_ctrl':
meye.c:(.text+0x710): undefined reference to `sony_pic_camera_command'
meye.c:(.text+0x736): undefined reference to `sony_pic_camera_command'
meye.c:(.text+0x75c): undefined reference to `sony_pic_camera_command'
meye.c:(.text+0x782): undefined reference to `sony_pic_camera_command'
meye.c:(.text+0x7a8): undefined reference to `sony_pic_camera_command'

when
CONFIG_SONY_LAPTOP=m
CONFIG_VIDEO_MEYE=y
CONFIG_COMPILE_TEST=y


-- 
~Randy
