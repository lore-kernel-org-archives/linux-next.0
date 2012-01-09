From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: build failure after merge of the battery tree
Date: Mon, 9 Jan 2012 23:53:18 +0000
Message-ID: <20120109235318.GJ30766@opensource.wolfsonmicro.com>
References: <C3AE124F08223B42BC95AEB82F0F6CED1FDB2C78@KCHJEXMB02.kpit.com> <1326097770.3542.14.camel@dhruva> <20120109131037.GA26091@oksana.dev.rtsoft.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:39127 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932158Ab2AIXxU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 9 Jan 2012 18:53:20 -0500
Content-Disposition: inline
In-Reply-To: <20120109131037.GA26091@oksana.dev.rtsoft.ru>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Anton Vorontsov <cbouatmailru@gmail.com>
Cc: Ashish Jangam <ashish.jangam@kpitcummins.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Mon, Jan 09, 2012 at 05:10:37PM +0400, Anton Vorontsov wrote:
> On Mon, Jan 09, 2012 at 01:59:29PM +0530, Ashish Jangam wrote:

> > > Caused by commit ded7fc7b0550 ("power_supply: Add DA9052 battery driver").

> > > The commit message says "This driver depends on DA9052 MFD core dirver for definitions and methods".  That core is presumably still pending inclusion.

> Well, it is in the MFD tree already, otherwise allmodconfig would not
> be able to select this driver.

It didn't actually go in via the MFD tree, it went in via regmap, but
same difference.

> > > I have used the battery tree from next-20120104 for today.
> > This patch depends upon Da9052/53 MFD core and also on one of its incremental patch for ADC that got these functions definitions. Below is that patch.
> > We had already posted this patch.

> So, this patch should go via MFD tree asap. Otherwise, I'll have to
> disable this driver by making it depend on 'broken' in Kconfig.

The regmap tree has already been merged by Linus which makes things a
bit tricky, it'd probably need to wait for -rc1 for Samuel to send it
givne that Linus was saying he really wanted everything to have been in
-next before the merge window.
