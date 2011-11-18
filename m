From: Gustavo Padovan <padovan-Y3ZbgMPKUGA34EUeqzHoZw@public.gmane.org>
Subject: Re: linux-next: Tree for Nov 17 (bluetooth)
Date: Fri, 18 Nov 2011 11:30:17 -0200
Message-ID: <20111118133017.GA2131@joana>
References: <20111117150733.a70faf2c9030d511d5367e1e@canb.auug.org.au>
 <4EC5496F.2080509@xenotime.net>
 <20111118095855.GB9034@aemeltch-MOBL1>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-bluetooth-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20111118095855.GB9034@aemeltch-MOBL1>
Sender: linux-bluetooth-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrei Emeltchenko <andrei.emeltchenko.news-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel@vg>
List-Id: linux-next.vger.kernel.org

Hi Andrei,

* Andrei Emeltchenko <andrei.emeltchenko.news-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> [2011-11-18 11:58:58 +0200]:

> Hi Randy,
> 
> On Thu, Nov 17, 2011 at 09:50:39AM -0800, Randy Dunlap wrote:
> > On 11/16/2011 08:07 PM, Stephen Rothwell wrote:
> > > Hi all,
> > 
> > 
> > When CONFIG_BT_L2CAP is not enabled:
> > 
> > net/built-in.o: In function `hci_dev_open':
> > (.text+0xdce9a): undefined reference to `enable_hs'
> 
> Despite not enabling L2CAP sounds strange we might find solution even for
> this usage :-)
> I am thinking about moving enable_hs to common part not depending on
> CONFIG_BT_L2CAP option:

This is ok, please send a proper git patch so I can apply it.

	Gustavo
