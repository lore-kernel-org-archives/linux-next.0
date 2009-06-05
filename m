From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [PATCH next] errno.h: define ERFKILL
Date: Fri, 5 Jun 2009 13:17:19 +0100
Message-ID: <20090605121719.GB26337@linux-mips.org>
References: <1244196408-12771-1-git-send-email-a.beregalov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from h5.dl5rb.org.uk ([81.2.74.5]:53129 "EHLO h5.dl5rb.org.uk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751226AbZFEMdw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 5 Jun 2009 08:33:52 -0400
Content-Disposition: inline
In-Reply-To: <1244196408-12771-1-git-send-email-a.beregalov@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: johannes@sipsolutions.net, linville@tuxdriver.com, linux-next@vger.kernel.org, davem@davemloft.net, kyle@mcmartin.ca, rth@twiddle.net, ink@jurassic.park.msu.ru

On Fri, Jun 05, 2009 at 02:06:48PM +0400, Alexander Beregalov wrote:

> Commit 1f87f7d3 (cfg80211: add rfkill support) added ERFKILL
> to asm-generic/errno.h, but alpha, mips, parisc and sparc use
> their own numbering scheme and do not include asm-generic/errno.h.
> We need to add definition of ERFKILL for them.
> 
> Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>

Acked-by: Ralf Baechle <ralf@linux-mips.org>

  Ralf
