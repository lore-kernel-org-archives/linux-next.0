From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: build failure after merge of the watchdog tree
Date: Thu, 25 Sep 2014 23:47:08 -0700
Message-ID: <54250BEC.3080904@roeck-us.net>
References: <20140926154031.4bc4dc39@canb.auug.org.au>	<5424FFF4.4010506@smartplayin.com>	<542503B1.9090206@roeck-us.net> <20140926163412.4135c44a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140926163412.4135c44a@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Pramod Gurav <pramod.gurav@smartplayin.com>, Wim Van Sebroeck <wim@iguana.be>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Carlo Caione <carlo@caione.org>, Andrew Morton <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

On 09/25/2014 11:34 PM, Stephen Rothwell wrote:
> Hi Guenter,
>
> On Thu, 25 Sep 2014 23:12:01 -0700 Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> Someone suggested that I should create an immutable tree with the
>> restart handler patchset, which everyone using the restart handlers
>> could merge. Is that an option ? I could technically do that,
>> but I would want to pick the patches from Andrew's tree to retain
>> his sign-off. Andrew, any thoughts/comments ?
>
> That is exactly what you should do.
>
Ok, I'll do that first thing tomorrow morning.

Guenter
