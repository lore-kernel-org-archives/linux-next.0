From: Rob Herring <robherring2@gmail.com>
Subject: Re: linux-next: build warning after merge of the devicetree tree
Date: Wed, 3 May 2017 07:12:27 -0500
Message-ID: <CAL_Jsq+oDXJVDvLSmPQVcm7QB1cwOeTdELeACB=9FtLkszhKdA@mail.gmail.com>
References: <20170428124503.172ce783@canb.auug.org.au> <20170503154433.25ea1d10@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170503154433.25ea1d10@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Frank Rowand <frank.rowand@sony.com>
List-Id: linux-next.vger.kernel.org

On Wed, May 3, 2017 at 12:44 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Rob,
>
> On Fri, 28 Apr 2017 12:45:03 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> After merging the devicetree tree, today's linux-next build (x86_64
>> allmodconfig) produced this warning:
>>
>> drivers/of/unittest.c: In function 'of_unittest':
>> drivers/of/unittest.c:2199:25: warning: 'last_sibling' may be used uninitialized in this function [-Wmaybe-uninitialized]
>>    last_sibling->sibling = overlay_base_root->child;
>>                          ^
>> drivers/of/unittest.c:2122:22: note: 'last_sibling' was declared here
>>   struct device_node *last_sibling;
>>                       ^
>>
>> Introduced by commit
>>
>>   81d0848fc8d2 ("of: Add unit tests for applying overlays")
>
> Ping?

Sorry, forgot to push out the fix. Now done.

Rob
