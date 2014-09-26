From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: mmotm 2014-09-25-16-28 uploaded (media/platform/vivid)
Date: Fri, 26 Sep 2014 10:29:58 -0700
Message-ID: <5425A296.3090900@infradead.org>
References: <5424a53b.o+nym6SX0Tg7EdW6%akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5424a53b.o+nym6SX0Tg7EdW6%akpm@linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: akpm@linux-foundation.org, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au, mhocko@suse.cz, Hans Verkuil <hverkuil@xs4all.nl>
List-Id: linux-next.vger.kernel.org

On 09/25/14 16:28, akpm@linux-foundation.org wrote:
> The mm-of-the-moment snapshot 2014-09-25-16-28 has been uploaded to
> 
>    http://www.ozlabs.org/~akpm/mmotm/
> 
> mmotm-readme.txt says
> 
> README for mm-of-the-moment:
> 
> http://www.ozlabs.org/~akpm/mmotm/
> 
> This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
> more than once a week.


on i386, when CONFIG_FB is not enabled:


ERROR: "cfb_fillrect" [drivers/media/platform/vivid/vivid.ko] undefined!
ERROR: "cfb_imageblit" [drivers/media/platform/vivid/vivid.ko] undefined!
ERROR: "fb_alloc_cmap" [drivers/media/platform/vivid/vivid.ko] undefined!
ERROR: "register_framebuffer" [drivers/media/platform/vivid/vivid.ko] undefined!
ERROR: "fb_dealloc_cmap" [drivers/media/platform/vivid/vivid.ko] undefined!
ERROR: "cfb_copyarea" [drivers/media/platform/vivid/vivid.ko] undefined!
ERROR: "unregister_framebuffer" [drivers/media/platform/vivid/vivid.ko] undefined!


I guess that VIDEO_VIVID should depend on FB.

-- 
~Randy
