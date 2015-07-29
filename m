From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: randconfig build error with next-20150729, in
 drivers/staging/most/aim-network/networking.c
Date: Wed, 29 Jul 2015 20:07:43 +0300
Message-ID: <20150729170743.GK5180@mwanda>
References: <CA+r1ZhggozPhg6o7En=4WVtpHamu-mZ4M0US9fbmiPt5qHx8GA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:45268 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752469AbbG2RIG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 29 Jul 2015 13:08:06 -0400
Content-Disposition: inline
In-Reply-To: <CA+r1ZhggozPhg6o7En=4WVtpHamu-mZ4M0US9fbmiPt5qHx8GA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, christian.gromm@microchip.com, devel <devel@driverdev.osuosl.org>

Randy Dunlap posted a patch for this.  It has to depend on NET.

regards,
dan carpenter
