From: Alan Cox <alan@linux.intel.com>
Subject: Re: make mandocs build failure with next-20150210
Date: Wed, 11 Feb 2015 14:19:00 +0000
Message-ID: <1423664340.10724.40.camel@linux.intel.com>
References: <CA+r1ZhhXpFWsBJohzyseUh1bVj51HcjzMPejY0wzmjgSvhaOHg@mail.gmail.com>
	 <20150211072757.166344e7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20150211072757.166344e7@canb.auug.org.au>
Sender: linux-doc-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jim Davis <jim.epost@gmail.com>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, linux-doc <linux-doc@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: linux-next.vger.kernel.org

On Wed, 2015-02-11 at 07:27 +1100, Stephen Rothwell wrote:
> Hi Jim,
> 
> On Tue, 10 Feb 2015 11:40:23 -0700 Jim Davis <jim.epost@gmail.com> wrote:
> >
> >   DOCPROC Documentation/DocBook/device-drivers.xml
> > docproc: .//include/linux/i2o.h: No such file or directory
> > make[1]: *** [Documentation/DocBook/device-drivers.xml] Error 1
> 
> Presumably caused by commit 2cbf7fe2d5d3 ("i2o: move to staging") from
> the staging tree.

Yep - I sent GregKH a fix.

Alan


