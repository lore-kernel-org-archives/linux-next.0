From: Sachin Kamat <spk.linux@gmail.com>
Subject: Re: linux-next: manual merge of the staging tree with the tree
Date: Fri, 11 Jul 2014 11:02:21 +0530
Message-ID: <CAK5sBcEz-s9K0fCDSQ-L4oKn1abWjRRw+=1PCjcvoYx2R_Aiqw@mail.gmail.com>
References: <20140711152130.45a6978f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-la0-f49.google.com ([209.85.215.49]:61928 "EHLO
	mail-la0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750750AbaGKFcX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 11 Jul 2014 01:32:23 -0400
Received: by mail-la0-f49.google.com with SMTP id gf5so438303lab.22
        for <linux-next@vger.kernel.org>; Thu, 10 Jul 2014 22:32:21 -0700 (PDT)
In-Reply-To: <20140711152130.45a6978f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

Hi Stephen,

I wonder if the subject line "manual merge of the staging tree with the tree" is
missing the name of the second tree (in this case probably should have been
"...with the tty tree"?)



On Fri, Jul 11, 2014 at 10:51 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Greg,
>
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/dgrp/dgrp_tty.c between commit e359a4e38d22 ("tty:
> Remove tty_hung_up_p() tests from tty drivers' open()") from the tty
> tree and commit 19b1e7695be8 ("staging: dgrp: remove driver") from the
> staging tree.
>
> I fixed it up (by just removing the file) and can carry the fix as
> necessary (no action is required).
>
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au



-- 
Regards,
Sachin.
