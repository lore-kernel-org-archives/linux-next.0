From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [BUG -next] pcmcia: setup IRQ to be used by PCMCIA drivers at
	card insert
Date: Tue, 3 Aug 2010 08:17:16 +0200
Message-ID: <20100803061716.GB9716@isilmar-3.linta.de>
References: <1280795899.11158.52.camel@lovely.krouter>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from isilmar-3.linta.de ([188.40.101.200]:44780 "EHLO linta.de"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1755158Ab0HCGRS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 3 Aug 2010 02:17:18 -0400
Content-Disposition: inline
In-Reply-To: <1280795899.11158.52.camel@lovely.krouter>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Fritz <chf.fritz@googlemail.com>
Cc: linux-next <linux-next@vger.kernel.org>

Hey,

On Tue, Aug 03, 2010 at 02:38:19AM +0200, Christoph Fritz wrote:
> buffer overflow in next-tree's commit 6f0f38c45a8f2f511c25893e33011ff32fc811db:

this bug is not only present in -next, but also in every 2.6 stable kernel
released -- the commit you mention merely moved code around.

> non-tested fix:

could I get your Signed-off-by, please?

Best,
	Dominik
