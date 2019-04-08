From: Steve French <smfrench@gmail.com>
Subject: Re: linux-next: Fixes tags need some work in the cifs tree
Date: Mon, 8 Apr 2019 17:30:20 -0500
Message-ID: <CAH2r5mvSQ6+gq92EMtj+_DYCZW_AOjZocJ9rAKHdtU09Nw-pgw@mail.gmail.com>
References: <20190409073827.0ac717ab@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190409073827.0ac717ab@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: CIFS <linux-cifs@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ZhangXiaoxu <zhangxiaoxu5@huawei.com>
List-Id: linux-next.vger.kernel.org

I just fixed these up manually and repushed to cifs-2.6.git for-next

I was curious if checkpatch should have flagged this - I reran
checkpatch on the original version of Zhang's patches and it didn't
complain about the spacing (and probably should have).

On Mon, Apr 8, 2019 at 4:38 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> In commit
>
>   7d672725ba72 ("cifs: Fix lease buffer length error")
>
> Fixes tags
>
>   Fixes: 9764c02fcbad(SMB3: Add support for multidialect negotiate (SMB2.1 and later))
>   Fixes: d5c7076b772a(smb3: add smb3.1.1 to default dialect list)
>
> has these problem(s):
>
>   - missing space between the SHA1 and the subject
>   - missing quotes around the subject
>
> In commit
>
>   54492efdd6a2 ("cifs: Fix use-after-free in SMB2_read")
>
> Fixes tag
>
>   Fixes: eccb4422cf97(smb3: Add ftrace tracepoints for improved SMB3 debugging)
>
> has these problem(s):
>
>   - missing space between the SHA1 and the subject
>   - missing quotes around the subject
>
> In commit
>
>   3cc71735cf9f ("cifs: Fix use-after-free in SMB2_write")
>
> Fixes tag
>
>   Fixes: eccb4422cf97(smb3: Add ftrace tracepoints for improved SMB3 debugging)
>
> has these problem(s):
>
>   - missing space between the SHA1 and the subject
>   - missing quotes around the subject
>
> --
> Cheers,
> Stephen Rothwell



-- 
Thanks,

Steve
