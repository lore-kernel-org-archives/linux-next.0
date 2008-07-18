From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: manual merge of the ttydev tree
Date: Fri, 18 Jul 2008 09:49:12 +0100
Message-ID: <20080718094912.42d9c043@the-village.bc.nu>
References: <20080718182015.bf3ef4e5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from lxorguk.ukuu.org.uk ([81.2.110.251]:52047 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753797AbYGRJn3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 18 Jul 2008 05:43:29 -0400
In-Reply-To: <20080718182015.bf3ef4e5.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Adrian Bunk <bunk@kernel.org>, "John W. Linville" <linville@tuxdriver.com>

On Fri, 18 Jul 2008 18:20:15 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Alan,
> 
> Today's linux-next merge of the ttydev tree got a conflict in
> drivers/net/wireless/strip.c between commit
> 94d9842403f770239a656586442454b7a8f2df29 ("remove the strip driver") from
> the wireless tree and commit 08bec19ee22b6d02bf354323e6b5a3e61070c04a
> ("tty-fix-strip") from the ttydev tree.
> 
> I just removed the file for now.
> 
> I think I remember some discussion of this a while ago ...


Yes - the strip driver should not be getting dropped. I asked Adrian to
stop this. I am suprised he hasn't done so.

Alan
