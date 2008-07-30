From: Ananth N Mavinakayanahalli <ananth@in.ibm.com>
Subject: Re: linux-next: build failure
Date: Wed, 30 Jul 2008 11:24:04 +0530
Message-ID: <20080730055404.GA6154@in.ibm.com>
References: <20080730153028.95226354.sfr@canb.auug.org.au>
Reply-To: ananth@in.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e4.ny.us.ibm.com ([32.97.182.144]:41983 "EHLO e4.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751779AbYG3FzN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 30 Jul 2008 01:55:13 -0400
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e4.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id m6U5tCd3002280
	for <linux-next@vger.kernel.org>; Wed, 30 Jul 2008 01:55:12 -0400
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
	by d01relay02.pok.ibm.com (8.13.8/8.13.8/NCO v9.0) with ESMTP id m6U5tCCk191236
	for <linux-next@vger.kernel.org>; Wed, 30 Jul 2008 01:55:12 -0400
Received: from d01av01.pok.ibm.com (loopback [127.0.0.1])
	by d01av01.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id m6U5tBTm013989
	for <linux-next@vger.kernel.org>; Wed, 30 Jul 2008 01:55:12 -0400
Content-Disposition: inline
In-Reply-To: <20080730153028.95226354.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Ankita Garg <ankita@in.ibm.com>, Vivek Goyal <vgoyal@redhat.com>, Haren Myneni <hbabu@us.ibm.com>, kexec@lists.infradead.org

On Wed, Jul 30, 2008 at 03:30:28PM +1000, Stephen Rothwell wrote:
> Hi Ananth,
> 
> Today's linux-next build (powerpc allyesconfig) failed like this:
> 
> tests/lkdtm.c:182: error: expected ')' before '*' token
> 
> I have no idea why this fails now when it did not before.
> 
> I applied the following patch.

Thanks Stephen!

Ankita, any ideas?

Ananth
