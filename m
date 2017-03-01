From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v3] staging: greybus: loop_backtest: fixed consistent
 spacing style issue
Date: Wed, 1 Mar 2017 11:16:37 +0100
Message-ID: <20170301101637.GH2871@localhost>
References: <20170301100943.GA9503@mod.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:34298 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750941AbdCAKRH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 1 Mar 2017 05:17:07 -0500
Received: by mail-lf0-f66.google.com with SMTP id y193so1711158lfd.1
        for <linux-next@vger.kernel.org>; Wed, 01 Mar 2017 02:16:40 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20170301100943.GA9503@mod.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jonathan Bowie <eudjtb@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, greybus-dev@lists.linaro.org, linux-next@vger.kernel.org

On Wed, Mar 01, 2017 at 02:09:43AM -0800, Jonathan Bowie wrote:
> Fixed incosistent spacing around arithmetic operator.
> 
> Signed-off-by: Jonathan Bowie <eudjtb@gmail.com>
> ---

This looks good except that you now dropped the changelog again (what
changed in v2 and v3?), and you CC:d the linux-next rather than the
staging list devel@driverdev.osuosl.org (I included the address in my
response to v1).

You can use scripts/get_maintainer.pl on a patch to figure out which
parties and lists to CC (you don't need to include LKML in this case).

Since you're doing this to learn the process, you can send a v4 and get
everything right.

Thanks,
Johan
