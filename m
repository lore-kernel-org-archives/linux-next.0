From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Signed-off-by missing for commits in the scsi tree
Date: Wed, 9 Aug 2017 09:53:51 +1000
Message-ID: <20170809095351.646496a8@canb.auug.org.au>
References: <20170809092730.1138bf7e@canb.auug.org.au>
        <1502235696.2736.120.camel@HansenPartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46357 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752081AbdHHXxx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 8 Aug 2017 19:53:53 -0400
In-Reply-To: <1502235696.2736.120.camel@HansenPartnership.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Martin K. Petersen" <martin.petersen@oracle.com>

Hi James,

On Tue, 08 Aug 2017 16:41:36 -0700 James Bottomley <James.Bottomley@HansenP=
artnership.com> wrote:
>
> =C2=A0The rule, I believe, is that only the person who transforms the ema=
il
> to a git tree should be the last signoff in the commit log, even if
> they're a tree pulling into another one and thereafter the signoffs go
> in the merge commit, so the signoff sent by me in the signed tag when I
> send the main tree to Linus is my signoff for transmitting all the
> commits, which includes the rebased ones in this instance.

According to Linus:

"Rebasing really is pretty much the exact same thing as
applying a patch."

And so should have a Signed-off-by from the committer.

--=20
Cheers,
Stephen Rothwell
