From: Thomas Meyer <thomas@m3y3r.de>
Subject: Re: linux-next: Tree for June 12
Date: Fri, 13 Jun 2008 20:39:27 +0200
Message-ID: <1213382367.4852bedf43924@213.133.104.17>
References: <20080612175307.8e4e3e08.sfr@canb.auug.org.au> <1213386991.3455.9.camel@dhcppc4> <s5h63sdqjeq.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from www17.your-server.de ([213.133.104.17]:39806 "EHLO
	www17.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751839AbYFMSj1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 13 Jun 2008 14:39:27 -0400
In-Reply-To: <s5h63sdqjeq.wl%tiwai@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Zitat von Takashi Iwai <tiwai@suse.de>:

> It was harmless for Intel and ATI hardwares :)
> We've not tested NVidia ones.  Good that you caught it fast.
> 
> Could you check whether another value, e.g. bdl_pos_adj=32 works?

Yes, indeed. bdl_pos_adj=32 works, too.

Thanks for the quick response.

greets
thomas
