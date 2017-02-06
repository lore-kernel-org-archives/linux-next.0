From: Andy Gross <andy.gross@linaro.org>
Subject: Re: linux-next: manual merge of the arm64 tree with the qcom tree
Date: Mon, 6 Feb 2017 09:45:51 -0600
Message-ID: <CAPBZ5QdrbAnkAXvEqR2Y_BM9qhm6aZUaHbBKx6QSr6p3wvZH9A@mail.gmail.com>
References: <20170206102329.04879df9@canb.auug.org.au> <20170206114418.GB19939@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170206114418.GB19939@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Will Deacon <will.deacon@arm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Catalin Marinas <catalin.marinas@arm.com>, linux-next@vger.kernel.org, Linux Kernel list <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 6 February 2017 at 05:44, Will Deacon <will.deacon@arm.com> wrote:
> On Mon, Feb 06, 2017 at 10:23:29AM +1100, Stephen Rothwell wrote:
>> Hi all,
>>
>> Today's linux-next merge of the arm64 tree got conflicts in:
>>
>>   arch/arm/kernel/armksyms.c
>>   arch/arm64/kernel/arm64ksyms.c
>>   arch/arm64/kernel/smccc-call.S
>>   include/linux/arm-smccc.h
>>
>> between commits:
>>
>>   0a0c5b832751 ("arm: kernel: Add SMC structure parameter")
>>   9c96e7f72029 ("firmware: qcom: scm: Fix interrupted SCM calls")
>>
>> from the qcom tree and commits:
>>
>>   680a0873e193 ("arm: kernel: Add SMC structure parameter")
>>   82bcd087029f ("firmware: qcom: scm: Fix interrupted SCM calls")
>>
>> from the arm64 tree.
>>
>> I fixed it up (please check the final resolution when it is released,
>> or fix these up) and can carry the fix as necessary. This is now fixed
>> as far as linux-next is concerned, but any non trivial conflicts should
>> be mentioned to your upstream maintainer when your tree is submitted for
>> merging.  You may also want to consider cooperating with the maintainer
>> of the conflicting tree to minimise any particularly complex conflicts.
>
> Thanks Stephen, although if looks like you've resolved the conflict to
> be what is in the qcom tree, which is in fact an earlier version of this
> patch series.
>
> Andy, please can you drop your stuff from -next now that a newer version
> is queued via arm64? (and also please check that you're happy with what
> I've got queued).

Done.  And looking at your for-next/core, what you have is correct.

Regards,

Andy
