From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH -net-next 1/4] firmware: convert e100 driver to
 request_firmware()
Date: Sun, 04 Jan 2009 16:06:11 -0800 (PST)
Message-ID: <20090104.160611.252248503.davem@davemloft.net>
References: <1230626401.24796.22.camel@jaswinder.satnam>
	<9929d2390812301433pae01ea4g5bfdef6d4d4c7a9c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:41359
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1750788AbZAEAGI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 4 Jan 2009 19:06:08 -0500
In-Reply-To: <9929d2390812301433pae01ea4g5bfdef6d4d4c7a9c@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: jeffrey.t.kirsher@intel.com
Cc: jaswinder@infradead.org, linux.nics@intel.com, e1000-devel@lists.sourceforge.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org

From: "Jeff Kirsher" <jeffrey.t.kirsher@intel.com>
Date: Tue, 30 Dec 2008 14:33:36 -0800

> Please hold off on committing, until we have had ample time to do some
> regression testing.  While this patch may have been in linux-next,
> this is the first we have seen of it.
> 
> I am concerned that IPMI traffic will be adversely affected by this patch.

Status please?
