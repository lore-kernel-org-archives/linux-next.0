From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: cifs tree build failure
Date: Wed, 03 Dec 2008 12:40:34 -0800 (PST)
Message-ID: <20081203.124034.142747347.davem@davemloft.net>
References: <20081203135312.60d4518d.sfr@canb.auug.org.au>
	<20081202.191925.208352769.davem@davemloft.net>
	<20081203065721.1b68a5a1@tleilax.poochiereds.net>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:34983
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1762764AbYLCUke (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 3 Dec 2008 15:40:34 -0500
In-Reply-To: <20081203065721.1b68a5a1@tleilax.poochiereds.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: jlayton@redhat.com
Cc: sfr@canb.auug.org.au, smfrench@gmail.com, linux-cifs-client@lists.samba.org, linux-next@vger.kernel.org, harvey.harrison@gmail.com

From: Jeff Layton <jlayton@redhat.com>
Date: Wed, 3 Dec 2008 06:57:21 -0500

> Still, is there some reason that NIP6/NIPQUAD stuff needs to be removed
> at the same time as we add %pI4/%pI6? An period where the old NIP*
> defines still live in the tree seems like a reasonable thing.

Actually, from my perspective, killing the macros turns out to
be a good thing.  It caught a potential revert of the conversion
we did in CIFS already, for example :)

Unlike a compile failure, we don't have some automated thing
scanning new patches looking for references to turds like these
NIPQUAD macros which we want to remove.
