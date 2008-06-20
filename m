From: Cornelia Huck <cornelia.huck@de.ibm.com>
Subject: Re: linux-next: s390 build failure
Date: Fri, 20 Jun 2008 09:58:43 +0200
Message-ID: <20080620095843.271c20e8@gondolin.boeblingen.de.ibm.com>
References: <20080620135257.102f024c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate4.de.ibm.com ([195.212.29.153]:20282 "EHLO
	mtagate4.de.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751251AbYFTH7I (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 20 Jun 2008 03:59:08 -0400
Received: from d12nrmr1607.megacenter.de.ibm.com (d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate4.de.ibm.com (8.13.8/8.13.8) with ESMTP id m5K7wj7S075542
	for <linux-next@vger.kernel.org>; Fri, 20 Jun 2008 07:58:45 GMT
Received: from d12av04.megacenter.de.ibm.com (d12av04.megacenter.de.ibm.com [9.149.165.229])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v9.0) with ESMTP id m5K7wjd83748020
	for <linux-next@vger.kernel.org>; Fri, 20 Jun 2008 09:58:45 +0200
Received: from d12av04.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av04.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id m5K7wisx013822
	for <linux-next@vger.kernel.org>; Fri, 20 Jun 2008 09:58:45 +0200
In-Reply-To: <20080620135257.102f024c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>

On Fri, 20 Jun 2008 13:52:57 +1000,
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Bisecting lead to the commit "s390: bus_id -> dev_set_name() changes" in
> the driver-core tree.  I suspect this was caused by the removal of
> "driver core: add init_name to struct device" from the driver-core tree
> on June 11 (even though the former patch was earlier in the series then
> the latter).

Yes, this patch should go after the introduction of init_name (and be
commented out in Greg's series file). I could also try to split out
dev_set_name() conversion from the init_name stuff, but I fear that
doesn't make much sense...
