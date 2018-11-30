From: Dave Rodgman <dave.rodgman@arm.com>
Subject: Re: linux-next: build warning after merge of the akpm tree
Date: Fri, 30 Nov 2018 14:52:10 +0000
Message-ID: <51cdffd4-8e89-0366-a13d-154b2cbfb69a@arm.com>
References: <20181130164030.3dbeb8b4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181130164030.3dbeb8b4@canb.auug.org.au>
Content-Language: en-US
Content-ID: <4B6D5845808F9340B244166314195929@eurprd08.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 30/11/2018 5:40 am, Stephen Rothwell wrote:
> After merging the akpm tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
>
> lib/lzo/lzo1x_compress.c: In function 'lzo1x_1_do_compress':
> lib/lzo/lzo1x_compress.c:239:14: warning: 'm_pos' may be used uninitializ=
ed in this function [-Wmaybe-uninitialized]
>     m_off =3D ip - m_pos;
>             ~~~^~~~~~~
> Probably introduced by patch
>
>    "lib/lzo: implement run-length encoding"
> or
>    "lib/lzo: separate lzo-rle from lzo"

Apologies, I didn't spot this (I think it's gcc only - clang, which I
was testing with, seems smart enough not to report this false positive).

I've fixed it in the latest patchset (v4):

https://lkml.org/lkml/2018/11/30/972

Dave
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
