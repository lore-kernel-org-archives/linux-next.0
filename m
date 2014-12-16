From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] arm/rpc: avoid static keyword removal via define
Date: Tue, 16 Dec 2014 11:40:56 +0000
Message-ID: <20141216114056.GP11285@n2100.arm.linux.org.uk>
References: <1418633287-5019-1-git-send-email-borntraeger@de.ibm.com>
 <1418633287-5019-2-git-send-email-borntraeger@de.ibm.com>
 <5490146A.3000408@de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gw-1.arm.linux.org.uk ([78.32.30.217]:33601 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750996AbaLPLlC (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 16 Dec 2014 06:41:02 -0500
Content-Disposition: inline
In-Reply-To: <5490146A.3000408@de.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org

On Tue, Dec 16, 2014 at 12:15:54PM +0100, Christian Borntraeger wrote:
> Am 15.12.2014 um 09:48 schrieb Christian Borntraeger:
> > commit 4486b86368d7 ("[ARM] riscpc: fix decompressor font file handling")
> > introduced Makefile magic to avoid building a file two times. Using
> > -Dstatic= does break some assumptions on compiler.h that were introduced
> > for READ_ONCE.
> > 
> > Lets just use sed on the copy instead of using a define.
> > 
> > Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
> > Cc: Russell King <linux@arm.linux.org.uk>
> 
> This fixed the linux-next build http://kisskb.ellerman.id.au/kisskb/target/1508/
> Unless anybody complains, I will send the pull request for the access_once tree tomorrow and I have this patch applied on top.

Please give me some time to look at this.

-- 
FTTC broadband for 0.8mile line: currently at 9.5Mbps down 400kbps up
according to speedtest.net.
