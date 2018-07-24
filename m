From: Matt Hart <matthew.hart@linaro.org>
Subject: Re: next-20180723 build: 2 failures 11 warnings (next-20180723)
Date: Tue, 24 Jul 2018 10:34:53 +0100
Message-ID: <CAH+k93FrA6+1BYmrdteP6pFLJH9nS0UOoz_oq+cA6nFy17zQHw@mail.gmail.com>
References: <E1fheAy-0003tU-Dq@optimist> <20180723181150.GF13981@sirena.org.uk>
 <20180724091626.GC19324@arm.com>
 <CAH+k93GQRKO8s+0qkSH+d_2GkapMAp8C776Q4bZZnL37M5MBCw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAH+k93GQRKO8s+0qkSH+d_2GkapMAp8C776Q4bZZnL37M5MBCw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Will Deacon <will.deacon@arm.com>
Cc: linaro-kernel@lists.linaro.org, Kernel Build Reports Mailman List <kernel-build-reports@lists.linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Kevin Hilman <khilman@kernel.org>, Mark Brown <broonie@kernel.org>, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-next.vger.kernel.org

On 24 July 2018 at 10:32, Matt Hart <matthew.hart@linaro.org> wrote:
>
>
>
> On 24 July 2018 at 10:16, Will Deacon <will.deacon@arm.com> wrote:
>>
>> On Mon, Jul 23, 2018 at 07:11:50PM +0100, Mark Brown wrote:
>> > On Mon, Jul 23, 2018 at 05:59:12PM +0100, Build bot for Mark Brown wrote:
>> >
>> > Today's -next fails to build an arm64 allmodconfig with:
>> >
>> > >     arm64-allmodconfig
>> > > ERROR: "__sync_icache_dcache" [drivers/xen/xen-privcmd.ko] undefined!
>> >
>> > using
>> >
>> >    aarch64-linux-gnu-gcc (Linaro GCC 5.3-2016.05) 5.3.1 20160412
>> >
>> > however it builds perfectly fine with
>> >
>> >    aarch64-linux-gnu-gcc (Linaro GCC 6.2-2016.11) 6.2.1 20161016
>> >
>> > which honestly seems like a sensible and worthwhile upgrade at this
>> > point anyway given that it's a year and a half old so I'm going to do
>> > that for my builder (perhaps even jump on a newer version) but it seemed
>> > worth highlighting in case this is considered undesirable.  A similar
>> > issue is hitting on KernelCI, we should probably look at upgrading the
>> > toolchain there too.
>>
>> Hmm, it looks to me like this comes about because xen/privcmd.c is being
>> built as a module, but contains a call to set_pte_at() with a special pte:
>>
>>         pte_t pte = pte_mkspecial(pfn_pte(page_to_pfn(page), r->prot));
>>
>>         set_pte_at(r->mm, addr, ptep, pte);
>>
>> which on arm64 contains:
>>
>>         if (pte_present(pte) && pte_user_exec(pte) && !pte_special(pte))
>>                 __sync_icache_dcache(pte);
>>
>> so GCC 6 can optimise away the call to the non-exported symbol, but GCC 5
>> has trouble.
>>
>> What I don't understand is why this suddenly cropped up. Did GCC 5 build
>> linux-next arm64 allmodconfig last week?
>
>
> KernelCI uses GCC5 for ARM64 and xen-privcmd.ko has been broken in linux-next (and mainline) allmodconfig for a long time

Bloody gmail and it's HTML mean't this didn't get delivered to
linux-arm-kernel list. Resent.

>
>>
>>
>> Cheers,
>>
>> Will
>
>
