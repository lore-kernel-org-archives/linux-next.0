From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: powerpc allyesconfig / allmodconfig linux-next next-20160729 - next-20160729 build failures
Date: Wed, 03 Aug 2016 09:52:23 +0200
Message-ID: <1944325.MtNrGQyQle@wuerfel>
References: <CAB=NE6U18jv89pxqAeZY8eTj44mq90kyXGaQO-108+ZMTyxQiQ@mail.gmail.com> <20160802220243.GK3296@wotan.suse.de> <20160803102324.6372e66a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.73]:49654 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755994AbcHCHx3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 3 Aug 2016 03:53:29 -0400
In-Reply-To: <20160803102324.6372e66a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linuxppc-dev@lists.ozlabs.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "Luis R. Rodriguez" <mcgrof@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Fengguang Wu <fengguang.wu@intel.com>, Guenter Roeck <linux@roeck-us.net>

On Wednesday, August 3, 2016 10:23:24 AM CEST Stephen Rothwell wrote:
> Hi Luis,
> 
> On Wed, 3 Aug 2016 00:02:43 +0200 "Luis R. Rodriguez" <mcgrof@kernel.org> wrote:
> >
> > Thanks for the confirmation. For how long is it known this is broken?
> > Does anyone care and fix these ? Or is this best effort?
> 
> This has been broken for many years 
> 
> I have a couple of times almost fixed it, but it requires that we
> change from using "ld -r" to build the built-in.o objects and some
> changes to the powerpc head.S code ... I will give it another shot now
> that the merge window is almost over (and linux-next goes into its
> quieter time).

Using a different way to link the kernel would also help us with
the remaining allyesconfig problem on ARM, as the problem is only in
'ld -r' not producing trampolines for symbols that later cannot get
them any more. It would probably also help building with ld.gold,
which is currently not working.

What is your suggested alternative?

	Arnd
