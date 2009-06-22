From: Jon Masters <jonathan@jonmasters.org>
Subject: Re: [PATCH -next] hwlat: depends on RING_BUFFER (build fix)
Date: Mon, 22 Jun 2009 17:14:11 -0400
Message-ID: <1245705251.15044.32.camel@localhost.localdomain>
References: <20090622181920.496d160e.sfr@canb.auug.org.au>
	 <4A3FA899.3040402@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from dallas.jonmasters.org ([72.29.103.172]:59054 "EHLO
	dallas.jonmasters.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752128AbZFVVOM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 22 Jun 2009 17:14:12 -0400
In-Reply-To: <4A3FA899.3040402@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Jon Masters <jcm@jonmasters.org>, Andrew Morton <akpm@linux-foundation.org>

On Mon, 2009-06-22 at 08:51 -0700, Randy Dunlap wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> hwlat_detector build fails because it uses ring_buffer interfaces
> without depending on RING_BUFFER.

Thanks randy, I'll pull that in to my for-linus tree. Hope to see you in
Montreal/Portland ;)

Jon.
