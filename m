From: Jean Delvare <khali@linux-fr.org>
Subject: Re: [PATCH] max6875: should depend on I2C
Date: Mon, 4 May 2009 15:46:25 +0200
Message-ID: <20090504154625.63b804b5@hyperion.delvare>
References: <1241430586-31878-1-git-send-email-a.beregalov@gmail.com>
	<20090504124802.13e56a44@hyperion.delvare>
	<20090504125556.GD3233@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zone0.gcu-squad.org ([212.85.147.21]:3385 "EHLO
	services.gcu-squad.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751907AbZEDNqf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 4 May 2009 09:46:35 -0400
In-Reply-To: <20090504125556.GD3233@pengutronix.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Wolfram Sang <w.sang@pengutronix.de>
Cc: Alexander Beregalov <a.beregalov@gmail.com>, linux-next@vger.kernel.org

Hi Wolfram,

On Mon, 4 May 2009 14:55:56 +0200, Wolfram Sang wrote:
> > Good catch! I've folded this fix into
> > i2c/i2c-chips-move-max6875-to-drivers-misc-eeprom.patch, thanks for
> > reporting.
> 
> ACK for the patch.
> 
> Haven't noticed that Jean put it into his quilt-stack already. Jean,
> could you also add the ACK from Ben Gardner or shall I resend it (with
> the minor nit removed?)

I fixed it all myself, it should be OK now.

-- 
Jean Delvare
