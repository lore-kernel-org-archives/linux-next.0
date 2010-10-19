From: Peter Hsiang <Peter.Hsiang@maxim-ic.com>
Subject: RE: linux-next: build failure after merge of the sound-asoc tree
Date: Mon, 18 Oct 2010 17:30:39 -0700
Message-ID: <B2150E1E4418E1438554A300EA5040E40D471A4297@ITSVLEX06.it.maxim-ic.internal>
References: <20101018142934.65f5d0fa.sfr@canb.auug.org.au>
 <B2150E1E4418E1438554A300EA5040E40D47140D97@ITSVLEX06.it.maxim-ic.internal>
 <20101019000730.GA27248@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from antispam02.maxim-ic.com ([205.153.101.183]:42649 "EHLO
	antispam02.maxim-ic.com.maxim-ic.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1754809Ab0JSAa3 convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Oct 2010 20:30:29 -0400
In-Reply-To: <20101019000730.GA27248@opensource.wolfsonmicro.com>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Liam Girdwood <lrg@slimlogic.co.uk>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Oct 18, 2010, Mark Brown wrote:
> On Mon, Oct 18, 2010 at 01:25:12PM -0700, Peter Hsiang wrote:
> 
> > This message seems to be saying that this header file is missing.
> > However, this header file was included in the patch that was submitted,
> > and it did compile fine here before the submit.
> > I don't understand why it's not there after it was applied?
> 
> Your patch was apparently not generated against the mainline Makefile or
> Kconfig and the automated conflict resolution tool I used (which is
> normally fairly reliable) appears to have misplaced the header.  I've
> restored the driver with the readdition of the header.

.../pub/scm/linux/kernel/git/next/linux-next.git  Right?
Thanks!

Peter
