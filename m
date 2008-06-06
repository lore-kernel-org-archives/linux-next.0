From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: linux-next: firmware build failure
Date: Fri, 06 Jun 2008 10:09:55 +0100
Message-ID: <1212743395.32207.297.camel@pmac.infradead.org>
References: <20080606174723.05ae4f28.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:45066 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751767AbYFFJJ7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 6 Jun 2008 05:09:59 -0400
In-Reply-To: <20080606174723.05ae4f28.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Fri, 2008-06-06 at 17:47 +1000, Stephen Rothwell wrote:
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
>   IHEX2FW firmware/atmsar11.fw
> Bad EOF record (type 01) format
> make[2]: *** [firmware/atmsar11.fw] Error 1

Dammit, and I thought I was going to manage a whole day without breaking
the build. Sorry; will attend to it now...

-- 
dwmw2

