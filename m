From: "Luck, Tony" <tony.luck@intel.com>
Subject: RE: next-20081104 - kernel panic on ia64 box, at
	__mutex_lock_interruptible_slowpath
Date: Tue, 9 Dec 2008 10:50:56 -0800
Message-ID: <57C9024A16AD2D4C97DC78E552063EA35C7EEAA3@orsmsx505.amr.corp.intel.com>
References: <20081204200745.eff0ac87.sfr@canb.auug.org.au>
 <20081209070730.GA12102@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:8350 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753483AbYLISvH convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 9 Dec 2008 13:51:07 -0500
In-Reply-To: <20081209070730.GA12102@linux.vnet.ibm.com>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Cc: "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>

>       next-20081204 kernel panic's, while booting up on ia64 box. This panic
> was not reproducible with the latest next-20081208 kernel.

I saw that too ... it was preceeded by an "impossible" WARN_ON message,
so I put it down to some experimental/untested code in linux-next.

-Tony
