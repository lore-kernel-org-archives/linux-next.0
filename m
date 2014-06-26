From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Jun 26 (crypto/drbg)
Date: Thu, 26 Jun 2014 08:08:55 -0700
Message-ID: <53AC3787.7090309@infradead.org>
References: <20140626164130.4d01a3b2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:39422 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753893AbaFZPI5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 26 Jun 2014 11:08:57 -0400
In-Reply-To: <20140626164130.4d01a3b2@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Stephan Mueller <smueller@chronox.de>, linux-crypto@vger.kernel.org

On 06/25/14 23:41, Stephen Rothwell wrote:
> Hi all,
> 
> The powerpc allyesconfig is again broken more than usual.
> 
> Changes since 20140625:
> 


on i386:

../crypto/drbg.c:1097:3: warning: format '%lu' expects argument of type 'long unsigned int', but argument 2 has type 'size_t' [-Wformat]
../crypto/drbg.c:1966:3: warning: format '%lu' expects argument of type 'long unsigned int', but argument 2 has type 'unsigned int' [-Wformat]
../crypto/drbg.c:1966:3: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'unsigned int' [-Wformat]


-- 
~Randy
