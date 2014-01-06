From: Baruch Siach <baruch@tkos.co.il>
Subject: Re: linux-next: build failure after merge of the spi tree
Date: Mon, 6 Jan 2014 09:09:06 +0200
Message-ID: <20140106070906.GE7812@tarshish>
References: <20140106180305.2839a467466f52f97ac68b93@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from guitar.tcltek.co.il ([192.115.133.116]:47216 "EHLO
	mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751218AbaAFHJK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 6 Jan 2014 02:09:10 -0500
Content-Disposition: inline
In-Reply-To: <20140106180305.2839a467466f52f97ac68b93@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Stephen,

On Mon, Jan 06, 2014 at 06:03:05PM +1100, Stephen Rothwell wrote:
> After merging the spi tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> drivers/spi/spi-dw-pci.c: In function 'spi_pci_probe':
> drivers/spi/spi-dw-pci.c:50:29: error: 'dev' undeclared (first use in this function)
>   dwpci = devm_kzalloc(&pdev-dev, sizeof(struct dw_spi_pci), GFP_KERNEL);
>                              ^
> 
> Caused by commit 04f421e7b0b1 ("spi: dw: use managed resources").
> 
> I have used the spi tree from next-20131224 for today (since the above
> commit does not revert cleanly).

Sorry, my bad (I said I have no way to test this PCI code, didn't I?). I'll 
send a fix shortly.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
