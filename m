From: Andrei Emeltchenko <andrei.emeltchenko.news@gmail.com>
Subject: Re: linux-next: Tree for Nov 17 (bluetooth)
Date: Fri, 18 Nov 2011 15:41:17 +0200
Message-ID: <20111118134115.GB24392@aemeltch-MOBL1>
References: <20111117150733.a70faf2c9030d511d5367e1e@canb.auug.org.au>
 <4EC5496F.2080509@xenotime.net>
 <20111118095855.GB9034@aemeltch-MOBL1>
 <20111118133017.GA2131@joana>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:60799 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753717Ab1KRNlU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 18 Nov 2011 08:41:20 -0500
Content-Disposition: inline
In-Reply-To: <20111118133017.GA2131@joana>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Marcel Holtmann <marcel@holtmann.org>

Hi Gustavo,

On Fri, Nov 18, 2011 at 11:30:17AM -0200, Gustavo Padovan wrote:
> Hi Andrei,
> 
> * Andrei Emeltchenko <andrei.emeltchenko.news@gmail.com> [2011-11-18 11:58:58 +0200]:
> 
> > Hi Randy,
> > 
> > On Thu, Nov 17, 2011 at 09:50:39AM -0800, Randy Dunlap wrote:
> > > On 11/16/2011 08:07 PM, Stephen Rothwell wrote:
> > > > Hi all,
> > > 
> > > 
> > > When CONFIG_BT_L2CAP is not enabled:
> > > 
> > > net/built-in.o: In function `hci_dev_open':
> > > (.text+0xdce9a): undefined reference to `enable_hs'
> > 
> > Despite not enabling L2CAP sounds strange we might find solution even for
> > this usage :-)
> > I am thinking about moving enable_hs to common part not depending on
> > CONFIG_BT_L2CAP option:
> 
> This is ok, please send a proper git patch so I can apply it.

The patch is already sent to linux-bluetooth

Best regards 
Andrei Emeltchenko 
