From: Boaz Harrosh <bharrosh@panasas.com>
Subject: Re: linux-next: Tree for November 17 (exofs)
Date: Tue, 17 Nov 2009 19:10:17 +0200
Message-ID: <4B02D8F9.2090208@panasas.com>
References: <20091117195309.6cc3ead0.sfr@canb.auug.org.au> <20091117090248.bb66c230.rdunlap@xenotime.net> <4B02D879.4010403@panasas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755558AbZKQRKS@vger.kernel.org>
In-Reply-To: <4B02D879.4010403@panasas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 11/17/2009 07:08 PM, Boaz Harrosh wrote:
> On 11/17/2009 07:02 PM, Randy Dunlap wrote:
>> On Tue, 17 Nov 2009 19:53:09 +1100 Stephen Rothwell wrote:
>>
>>> Hi all,
>>>
>>> Changes since 20091116:
>>
>>
>> on i386 (X86_32):
>>
>> fs/built-in.o: In function `exofs_sbi_read':
>> (.text+0x592964): undefined reference to `__umoddi3'
>>
>> ---
>> ~Randy
> 
> exofs_sbi_read is a totally simple loop thing. What does the
> __umoddi3 means? Please help?
> 
> Boaz

OK I think I get it. It's that u64 mod (%) operation. I'll try to
find a ready made macro for that. Sorry

Boaz
