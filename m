From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: powerpc allyesconfig / allmodconfig linux-next next-20160729 -
 next-20160729 build failures
Date: Wed, 3 Aug 2016 10:23:24 +1000
Message-ID: <20160803102324.6372e66a@canb.auug.org.au>
References: <CAB=NE6U18jv89pxqAeZY8eTj44mq90kyXGaQO-108+ZMTyxQiQ@mail.gmail.com>
	<20160802215839.GA7383@roeck-us.net>
	<20160802220243.GK3296@wotan.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44402 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754135AbcHCAXh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 2 Aug 2016 20:23:37 -0400
In-Reply-To: <20160802220243.GK3296@wotan.suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Luis R. Rodriguez" <mcgrof@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, linux-next@vger.kernel.org, Fengguang Wu <fengguang.wu@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Luis,

On Wed, 3 Aug 2016 00:02:43 +0200 "Luis R. Rodriguez" <mcgrof@kernel.org> wrote:
>
> Thanks for the confirmation. For how long is it known this is broken?
> Does anyone care and fix these ? Or is this best effort?

This has been broken for many years :-(

I have a couple of times almost fixed it, but it requires that we
change from using "ld -r" to build the built-in.o objects and some
changes to the powerpc head.S code ... I will give it another shot now
that the merge window is almost over (and linux-next goes into its
quieter time).

-- 
Cheers,
Stephen Rothwell
