From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: powerpc allyesconfig / allmodconfig linux-next next-20160729 - next-20160729 build failures
Date: Wed, 03 Aug 2016 14:29:13 +0200
Message-ID: <5216072.9VpDc0iy8Q@wuerfel>
References: <CAB=NE6U18jv89pxqAeZY8eTj44mq90kyXGaQO-108+ZMTyxQiQ@mail.gmail.com> <1944325.MtNrGQyQle@wuerfel> <20160803221911.2f76ccad@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160803221911.2f76ccad@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linuxppc-dev@lists.ozlabs.org, "Luis R. Rodriguez" <mcgrof@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Fengguang Wu <fengguang.wu@intel.com>, Guenter Roeck <linux@roeck-us.net>
List-Id: linux-next.vger.kernel.org

On Wednesday, August 3, 2016 10:19:11 PM CEST Stephen Rothwell wrote:
> Hi Arnd,
> 
> On Wed, 03 Aug 2016 09:52:23 +0200 Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > Using a different way to link the kernel would also help us with
> > the remaining allyesconfig problem on ARM, as the problem is only in
> > 'ld -r' not producing trampolines for symbols that later cannot get
> > them any more. It would probably also help building with ld.gold,
> > which is currently not working.
> > 
> > What is your suggested alternative?
> 
> I have a patch that make the built-in.o files into thin archives (same
> as archives, but the actual objects are replaced with the name of the
> original object file).  That way the final link has all the original
> objects.  I haven't checked to see what the overheads of doing it this
> way is.
> 
> Nick Piggin has just today taken my old patch (it was last rebased to
> v4.4-rc1) and tried it on a recent kernel and it still seems to mostly
> work.  It probably needs some tidying up, but you are welcome to test
> it if you want to.

Sure, I'll certainly give it a try on ARM when you send me a copy.

	Arnd
