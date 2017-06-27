From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: mmotm 2017-06-23-15-03 uploaded
Date: Tue, 27 Jun 2017 09:38:09 +0200
Message-ID: <CAKwiHFjfrWqa+0NhL1EHKJwmghrL52Xzn-tYJsOi1B41shCsTg@mail.gmail.com>
References: <594d905d.geNp0UO7DULvNDPS%akpm@linux-foundation.org>
 <CAC=cRTNJe5Bo-1E+3oJEbWM8Yt5SyZOhnUiC9U5OK0GWrp1E0g@mail.gmail.com>
 <c3caa911-6e40-42a8-da4d-45243fb7f4ad@suse.cz> <13ab3968-a7e4-add3-b050-438d462f7fc4@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <13ab3968-a7e4-add3-b050-438d462f7fc4@suse.cz>
Sender: owner-linux-mm@kvack.org
To: Vlastimil Babka <vbabka@suse.cz>
Cc: huang ying <huang.ying.caritas@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, mm-commits@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, mhocko@suse.cz, Mark Brown <broonie@kernel.org>
List-Id: linux-next.vger.kernel.org

>>
>> However, the patch in mmotm seems to be missing this crucial hunk that
>> Rasmus had in the patch he sent [1]:
>>
>> -__rmqueue_fallback(struct zone *zone, unsigned int order, int
>> start_migratetype)
>> +__rmqueue_fallback(struct zone *zone, int order, int start_migratetype)
>>
>> which makes this a signed vs signed comparison.
>>
>> What happened to it? Andrew?

This is really odd. Checking, I see that it was also absent from the
'this patch has been added to -mm' mail, but I admit I don't proofread
those to see they match what I sent. Oh well. Let me know if I need to
do anything.

Rasmus

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
