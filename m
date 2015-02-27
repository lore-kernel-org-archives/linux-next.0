From: Mike Turquette <mturquette@linaro.org>
Subject: Re: linux-next: build failure after merge of the clk tree
Date: Thu, 26 Feb 2015 16:01:24 -0800
Message-ID: <CAPtuhTgR-T-45QUuUfU_rCqR_yExbuQF-YQDCpVKeB4vyh9h7Q@mail.gmail.com>
References: <20150226131413.2aceaf7e@canb.auug.org.au> <1424941761.27971.2.camel@AMDC1943>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1424941761.27971.2.camel@AMDC1943>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
List-Id: linux-next.vger.kernel.org

On Thu, Feb 26, 2015 at 1:09 AM, Krzysztof Kozlowski
<k.kozlowski@samsung.com> wrote:
> On czw, 2015-02-26 at 13:14 +1100, Stephen Rothwell wrote:
>> Hi Mike,
>>
>> After merging the clk tree, today's linux-next build (x86_64 allmodconfig)
>> failed like this:
>>
>> drivers/clk/clk.c: In function 'clk_disable_unused_subtree':
>> drivers/clk/clk.c:514:3: error: label 'out' used but not defined
>>    goto out;
>>    ^
>>
>> Caused by commit a2146f032294 ("clk: Use lockdep asserts to find
>> missing hold of prepare_lock").  Commit c440525cb967 ("clk: Remove
>> unneeded NULL checks") removed that label along with the NULL check
>> that a2146f032294 reintroduces (was this a bad rebase?).  Please do
>> simple build tests.
>>
>> I have used the clk tree from next-20150225 for today.
>
> Mike,
>
> It seems that my patch did not applied cleanly and the merge introduced
> such artifacts. My patch adds only lockdep_asserts and does not
> influence the program flow. I can rebase and resend the patch if you
> wish.

It's OK. I fixed it up locally the same day that I applied it but
didn't push the change out to my mirror in time to catch -next. It
will be fixed the next time Stephen pulls the clk tree.

Regards,
Mike

>
> Best regards,
> Krzysztof
>
