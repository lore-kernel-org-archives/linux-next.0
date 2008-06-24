From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: linux-next: manual merge of pcmcia tree
Date: Tue, 24 Jun 2008 15:49:27 +0200
Message-ID: <20080624134927.GA24288@isilmar.linta.de>
References: <20080623173241.3ac77e63.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from isilmar.linta.de ([213.133.102.198]:56012 "EHLO linta.de"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753186AbYFXNt3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 24 Jun 2008 09:49:29 -0400
Content-Disposition: inline
In-Reply-To: <20080623173241.3ac77e63.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Kristoffer Ericson <kristoffer_e1@hotmail.com>

Hi Stephen,

On Mon, Jun 23, 2008 at 05:32:41PM +1000, Stephen Rothwell wrote:
> Today's linux-next merge of the pcmcia tree got a conflict in
> drivers/ide/legacy/ide-cs.c between commit
> a17bf220231a5061a29a27a99a273246eb3b156e ("pcmcia: add another pata/ide
> ID") from Linus' tree and commit f3aa02c57dec52fbe519c51f741e3a94d19dcb4c
> ("pcmcia: add another pata/ide ID") from the pcmcia tree.
> 
> From the discussion on LKML, I assume the upstream version is correct and
> took that.

Thanks! The two patches which were now (fixed and) sent upstream are now
removed from the pcmcia tree.

Best,
	Dominik
