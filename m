From: Ohad Ben-Cohen <ohad@wizery.com>
Subject: Re: linux-next: removal of the rpmsg tree
Date: Wed, 9 Mar 2016 17:07:33 +0200
Message-ID: <CAK=WgbaDinH5VC+tP5NYZMbh7CiOSfqNbkZEbaN3cT5pZhae5g@mail.gmail.com>
References: <20160309162826.60d6b72b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lb0-f182.google.com ([209.85.217.182]:33518 "EHLO
	mail-lb0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753662AbcCIPHz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 9 Mar 2016 10:07:55 -0500
Received: by mail-lb0-f182.google.com with SMTP id k15so70118622lbg.0
        for <linux-next@vger.kernel.org>; Wed, 09 Mar 2016 07:07:54 -0800 (PST)
In-Reply-To: <20160309162826.60d6b72b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>

Hi Stephen,

On Wed, Mar 9, 2016 at 7:28 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Ohad,
>
> I noticed that the rpmsg tree
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/ohad/rpmsg.git branch for-next
>
> has not been updated since November 2014.  I am going to remove it from
> linux-next tomorrow unless I hear that it may be useful.  It can always
> be easily added back if it proves useful in the future.

That should be fine.

FWIW, Bjorn will most likely setup another rpmsg tree and ask you to
add it to linux-next, as he's co-maintaining
remoteproc/rpmsg/hwspinlock now.

Thanks a lot,
Ohad.
