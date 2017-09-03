From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: linux-next: Signed-off-by missing for commits in the mips tree
Date: Sun, 3 Sep 2017 23:14:03 +0200
Message-ID: <CAFBinCA_2PMwNsC_1MtnUeBWs7VPFOjrRTqHts6_O_fqp0Svrg@mail.gmail.com>
References: <20170904021318.613b0a21@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:36050 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752942AbdICVOY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 3 Sep 2017 17:14:24 -0400
In-Reply-To: <20170904021318.613b0a21@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Hauke Mehrtens <hauke@hauke-m.de>, Ralf Baechle <ralf@linux-mips.org>
Cc: James Hogan <james.hogan@imgtec.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paul Burton <paul.burton@imgtec.com>, Stephen Rothwell <sfr@canb.auug.org.au>

Hi Hauke, Hi Ralf,

On Sun, Sep 3, 2017 at 6:13 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Commits
>
> bb19a5e5205b MIPS: lantiq: Remove the arch/mips/lantiq/xway/reset.c implementation
> f6a4de1654c9 MIPS: lantiq: Add a GPHY driver which uses the RCU syscon-mfd
> 565f7e8292f5 reset: Add a reset controller driver for the Lantiq XWAY based SoCs
> e55bfdfacaed Documentation: DT: MIPS: lantiq: Add docs for the RCU bindings
> 5a7715f4b8e0 MIPS: lantiq: Enable MFD_SYSCON to be able to use it for the RCU MFD
Hauke: thank you for pushing these patches forward (by adding lots of
fixes, missing documentation and so on)!
I can send a Signed-off-by for all of these - however I'd like you to
be the author of at least "Documentation: DT: MIPS: lantiq: Add docs
for the RCU bindings" (since you did all the actual work, but finding
the best DT binding with the DT maintainers).

Ralf: how do you want to handle this? should I simply send my
Signed-off-by on the relevant patches and you will fixup these?
and similarly, (if it's OK for Hauke) can you also change the author
of "Documentation: DT: MIPS: lantiq: Add docs for the RCU bindings"?

> 114f298226a3 MIPS: Malta: Use new GIC accessor functions
>
> are missing a Signed-off-by from their author.
>
> Commit
>
> 114f298226a3 MIPS: Malta: Use new GIC accessor functions
>
> is missing a Signed-off-by from its commiter.
>
> --
> Cheers,
> Stephen Rothwell
thanks for spotting this Stephen


Regards,
Martin
