From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: make mandocs build failure with next-20150210
Date: Mon, 16 Feb 2015 11:46:27 -0800
Message-ID: <20150216194627.GB9933@kroah.com>
References: <CA+r1ZhhXpFWsBJohzyseUh1bVj51HcjzMPejY0wzmjgSvhaOHg@mail.gmail.com>
 <20150211072757.166344e7@canb.auug.org.au>
 <1423664340.10724.40.camel@linux.intel.com>
 <20150211154844.GA18637@kroah.com>
 <CALLJCT11o3CkhmsDF7nJxg-r0zoEaee4eScy9Xc5LVEg7Vg4Yg@mail.gmail.com>
 <1424103690.10724.62.camel@linux.intel.com>
 <20150216122504.36620b6f@lwn.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150216122504.36620b6f@lwn.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Corbet <corbet@lwn.net>
Cc: Alan Cox <alan@linux.intel.com>, Masanari Iida <standby24x7@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Jim Davis <jim.epost@gmail.com>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-doc <linux-doc@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

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
> 
> Thanks,
> 
> jon
> 
> From a984e29fbe72371b203c43a33b66df44b4c8a948 Mon Sep 17 00:00:00 2001
> From: Jonathan Corbet <corbet@lwn.net>
> Date: Mon, 16 Feb 2015 12:21:42 -0700
> Subject: [PATCH] Fix docs build failure caused by i2o removal
> 
> The movement of the I2O tree into staging broke the DocBook build.  Rather
> than redirect the i2o references into staging, it seems better to just
> remove them since this code is on its way out anyway.
> 
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
