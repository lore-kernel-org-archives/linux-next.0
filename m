From: Peter Hurley <peter@hurleysoftware.com>
Subject: Re: linux-next: Tree for Nov 26 (staging/fwserial)
Date: Tue, 27 Nov 2012 02:39:10 -0500
Message-ID: <1354001950.3284.23.camel@thor>
References: <20121127011738.9ecd7971a7ea2e3d09a9450d@canb.auug.org.au>
	 <50B3D767.70604@infradead.org>
	 <20121126152001.bf346786.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout39.mail01.mtsvc.net ([216.70.64.83]:36459 "EHLO
	n12.mail01.mtsvc.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1758047Ab2K0HjQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 27 Nov 2012 02:39:16 -0500
In-Reply-To: <20121126152001.bf346786.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>

On Mon, 2012-11-26 at 15:20 -0800, Andrew Morton wrote:
> On Mon, 26 Nov 2012 12:56:07 -0800
> Randy Dunlap <rdunlap@infradead.org> wrote:
> 
> > On 11/26/2012 06:17 AM, Stephen Rothwell wrote:
> > 
> > > Hi all,
> > > 
> > > Changes since 20121115:
> > > 
> > 
> > 
> > on i386:
> > 
> > drivers/staging/fwserial/dma_fifo.c: In function 'dma_fifo_in':
> > drivers/staging/fwserial/dma_fifo.c:174:2: error: implicit declaration of function '__WARN_printf'
> > 
> 
> That should be replaced with WARN(fifo->corrupt, format).

Yeah, not sure what I was thinking there. Or rather not thinking.

> drivers/staging/fwserial/dma_fifo.[ch] appear to be generic code and
> really should be proposed for mm/ or lib/.

If there are other users for which this would be useful, that's ok with
me. I'd feel more comfortable with that after this driver gets some
heavier usage (which shouldn't be a problem once I get a console and
debugger running on top of it).
