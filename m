From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for May 14 (vhost_scsi)
Date: Tue, 14 May 2013 12:16:20 -0700
Message-ID: <51928D84.2040305@infradead.org>
References: <20130514141739.46eb9b42c95cb02947610379@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:46696 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754581Ab3ENTRD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 14 May 2013 15:17:03 -0400
In-Reply-To: <20130514141739.46eb9b42c95cb02947610379@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Nicholas A. Bellinger" <nab@risingtidesystems.com>, virtualization@lists.linux-foundation.org

On 05/13/13 21:17, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20130513:
> 
> <crickets :-)>


on x86_64:

ERROR: "memcpy_fromiovec" [drivers/vhost/vhost_scsi.ko] undefined!


It needs to depend on NET since net/core/ provides that function.


-- 
~Randy
