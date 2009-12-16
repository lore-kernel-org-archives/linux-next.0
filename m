From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for December 16 (amd64_edac)
Date: Wed, 16 Dec 2009 09:24:24 -0800
Message-ID: <20091216092424.5f87214c.randy.dunlap@oracle.com>
References: <20091216183212.118c5e14.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet12.oracle.com ([141.146.126.234]:21859 "EHLO
	acsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1762329AbZLPRYt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 16 Dec 2009 12:24:49 -0500
In-Reply-To: <20091216183212.118c5e14.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Borislav Petkov <borislav.petkov@amd.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "H. Peter Anvin" <hpa@zytor.com>

On Wed, 16 Dec 2009 18:32:12 +1100 Stephen Rothwell wrote:

> Hi all,
> 
> My usual call for calm: please do not put stuff destined for 2.6.34 into
> linux-next trees until after 2.6.33-rc1.
> 
> Changes since 20091215:


When CONFIG_SMP=n, CONFIG_X86_MSR=m:

ERROR: "msrs_free" [drivers/edac/amd64_edac_mod.ko] undefined!
ERROR: "msrs_alloc" [drivers/edac/amd64_edac_mod.ko] undefined!


Should EDAC_AMD64 also depend on SMP?

---
~Randy
