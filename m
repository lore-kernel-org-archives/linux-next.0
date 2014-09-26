From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: New build failures in Sep 25 tree
Date: Thu, 25 Sep 2014 23:46:17 -0700
Message-ID: <54250BB9.1020700@roeck-us.net>
References: <20140925202559.GA1750@roeck-us.net> <CAMuHMdXE4aU1qZ9iGBT48QfMv5v7gsBZSjL_1_D8p=JBJfeN6A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdXE4aU1qZ9iGBT48QfMv5v7gsBZSjL_1_D8p=JBJfeN6A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vineet Gupta <vgupta@synopsys.com>, Ulf Hansson <ulf.hansson@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux <linux@lists.openrisc.net>
List-Id: linux-next.vger.kernel.org

On 09/25/2014 11:30 PM, Geert Uytterhoeven wrote:
> Hi G=C3=BCnther,
>
> [cc openrisc]
>
> On Thu, Sep 25, 2014 at 10:25 PM, Guenter Roeck <linux@roeck-us.net> =
wrote:
>> New build failures:
>
>> openrisc-defconfig
>>
>> In file included from arch/openrisc/kernel/signal.c:31:0:
>> ./arch/openrisc/include/asm/syscall.h: In function 'syscall_get_arch=
':
>> ./arch/openrisc/include/asm/syscall.h:77:9: error: 'EM_OPENRISC' und=
eclared
>
> That's not a new one. It's been failing for half or year or so.
>
Thought I had seen it before.

> If you only see it now, that means something else got fixed ;-)
>
That's one way to put it ;-)

Guenter
