From: ian <spyro@f2s.com>
Subject: Re: linux-next: mfd tree build failure
Date: Tue, 05 Aug 2008 14:03:14 +0100
Message-ID: <1217941394.18866.19.camel@wirenth>
References: <20080805150947.ee63424a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mk-outboundfilter-5.mail.uk.tiscali.com ([212.74.114.1]:11203
	"EHLO mk-outboundfilter-5.mail.uk.tiscali.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1761265AbYHENDc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 Aug 2008 09:03:32 -0400
In-Reply-To: <20080805150947.ee63424a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Samuel Ortiz <sameo@openedhand.com>, linux-next@vger.kernel.org

On Tue, 2008-08-05 at 15:09 +1000, Stephen Rothwell wrote:
> 
> I reverted commit 4d6da2de1b09228989efb67a1f9e6d2ced075540 ("mfd:
> driver for the TMIO NAND controller") until it has tighter controls in
> its Kconfig patch. i.e. I have no idea what arches this should be
> built on.

Since there is no way to know wether an arch has readsw() and friends at
config time, I'd propose that bot the TMIO NAND and MMC drivers be built
only on ARM for now. If anyone every uses them on another platform, they
can add the support.

Should I redo the two drivers patchsets, or would you prefer a patch
fixing this after the fact?
