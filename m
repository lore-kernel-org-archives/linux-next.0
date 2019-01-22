From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: linux-next: Tree for Jan 22 (drivers/reset/reset-brcmstb.c)
Date: Tue, 22 Jan 2019 15:10:22 -0800
Message-ID: <65480a4a-c9b3-91cd-0de8-51d92686b365@gmail.com>
References: <20190122153649.77efe7cc@canb.auug.org.au>
 <44246f8e-7cc7-bf2a-1306-b21d6cb5e268@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <44246f8e-7cc7-bf2a-1306-b21d6cb5e268@infradead.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 1/22/19 8:21 AM, Randy Dunlap wrote:
> On 1/21/19 8:36 PM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20190121:
>>
> 
> on i386:
> 
> ld: drivers/reset/reset-brcmstb.o: in function `brcmstb_reset_probe':
> reset-brcmstb.c:(.text+0xd7): undefined reference to `__umoddi3'
> ld: reset-brcmstb.c:(.text+0x120): undefined reference to `__udivdi3'
> 
> 
> Full randconfig file is attached.

Thanks, I will be submitting a fix for this shortly.
-- 
Florian
