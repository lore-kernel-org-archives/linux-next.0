From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for May 8 (drivers/media/pci/meye/)
Date: Wed, 8 May 2019 13:22:56 -0700
Message-ID: <f4242ed8-971e-7d07-7df9-628c40d7dbf7@infradead.org>
References: <20190508173403.6088d0db@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190508173403.6088d0db@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
List-Id: linux-next.vger.kernel.org

On 5/8/19 12:34 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20190507:
> 
> The ubifs tree gained a conflict against Linus' tree.
> 


Hi Mauro,

Commit 6159e12e11770fb25e748af90f6c5206c1df09ee:
media: meye: allow building it with COMPILE_TEST on non-x86

causes a build failure when
CONFIG_VIDEO_MEYE=y
CONFIG_SONY_LAPTOP=m


ld: drivers/media/pci/meye/meye.o: in function `meye_s_ctrl':
meye.c:(.text+0x5bb): undefined reference to `sony_pic_camera_command'
ld: meye.c:(.text+0x5db): undefined reference to `sony_pic_camera_command'
ld: meye.c:(.text+0x5fb): undefined reference to `sony_pic_camera_command'
ld: meye.c:(.text+0x61b): undefined reference to `sony_pic_camera_command'
ld: meye.c:(.text+0x63b): undefined reference to `sony_pic_camera_command'
ld: drivers/media/pci/meye/meye.o:meye.c:(.text+0x65b): more undefined references to `sony_pic_camera_command' follow



-- 
~Randy
