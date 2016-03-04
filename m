From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the v4l-dvb tree
Date: Fri, 4 Mar 2016 16:24:44 +1100
Message-ID: <20160304162444.7f043991@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59832 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751024AbcCDFYr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 4 Mar 2016 00:24:47 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Janani Ravichandran <janani.rvchndrn@gmail.com>, Antti Palosaari <crope@iki.fi>

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in:

  drivers/media/dvb-frontends/mn88473.c

between commit:

  7908fad99a6c ("[media] mn88473: finalize driver")

from the v4l-dvb tree and commit:

  3a35be2a1443 ("staging: media: Remove unneeded parentheses")

from the staging tree.

I fixed it up (I just used the v4l-dvb tree version) and can carry the
fix as necessary (no action is required).

-- 
Cheers,
Stephen Rothwell
