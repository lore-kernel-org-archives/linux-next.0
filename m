From: "Wu, Fengguang" <fengguang.wu@intel.com>
Subject: RE: linux-next: origin tree build warning
Date: Mon, 18 Jan 2010 12:29:52 +0800
Message-ID: <6CADD16F56BC954D8E28F3836FA7ED7112A9CD50F8@shzsmsx501.ccr.corp.intel.com>
References: <20100118150501.f6aa79e3.sfr@canb.auug.org.au>,<20100118151401.dd8a9ef2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga03.intel.com ([143.182.124.21]:28872 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752207Ab0AREdy convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 17 Jan 2010 23:33:54 -0500
In-Reply-To: <20100118151401.dd8a9ef2.sfr@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linus <torvalds@linux-foundation.org>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

On Mon, 18 Jan 2010 15:05:01 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > It actually looks like commit c29af9636 ("sysdev: Pass attribute in
> > sysdev_class attributes show/store") referred to in the changelog for the
> > above commit has not yet been applied to Linus' tree?
>
> Commit c29af9636 ("sysdev: Pass attribute in sysdev_class attributes
> show/store") does appear in linux-next since next-20100111 (in the
> driver-core quilt series - therefore intended for 2.6.34) (it will have a
> different SHA1 today)

So let's queue 8ff410daa009c (sysdev: fix prototype for memory_sysdev_class show/store functions)
in driver-core and delay it to 2.6.34?

Thanks,
Fengguang
