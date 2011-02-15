From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [next-20110214] Kernel-modules with unknown parameter
Date: Tue, 15 Feb 2011 10:30:26 +1030
Message-ID: <201102151030.26956.rusty@rustcorp.com.au>
References: <AANLkTimM1Tmws46DUyoNGsn+P8WN1XPsRu=L8yPzd=xU@mail.gmail.com> <AANLkTikO=5zBCvPbd2MXqgzE_mvnabTtH_e2C5_5bpQv@mail.gmail.com> <AANLkTinFOPc+BM8cnPE3SLt7Dc2TFOw1v+bntFu01hpO@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:44166 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751997Ab1BOAA3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 14 Feb 2011 19:00:29 -0500
In-Reply-To: <AANLkTinFOPc+BM8cnPE3SLt7Dc2TFOw1v+bntFu01hpO@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sedat.dilek@gmail.com
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Randy Dunlap <randy.dunlap@oracle.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>

On Mon, 14 Feb 2011 11:45:59 pm Sedat Dilek wrote:
> >> Any idea what's going on? Stephen, Randy noticed the same like me?

Dmitry broke module parameters with a "trivial" transform which turned out
not to be.

I wasn't paying enough attention, and let it through.

> My damn brain can't understand - looking at the series file in [2] -
> why the hell the "possible" patch [3] is not included in linux-next?

There are markers in the series file, which indicate what goes into
linux-next.

Cheers,
Rusty.
