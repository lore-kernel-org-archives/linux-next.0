From: Eric Paris <eparis@redhat.com>
Subject: Re: linux-next: build failure after merge of the final tree
 (security tree related)
Date: Mon, 16 Apr 2012 11:34:21 -0400
Message-ID: <1334590461.2250.0.camel@localhost>
References: <20120416154607.302f7ae245472e1e917dacef@canb.auug.org.au>
	 <CABqD9hauxzd4vVbxyC5M1p9e6mLt1cjYP7wbhzTKPi3iMpc0kg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:42432 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753945Ab2DPPe2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Apr 2012 11:34:28 -0400
In-Reply-To: <CABqD9hauxzd4vVbxyC5M1p9e6mLt1cjYP7wbhzTKPi3iMpc0kg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Will Drewry <wad@chromium.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Kees Cook <keescook@chromium.org>

On Mon, 2012-04-16 at 10:32 -0500, Will Drewry wrote:

> Thanks for this, and the other two fixes!  I'll pull together a patch
> fixing up the other call sites.  My past revisions had avoided this by
> using a new symbol, and I totally forgot to touch these up in the last
> round.
> 
> What's the best way to submit the clean up -- against the security-next tree?
> 
> Thanks and sorry for the noise!

Just send fixes to James and they will get picked up by Stephen the day
after he commits them to security-next.

-Eric
