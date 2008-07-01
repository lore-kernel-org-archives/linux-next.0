From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: manual merge of the ttydev tree
Date: Tue, 1 Jul 2008 15:12:05 +0100
Message-ID: <20080701151205.2b728f94@lxorguk.ukuu.org.uk>
References: <20080702000712.3698a7f9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:55756 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1754416AbYGAO3o (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Jul 2008 10:29:44 -0400
In-Reply-To: <20080702000712.3698a7f9.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Adrian Bunk <bunk@kernel.org>

On Wed, 2 Jul 2008 00:07:12 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi ,
> 
> Today's linux-next merge of the ttydev tree got a conflict in
> drivers/net/wireless/strip.c between commit
> 94d9842403f770239a656586442454b7a8f2df29 ("remove the strip driver") from
> the net tree and commit 7636d4eb65deca18568e3ec4bfa65b85078042ce
> ("01-ldisc-ref") from the ttydev tree.
> 
> The former removed the file.

Perhaps whoever removed the file would care to talk to the tty driver
maintainer before doing so - please drop the strip driver removal. It
still has a couple of users
