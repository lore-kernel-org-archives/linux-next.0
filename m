From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH] fixup! serial: mctrl-gpio: simplify init routine
Date: Tue, 10 Mar 2015 10:18:45 +0100
Message-ID: <20150310091845.GA13728@kroah.com>
References: <20150310163740.0f3bc651@canb.auug.org.au>
 <1425976191-20894-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:59827 "EHLO
	out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751057AbbCJJSr (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 10 Mar 2015 05:18:47 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id B6C9C210CC
	for <linux-next@vger.kernel.org>; Tue, 10 Mar 2015 05:18:45 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <1425976191-20894-1-git-send-email-u.kleine-koenig@pengutronix.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Mar 10, 2015 at 09:29:51AM +0100, Uwe Kleine-K=F6nig wrote:
> ---
>  drivers/tty/serial/serial_mctrl_gpio.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

No changelog comment, no signed-off-by: and some odd "fixup!" in the
subject line :(

Please fix and resend so that I can actually apply the thing.

thanks,

greg k-h
