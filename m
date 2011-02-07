From: Michael =?ISO-8859-1?Q?B=FCsch?= <mb@bu3sch.de>
Subject: Re: [PATCH] Fix SSB chipcommon HT/ALP avail bits layout and usage
Date: Mon, 07 Feb 2011 20:55:56 +0100
Message-ID: <1297108556.18125.1.camel@maggie>
References: <1297107730.32607.10.camel@dev.znau.edu.ua>
	 (sfid-20110207_204928_918460_412E3BD6)
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 80-190-117-144.ip-home.de ([80.190.117.144]:57033 "EHLO
	bu3sch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752038Ab1BGUcT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Feb 2011 15:32:19 -0500
In-Reply-To: <1297107730.32607.10.camel@dev.znau.edu.ua> (sfid-20110207_204928_918460_412E3BD6)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: George Kashperko <george@znau.edu.ua>
Cc: linux-next@vger.kernel.org

On Mon, 2011-02-07 at 21:42 +0200, George Kashperko wrote: 
> BCM4328 chipcommon have different CLKCTLST register HT and ALP availability
> bits' layout comparing to other BCM chips. 4328 HT/ALP availability bits are
> 16/17 whereas other BCM chips' HT/ALP availability bits are 17/16. Therefore
> current pmu pll initialization code forces active low power clock for all
> non-4328 chips instead of switching HT clock on.
> Patch also fixes typo in ALP avail define description.

Where did you get the knowledge that the bits are swapped on 4328 from?

-- 
Greetings Michael.
