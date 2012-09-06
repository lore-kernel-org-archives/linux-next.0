From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: Re: [PATCH -next] extcon: extcon-arizona depends on INPUT
Date: Wed, 5 Sep 2012 20:39:57 -0700
Message-ID: <20120906033957.GA21704@kroah.com>
References: <6721797.222311346888851339.JavaMail.weblogic@epml19>
 <20120906000603.GA7043@kroah.com>
 <CAK7N6vpGsrF-VrAOO0nULOXNLzMfK-+eV4UOn0ch-S1zSH0rEQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAK7N6vpGsrF-VrAOO0nULOXNLzMfK-+eV4UOn0ch-S1zSH0rEQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: anish singh <anish198519851985@gmail.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Randy Dunlap <rdunlap@xenotime.net>, =?utf-8?B?7LWc7LCs7Jqw?= <cw00.choi@samsung.com>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, Sep 06, 2012 at 08:54:16AM +0530, anish singh wrote:
> On Thu, Sep 6, 2012 at 5:36 AM, Greg KH <gregkh@linuxfoundation.org> wrote:
> > On Wed, Sep 05, 2012 at 11:47:31PM +0000, MyungJoo Ham wrote:
> >> > On Wed, Sep 05, 2012 at 11:28:03AM +0800, Mark Brown wrote:
> >> > > On Tue, Sep 04, 2012 at 04:51:00PM -0700, Randy Dunlap wrote:
> >> > >
> >> > > > This build error still happens in linux-next of 20120904.
> >> > >
> >> > > > Can we get the patch merged for linux-next?
> >> > >
> >> > > Greg's the one managing extcon in -next.
> >> >
> >> > Yeah, can someone forward this to me so I can apply it?  I can't seem to
> >> > find it anywhere...
> >> >
> >> > greg k-h
> >>
> >> I've been creating "extcon-for-next" tree at git.infradead.org
> >> I'll rebase the branch base on your driver-core-next
> >>
> >> http://git.infradead.org/users/kmpark/linux-samsung/shortlog/refs/heads/extcon-for-next
> Is it possible to apply all the patches found here?I can see that some
> couldn't make
> it to your driver tree.

If no one asks, they how can I know to apply them?

(hint, hint, hint...)

greg k-h
