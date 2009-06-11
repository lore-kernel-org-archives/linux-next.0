From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: net tree build warnings
Date: Wed, 10 Jun 2009 23:47:57 -0700 (PDT)
Message-ID: <20090610.234757.215116002.davem@davemloft.net>
References: <20090611145541.2570a43d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1759569AbZFKGsL@vger.kernel.org>
In-Reply-To: <20090611145541.2570a43d.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, slapin@ossfans.org
List-Id: linux-next.vger.kernel.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 11 Jun 2009 14:55:41 +1000

> Today's linux-next build (x86_64 allmodconfig) produced these warnings:
> 
> net/ieee802154/raw.c: In function 'raw_sendmsg':
> net/ieee802154/raw.c:135: warning: format '%u' expects type 'unsigned int', but argument 2 has type 'size_t'
> net/ieee802154/dgram.c: In function 'dgram_sendmsg':
> net/ieee802154/dgram.c:251: warning: format '%u' expects type 'unsigned int', but argument 2 has type 'size_t'
> 
> Introduced by commit 9ec7671603573ede31207eb5b0b3e1aa211b2854 ("net: add
> IEEE 802.15.4 socket family implementation").

Similar to what you reported yesterday :-)

I'll get this fixed.
