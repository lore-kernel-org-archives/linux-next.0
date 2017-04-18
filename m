From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the staging tree
Date: Tue, 18 Apr 2017 16:26:52 +1000
Message-ID: <20170418162652.556077f3@canb.auug.org.au>
References: <20170418153220.734e83f4@canb.auug.org.au>
        <20170418055440.GA31928@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170418055440.GA31928@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Alan Cox <alan@linux.intel.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Greg,

On Tue, 18 Apr 2017 07:54:40 +0200 Greg KH <greg@kroah.com> wrote:
>
> On Tue, Apr 18, 2017 at 03:32:20PM +1000, Stephen Rothwell wrote:
> > Hi Greg,
> > 
> > After merging the staging tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> > 
> > make[7]: *** No rule to make target 'drivers/staging/media/atomisp/pci/atomisp2/css2400/isp/kernels/uds/uds_1.0/ia_css_uds.host.o', needed by 'drivers/staging/media/atomisp/pci/atomisp2/atomisp.o'.  Stop.
> > 
> > Caused by commit
> > 
> >   7afe8f84f793 ("atomisp: remove UDS kernel code")
> > 
> > I have used the staging tree from next-20170413 for today.  
> 
> Ok, the 0-day bot reported something odd like this, with Alan's original
> patches, but I couldn't reproduce it, and then when I applied them, the
> 0-day bot worked just fine.  But now you are having the same issue.
> 
> I'm totally confused, Alan, any ideas?

Well, drivers/staging/media/atomisp/pci/atomisp2/Makefile lists
css2400/isp/kernels/uds/uds_1.0/ia_css_uds.host.o in atomisp-objs.

The above commit deleted
drivers/staging/media/atomisp/pci/atomisp2/css2400/isp/kernels/uds/uds_1.0/ia_css_uds.host.c

-- 
Cheers,
Stephen Rothwell
