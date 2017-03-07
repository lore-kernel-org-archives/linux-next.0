From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the staging tree
Date: Tue, 7 Mar 2017 13:24:01 +0100
Message-ID: <20170307122401.GA32041@kroah.com>
References: <20170307122542.49126980@canb.auug.org.au>
 <20170307084729.GB20446@kroah.com>
 <20170307204947.3096e98f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170307204947.3096e98f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Cox <alan@linux.intel.com>
List-Id: linux-next.vger.kernel.org

On Tue, Mar 07, 2017 at 08:49:47PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> On Tue, 7 Mar 2017 09:47:29 +0100 Greg KH <greg@kroah.com> wrote:
> >
> > I really can't duplicate this here, but you and the kbuild bot are
> > hitting this now.  in drivers/staging/media/atomisp/Makefile we have:
> > 	LINUXINCLUDE        += -I drivers/staging/media/atomisp/include/
> > to point the include path at where atomisp_gmin_platform.h is at.
> > 
> > So I don't understand what is going on here.  Alan, any hints?
> 
> I use a separate object dir (O=...) so maybe you need
> 
> LINUXINCLUDE += -I$(srctree)/drivers/staging/media/atomisp/include/

Ah!  yeah, using LINUXINCLUDE sucks, I'll go make all of those include
files relative references to make just building a subdir work properly.

thanks for the pointer, this should get fixed in my tree soon...

greg k-h
