From: "David E. Box" <david.e.box@linux.intel.com>
Subject: Re: linux-next: Tree for Feb 17 (i2c-designware-baytrail.c)
Date: Tue, 17 Feb 2015 12:59:49 -0800
Message-ID: <20150217205949.GA6671@pathfinder>
References: <20150217160221.1a15340e@canb.auug.org.au>
 <54E38840.5060306@infradead.org>
 <20150217191153.GA1616@katana>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:54555 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752431AbbBQVDr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Feb 2015 16:03:47 -0500
Content-Disposition: inline
In-Reply-To: <20150217191153.GA1616@katana>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org

Hi Wolfram,

On Tue, Feb 17, 2015 at 08:11:58PM +0100, Wolfram Sang wrote:
> Randy,
> 
> thanks for the report!
> 
> > I suppose someone could make that:
> > 
> > 	depends on I2C_DESIGNWARE_PLATFORM && IOSF_MBI=y && ACPI
> > 
> > or even make I2C_DESIGNWARE_BAYTRAIL be a tristate symbol.
> 
> I'll wait a day for input from David what he prefers, because I don't
> own/know this platform. If there is no response, I'll apply the first
> solution.
> 

This is fine with me. I own IOSF_MBI as well. Thanks.

Dave
