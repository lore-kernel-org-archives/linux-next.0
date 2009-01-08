From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: Tree for January 7 (wimax: more)
Date: Thu, 8 Jan 2009 11:15:01 +0100
Message-ID: <20090108101501.GA15294@elte.hu>
References: <20090107170646.8d44292b.sfr@canb.auug.org.au>
	<4964EDE6.5090902@oracle.com>
	<200901071051.23010.inaky@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <wimax-bounces@linuxwimax.org>
Content-Disposition: inline
In-Reply-To: <200901071051.23010.inaky@linux.intel.com>
List-Unsubscribe: <http://www.linuxwimax.org/mailman/listinfo/wimax>,
	<mailto:wimax-request@linuxwimax.org?subject=unsubscribe>
List-Archive: <http://lists.moblin.org/pipermail/wimax>
List-Post: <mailto:wimax@linuxwimax.org>
List-Help: <mailto:wimax-request@linuxwimax.org?subject=help>
List-Subscribe: <http://www.linuxwimax.org/mailman/listinfo/wimax>,
	<mailto:wimax-request@linuxwimax.org?subject=subscribe>
Sender: wimax-bounces@linuxwimax.org
Errors-To: wimax-bounces@linuxwimax.org
To: Inaky Perez-Gonzalez <inaky@linux.intel.com>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, wimax@linuxwimax.org, LKML <linux-kernel@vger.kernel.org>, linux-wimax@intel.com, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org


* Inaky Perez-Gonzalez <inaky@linux.intel.com> wrote:

> On Wednesday 07 January 2009, Randy Dunlap wrote:
> > Stephen Rothwell wrote:
> > > Hi all,
> > >
> > > The powerpc ppc44x_defconfig builds again.
> > >
> > > Changes since 20090106:
> >
> > drivers/net/wimax/i2400m/usb.c:403: error: 'struct usb_device' has no
> > member named 'autosuspend_delay' drivers/net/wimax/i2400m/usb.c:404: error:
> > 'struct usb_device' has no member named 'autosuspend_disabled'
> > drivers/net/wimax/i2400m/usb.c:506: error: 'struct usb_device' has no
> > member named 'auto_pm'
> 
> Fix on the way -- need #ifdef CONFIG_PMs in a few parts.

FYI, this build bug has now hit upstream too:

drivers/net/wimax/i2400m/usb.c: In function 'i2400mu_probe':
drivers/net/wimax/i2400m/usb.c:403: error: 'struct usb_device' has no member named 'autosuspend_delay'
drivers/net/wimax/i2400m/usb.c:404: error: 'struct usb_device' has no member named 'autosuspend_disabled'
drivers/net/wimax/i2400m/usb.c: In function 'i2400mu_suspend':
drivers/net/wimax/i2400m/usb.c:506: error: 'struct usb_device' has no member named 'auto_pm'

	Ingo
