From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH next] parisc: asm/pdc.h should include asm/page.h
Date: Wed, 1 Apr 2009 11:01:15 -0400
Message-ID: <20090401150115.GA1443@bombadil.infradead.org>
References: <a4423d670904010244q1cfbce88qaa635d8e4070db07@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:49511 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932294AbZDAPBV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 1 Apr 2009 11:01:21 -0400
Content-Disposition: inline
In-Reply-To: <a4423d670904010244q1cfbce88qaa635d8e4070db07@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, linux-parisc@vger.kernel.org, kyle@mcmartin.ca

On Wed, Apr 01, 2009 at 01:44:08PM +0400, Alexander Beregalov wrote:
> Fixes this build error:
> arch/parisc/kernel/pdc_cons.c:117: error: '__PAGE_OFFSET' undeclared
> (first use in this function)
> 
> Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>

Huh. Nice. More patches to arch/parisc that didn't go through me that
break things.

Applied, thanks again Alexander.

cheers, Kyle
