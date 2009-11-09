From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: linux-next: manual merge of the pcmcia tree with the mtd tree
Date: Mon, 9 Nov 2009 08:25:36 +0100
Message-ID: <20091109072536.GA20696@isilmar.linta.de>
References: <20091109144221.f27d7242.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from isilmar.linta.de ([213.133.102.198]:37291 "EHLO linta.de"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1754199AbZKIHZd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 9 Nov 2009 02:25:33 -0500
Content-Disposition: inline
In-Reply-To: <20091109144221.f27d7242.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Woodhouse <David.Woodhouse@intel.com>
Cc: linux-next@vger.kernel.org, linux-mtd@vger.kernel.org

Hi David,

could you drop it from your tree, please? It depends on a patch which is in
the PCMCIA tree, and so it isn't a good idea to carry this patch in the
linux-mtd tree (well, it doesn't matter all that much as this driver is
marked BROKEN anyways, but...)

Best,
	Dominik
