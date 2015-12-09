From: Borislav Petkov <bp@suse.de>
Subject: Re: Crash caused by "EDAC: Rip out the edac_subsys reference
 counting" (was Re: linux-next: Tree for Dec 8)
Date: Wed, 9 Dec 2015 20:20:40 +0100
Message-ID: <20151209192040.GE10518@pd.tnic>
References: <20151208154910.78d27c03@canb.auug.org.au>
 <1449657167.17265.4.camel@ellerman.id.au>
 <20151209111747.GA10518@pd.tnic>
 <20151209160301.GB10518@pd.tnic>
 <1449679809.15946.167.camel@freescale.com>
 <20151209173829.GD10518@pd.tnic>
 <1449683825.15946.207.camel@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:39965 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753302AbbLITU5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 9 Dec 2015 14:20:57 -0500
Content-Disposition: inline
In-Reply-To: <1449683825.15946.207.camel@freescale.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Scott Wood <scottwood@freescale.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Johannes Thumshirn <jthumshirn@suse.de>, linux-edac@vger.kernel.org

On Wed, Dec 09, 2015 at 11:57:05AM -0600, Scott Wood wrote:
> I recall at the time suggesting that the PCIe controller driver insta=
ntiate a
> platform device for the EDAC driver to bind to -- it looks like that'=
s what
> we'll need to do.

Sounds better. Let me know if there's anything I can help with to get
this sorted out.

Thanks.

--=20
Regards/Gruss,
    Boris.

SUSE Linux GmbH, GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Nort=
on, HRB 21284 (AG N=C3=BCrnberg)
--=20
