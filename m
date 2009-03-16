From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for March 16 (slob)
Date: Mon, 16 Mar 2009 11:32:00 -0700
Message-ID: <49BE9B20.70808@oracle.com>
References: <20090316220609.6f4a884c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet12.oracle.com ([148.87.113.124]:27905 "EHLO
	rgminet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752466AbZCPScR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 16 Mar 2009 14:32:17 -0400
In-Reply-To: <20090316220609.6f4a884c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20090312:


mm/slob.c:480: error: 'flags' undeclared (first use in this function)


pseudo-patch:

s/flags/gfp/


~Randy
