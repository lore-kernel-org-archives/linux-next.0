From: Tony Lindgren <tony@atomide.com>
Subject: Re: linux-next-20100201 - OMAP2+ defconfig broken with
 CONFIG_DEBUG_LL
Date: Fri, 4 Feb 2011 11:59:38 -0800
Message-ID: <20110204195938.GA3322@atomide.com>
References: <AANLkTinF+dpKvuRztChBM01MAjgL-foGp_yVq3uC9ghu@mail.gmail.com>
 <4af2a35f6d08ddcb33eb86aa3c784fb5@mail.gmail.com>
 <7f99b6fa52967d67bf45d4e8aa7db1e8@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mho-02-ewr.mailhop.org ([204.13.248.72]:62434 "EHLO
	mho-02-ewr.mailhop.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752505Ab1BDUAN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 4 Feb 2011 15:00:13 -0500
Content-Disposition: inline
In-Reply-To: <7f99b6fa52967d67bf45d4e8aa7db1e8@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Santosh Shilimkar <santosh.shilimkar@ti.com>
Cc: Anand Gadiyar <gadiyar@ti.com>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>

* Santosh Shilimkar <santosh.shilimkar@ti.com> [110201 01:25]:
> > -----Original Message-----
> > From: linux-arm-kernel-bounces@lists.infradead.org [mailto:linux-
> > arm-kernel-bounces@lists.infradead.org] On Behalf Of Anand Gadiyar
> > Sent: Tuesday, February 01, 2011 2:54 PM
> > To: linux-arm-kernel@lists.infradead.org; linux-
> > next@vger.kernel.org; Russell King - ARM Linux
> > Subject: RE: linux-next-20100201 - OMAP2+ defconfig broken with
> > CONFIG_DEBUG_LL
> >
> > Gadiyar, Anand wrote:
> > > Hi all,
> > >
> > > I tried to build linux-next as of 20100201 with
> > > omap2plus_defconfig. In addition
> > > I turned on CONFIG_DEBUG_LL and hit the following error.

Posted a fix for that yesterday. Will upload it into Russell's
patch system for the p2v branch.

Tony
