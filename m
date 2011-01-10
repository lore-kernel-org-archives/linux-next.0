From: Wim Van Sebroeck <wim@iguana.be>
Subject: Re: linux-next: build failure after merge of the watchdog tree
Date: Mon, 10 Jan 2011 08:27:50 +0100
Message-ID: <20110110072750.GL3801@infomag.iguana.be>
References: <20110110141250.78947d61.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailrelay002.isp.belgacom.be ([195.238.6.175]:54230 "EHLO
	mailrelay002.isp.belgacom.be" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750852Ab1AJH1w (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 10 Jan 2011 02:27:52 -0500
Content-Disposition: inline
In-Reply-To: <20110110141250.78947d61.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Philippe De Muyter <phdm@macqel.be>

Hi Stephen,

> After merging the watchdog tree, today's linux-next build (x86_64
> allmodconfig) failed like this:

This driver is for the m68K architecture. I apparently missed checking
the dependancy in Kconfig. I'll fix it today.

Kind regards,
Wim.
