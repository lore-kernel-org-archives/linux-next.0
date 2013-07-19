From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: linux-next: Tree for May 2 (platform/x86/samsung-laptop)
Date: Fri, 19 Jul 2013 16:45:21 -0700
Message-ID: <20130719234521.GB3264@kroah.com>
References: <20130502173537.c8aa671a1b22abe2ec341b87@canb.auug.org.au>
 <5182DA15.6030901@infradead.org>
 <51E97512.4040500@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <51E97512.4040500@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Fri, Jul 19, 2013 at 10:19:14AM -0700, Randy Dunlap wrote:
> On 05/02/13 14:26, Randy Dunlap wrote:
> > On 05/02/13 00:35, Stephen Rothwell wrote:
> >> Hi all,
> >>
> >> Please do not add any v3.11 destined work to your linux-next included
> >> branches until after v3.10-rc1 is released.
> >>
> >> Changes since 20130501:
> >>
> > 
> > 
> > when CONFIG_ACPI_VIDEO=m and CONFIG_SAMSUNG_LAPTOP=y:
> > 
> > drivers/built-in.o: In function `samsung_init':
> > samsung-laptop.c:(.init.text+0x94ba): undefined reference to `acpi_video_unregister'
> > 
> > 
> > 
> 
> This build error still happens in linux-next of 20130719...

I have not been the samsung-laptop driver maintainer for a few years
now, so there's nothing I can do about this, sorry.

greg k-h
