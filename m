From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: linux-next: Tree for July 12 (v4l2-ioctl.c)
Date: Tue, 17 Jul 2012 08:48:37 +0200
Message-ID: <201207170848.37945.hverkuil@xs4all.nl>
References: <20120712160335.9cbff13c2f18eadc7d3cb0cf@canb.auug.org.au> <4FFEF21A.7050701@xenotime.net> <CACVXFVOy7VGstdotnofq=o_UmFh0KwqH6p25MamwAbLfRgcTRg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <CACVXFVOy7VGstdotnofq=o_UmFh0KwqH6p25MamwAbLfRgcTRg@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
To: Ming Lei <ming.lei@canonical.com>
Cc: Randy Dunlap <rdunlap@xenotime.net>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-media <linux-media@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue July 17 2012 04:25:35 Ming Lei wrote:
> On Thu, Jul 12, 2012 at 11:49 PM, Randy Dunlap <rdunlap@xenotime.net> wrote:
> > On 07/11/2012 11:03 PM, Stephen Rothwell wrote:
> >
> >> Hi all,
> >>
> >> Changes since 20120710:
> >
> >
> >
> > on i386 and/or x86_64, drivers/media/video/v4l2-ioctl.c has too many
> > errors to be listed here.  This is the beginning few lines of the errors:
> 
> I see the errors on ARM too.

A fix can be found here:

http://patchwork.linuxtv.org/patch/13336/

Regards,

	Hans
