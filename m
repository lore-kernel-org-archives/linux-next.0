From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: make mandocs build failure with next-20150210
Date: Mon, 16 Feb 2015 11:46:15 -0800
Message-ID: <20150216194615.GA9933@kroah.com>
References: <CA+r1ZhhXpFWsBJohzyseUh1bVj51HcjzMPejY0wzmjgSvhaOHg@mail.gmail.com>
 <20150211072757.166344e7@canb.auug.org.au>
 <1423664340.10724.40.camel@linux.intel.com>
 <20150211154844.GA18637@kroah.com>
 <CALLJCT11o3CkhmsDF7nJxg-r0zoEaee4eScy9Xc5LVEg7Vg4Yg@mail.gmail.com>
 <1424103690.10724.62.camel@linux.intel.com>
 <20150216122504.36620b6f@lwn.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:50593 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751146AbbBPTqQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 16 Feb 2015 14:46:16 -0500
Content-Disposition: inline
In-Reply-To: <20150216122504.36620b6f@lwn.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Alan Cox <alan@linux.intel.com>, Masanari Iida <standby24x7@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Jim Davis <jim.epost@gmail.com>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-doc <linux-doc@vger.kernel.org>

On Mon, Feb 16, 2015 at 12:25:04PM -0700, Jonathan Corbet wrote:
> On Mon, 16 Feb 2015 16:21:30 +0000
> Alan Cox <alan@linux.intel.com> wrote:
> 
> > > This warning started to appear on Linus's tree, after staging pull
> > > request was merged.  
> > 
> > I sent GregKH a fix for it a while ago
> 
> He seemed to indicate that he doesn't have it.  The following would seem
> to fit the bill; unless somebody objects I'll send it upward so that docs
> builds start working again.

I got the second patch, but it was too late for my first round of
patches to send to Linus.  Feel free to send this on yourself as I'm
going to be at a conference all this week and have limited time to do
this.

thanks,

greg k-h
