From: Yinghai Lu <yinghai@kernel.org>
Subject: Re: linux-next: build failure after merge of the final tree
Date: Fri, 16 Jul 2010 11:39:34 -0700
Message-ID: <4C40A766.6060309@kernel.org>
References: <20100716171124.064cf319.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:27448 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757696Ab0GPSm7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 16 Jul 2010 14:42:59 -0400
In-Reply-To: <20100716171124.064cf319.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Russell King <rmk@arm.linux.org.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>

On 07/16/2010 12:11 AM, Stephen Rothwell wrote:
> Hi Russell,
> 
> After merging the final tree, today's linux-next build (most, if not all
> arm configs) failed (not unexpectedly) due to the lmb -> memblock rename
> (commit 95f72d1ed41a66f1c1c29c24d479de81a0bea36f "lmb: rename to
> memblock").
> 
> See http://kisskb.ellerman.id.au/kisskb/branch/9/

You or Russell may need to run the scripts in that patch

      FILES=$(find * -type f | grep -vE 'oprofile|[^K]config')

      sed -i \
        -e 's/lmb/memblock/g' \
        -e 's/LMB/MEMBLOCK/g' \
        $FILES

      for N in $(find . -name lmb.[ch]); do
        M=$(echo $N | sed 's/lmb/memblock/g')
        mv $N $M
      done


Thanks

Yinghai
