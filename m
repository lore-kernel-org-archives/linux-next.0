From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [BUILD-FAILURE] linux-next: Tree for June 4 -
	firmware/keyspan/mpr.fw.gen.S
Date: Wed, 04 Jun 2008 12:57:42 +0100
Message-ID: <1212580662.32207.54.camel@pmac.infradead.org>
References: <20080604180025.3ecd03ff.sfr@canb.auug.org.au>
	 <48468091.5000102@linux.vnet.ibm.com>
	 <1212580245.32207.51.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:55695 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751163AbYFDL5t (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 4 Jun 2008 07:57:49 -0400
In-Reply-To: <1212580245.32207.51.camel@pmac.infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andy Whitcroft <apw@shadowen.org>

On Wed, 2008-06-04 at 12:50 +0100, David Woodhouse wrote:
> Hm, what version of make? Does .SECONDEXPANSION: not work everywhere?

What does this Makefile do for you...

FOO=foo
.SECONDEXPANSION:
bar: $$(FOO)

-- 
dwmw2

