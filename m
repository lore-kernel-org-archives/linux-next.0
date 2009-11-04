From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: linux-next: pcmcia tree build failure
Date: Wed, 4 Nov 2009 09:07:54 +0100
Message-ID: <20091104080754.GA27784@isilmar.linta.de>
References: <20091104131540.f39af556.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from isilmar.linta.de ([213.133.102.198]:33621 "EHLO linta.de"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753566AbZKDIHv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 4 Nov 2009 03:07:51 -0500
Content-Disposition: inline
In-Reply-To: <20091104131540.f39af556.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, linux-usb@vger.kernel.org

Hi Stephen,

On Wed, Nov 04, 2009 at 01:15:40PM +1100, Stephen Rothwell wrote:
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> drivers/telephony/ixj_pcmcia.c: In function 'ixj_probe':
> drivers/telephony/ixj_pcmcia.c:35: error: 'link' undeclared (first use in this function)
> 
> Caused by commit 990c0c8eeb34f62d062052d462feaa99715cb043 ("pcmcia: use
> dynamic debug infrastructure, deprecate CS_CHECK (misc drivers)").
> 
> I have used the version of the pcmcia tree from next-20091102 for today.
> Please build test.  :-(

Thanks -- fixed both issues (build failure and test setup).

Best,
	Domiik
