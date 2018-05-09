From: Daniel Borkmann <daniel@iogearbox.net>
Subject: Re: [PATCH bpf-next] xsk: fix 64-bit division
Date: Wed, 9 May 2018 18:13:33 +0200
Message-ID: <17967788-2811-892b-0126-1bc49a5b9929@iogearbox.net>
References: <e9890e95-16b4-4540-301b-43f17a824808@infradead.org>
 <20180507174350.3534-1-bjorn.topel@gmail.com>
 <baf737cf-a0c4-b542-8d37-fd9cdfe7101d@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <baf737cf-a0c4-b542-8d37-fd9cdfe7101d@infradead.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>, ast@fb.com, netdev@vger.kernel.org
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, magnus.karlsson@intel.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 05/07/2018 08:25 PM, Randy Dunlap wrote:
> On 05/07/2018 10:43 AM, Björn Töpel wrote:
>> From: Björn Töpel <bjorn.topel@intel.com>
>>
>> i386 builds report:
>>   net/xdp/xdp_umem.o: In function `xdp_umem_reg':
>>   xdp_umem.c:(.text+0x47e): undefined reference to `__udivdi3'
>>
>> This fix uses div_u64 instead of the GCC built-in.
>>
>> Fixes: c0c77d8fb787 ("xsk: add user memory registration support sockopt")
>> Signed-off-by: Björn Töpel <bjorn.topel@intel.com>
> 
> I don't know why the subject says xsk (instead of xdp), but anyway:
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org>

Applied to bpf-next, thanks everyone!
