From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: import of the kernel-doc tree failed
Date: Thu, 15 Sep 2011 09:10:25 -0700
Message-ID: <4E722371.2060908@xenotime.net>
References: <20110915111301.a4227f9ca0d1f448d54050ae@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy8-pub.bluehost.com ([69.89.22.20]:41899 "HELO
	oproxy8-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S934081Ab1IOQK1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 15 Sep 2011 12:10:27 -0400
In-Reply-To: <20110915111301.a4227f9ca0d1f448d54050ae@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On 09/14/11 18:13, Stephen Rothwell wrote:
> Hi Randy,
> 
> Importing the kernel-doc tree today produced this error:
> 
> $ git am ../quilt/kernel-doc/docum-leds-class-fix-typo.patch
> Patch format detection failed.
> 
> I just had to replace the tab in the From: line with a space.

I fixed my version of the patch.

Thanks.

-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
