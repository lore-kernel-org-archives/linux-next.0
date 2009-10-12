From: Borislav Petkov <petkovbb@googlemail.com>
Subject: Re: linux-next: manual merge of the i7core_edac tree with Linus'
 tree
Date: Mon, 12 Oct 2009 07:05:34 +0200
Message-ID: <20091012050534.GC7629@liondog.tnic>
References: <20091012142328.710881fe.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f210.google.com ([209.85.218.210]:55348 "EHLO
	mail-bw0-f210.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751286AbZJLFGP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 12 Oct 2009 01:06:15 -0400
Content-Disposition: inline
In-Reply-To: <20091012142328.710881fe.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Ingo Molnar <mingo@elte.hu>
Cc: Mauro Carvalho Chehab <mchehab@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Oct 12, 2009 at 02:23:28PM +1100, Stephen Rothwell wrote:
> Today's linux-next merge of the i7core_edac tree got a conflict in
> arch/x86/kernel/cpu/mcheck/mce.c between commit
> f436f8bb73138bc74eb1c6527723e00988ad8a8a ("x86: EDAC: MCE: Fix MCE
> decoding callback logic") from Linus' tree and commit
> 699a7dbe1ffdf4b25c1475e45590b181c3e23087 ("edac_mce: Add an interface
> driver to report mce errors via edac") from the i7core_edac tree.

The current way Ingo suggested is using an atomic notifier instead
from within print_mce to convey MCE info to an EDAC driver, see
http://marc.info/?l=linux-kernel&m=125455310112745&w=2

Ingo, what are your plans with that? I'm guessing the .33 timeframe?

Thanks.

-- 
Regards/Gruss,
    Boris.
