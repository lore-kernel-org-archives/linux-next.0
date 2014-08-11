From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: linux-next: build failure after merge of the mmc-uh tree
Date: Mon, 11 Aug 2014 09:54:25 +0200
Message-ID: <CAPDyKFqrTVP46+NU+pvf+gFMnEkuJFmARzMpm_2DEcNCK5-BAw@mail.gmail.com>
References: <20140728144608.7d9ac736@canb.auug.org.au>
	<20140808132510.68e8ae66@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140808132510.68e8ae66@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sonny Rao <sonnyrao@chromium.org>
List-Id: linux-next.vger.kernel.org

On 8 August 2014 05:25, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> On Mon, 28 Jul 2014 14:46:08 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> After merging the mmc-uh tree, today's linux-next build (arm
>> multi_v7_defconfig) failed like this:
>>
>> drivers/mmc/host/dw_mmc.c: In function 'dw_mci_reset':
>> drivers/mmc/host/dw_mmc.c:2262:3: error: implicit declaration of function 'dw_mci_idmac_reset' [-Werror=implicit-function-declaration]
>>    dw_mci_idmac_reset(host);
>>    ^
>>
>> Caused by commit 25f7dadbd982 ("mmc: dw_mmc: change to use recommended
>> reset procedure").
>>
>> I have used the mmc-uh tree from next-20140725 for today.
>
> Ping.  We are nearly half way through the merge window and there has
> been a patch posted for this, but the tree is still broken ...

Sorry for the delay. I have picked up the new version of the patch now.

Kind regards
Ulf Hansson

>
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
