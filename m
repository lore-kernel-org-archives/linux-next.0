From: Timur Tabi <timur@freescale.com>
Subject: Re: linux-next: sound tree build failure
Date: Tue, 03 Feb 2009 08:48:27 -0600
Message-ID: <4988593B.8010308@freescale.com>
References: <20090203141011.c72d35b5.sfr@canb.auug.org.au> <s5htz7cdq5b.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from az33egw02.freescale.net ([192.88.158.103]:45527 "EHLO
	az33egw02.freescale.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751981AbZBCOss (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 3 Feb 2009 09:48:48 -0500
In-Reply-To: <s5htz7cdq5b.wl%tiwai@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>

Takashi Iwai wrote:

>> Caused by commit ff7bf02f630ae93cad4feda0f6a5a19b25a5019a ("ASoC: fix
>> documentation in CS4270 codec driver") which does somewhat more than fix
>> documentation.  It clearly wasn't even build tested.

Yes, I apologize for that.  I thought I tested it, but I guess I either forgot
or got confused.

-- 
Timur Tabi
Linux kernel developer at Freescale
