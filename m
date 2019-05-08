From: Steve French <smfrench@gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the cifs tree
Date: Tue, 7 May 2019 23:03:38 -0500
Message-ID: <CAH2r5mtrZ9K9H_d6PV1_zx1gvnWbq5J=gJ0EY_XbKBRA+kLyqQ@mail.gmail.com>
References: <20190508073238.6a5f4cd7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190508073238.6a5f4cd7@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: CIFS <linux-cifs@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Probst <kernel@probst.it>
List-Id: linux-next.vger.kernel.org

fixed

On Tue, May 7, 2019 at 4:32 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Commit
>
>   b00c40f57bd5 ("cifs: fix strcat buffer overflow and reduce raciness in smb21_set_oplock_level()")
>
> is missing a Signed-off-by from its author.
>
> Actually it looks like you were just tripped up by the mailing list's
> DMARC workaround.  :-(
>
> --
> Cheers,
> Stephen Rothwell



-- 
Thanks,

Steve
