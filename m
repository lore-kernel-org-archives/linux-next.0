From: Sean MacLennan <seanm@seanm.ca>
Subject: Re: linux-next: Tree for Dec 12 (staging/rtl8192e)
Date: Tue, 13 Dec 2011 23:39:39 -0500
Message-ID: <20111213233939.572235ff@opus.seanm.ca>
References: <20111212161444.22a11535656c6bfbd884d9ec@canb.auug.org.au>
	<4EE63A9C.1090503@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from toronto-hs-216-138-233-67.s-ip.magma.ca ([216.138.233.67]:59672
	"HELO yow.seanm.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1755758Ab1LNEqY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 13 Dec 2011 23:46:24 -0500
In-Reply-To: <4EE63A9C.1090503@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Mon, 12 Dec 2011 09:32:12 -0800
Randy Dunlap <rdunlap@xenotime.net> wrote:

> On 12/11/2011 09:14 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20111209:
> 
> 
> ERROR:
> "rtllib_crypt_delayed_deinit" [drivers/staging/rtl8192e/rtllib.ko]
> undefined! ERROR:
> "rtllib_get_crypto_ops" [drivers/staging/rtl8192e/rtllib.ko]
> undefined! ERROR:
> "rtllib_crypt_deinit_entries" [drivers/staging/rtl8192e/rtllib.ko]
> undefined! ERROR:
> "rtllib_crypt_deinit_handler" [drivers/staging/rtl8192e/rtllib.ko]
> undefined!
> 
> Full randconfig file is attached.
> 

This is my fault and I am working on a patch for this. I can submit a
quick fix if needed.

Cheers,
   Sean
