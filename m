From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: Re: linux-next: manual merge of the clk tree with the keystone tree
Date: Wed, 26 Feb 2014 09:26:26 -0500
Message-ID: <530DF992.1090106@ti.com>
References: <20140226181521.e8cecdff21d892ea1f037bff@canb.auug.org.au> <530DD2CD.7000302@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <530DD2CD.7000302@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Khoronzhuk, Ivan" <ivan.khoronzhuk@ti.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Mike Turquette <mturquette@linaro.org>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Karicheri, Muralidharan" <m-karicheri2@ti.com>, "Strashko, Grygorii" <grygorii.strashko@ti.com>
List-Id: linux-next.vger.kernel.org

On Wednesday 26 February 2014 06:41 AM, Khoronzhuk, Ivan wrote:
> 
> On 02/26/2014 09:15 AM, Stephen Rothwell wrote:
>> Hi Mike,
>>
>> Today's linux-next merge of the clk tree got a conflict in
>> arch/arm/boot/dts/keystone-clocks.dtsi between commit 0cfc9ccec2a8 ("ARM:
>> dts: keystone: preparatory patch to support K2L and K2E SOCs") from the
>> keystone tree and commit 565bbdcd3b91 ("ARM: keystone: dts: fix clkvcp3
>> control register address") from the clk tree.
>>
>> I fixed it up (by adding the following merge fix patch) and can carry the
>> fix as necessary (no action is required).
>>
>> From: Stephen Rothwell <sfr@canb.auug.org.au>
>> Date: Wed, 26 Feb 2014 18:12:55 +1100
>> Subject: [PATCH] ARM: keystone: dts: fix for code movement
>>
>> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> ---
>>   arch/arm/boot/dts/k2hk-clocks.dtsi | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/k2hk-clocks.dtsi b/arch/arm/boot/dts/k2hk-clocks.dtsi
>> index 4eed84feb761..a71aa2996321 100644
>> --- a/arch/arm/boot/dts/k2hk-clocks.dtsi
>> +++ b/arch/arm/boot/dts/k2hk-clocks.dtsi
>> @@ -339,7 +339,7 @@ clocks {
>>   		compatible = "ti,keystone,psc-clock";
>>   		clocks = <&chipclk13>;
>>   		clock-output-names = "vcp-3";
>> -		reg = <0x0235000a8 0xb00>, <0x02350060 0x400>;
>> +		reg = <0x023500a8 0xb00>, <0x02350060 0x400>;
>>   		reg-names = "control", "domain";
>>   		domain-id = <24>;
>>   	};
> 
> The patch "ARM: dts: keystone: preparatory patch to support K2L and K2E 
> SOCs"
> is from "[PATCH 0/4] ARM: dts: keystone: Add support for K2H and K2E 
> SOCs/EVMs"
> series (http://www.spinics.net/lists/arm-kernel/msg310946.html).
> 
> As I understand, this series splits keystone clock tree into tree boards.
Not boards but SOCs.

> As result clock "clkvcp3" (for wich reg is corrected) is moved to the 
> following two dts:
> 
> k2hk-clocks.dtsi
> k2l-clocks.dtsi
> 
> So probably you should apply this change to k2l-clocks.dtsi too.
> 
I will fix my tree. Thanks for spotting it Ivan !!

Regards,
Santosh
