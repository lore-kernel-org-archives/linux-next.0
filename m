From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: linux-next: pcmcia tree build failure
Date: Mon, 25 Jan 2010 08:38:45 +0100
Message-ID: <20100125073845.GA25453@comet.dominikbrodowski.net>
References: <20100125131343.9934da5f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from isilmar.linta.de ([213.133.102.198]:44140 "EHLO linta.de"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1750960Ab0AYHiz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 Jan 2010 02:38:55 -0500
Content-Disposition: inline
In-Reply-To: <20100125131343.9934da5f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hey Stephen,

On Mon, Jan 25, 2010 at 01:13:43PM +1100, Stephen Rothwell wrote:
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> drivers/built-in.o:(.toc1+0xd118): undefined reference to `pcmcia_dev_list_lock'
> 
> Caused by commit fc53c3482805cb3281dbeb0bd29dd892aaa53303 ("pcmcia:
> simplify locking").
> 
> I have used the pcmcia tree from next-20100122 for today.

Thanks, fixed for tomorrow.

Best,
	Dominik
