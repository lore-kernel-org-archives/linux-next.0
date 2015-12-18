From: Dan Streetman <ddstreet@ieee.org>
Subject: Re: linux-next: Tree for Dec 16 (lib/842/842_decompress)
Date: Fri, 18 Dec 2015 09:32:06 -0500
Message-ID: <CALZtONAX=HeofcK1F1CPbiQONVubD-eQmZTNK+MGnO1qL2bnig@mail.gmail.com>
References: <20151216164343.0cb641ce@canb.auug.org.au> <5671C83C.7@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5671C83C.7@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, Dec 16, 2015 at 3:23 PM, Randy Dunlap <rdunlap@infradead.org> wrote:
> On 12/15/15 21:43, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20151215:
>>
>> The drm-misc tree gained a conflict against Linus' tree.
>>
>> The i2c tree gained a build failure for which I applied a patch.
>>
>> The gpio tree gained a build failure so I used the version from
>> next-20151215.
>>
>
> on i386, when CONFIG_PRINTK is not enabled:
>
>
> ../lib/842/842_decompress.c: In function '__do_index':
> ../lib/842/842_decompress.c:205:2: error: implicit declaration of function 'no_printk' [-Werror=implicit-function-declaration]
>   pr_debug("index%x to %lx off %lx adjoff %lx tot %lx data %lx\n",
>   ^

Hmm, it's not failing for me, can you send your config?

>
>
>
>
>
> --
> ~Randy
