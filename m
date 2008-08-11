From: Andi Kleen <ak@linux.intel.com>
Subject: Re: [PATCH -next] Panasonic ACPI depends on INPUT
Date: Mon, 11 Aug 2008 13:25:38 +0200
Message-ID: <48A021B2.6060205@linux.intel.com>
References: <20080806182828.6bfe0a16.sfr@canb.auug.org.au> <20080806172938.74b8033b.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:35768 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751248AbYHKLZc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 11 Aug 2008 07:25:32 -0400
In-Reply-To: <20080806172938.74b8033b.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, akpm <akpm@linux-foundation.org>

Randy Dunlap wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> Panasonic ACPI driver needs to depend on INPUT.
> Otherwise it has build errors when CONFIG_INPUT=n:

Applied thanks.

-Andi
