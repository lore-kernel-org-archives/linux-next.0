From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: make mandocs build failure with next-20150210
Date: Wed, 11 Feb 2015 23:48:44 +0800
Message-ID: <20150211154844.GA18637@kroah.com>
References: <CA+r1ZhhXpFWsBJohzyseUh1bVj51HcjzMPejY0wzmjgSvhaOHg@mail.gmail.com>
 <20150211072757.166344e7@canb.auug.org.au>
 <1423664340.10724.40.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:36547 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752530AbbBKPs5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 11 Feb 2015 10:48:57 -0500
Content-Disposition: inline
In-Reply-To: <1423664340.10724.40.camel@linux.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@linux.intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jim Davis <jim.epost@gmail.com>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, linux-doc <linux-doc@vger.kernel.org>

On Wed, Feb 11, 2015 at 02:19:00PM +0000, Alan Cox wrote:
> On Wed, 2015-02-11 at 07:27 +1100, Stephen Rothwell wrote:
> > Hi Jim,
> > 
> > On Tue, 10 Feb 2015 11:40:23 -0700 Jim Davis <jim.epost@gmail.com> wrote:
> > >
> > >   DOCPROC Documentation/DocBook/device-drivers.xml
> > > docproc: .//include/linux/i2o.h: No such file or directory
> > > make[1]: *** [Documentation/DocBook/device-drivers.xml] Error 1
> > 
> > Presumably caused by commit 2cbf7fe2d5d3 ("i2o: move to staging") from
> > the staging tree.
> 
> Yep - I sent GregKH a fix.

You did?  Did I apply it?  I don't see it in my to-apply queue
anywhere...

Care to resend?

thanks,

greg k-h
