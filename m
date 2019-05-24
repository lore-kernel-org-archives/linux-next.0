From: Steve French <smfrench@gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the cifs tree
Date: Fri, 24 May 2019 09:14:07 -0500
Message-ID: <CAH2r5msm9TfC8f5WNOyD-9g01u9m-UNPuk_XPp3Ykhc4u7+Rtg@mail.gmail.com>
References: <20190524142713.360c0c10@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190524142713.360c0c10@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: CIFS <linux-cifs@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Murphy Zhou <jencce.kernel@gmail.com>
List-Id: linux-next.vger.kernel.org

fixed and repushed to cifs-2.6.git for-next

On Thu, May 23, 2019 at 11:27 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> In commit
>
>   f875253b5fe6 ("fs/cifs/smb2pdu.c: fix buffer free in SMB2_ioctl_free")
>
> Fixes tag
>
>   Fixes: 2c87d6a ("cifs: Allocate memory for all iovs in smb2_ioctl")
>
> has these problem(s):
>
>   - SHA1 should be at least 12 digits long
>     Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
>     or later) just making sure it is not set (or set to "auto").
>
> --
> Cheers,
> Stephen Rothwell



-- 
Thanks,

Steve
