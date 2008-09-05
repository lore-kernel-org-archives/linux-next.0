From: "Brandeburg, Jesse" <jesse.brandeburg@intel.com>
Subject: RE: [E1000-devel] linux-next: Tree for September 4 (PATCH: IXGBE)
Date: Fri, 5 Sep 2008 09:38:17 -0700
Message-ID: <36D9DB17C6DE9E40B059440DB8D95F520611FFF8@orsmsx418.amr.corp.intel.com>
References: <20080904193606.573f2cb3.sfr@canb.auug.org.au> <20080904204137.9b31f644.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:53772 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751075AbYIEQii convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 5 Sep 2008 12:38:38 -0400
Content-class: urn:content-classes:message
In-Reply-To: <20080904204137.9b31f644.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, jgarzik <jgarzik@pobox.com>, "Kirsher, Jeffrey T" <jeffrey.t.kirsher@intel.com>, e1000-devel@l
Cc: Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew@sc8-sf-spam2.sourceforge.net

Randy Dunlap wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> ixgbe needs to be restricted to the same build config (m/y)
> as DCA since it calls the dca_*() functions.
> 
> ixgbe_main.c:(.text+0xd9c09): undefined reference to `dca3_get_tag'

Thanks Randy for catching that, you're correct.

Acked-by: Jesse Brandeburg <jesse.brandeburg@intel.com>
