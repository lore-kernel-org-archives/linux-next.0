From: Kent Overstreet <koverstreet@google.com>
Subject: Re: mmotm 2013-01-04-15-43 uploaded (aio)
Date: Sun, 6 Jan 2013 11:27:40 -0800
Message-ID: <CAH+dOxJ1aE-oaR1S6sZE4AJeiyLu-WHo3qEXRX+ucHXyLHEQxg@mail.gmail.com>
References: <20130104234405.8750720004E@hpza10.eem.corp.google.com>
	<50E88491.4060703@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <50E88491.4060703@infradead.org>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Sat, Jan 5, 2013 at 11:52 AM, Randy Dunlap <rdunlap@infradead.org> wrote:
> On 01/04/13 15:44, akpm@linux-foundation.org wrote:
>> The mm-of-the-moment snapshot 2013-01-04-15-43 has been uploaded to
>>
>>    http://www.ozlabs.org/~akpm/mmotm/
>>
>> mmotm-readme.txt says
>>
>> README for mm-of-the-moment:
>>
>> http://www.ozlabs.org/~akpm/mmotm/
>>
>> This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
>> more than once a week.
>>
>
>
> A few hundred of these warnings:
>
> include/linux/aio.h:102:43: warning: 'return' with a value, in function returning void [enabled by default]
>
> and these errors:
>
> fs/aio.c:697:2: error: dereferencing pointer to incomplete type
> fs/aio.c:697:2: error: dereferencing pointer to incomplete type
> fs/aio.c:697:2: error: dereferencing pointer to incomplete type
> fs/aio.c:707:21: error: dereferencing pointer to incomplete type
> fs/aio.c:808:30: error: dereferencing pointer to incomplete type
> fs/aio.c:824:40: error: dereferencing pointer to incomplete type
> fs/aio.c:826:25: error: storage size of 'batch_stack' isn't known
>
> when CONFIG_BLOCK is not enabled.

Whoops, thanks. I'm on it.
