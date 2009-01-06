From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH -net-next 3/4] firmware: convert tg3 driver to
 request_firmware()
Date: Mon, 05 Jan 2009 16:01:12 -0800 (PST)
Message-ID: <20090105.160112.119906029.davem@davemloft.net>
References: <1230626497.24796.26.camel@jaswinder.satnam>
	<49620AFE.6040409@hartkopp.net>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:40623
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1750911AbZAFABM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 5 Jan 2009 19:01:12 -0500
In-Reply-To: <49620AFE.6040409@hartkopp.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: oliver@hartkopp.net
Cc: jaswinder@infradead.org, jgarzik@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, mchan@broadcom.com, mike@marineau.org

From: Oliver Hartkopp <oliver@hartkopp.net>
Date: Mon, 05 Jan 2009 14:28:30 +0100

> 2. I got this inconsistent lock state, i've not seen before:

I know what causes it.  It's this change:

commit 22604c866889c4b2e12b73cbf1683bda1b72a313
Author: Michael Marineau <mike@marineau.org>
Date:   Sun Jan 4 17:18:51 2009 -0800

    net: Fix for initial link state in 2.6.28

It causes us to now call the linkwatch even trigger code inside of
software interrupt context, but that is illegal because that code path
takes the dev_base_lock rwlock as a writer.

I'm going to revert, and Michael will need to find a way to fix the
initial link state issue without adding locking problems :-)
