From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the v4l-dvb
 tree
Date: Sat, 27 Apr 2019 08:36:46 +0200
Message-ID: <20190427063646.GE15324@kroah.com>
References: <20190426160658.4929d1ad@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190426160658.4929d1ad@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Cristiano Borges Cardoso <cristianoborgescardoso@gmail.com>, Nishka Dasgupta <nishka.dasgupta@yahoo.com>, Sanjana Sanikommu <sanjana99reddy99@gmail.com>, Vatsala Narang <vatsalanarang@gmail.com>, Bhanusree Pola <bhanusreemahesh@gmail.com>, Himadri Pandya <himadri18.07@gmail.com>, Jules Irenge <jbi.octave@gmail.com>
List-Id: linux-next.vger.kernel.org

On Fri, Apr 26, 2019 at 04:06:58PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the staging tree got conflicts in:
> 
>   drivers/staging/media/zoran/Kconfig
>   drivers/staging/media/zoran/videocodec.c
>   drivers/staging/media/zoran/videocodec.h
>   drivers/staging/media/zoran/zoran.h
>   drivers/staging/media/zoran/zoran_card.c
>   drivers/staging/media/zoran/zoran_card.h
>   drivers/staging/media/zoran/zoran_device.c
>   drivers/staging/media/zoran/zoran_device.h
>   drivers/staging/media/zoran/zoran_driver.c
>   drivers/staging/media/zoran/zoran_procfs.c
>   drivers/staging/media/zoran/zoran_procfs.h
>   drivers/staging/media/zoran/zr36016.c
>   drivers/staging/media/zoran/zr36016.h
>   drivers/staging/media/zoran/zr36050.c
>   drivers/staging/media/zoran/zr36050.h
>   drivers/staging/media/zoran/zr36057.h
>   drivers/staging/media/zoran/zr36060.c
>   drivers/staging/media/zoran/zr36060.h
> 
> between commit:
> 
>   8dce4b265a53 ("media: zoran: remove deprecated driver")
> 
> from the v4l-dvb tree and various commits from the staging tree.

Yeah! glad the driver is now gone, sorry for the merge issues.

greg k-h
