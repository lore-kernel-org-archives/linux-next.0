From: James Morris <jmorris@namei.org>
Subject: Re: linux-next: security-testing tree build failure
Date: Fri, 6 Feb 2009 19:14:11 +1100 (EST)
Message-ID: <alpine.LRH.1.10.0902061912240.16725@tundra.namei.org>
References: <20090206182831.c18a56a0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tundra.namei.org ([65.99.196.166]:3400 "EHLO tundra.namei.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752675AbZBFIO0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 6 Feb 2009 03:14:26 -0500
In-Reply-To: <20090206182831.c18a56a0.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Al Viro <viro@zeniv.linux.org.uk>, Mimi Zohar <zohar@linux.vnet.ibm.com>

On Fri, 6 Feb 2009, Stephen Rothwell wrote:

> Hi James,
> 
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> fs/namei.c: In function 'may_open':
> fs/namei.c:1516: error: 'nd' undeclared (first use in this function)
> 
> Caused by commit 6146f0d5e47ca4047ffded0fb79b6c25359b386c ("integrity:
> IMA hooks").
> 
> The "nd" parameter to may_open() was removed in commit
> 3fb64190aa3c23c10e6e9fd0124ac030115c99bf ("pass a struct path * to
> may_open") before 2.6.29-rc1.
> 
> I have dropped the security-testing tree for today.

This was also fixed before I pushed my tree out (can you re-pull the 
security-testing tree at ~11am your time if you get a conflict?  chances 
are I've fixed it by then).

-- 
James Morris
<jmorris@namei.org>
