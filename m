From: Cornelia Huck <cornelia.huck@de.ibm.com>
Subject: Re: linux-next: s390 build failure
Date: Mon, 23 Jun 2008 17:22:26 +0200
Message-ID: <20080623172226.08baece9@gondolin.boeblingen.de.ibm.com>
References: <20080620135257.102f024c.sfr@canb.auug.org.au>
	<20080620095843.271c20e8@gondolin.boeblingen.de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate5.uk.ibm.com ([195.212.29.138]:5497 "EHLO
	mtagate5.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754917AbYFWPXH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 23 Jun 2008 11:23:07 -0400
Received: from d06nrmr1407.portsmouth.uk.ibm.com (d06nrmr1407.portsmouth.uk.ibm.com [9.149.38.185])
	by mtagate5.uk.ibm.com (8.13.8/8.13.8) with ESMTP id m5NFMRrs098262
	for <linux-next@vger.kernel.org>; Mon, 23 Jun 2008 15:22:27 GMT
Received: from d06av01.portsmouth.uk.ibm.com (d06av01.portsmouth.uk.ibm.com [9.149.37.212])
	by d06nrmr1407.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v9.0) with ESMTP id m5NFMR7p1663016
	for <linux-next@vger.kernel.org>; Mon, 23 Jun 2008 16:22:27 +0100
Received: from d06av01.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av01.portsmouth.uk.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id m5NFMRbQ011684
	for <linux-next@vger.kernel.org>; Mon, 23 Jun 2008 16:22:27 +0100
In-Reply-To: <20080620095843.271c20e8@gondolin.boeblingen.de.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>

On Fri, 20 Jun 2008 09:58:43 +0200,
Cornelia Huck <cornelia.huck@de.ibm.com> wrote:

> I could also try to split out
> dev_set_name() conversion from the init_name stuff, but I fear that
> doesn't make much sense...

Well, so I did just that... I'll reply to this mail with two patches:

- "s390: bus_id -> dev_set_name() changes" should replace the patch of
the same title. It removes the dependency on init_name.

- "s390: bus_id -> dev_set_name() for css and ccw busses" should go
after "driver core: add init_name to struct device". It depends on
init_name and consequently should be commented out until that patch is
re-activated.

Greg: Could you please add these to your tree?
