From: Darren Hart <dvhart@infradead.org>
Subject: Re: linux-next: build failure after merge of the drivers-x86 tree
Date: Sun, 7 Jun 2015 21:52:42 -0700
Message-ID: <20150608045242.GB34635@fury.dvhart.com>
References: <1433499181.8590.1.camel@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:41368 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751173AbbFHEwn (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 8 Jun 2015 00:52:43 -0400
Content-Disposition: inline
In-Reply-To: <1433499181.8590.1.camel@ellerman.id.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, rkrcmar@redhat.com

On Fri, Jun 05, 2015 at 08:13:01PM +1000, Michael Ellerman wrote:
> Hi Darren,
> 
> After merging the drivers-x86 tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> ERROR: "acpi_bus_get_status_handle" [drivers/platform/x86/pvpanic.ko] undefined!
> 
> Caused by commit b8f8cf6b02b6 ("pvpanic: handle missing _STA correctly").
> 
> I have applied the fixup patch from Radim for today
> (http://marc.info/?l=linux-next&m=143344030214935&w=2).

It is now fixed on my for-next HEAD.

I rolled this incremental fix into the original to avoid breaking bisect.

-- 
Darren Hart
Intel Open Source Technology Center
