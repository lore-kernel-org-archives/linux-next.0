From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: linux-next: manual merge of the irqchip tree with the arm-soc tree
Date: Tue, 29 May 2018 10:16:24 +0200
Message-ID: <b01f3226-5bb8-071a-e825-73bec913ffa8@st.com>
References: <20180529155257.5ae48830@canb.auug.org.au>
 <1bedc0b7-21f9-1e15-a11c-3de06e81b5ba@st.com>
 <c306fbd9-21d9-5345-e820-52bc23d1b7c7@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <c306fbd9-21d9-5345-e820-52bc23d1b7c7@arm.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marc Zyngier <marc.zyngier@arm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>
Cc: Amelie Delaunay <amelie.delaunay@st.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ludovic Barre <ludovic.barre@st.com>
List-Id: linux-next.vger.kernel.org

Hi Marc

On 05/29/2018 09:47 AM, Marc Zyngier wrote:
> On 29/05/18 08:41, Alexandre Torgue wrote:
>> Hi Stephen
>>
>> On 05/29/2018 07:52 AM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Today's linux-next merge of the irqchip tree got a conflict in:
>>>
>>>     arch/arm/boot/dts/stm32mp157c.dtsi
>>>
>>> between commit:
>>>
>>>     3c00436fdb20 ("ARM: dts: stm32: add USBPHYC support to stm32mp157c")
>>>
>>> from the arm-soc tree and commit:
>>>
>>>     5f0e9d2557d7 ("ARM: dts: stm32: Add exti support for stm32mp157c")
>>>
>>> from the irqchip tree.
>>>
>>> I fixed it up (see below) and can carry the fix as necessary. This
>>> is now fixed as far as linux-next is concerned, but any non trivial
>>> conflicts should be mentioned to your upstream maintainer when your tree
>>> is submitted for merging.  You may also want to consider cooperating
>>> with the maintainer of the conflicting tree to minimise any particularly
>>> complex conflicts.
>>>
>>
>> Thanks for the fix (I will reorder nodes in a future patch). My opinion
>> is that all STM32 DT patches should come through my STM32 tree. It is my
>> role to fix this kind of conflicts. I thought it was a common rule
>> (driver patches go to sub-system maintainer tree and DT to the Machine
>> maintainer). For incoming next-series which contain DT+driver patches I
>> will indicate clearly that I take DT patch. I'm right ?
> Happy to oblige. Can you make sure you sync up with Ludovic and define
> what you want to do?

Sorry I don't understand your reply. I just say that for series 
containing DT patches + drivers patches, to my point of view it is more 
safe that driver patches are taken by sub-system maintainer (you in this 
case) and that I take DT patches in my tree.

> 
> In the meantime, I'm dropping the series altogether.
> 
Why? We could keep it as Stephen fixed the merge issue.

> Thanks,
> 
> 	M.
> 
