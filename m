From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Feb 13 (runtime failures and 'non-zero nr_pmds'
 messages)
Date: Fri, 13 Feb 2015 20:45:40 -0800
Message-ID: <54DED2F4.50009@roeck-us.net>
References: <20150213165615.1ad43047@canb.auug.org.au>	<20150213185428.GA31193@roeck-us.net> <20150214103734.3052cd2f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150214103734.3052cd2f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Sabrina Dubroca <sd@queasysnail.net>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On 02/13/2015 03:37 PM, Stephen Rothwell wrote:
> Hi Guenter,
>
> On Fri, 13 Feb 2015 10:54:28 -0800 Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> I see a number of runtime failures with this version.
>> It affects alpha, mips64, ppc64, and x86_64.
>> Symptom is always the same. There are lots of
>>
>> BUG: non-zero nr_pmds on freeing mm: X (where X is 1..4)
>>
>> messages in the log, and the affected VMs don't reboot.
>>
>> I don't see the problem in curent mainline, nor in mmotm.
>> Bisect points to "Merge branch 'akpm-current/current'",
>> which isn't really helpful.
>>
>> Not sure if this is a bad merge resolution, so just take this
>> as a heads-up for now.
>
> Yours is the second report overnight (see attached).  Almost certainly
> a bad merge resolution on my part (its a bit hard when Andrew get part
> of his patch set merged by Linus :-()
>
And now Fengguang's tests caught it as well.

> I will fix up the merge on Monday (unless Andrew gets more stuff merged
> or updates mmotm for me).
>
> Sorry about that.
>

No worries. Good news is that test coverage is getting better.

Guenter
