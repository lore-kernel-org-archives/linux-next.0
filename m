From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: Re: [PATCH -next] extcon: extcon-arizona depends on INPUT
Date: Wed, 5 Sep 2012 17:06:03 -0700
Message-ID: <20120906000603.GA7043@kroah.com>
References: <6721797.222311346888851339.JavaMail.weblogic@epml19>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ie0-f174.google.com ([209.85.223.174]:45544 "EHLO
	mail-ie0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755182Ab2IFAGI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 5 Sep 2012 20:06:08 -0400
Received: by ieje11 with SMTP id e11so2071143iej.19
        for <linux-next@vger.kernel.org>; Wed, 05 Sep 2012 17:06:07 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <6721797.222311346888851339.JavaMail.weblogic@epml19>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, Randy Dunlap <rdunlap@xenotime.net>, =?utf-8?B?7LWc7LCs7Jqw?= <cw00.choi@samsung.com>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Wed, Sep 05, 2012 at 11:47:31PM +0000, MyungJoo Ham wrote:
> > On Wed, Sep 05, 2012 at 11:28:03AM +0800, Mark Brown wrote:
> > > On Tue, Sep 04, 2012 at 04:51:00PM -0700, Randy Dunlap wrote:
> > > 
> > > > This build error still happens in linux-next of 20120904.
> > > 
> > > > Can we get the patch merged for linux-next?
> > > 
> > > Greg's the one managing extcon in -next.
> > 
> > Yeah, can someone forward this to me so I can apply it?  I can't seem to
> > find it anywhere...
> > 
> > greg k-h
> 
> I've been creating "extcon-for-next" tree at git.infradead.org
> I'll rebase the branch base on your driver-core-next
> 
> http://git.infradead.org/users/kmpark/linux-samsung/shortlog/refs/heads/extcon-for-next

Don't worry, I've already applied this patch now.

thanks,

greg k-h
