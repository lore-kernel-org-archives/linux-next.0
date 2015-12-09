From: Borislav Petkov <bp@suse.de>
Subject: Re: Crash caused by "EDAC: Rip out the edac_subsys reference
 counting" (was Re: linux-next: Tree for Dec 8)
Date: Wed, 9 Dec 2015 12:17:47 +0100
Message-ID: <20151209111747.GA10518@pd.tnic>
References: <20151208154910.78d27c03@canb.auug.org.au>
 <1449657167.17265.4.camel@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:44125 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751804AbbLILSE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 9 Dec 2015 06:18:04 -0500
Content-Disposition: inline
In-Reply-To: <1449657167.17265.4.camel@ellerman.id.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Scott Wood <scottwood@freescale.com>

On Wed, Dec 09, 2015 at 09:32:47PM +1100, Michael Ellerman wrote:
> Presumably caused by the fact that edac_init() is subsys_initcall(), =
whereas
> corenet_gen_publish_devices() is arch_initcall().

Thanks for the report!

Hmm, interesting, can you send .config please?

I need to fix this dependency properly - edac_core needs to have
finished loaded *before* any other EDAC driver loads. Every other order
is wrong.

--=20
Regards/Gruss,
    Boris.

SUSE Linux GmbH, GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Nort=
on, HRB 21284 (AG N=C3=BCrnberg)
--=20
