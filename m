From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: crisv32 runtime failure in -next due to 'page-flags: define
 behavior SL*B-related flags on compound pages'
Date: Tue, 22 Sep 2015 08:40:14 -0700
Message-ID: <20150922154014.GR4029@linux.vnet.ibm.com>
References: <20150922132751.GB17969@node.dhcp.inet.fi>
 <201509221357.t8MDv6G5015271@ignucius.se.axis.com>
 <20150922151835.GM4029@linux.vnet.ibm.com>
 <20150922153104.GA19024@node.dhcp.inet.fi>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150922153104.GA19024@node.dhcp.inet.fi>
Sender: linux-kernel-owner@vger.kernel.org
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: Hans-Peter Nilsson <hans-peter.nilsson@axis.com>, starvik@axis.com, linux@roeck-us.net, jespern@axis.com, hughd@google.com, kirill.shutemov@linux.intel.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, akpm@linux-foundation.org, minchan@kernel.org, linux-cris-kernel@axis.com
List-Id: linux-next.vger.kernel.org

On Tue, Sep 22, 2015 at 06:31:04PM +0300, Kirill A. Shutemov wrote:
> On Tue, Sep 22, 2015 at 08:18:35AM -0700, Paul E. McKenney wrote:
> > On Tue, Sep 22, 2015 at 03:57:06PM +0200, Hans-Peter Nilsson wrote:
> > > I guess you hit the right spot, but I'd think people would be
> > > more comfortable with aligning to sizeof (void *).
> > 
> > I would indeed prefer sizeof(void *).
> 
> Do you prefer to have the attribute set for whole structure or for ->next?
> I think attribute on ->next is more appropriate from documentation POV.

Agreed, I do prefer ->next.

							Thanx, Paul
