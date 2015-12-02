From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the mvebu tree with the arm-soc tree
Date: Wed, 02 Dec 2015 12:21:21 +0100
Message-ID: <2428665.BrOON4cELy@wuerfel>
References: <20151202111244.b7ee49ee06b4a95e407e740d@kernel.org> <20151202111829.GE1929@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.135]:62471 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757923AbbLBLV7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Dec 2015 06:21:59 -0500
In-Reply-To: <20151202111829.GE1929@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Jason Cooper <jason@lakedaemon.net>, andrew@lunn.ch, gregory.clement@free-electrons.com, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wednesday 02 December 2015 11:18:29 Mark Brown wrote:
> On Wed, Dec 02, 2015 at 11:12:44AM +0000, Mark Brown wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the mvebu tree got a conflict in  between commit
> > 377524dc4d77f50e ("ARM: mmp: move into ARCH_MULTIPLATFORM") from the arm-soc
> > tree and commit 5f4423af9dd17 ("ARM: orion: multiplatform support") from the
> > mvebu tree.
> 
> Ccing in Arnd since I forgot to do that.
> 

I was planning to merge all the multiplatform changes into one next/multiplatform
branch, but the mvebu maintainers preferred to keep this one in their tree at
least initially. The conflict will go away once it's tested sufficiently and
I'm pulling it back.
	
	Arnd
