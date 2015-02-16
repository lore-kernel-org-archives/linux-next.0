From: Alan Cox <alan@linux.intel.com>
Subject: Re: make mandocs build failure with next-20150210
Date: Mon, 16 Feb 2015 19:39:42 +0000
Message-ID: <1424115582.10724.86.camel@linux.intel.com>
References: <CA+r1ZhhXpFWsBJohzyseUh1bVj51HcjzMPejY0wzmjgSvhaOHg@mail.gmail.com>
	 <20150211072757.166344e7@canb.auug.org.au>
	 <1423664340.10724.40.camel@linux.intel.com>
	 <20150211154844.GA18637@kroah.com>
	 <CALLJCT11o3CkhmsDF7nJxg-r0zoEaee4eScy9Xc5LVEg7Vg4Yg@mail.gmail.com>
	 <1424103690.10724.62.camel@linux.intel.com>
	 <20150216122504.36620b6f@lwn.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:30307 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751276AbbBPTjq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Feb 2015 14:39:46 -0500
In-Reply-To: <20150216122504.36620b6f@lwn.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-next@vger.kernel.org

On Mon, 2015-02-16 at 12:25 -0700, Jonathan Corbet wrote:
> On Mon, 16 Feb 2015 16:21:30 +0000
> Alan Cox <alan@linux.intel.com> wrote:
> 
> > > This warning started to appear on Linus's tree, after staging pull
> > > request was merged.  
> > 
> > I sent GregKH a fix for it a while ago
> 
> He seemed to indicate that he doesn't have it. 

I sent it again when he said that. Oh well. Guess his email is turning
something with lots of <> into spamfilter fodder.

My patch matches yours 

Alan
