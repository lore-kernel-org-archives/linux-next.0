From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the input-current tree
Date: Fri, 25 Jan 2019 15:56:56 -0800
Message-ID: <CAKdAkRRBVDd80e4zjmwqqMH-dt4-1paVdrriu2Fn=-Zv+7qgrg@mail.gmail.com>
References: <20190124220954.2147f1da@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190124220954.2147f1da@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Lubomir Rintel <lkundrak@v3.sk>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Thu, Jan 24, 2019 at 3:09 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Dmitry,
>
> In commit
>
>   ec87da107d11 ("Input: olpc_apsp - assign priv->dev earlier")
>
> Fixes tag
>
>   Fixes: commit af518342effd ("Input: olpc_apsp - check FIFO status on open(), not probe()")
>
> has these problem(s):
>
>   - No SHA1 recognised
>
> The "commit" at the start of the tag value was unexpected.

Hmm, this is really weird:

dtor@dtor-ws:~/kernel/master (for-linus)$ git log --oneline --
drivers/input/serio/olpc_apsp.c
ec87da107d11 Input: olpc_apsp - assign priv->dev earlier
2a58dd767bf9 Input: olpc_apsp - remove set but not used variable 'np'
ed22cee91a88 Input: olpc_apsp - enable the SP clock
af518342effd Input: olpc_apsp - check FIFO status on open(), not probe()

As you can see there is that SHA1 in question present in my for-linus branch.

Thanks.

-- 
Dmitry
