From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: mmotm 2012-12-14-17-51 uploaded (staging/sb105x)
Date: Sat, 15 Dec 2012 01:00:27 -0500
Message-ID: <1355551227.17101.411.camel@gandalf.local.home>
References: <20121215015227.144C820004E@hpza10.eem.corp.google.com>
	 <50CC0AC4.3080206@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <50CC0AC4.3080206@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Fri, 2012-12-14 at 21:29 -0800, Randy Dunlap wrote:
> On 12/14/12 17:52, akpm@linux-foundation.org wrote:
> > The mm-of-the-moment snapshot 2012-12-14-17-51 has been uploaded to
> > 
> >    http://www.ozlabs.org/~akpm/mmotm/
> > 
> > mmotm-readme.txt says
> > 
> > README for mm-of-the-moment:
> > 
> > http://www.ozlabs.org/~akpm/mmotm/
> > 
> > This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
> > more than once a week.
> > 
> 
> 
> (not from mmotm patches)
> 
> When CONFIG_PARPORT is not enabled:
> 
> drivers/built-in.o: In function `multi_init':
> sb_pci_mp.c:(.init.text+0x162ac): undefined reference to `parport_pc_probe_port'
> 

I sent out a fix today. Thanks,

https://lkml.org/lkml/2012/12/14/250

-- Steve
