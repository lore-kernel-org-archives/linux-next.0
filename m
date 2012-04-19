From: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Subject: Re: linux-next: triage for April 18, 2012
Date: Fri, 20 Apr 2012 00:24:54 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.1204200023500.2110@axis700.grange>
References: <20120419020136.GB3443@windriver.com> <878vhrjs6x.fsf@laptop.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <878vhrjs6x.fsf@laptop.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Ball <cjb@laptop.org>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>
List-Id: linux-next.vger.kernel.org

On Thu, 19 Apr 2012, Chris Ball wrote:

> Hi,
> 
> On Wed, Apr 18 2012, Paul Gortmaker wrote:
> > ARM:mackerel_defconfig,ag5evm_defconfig
> > 	when:	Apr 19 (possibly earlier?)
> > 	why:	pfc-sh7372.c: undefined reference to `mmc_detect_change'
> > 	why:	pfc-sh73a0.c: undefined reference to `mmc_detect_change'
> > 	status:	
> > 	fix:	
> > 	ref:	http://kisskb.ellerman.id.au/kisskb/buildresult/6131930/
> > 	ref:	http://kisskb.ellerman.id.au/kisskb/buildresult/6131908/
> 
> Adding Guennadi and Magnus to CC for this error (which is coming from
> tmio_mmc_cd_wakeup).

...waiting for these patches to make it in:

http://article.gmane.org/gmane.linux.ports.sh.devel/14412
http://article.gmane.org/gmane.linux.ports.sh.devel/14413

Thanks
Guennadi
---
Guennadi Liakhovetski, Ph.D.
Freelance Open-Source Software Developer
http://www.open-technology.de/
