From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: powerpc allyesconfig / allmodconfig linux-next next-20160729 - next-20160729 build failures
Date: Wed, 03 Aug 2016 22:13:28 +0200
Message-ID: <6481373.xtk4H4bKaE@wuerfel>
References: <CAB=NE6U18jv89pxqAeZY8eTj44mq90kyXGaQO-108+ZMTyxQiQ@mail.gmail.com> <3892328.nUGXIq3MaH@wuerfel> <20160803194429.GA14627@gate.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160803194429.GA14627@gate.crashing.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Cc: Segher Boessenkool <segher@kernel.crashing.org>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "Luis R. Rodriguez" <mcgrof@kernel.org>, linux-next@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Fengguang Wu <fengguang.wu@intel.com>, Guenter Roeck <linux@roeck-us.net>
List-Id: linux-next.vger.kernel.org

On Wednesday, August 3, 2016 2:44:29 PM CEST Segher Boessenkool wrote:
> Hi Arnd,
> 
> On Wed, Aug 03, 2016 at 08:52:48PM +0200, Arnd Bergmann wrote:
> > From my first look, it seems that all of lib/*.o is now getting linked
> > into vmlinux, while we traditionally leave out everything from lib/
> > that is not referenced.
> > 
> > I also see a noticeable overhead in link time, the numbers are for
> > a cache-hot rebuild after a successful allyesconfig build, using a
> > 24-way Opteron@2.5Ghz, just relinking vmlinux:
> > 
> > $ time make skj30 vmlinux # before
> > real	2m8.092s
> > user	3m41.008s
> > sys	0m48.172s
> > 
> > $ time make skj30 vmlinux # after
> > real	4m10.189s
> > user	5m43.804s
> > sys	0m52.988s
> 
> Is it better when using rcT instead of rcsT?

It seems to be noticeably better for the clean rebuild case, though
not as good as the original:

real	3m34.015s
user	5m7.104s
sys	0m49.172s

I've also tried now with my own patch applied as well (linking
each drivers/*/built-in.o into vmlinux rather than having them
linked into drivers/built-in.o first), but that makes no
difference.

	Arnd
